# GovGrants Java → Playwright Migration Log

> Track every pattern fix, alignment, and migration decision.
> Each entry maps: **Java source** → **Playwright implementation** → **Status**

> **See Also** — Organized migration documentation:
> - **Full NYSED Log**: [`docs/migration-logs/NYSED-MIGRATION-LOG.md`](docs/migration-logs/NYSED-MIGRATION-LOG.md) (detailed per-component log with all test runs)
> - **Shadow DOM & Field Guide**: [`docs/migration-logs/SHADOW-DOM-FIELD-GUIDE.md`](docs/migration-logs/SHADOW-DOM-FIELD-GUIDE.md) (generic approach for all projects)
> - **New Project Template**: [`docs/migration-logs/PROJECT-TEMPLATE.md`](docs/migration-logs/PROJECT-TEMPLATE.md) (copy for each new project)
> - **Framework Overview**: [`docs/FRAMEWORK_OVERVIEW.md`](docs/FRAMEWORK_OVERVIEW.md) (architecture & extension points)

---

## Pattern Fixes Applied

### 1. Login Flow
| Java Source | Playwright File | Status |
|---|---|---|
| `MainPage.login()` | `login-page.ts → loginAs()` | Done |
| `GovGrantsObjects.clickLogOut()` | `login-page.ts → logout()` | Done |
| `MainPage.navigateToPortal()` | `login-page.ts → navigateToPortal()` | Done |
| `GovGrantsSteps.reloginToggleToAppInURL()` | `login-steps.ts → reLoginHandler` | Done |
| `UsersAndURL.getUserName/getPassword()` | `user-resolver.ts → resolveUser()` | Done |
| `UsersController.getPortalUrl()` | `login-steps.ts → resolveBaseUrl()` | Done |

**Java re-login flow:** wait 3s → clickLogOut (profile dropdown → Log Out) → wait 4s → deleteAllCookies → navigateToPortal → login → waitForEgmsHeader
**Playwright re-login flow:** wait 3s → logout() (profile dropdown → Log Out → clearCookies → wait 4s) → navigateToPortal() (clearCookies → navigate) → loginAs()

### 2. Flex Table — Top Right Button
| Java Source | Playwright File | Status |
|---|---|---|
| `PhasePanel.clickTableTopRightButton()` | `flex-table-page.ts → clickTopRightButton()` | Done |
| `PhasePanel.getTopRightButtonLocatorByTableId()` | XPath in clickTopRightButton | Done |
| `FlexTable.waitForFlexTablesToLoad()` | `wait-helper.ts → waitForFlexTablesToLoad()` | Done |

**Java XPath:** `//*[@id='{id}']//div[contains(@class,'panel-heading')]//*[text()='{btn}' or @value='{btn}' or @type='{btn}']`
**Added waits:** waitForSpinnerDisappear + waitForFlexTablesToLoad + waitForLightningReady before button search

### 3. Sub-Tab Navigation
| Java Source | Playwright File | Status |
|---|---|---|
| `PageDetails.clickSubTabsInsideTableViewForLWC()` | `navigation-page.ts → clickSubTab()` | Done |

**Includes:** slds-tabs_default XPath, More Tabs overflow, JS click fallback

### 4. Sidebar Navigation
| Java Source | Playwright File | Status |
|---|---|---|
| sidebar link click (LWC) | `navigation-page.ts → clickSidebarContent()` | Done |

**Key:** Uses dispatchEvent('click') for LWC event handlers, not native .click()

### 5. Row-Level Action Buttons
| Java Source | Playwright File | Status |
|---|---|---|
| Flex table row button assert/click | `flex-table-page.ts → assertRowLevelButton/clickTableActionIconById` | Done |

**Key:** `//td//*[text()='X']/ancestor::tr[1]//button` + Escape after assert to close dropdown

### 6. Modal Interactions
| Java Source | Playwright File | Status |
|---|---|---|
| `Modal.clickModalButton()` | `modal-page.ts → clickModalButton()` | Done |
| `Modal.acceptPopUp()` | `modal-page.ts → acceptPopUp()` | Done |
| `Modal.closeModal()` | `modal-page.ts → closeModal()` | Done |

### 7. Page Details
| Java Source | Playwright File | Status |
|---|---|---|
| `PageDetails.getFieldValue()` | `page-details-page.ts → getFieldValue()` | Done |
| `PageDetails.clickTopRightButton()` | `page-details-page.ts → clickTopRightButton()` | Done |

### 8. Properties File Resolution
| Java Source | Playwright File | Status |
|---|---|---|
| `Properties_Logs.ReadPropertyFile()` | `properties-loader.ts → loadProperties/getProperty` | Done |
| `---module:-:key---` token resolution | `saved-values.ts → resolve()` | Done |

### 9. Failure Diagnostics (NEW — not in Java)
| Feature | File | Status |
|---|---|---|
| Screenshot on failure | `failure-diagnostics.ts` | Done |
| DOM snapshot | `failure-diagnostics.ts` | Done |
| Smart DOM extraction | `failure-diagnostics.ts` | Done |
| Locator analysis | `failure-diagnostics.ts` | Done |
| Console + framework logs | `failure-diagnostics.ts` | Done |
| Cucumber report attachments | `browser-hooks.ts` | Done |

---

## Patterns Still Pending

| Java Pattern | Java File | Priority | Notes |
|---|---|---|---|
| `FlexTable.editFlexTableRowsInlineForLWC()` | FlexTable.java | Medium | Inline editing |
| `FlexTable.waitForFlexTablesToLoad()` integration in all callers | FlexTable.java | High | Add to all table interaction methods |
| `InputForms.enterInputFieldsFromExcelFile()` | InputForms.java | Medium | Excel-driven form input |
| `PhasePanel.clickDoubleArrowDropDownAndSelectItem()` | PhasePanel.java | High | Toggle button |
| Composite API steps (create program, etc.) | ApiSteps.java | Low | Need Salesforce REST API |
| Mail notification steps | GovGrantsSteps.java | Low | Need IMAP checker |
| Old pattern (non-LWC) page interactions | OldPatternSteps.java | Low | Legacy |

---

## Dynamic Wait Strategy

**Principle:** Never use `waitForTimeout(ms)` for synchronization. Only use it for:
- Post-action settling (cookie clearing, page transitions) where no DOM signal exists
- Matching Java's explicit `makeThreadSleep()` calls that have no better alternative

**Preferred Playwright waits:**
- `locator.waitFor({ state: 'visible'|'attached'|'hidden' })` — wait for element state
- `page.waitForLoadState('load'|'domcontentloaded'|'networkidle')` — wait for page load
- `waitForSpinnerDisappear()` — custom: polls for spinner elements to disappear
- `waitForFlexTablesToLoad()` — custom: polls for progress-bar indicators to disappear
- `waitForLightningReady()` — custom: waits for Lightning aura framework ready state
- `page.waitForResponse()` — wait for specific API call completion
- `page.waitForURL()` — wait for navigation to complete

### 10. Dynamic Wait Cleanup
| Before | After | Change |
|---|---|---|
| 58 `waitForTimeout` calls | 27 remaining | **31 replaced with dynamic waits** |

**Replaced patterns:**
- Lookup/autocomplete fills: removed 1000ms sleep → rely on `waitFor({ state: 'visible' })` on suggestion
- File uploads: 2000ms → `waitForLoadState('domcontentloaded')`
- Page reloads: 3000ms → `waitForLoadState('networkidle')`
- Toggle menu clicks: 1000ms → `waitForPageLoad()` (spinner-based)
- Dropdown menu clicks: 500ms → rely on next element's `waitFor`
- Search + Enter: 1000ms → `waitForLoadState('domcontentloaded')`
- Login logout: 700ms/4000ms → `waitForLoadState` + `waitForURL(/login/)`
- Re-login pre-wait: 3000ms → `waitForLoadState('domcontentloaded')`

**Kept (justified):**
- Hover tooltip waits (500ms × 5) — no DOM signal for tooltip appearance
- Internal polling loops in wait-helper.ts — by design
- "I wait for N seconds" step — user-explicit
- External site loads (yopmail/maildrop 3000ms) — external dependency

---

## Gherkin `I wait for X seconds` — Impact Analysis

**Total wait steps found: 18,474** across all feature files

### Distribution by Duration
| Duration | Count | Can Remove? |
|---|---|---|
| 2s | 9,846 | **Yes** — framework now waits dynamically |
| 3s | 4,599 | **Yes** — framework now waits dynamically |
| 5s | 2,128 | **Mostly** — review case by case |
| 4s | 568 | **Yes** |
| 6s | 452 | Check — may be email/API waits |
| 9s+ | 881 | Keep — likely external system waits |

### Top Patterns (what precedes the wait)
| Pattern Before Wait | Count | Framework Fix |
|---|---|---|
| `I click modal button "Save/Close"` | ~150 | `clickModalButton()` now has networkidle + spinner + domcontentloaded |
| `I click on "Save/Edit/Submit" in page details` | ~200 | `clickTopRightButton()` now has acceptPopUp + spinner + domcontentloaded |
| `I navigate to "X" sub tab` | ~100 | `clickSubTab()` now has spinner + flexTableLoad + domcontentloaded |
| `I refresh the page` | ~50 | Refresh step now has spinner + flexTableLoad |
| `I click on "View" icon in flex table` | ~200 | `clickTableActionIcon*()` already has modal wait |
| `I "Approve" in the approval decision` | ~96 | Approval page has spinner wait |

### Migration Recommendation
Once all framework waits are verified working via live tests, the `I wait for "2" seconds` and `I wait for "3" seconds` steps can be **batch-removed** from Gherkin files:
- **Phase 1**: Remove 2s waits after modal/page-details/sub-tab/refresh (test with sample scenarios)
- **Phase 2**: Remove 3s waits after same patterns
- **Phase 3**: Remove 5s waits case by case
- **Keep**: 9s+ waits (email arrival, external API, processing)

**Estimated removable: ~14,000 steps** (76% of all waits)

---

## Test Execution Results

| Run | Date | Scenario | Steps Passed | Failed At | Root Cause |
|---|---|---|---|---|---|
| 1 | 2026-07-10 | @56710 | 7/35 | Re-login as PM | No logout before re-login |
| 2 | 2026-07-10 | @56710 | 15/35 | Add Files button | Table not loaded after sub-tab |
| 3 | 2026-07-10 | @56710 | 1/35 | Navigate Home tab | Login didn't complete — "Log In to Sandbox" click didn't wait for navigation |
| 4 | 2026-07-10 | @56710 | 15/35 | Add Files button | Login fixed with Promise.all; "Add Files" is inside dropdown menu, not direct button |
| 5 | 2026-07-10 | @56710 | TBD | TBD | Added dropdown menu fallback + improved diagnostics |
| 6 | 2026-07-10 | @NYSED-5137 | 2/42 | Create standalone grant API | Salesforce trigger error (org config, not framework) |
| **7** | **2026-07-10** | **@56709** | **6/6 ✅ PASS** | **—** | **Login + tab + sidebar + flex table + assertion — all dynamic waits working** |
| **8** | **2026-07-10** | **@504582** | **13/17 (14th is data)** | **Field assertion** | **All 13 framework steps PASS; failure is "Hold Payments"=Yes (stale data, not framework)** |
| 9 | 2026-07-10 | @DG_API (attempt 1) | 0/6 | Auth | `invalid_grant` — API was using test.salesforce.com instead of instance URL |
| **10** | **2026-07-10** | **@DG_API (attempt 2)** | **2/6** | **createStandaloneGrant** | **Auth FIXED. activateProgram ✅ publishAnnouncement ✅. Grant fails: SF trigger bug (Program__c not queried)** |
| **11** | **2026-07-10** | **@504568 (FD)** | **21/21 ✅ PASS** | **—** | **Manage Holds modal, dropdown picklist, form input, Save/Close, field verify — ALL PASS** |
| 12 | 2026-07-10 | @504568 (ADMIN) | 0/21 | Login | ERR_ABORTED — transient network issue between scenarios |
| **13** | **2026-07-13** | **@34872** | **2/3** | Sidebar nav | **JWT auth PASS** — login via frontdoor URL works |
| **14** | **2026-07-14** | **@521631** | **12/12 ✅ PASS** | **—** | **Soft assertion fix — all passed** |
| 15-18 | 2026-07-14-15 | @489011 | 7→25/25 | Field input | Shadow DOM + dual attr + lazy rendering — iteratively fixed |
| **19** | **2026-07-15** | **@489011** | **25/25 ✅ PASS** | **—** | **All field types work — lookup, picklist, text, date** |

### Key Fixes Applied (Jul 10)
- **Login**: `Promise.all([waitForNavigation, click])` for "Log In to Sandbox" and login button
- **Login verification**: Post-login check — if still on login page, throw clear error
- **Flex table dropdown**: `clickTopRightButton()` now tries direct button first, falls back to hamburger menu → menu item
- **Diagnostics**: Rewrote `analyzeFailingLocator()` — proper XPath extraction, table content listing, raw error always included

### Key Fixes Applied (Jul 13-15)
- **JWT Auth**: Token-based login via frontdoor URL — no passwords needed for internal users
- **Shadow DOM**: Replaced XPath with CSS selectors in all field locators — CSS auto-pierces shadow DOM
- **Dual Attribute**: Added `c-fieldlwc[data-fieldapiname]` alongside `[data-field_api_name]` — modal vs page detail
- **Lazy Rendering**: `findEditableWrapper()` retry loop (5×1s) for c-fieldlwc inputs that render async
- **Field Detection**: `detectFieldType()` in Java priority order — radio → checkbox → richtext → lookup → picklist → multiselect → date → text
- **Lookup Handler**: CSS-based `input[type='search']` activation + XPath result picker
- **Picklist Handler**: CSS-based `button[aria-haspopup='listbox']` + dropdown option selection
- **Soft Assertions**: `softAssert()` wrapper for ~20 step definitions with `(softly see|see)` patterns
- **Year Range**: Capped random year to 2036-2060 (Salesforce picklist bounds)
