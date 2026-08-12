# Playwright Migration Fix Log

> Captures all issues found and fixed during Java → Playwright migration.
> Use this as a checklist when migrating other GovGrants projects.

---

## ⚠️ Hard Debugging Rules — ALWAYS Follow Before Touching Framework Code

These rules exist because framework code is **generic and critical** — a wrong patch slows or breaks ALL 5000+ scenarios.

### Rule 1 — Check Screenshot First
When a locator is not found, **open `reports/diagnostics/<scenario>/screenshot.png` immediately**.
- If the page looks wrong (wrong tab, missing sections, wrong data) → it's a **data/config issue** → fix Excel or test data, NOT the framework.
- If the page looks correct but element missing → it may be a **framework/XPath issue** → investigate further.

### Rule 2 — Classify the Issue Before Fixing

| Symptom | Check First | Fix In |
|---------|-------------|--------|
| Table not in DOM | Screenshot — does the section exist on page? | Excel test data |
| Field not found | Screenshot — is the correct tab/modal open? | Excel test data |
| Button not visible | Screenshot — is it in a dropdown? | Framework (dropdown fallback) |
| Checkbox click timeout | DOM — is it covered by overlay? | Framework (JS click) |
| Wrong navigation | Screenshot — which page are we on? | Step definition wait |

### Rule 3 — Never Patch Framework for Data Problems
Examples of data problems mistaken for framework issues:
- `Fund_Code__c` already exists → program creation fails silently → looks like navigation bug
- `FocusAreaRequired__c` not set → Focus Area table absent → looks like scroll/lazy-load bug
- Contact not associated → inline edit row missing → looks like timing bug

### Rule 4 — Revert Framework Patches That Were Applied for Data Issues
If a framework patch was applied for a data issue, **revert it immediately** to keep the framework clean.

---

## Fix #1: Upload Attachment — Missing Classification & Upload Button

**File:** `src/project/step-definitions/common/navigation-steps.ts`
**Step:** `I upload attachment (without random number )?"X" of type "Y" from computer`
**Symptom:** File appeared in modal but was never uploaded. "Unsaved changes" confirm dialog appeared on navigation.

| Action | Java (`GovGrantsObjects.java:374-401`) | Playwright (Before) | Playwright (After) |
|--------|---------------------------------------|---------------------|---------------------|
| Select Classification | `selectByValue(fileType)` | ❌ Missing | ✅ `selectOption` / combobox click |
| Set file input | `textInput().in(filePath)` | ✅ `setInputFiles()` | ✅ `setInputFiles()` |
| Click Upload | `click("//button[text()='Upload']")` | ❌ Missing | ✅ `uploadBtn.click()` |

**Root cause:** Original scaffolding only called `setInputFiles()` — skipped the classification dropdown and the Upload button click.

**Java reference:** `GovGrantsObjects.uploadAttachmentInFlexTableFromComputer()`

---

## Fix #2: Page Details Button — Dropdown Priority

**File:** `src/project/step-definitions/common/misc-steps.ts`
**Step:** `I click on "X" in the page details`
**Symptom:** Buttons like "Activate" and "Deactivate" (inside dropdown menu ▼) were not found. Framework tried switching browser tabs first, causing timeout on stale tab links.

**Before:** Tried switching tabs → last resort: tried dropdown
**After:** Try dropdown on current page FIRST → then try other tabs → last resort: dropdown again

**Root cause:** "Activate"/"Deactivate" live in the top-right dropdown menu (`lightning-button-menu`), not as direct buttons. The original code checked tabs before checking the dropdown, causing unnecessary timeouts.

**Java reference:** `PageDetails.clickAnyTopRightButton()` — always tries direct button first, then falls back to `gnt-header-overview//lightning-button-menu`.

---

## Fix #3: Confirm Popup Handling — Timing & Button Text

**File:** `src/project/step-definitions/common/misc-steps.ts`
**Step:** `I click on "X" in the page details` (popup acceptance sub-logic)
**Symptom:** Confirm dialogs ("Are you sure you want to Activate/Deactivate?") were not dismissed. Next step failed because the action wasn't completed.

| Aspect | Before | After |
|--------|--------|-------|
| Wait before checking | None | 2s wait after button click |
| Popup timeout | 2000ms `isVisible` | 10000ms `isVisible` |
| Button text matching | `text()='OK'` only | `text()='OK' or text()='Ok' or text()='Yes' or text()='Continue'` |
| Container scope | `modal__container` only | `modal__container` + `modal__footer` |
| Comment box handling | ❌ Missing | ✅ Fills "Automated Test" if prompt/input present |
| Logging | Silent | Logs accepted/not-found |

**Root cause:** Salesforce confirm dialogs need time to render after a button click. The 2000ms check was too fast, and "Ok" (lowercase k) wasn't matched.

**Java reference:** `Modal.acceptPopUp()` — waits for `modal__container` to be present, then waits for button, then clicks. Also handles comment box inputs.

---

## Fix #4: Schedule Date Regex — Case Sensitivity

**File:** `src/project/step-definitions/common/assertion-steps.ts`
**Step:** `I (softly verify|verify) that the Schedule (start|end) date is matching with Reporting Period (start|end) Date`
**Symptom:** 2 undefined steps in dry-run. Feature files used "Reporting Period **End** Date" (capital E) but regex only matched lowercase.

**Before:** `(start|end)` for third capture group
**After:** `(start|end|Start|End)` for third capture group

---

## Fix #5: Test Resource Files Missing

**Location:** `src/project/data/`
**Symptom:** `ENOENT: no such file or directory` for `Attachment.pdf`

**Fix:** Copied test resource files from Java project:
- `src/main/resources/Attachment.pdf` → `src/project/data/Attachment.pdf`
- `src/main/resources/Attachment1.pdf` → `src/project/data/Attachment1.pdf`
- `src/main/resources/AttachmentTesting.pdf` → `src/project/data/AttachmentTesting.pdf`

**Checklist:** When migrating, always copy ALL files from Java `src/main/resources/` to Playwright `src/project/data/` — not just `.xlsx` files.

---

## Fix #6: Test Data Cleanup Hook

**Files:** `src/framework/api/grantor-api-service.ts`, `src/framework/hooks/browser-hooks.ts`, `src/framework/utils/saved-values.ts`
**Symptom:** Test data (Focus Areas, Programs, Announcements, etc.) was not cleaned up after scenarios, polluting the Salesforce org.

**Added:**
- `GrantorApiService.cleanupTestData()` — scans `savedValues` for keys starting with "AUTOMATION RUNTIME" and deletes records via API in dependency order (child → parent)
- `SavedValues.getAllKeysStartingWith()` — prefix scan method
- `After` hook calls `api.cleanupTestData()` before closing browser

**Deletion order (mirrors Java `deleteRecordInHooks()`):**
1. Simple types: Focus Area, Funding Source, KPI, Package, Strategic Plan, Site Visit, Desk Review, Amendment, Payment, Risk, Contact, Organization
2. Closeout (+ Payment Request)
3. Application (Reviews → PreApplication → Application)
4. Award (Progress Report → Amendment → Award → Grant)
5. Announcement (all child records → Announcement)
6. Program (parent — last)

**Java reference:** `GrantorWebServices.deleteRecordInHooks()` and `setup.java @After`

---

## Fix #7: PDF Parse Dependency

**Symptom:** PDF assertion steps silently skipped because `pdf-parse` wasn't installed.
**Fix:** `npm install pdf-parse`

---

## Fix #8: Popup Detection — `isVisible` vs `waitFor`

**File:** `src/project/step-definitions/common/misc-steps.ts`
**Symptom:** Intermittent failures on Activate/Deactivate confirm dialogs. Sometimes passed, sometimes popup wasn't dismissed.

**Root cause:** Playwright's `isVisible({ timeout })` does **NOT retry** — it checks once and returns immediately. If the popup hasn't rendered yet, it returns `false` and moves on. `waitFor({ state: 'visible', timeout })` actually **polls/retries** until the element appears or timeout expires.

**Before:** `popupBtn.isVisible({ timeout: 10000 })` — single check, no retry
**After:** `popupBtn.waitFor({ state: 'visible', timeout: 15000 })` — retries until visible

**Key rule:** Never use `isVisible()` when you need to **wait** for an element. Use `waitFor()` instead. `isVisible()` is only for checking current state without waiting.

---

## Migration Checklist for New Projects

- [ ] Copy ALL resource files (including .pdf) from Java `src/main/resources/` to Playwright `src/project/data/`
- [ ] Upload steps must include: classification select + file set + Upload button click
- [ ] Page detail button clicks try dropdown BEFORE tab switching
- [ ] Popup handler waits ≥2s after click, matches OK/Ok/Yes/Continue, covers `modal__footer`
- [ ] Step regexes handle case variations in feature files (check dry-run for undefined)
- [ ] Install `pdf-parse` if PDF assertion steps are used
- [ ] Cleanup hooks delete test data in proper dependency order (child → parent)
- [ ] Run `tsc --noEmit` + `cucumber-js --dry-run` after every change
- [ ] Run at least one real scenario end-to-end before declaring migration complete
- [ ] Compare each step body against Java — not just regex match (dry-run only catches missing steps, not shallow implementations)
