# Shadow DOM & Salesforce LWC Field Handling Guide

> **Generic approach for Playwright automation of Salesforce Lightning Web Components.**
> Applicable to all GovGrants projects migrating from Java Selenium to Playwright.

---

## 1. The Core Problem: XPath vs CSS in Playwright

### Java Selenium (old framework)
- Selenium does **not** use shadow DOM piercing — Salesforce Lightning renders LWC with **synthetic shadow DOM** (open mode) that Selenium can traverse normally via XPath.
- Locators like `//div[@data-field_api_name='X']//input` work fine.

### Playwright (new framework)
- Playwright uses **real shadow DOM piercing** for CSS selectors — CSS selectors automatically cross open shadow DOM boundaries.
- **XPath does NOT pierce shadow DOM** in Playwright. This is the single most critical difference.
- Any locator strategy using XPath to find elements inside LWC components **will fail silently** (element not found).

### Rule
```
ALWAYS use CSS selectors for elements inside Salesforce LWC components.
Reserve XPath only for elements in the regular (non-shadow) DOM.
```

---

## 2. GovGrants Dual Attribute Pattern

GovGrants uses **two different data attributes** for field API names depending on context:

| Attribute | Format | Used On | Context |
|-----------|--------|---------|---------|
| `data-field_api_name` | Underscore | `<div>` wrappers | Page detail sections |
| `data-fieldapiname` | CamelCase | `<c-fieldlwc>` elements | Modal forms |
| `data-api-name` | Kebab | Standard Salesforce | Record pages |

### CSS Locator Pattern
```typescript
// Non-modal — search all variants
`[data-field_api_name='${fieldApiName}'], ` +
`[data-api-name='${fieldApiName}'], ` +
`c-fieldlwc[data-fieldapiname='${fieldApiName}']`

// Modal-scoped — prefix with modal container
`div[class*='modal__container'] [data-field_api_name='${fieldApiName}'], ` +
`div[class*='modal__container'] c-fieldlwc[data-fieldapiname='${fieldApiName}'], ` +
`.slds-modal [data-field_api_name='${fieldApiName}'], ` +
`.slds-modal c-fieldlwc[data-fieldapiname='${fieldApiName}'], ` +
`section[role='dialog'] [data-field_api_name='${fieldApiName}'], ` +
`section[role='dialog'] c-fieldlwc[data-fieldapiname='${fieldApiName}']`
```

### For New Projects
Check the actual DOM of your Salesforce org to identify which attributes are used. Common variations:
- `data-field_api_name` (GovGrants custom)
- `data-fieldapiname` (GovGrants LWC)
- `data-field-api-name` (kebab-case variant)
- `data-target-selection-name` (Salesforce internal)

---

## 3. Lazy-Rendered LWC Inputs

### Problem
When a Salesforce modal opens:
1. The modal container (`div.modal__container`) appears immediately
2. Custom LWC elements (`c-fieldlwc`) attach to DOM within ~100ms
3. **Internal `<input>`, `<button>`, `<textarea>` children render asynchronously** — often 1-3 seconds later

### Symptom
```
[WRAPPER] Found 10 matches, searching for editable one
[WRAPPER] No editable match found, using first
[FIELD] No interactive element found in wrapper
```

### Solution: Retry Loop in `findEditableWrapper()`
```typescript
// Wait for wrapper element to attach
await waitUntilAttached(firstMatch, timeout);

// Retry loop — children may not have rendered yet
const maxRetries = 5;
for (let retry = 0; retry < maxRetries; retry++) {
  // Check each candidate for editable children
  for (let i = 0; i < count; i++) {
    const hasEditable = await candidate.locator(editableSelector).count();
    if (hasEditable > 0) return candidate; // Found!
  }
  // Not ready yet — wait and retry
  await page.waitForTimeout(1000);
}
```

### Editable Element Selector
```css
input:not([type='hidden']),
textarea,
select,
button[aria-haspopup='listbox'],
div[class*='text-area'],
.ql-editor,
ul li[class*='listbox__item'],
lightning-combobox
```

---

## 4. Field Type Detection Strategy

### Detection Order (matches Java `InputForms.handleFormDataInputs()`)

| Priority | Type | CSS Detection Selector |
|----------|------|----------------------|
| 1 | Radio | `span[class*='slds-radio_faux']` |
| 2 | Checkbox | `input[type='checkbox']` |
| 3 | Rich Text | `.ql-editor, lightning-input-rich-text` |
| 4 | Lookup | `input[type='search'], lightning-lookup` |
| 5 | Picklist | `button[aria-haspopup='listbox'], button[id*='combobox-button']` |
| 6 | Multi-select | `ul li[class*='listbox__item']` |
| 7 | Date | `lightning-datepicker, input[name*='date' i]` |
| 8 | Text (default) | `input, textarea` |

### Lookup vs Picklist Distinction
Both use combobox patterns. Key differentiators:
- **Lookup**: Has `input[type='search']` or `lightning-lookup` component
- **Picklist**: Has `button[aria-haspopup='listbox']` but NO search input

Always check for lookup **before** picklist in the detection order.

---

## 5. Specialized Field Handlers

### Lookup Fields (autocomplete)
```
1. Find input[type='search'] or input[role='combobox']:not([readonly])
2. Click to activate
3. Clear existing text → type search value
4. Wait for dropdown results (1-2s)
5. Click matching option: div[@title='value'] or lightning-base-combobox-item//span[@title]
6. Fallback: ArrowDown + Enter (keyboard selection)
```

### Picklist/Dropdown Fields
```
1. Find button[aria-haspopup='listbox'] or button[id*='combobox-button']
2. Click to open dropdown (try normal click, fallback to JS click)
3. Wait for options to render (~500ms)
4. Click matching option: span[@title='value']
5. Fallback: JS click on option element
```

### Multi-Select Fields
```
1. Find all li[class*='listbox__item'] in the "Available" list
2. For each value (comma-separated):
   a. Click the matching span[@title='value']
3. Click "Move to Chosen" button
```

### Text Fields
```
1. Find input[type='text'] or textarea
2. Click with JS (activates LWC event handlers)
3. Clear existing value (triple-click + delete)
4. Type new value
5. Verify: compare actual vs expected, retry up to 3 times
6. Press Tab to trigger validation
```

### Date Fields
```
1. Check if value is numeric (day offset) → convert to MM/dd/yyyy
2. Find input inside lightning-datepicker
3. Clear and type formatted date
4. Press Escape (close calendar popup) + Tab
```

---

## 6. Java Selenium → Playwright Locator Mapping

| Java Pattern | Playwright Equivalent | Notes |
|-------------|----------------------|-------|
| `By.xpath("//div[@data-field_api_name='X']")` | `page.locator("[data-field_api_name='X']")` | CSS pierces shadow DOM |
| `By.xpath(".//input[@type='search']")` | `wrapper.locator("input[type='search']")` | Scoped CSS |
| `By.xpath("//div[@title='value']")` | `page.locator("//div[@title='value']")` | XPath OK here (not in shadow DOM) |
| `By.xpath(".//button[@aria-haspopup='listbox']")` | `wrapper.locator("button[aria-haspopup='listbox']")` | CSS for LWC children |
| `By.xpath("//span[@title='value']")` | `page.locator("//span[@title='value']")` | XPath OK (dropdown in regular DOM) |
| `I.amPerforming().click().withJavaScript(el)` | `clickHelper.clickWithJavaScript(locator)` | `dispatchEvent('click')` |

### Key Principle
- **Inside LWC components** (field wrappers, form elements): Use **CSS selectors**
- **Outside LWC** (dropdown results, page-level elements): XPath is acceptable
- **When in doubt**: Use CSS — it works everywhere

---

## 7. Modal Scoping

### When to Scope to Modal
- Step says `I enter in modal value "X" into field "Y"` → `isModal = true`
- Step says `I enter "X" values from "Y.xlsx"` → `isModal = false` (but auto-detects via findEditableWrapper)

### Auto-Detection (recommended approach)
When `isModal = false`, the locator searches all matching elements. The `findEditableWrapper()` method automatically picks the one containing editable inputs — which is typically the modal form element, not the read-only background page element.

This approach works because:
1. Background page elements with `data-field_api_name` are read-only (no inputs inside)
2. Modal form elements with `data-fieldapiname` have interactive inputs
3. `findEditableWrapper` checks for interactive children and selects the right one

---

## 8. Diagnostic Signals

### Log Patterns to Watch For

| Log Message | Meaning | Action |
|-------------|---------|--------|
| `No editable match found` | Wrapper exists but no inputs inside | Likely lazy-rendering; increase retry count |
| `No interactive element found` | detectFieldType returned `text` but no input/textarea found | Wrong wrapper selected; check attribute names |
| `Detected type: text` for a picklist | Detection order wrong | Check for `button[aria-haspopup]` before text fallback |
| `Using match 0 (has editable elements)` | Correct wrapper found | Working as expected |
| `Single match has no editable elements yet, waiting...` | Retry loop active | Lazy rendering detected, waiting |

### Framework Log Location
- **Per-run**: `reports/diagnostics/<scenario>_<timestamp>/framework-logs.txt`
- **Artifacts**: screenshot, dom-snapshot, smart-dom, locator-analysis

---

## 9. Checklist for New Project Migration

### Pre-Migration
- [ ] Identify Salesforce org's field attribute pattern (`data-field_api_name`, `data-fieldapiname`, etc.)
- [ ] Identify custom LWC component names (`c-fieldlwc`, `c-custom-input`, etc.)
- [ ] Identify modal container selectors (`modal__container`, `slds-modal`, etc.)
- [ ] Check if org uses synthetic vs native shadow DOM

### During Migration
- [ ] Replace ALL XPath field locators with CSS selectors
- [ ] Add all field attribute variants to `getFieldLocator()`
- [ ] Implement `findEditableWrapper()` with retry loop
- [ ] Implement `detectFieldType()` with correct priority order
- [ ] Test each field type: text, picklist, lookup, date, checkbox, radio, richtext, multiselect
- [ ] Test modal vs non-modal field entry

### Post-Migration Validation
- [ ] Run scenario with Excel-driven field entry (covers all types)
- [ ] Check framework logs for `No editable match found` warnings
- [ ] Verify no `[FIELD] No interactive element found` errors
- [ ] Confirm picklist/lookup selections actually persist after Tab/blur

---

## 10. File Reference

| File | Purpose |
|------|---------|
| `src/project/pages/page-details-page.ts` | Field input logic — `getFieldLocator`, `findEditableWrapper`, `detectFieldType`, handlers |
| `src/framework/utils/click-helper.ts` | LWC-compatible click (JS fallback) |
| `src/framework/utils/wait-helper.ts` | Dynamic waits (spinner, modal, toast) |
| `src/framework/utils/failure-diagnostics.ts` | Diagnostic capture on failure |
| `NYSED_Playwright/src/helpers/InputFormsHelper.ts` | POC reference implementation |
| `src/main/java/com/helperPackage/govgrants/InputForms.java` | Java reference implementation |

---

**Created**: July 15, 2026
**Applicable To**: All GovGrants Playwright migration projects
**Last Updated**: July 15, 2026
