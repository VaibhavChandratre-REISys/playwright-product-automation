# NYSED Project - Playwright Migration Log

## 📋 Project Information

- **Project Name**: NYSED (New York State Education Department)
- **Migration Start Date**: July 2026
- **Migration Status**: 🔄 92% Complete
- **Java Framework**: Selenium WebDriver
- **Target Framework**: Playwright + TypeScript + Cucumber
- **Total Scenarios**: 5,226 scenarios
- **Total Features**: 150+

---

## 🎯 Migration Objectives

1. **Port Java Selenium framework to Playwright** while maintaining 100% Gherkin compatibility
2. **Improve test stability** with better wait strategies and LWC support
3. **Enable cross-project reusability** for 15+ GovGrants projects
4. **Add diagnostic capabilities** for faster failure analysis
5. **Maintain feature parity** with Java framework

---

## ✅ Completed Components

### **1. Core Framework Setup**
- [x] TypeScript + Playwright project structure
- [x] Cucumber integration with custom world
- [x] Browser hooks (Before/After/BeforeStep)
- [x] Environment configuration (.env files)
- [x] Properties file loader
- [x] Excel reader utility

**Date Completed**: July 2026  
**Files Created**:
- `src/framework/world/custom-world.ts`
- `src/framework/hooks/browser-hooks.ts`
- `src/framework/config/properties-loader.ts`
- `src/framework/utils/excel-reader.ts`

---

### **2. Page Objects (POC-Aligned)**
- [x] LoginPage - Login, logout, portal navigation
- [x] NavigationPage - Main tabs, sidebar, sub-tabs
- [x] PageDetailsPage - Field input, Excel data entry
- [x] FlexTablePage - Table interactions, row operations
- [x] ModalPage - Modal dialogs, popups

**Date Completed**: July 2026  
**Key Patterns Implemented**:
- JavaScript click for LWC components (`dispatchEvent('click')`)
- Dynamic spinner/modal/toast waits
- Lazy-rendered contenteditable handling for rich text
- Column mapping for flex tables
- Retry logic for Salesforce field inputs

**Files Created**:
- `src/project/pages/login-page.ts`
- `src/project/pages/navigation-page.ts`
- `src/project/pages/page-details-page.ts`
- `src/project/pages/flex-table-page.ts`
- `src/project/pages/modal-page.ts`

---

### **3. Step Definitions (Java-Compatible)**
- [x] navigation-steps.ts (~200 steps)
- [x] assertion-steps.ts (~185 steps)
- [x] login-steps.ts (~10 steps)
- [x] misc-steps.ts (~40 steps)
- [x] composite-steps.ts (~25 steps - API stubs)
- [x] approval-steps.ts (~20 steps)

**Date Completed**: July 2026  
**Verification**: `npx cucumber-js --dry-run` → 0 undefined, 0 ambiguous

**Files Created**:
- `src/project/step-definitions/common/navigation-steps.ts`
- `src/project/step-definitions/common/assertion-steps.ts`
- `src/project/step-definitions/common/login-steps.ts`
- `src/project/step-definitions/common/misc-steps.ts`
- `src/project/step-definitions/common/composite-steps.ts`
- `src/project/step-definitions/common/approval-steps.ts`

---

### **4. Utilities & Helpers**
- [x] SavedValues - Token resolution system
- [x] WaitHelper - Dynamic waits (spinners, modals, toasts)
- [x] ClickHelper - LWC-compatible click strategies
- [x] DateTokenParser - {Date:...} token parsing
- [x] Logger - Scenario-level logging with buffer
- [x] UserResolver - Role-based credential mapping

**Date Completed**: July 2026  
**Key Features**:
- Resolves `{SavedValue:KEY}`, `---module:-:key---`, `{Date:pattern::modifiers}`
- Handles numeric Excel values (dates, amounts)
- Buffers last 500 log entries per scenario
- Maps user roles to environment credentials

**Files Created**:
- `src/framework/utils/saved-values.ts`
- `src/framework/utils/wait-helper.ts`
- `src/framework/utils/click-helper.ts`
- `src/framework/utils/date-token-parser.ts`
- `src/framework/utils/logger.ts`
- `src/framework/utils/user-resolver.ts`

---

### **5. API Integration**
- [x] Salesforce REST API client
- [x] Grantor API service (program/announcement creation)
- [x] API filters with Salesforce record ID resolution

**Date Completed**: July 2026  
**Endpoints Implemented**:
- Authentication (OAuth 2.0)
- Program activation
- Announcement publishing
- Record ID lookup (`getRecordIds/v1`)

**Files Created**:
- `src/framework/api/salesforce-api-client.ts`
- `src/framework/api/grantor-api-service.ts`

---

### **6. Failure Diagnostics System**
- [x] Full-page screenshots
- [x] DOM snapshots (full + smart extraction)
- [x] Locator analysis (failing XPath + what exists)
- [x] Browser console logs
- [x] Framework execution logs
- [x] UI state snapshot (spinners, modals, toasts)
- [x] Failure summary with debugging instructions

**Date Completed**: July 2026  
**Output Location**: `reports/diagnostics/<scenario>_<timestamp>/`

**Files Created**:
- `src/framework/utils/failure-diagnostics.ts`

---

### **7. Field Input Handlers**
- [x] Rich text fields (`lightning-input-rich-text`)
- [x] Date fields with numeric offsets
- [x] Text inputs with retry logic
- [x] Combobox/picklist (CSS + `button[aria-haspopup='listbox']`)
- [x] Lookup/autocomplete (`input[type='search']` + result picker)
- [x] Multi-select (Move to Chosen)
- [x] Checkboxes
- [x] Radio buttons
- [x] Textareas

**Date Completed**: July 15, 2026  
**Key Design**: Uses CSS selectors (pierce shadow DOM) + `detectFieldType()` auto-detection + `findEditableWrapper()` retry loop for lazy-rendered LWC

---

### **8. Flex Table Operations**
- [x] Enter rows via "New" button
- [x] Edit rows inline via "Edit" button
- [x] Save values from specific rows/columns
- [x] Dynamic column mapping
- [x] Type-aware cell filling (text, date, checkbox, lookup)

**Date Completed**: July 2026  
**Key Methods**:
- `enterFlexTableRows()`
- `editFlexTableRowsInline()`
- `constructColumnMapping()`
- `fillTableCell()`

---

### **9. Token Resolution**
- [x] `{SavedValue:KEY}` - Runtime scenario values
- [x] `---module:-:key---` - Properties file lookup
- [x] `{Date:pattern::modifiers}` - Date formatting with offsets
- [x] `{grantor_tableId:KEY}` - Table ID mapping
- [x] `{grantee_tableId:KEY}` - Table ID mapping
- [x] Numeric value handling from Excel

**Date Completed**: July 2026  
**Supported Date Modifiers**: `d+N`, `d-N`, `M+N`, `Y+N`, `d=N`, etc.

---

### **10. JWT Authentication System**
- [x] JWT token exchange with Salesforce
- [x] Frontdoor URL login (no password required)
- [x] Session caching per persona
- [x] Preflight health check (`npm run preflight`)
- [x] Automatic fallback to password login for Grantee URLs

**Date Completed**: July 13, 2026  
**Files Created**:
- `src/framework/auth/salesforce-jwt.ts`
- `src/framework/auth/jwt-login.strategy.ts`
- `src/framework/auth/password-login.strategy.ts`
- `src/framework/auth/login-dispatcher.ts`
- `src/framework/auth/preflight.ts`

**Rollback**: Set `SF_AUTH_MODE=password` in `.env.auto`

---

### **11. Shadow DOM & LWC Field Handling**
- [x] CSS selectors for shadow DOM piercing (XPath does NOT pierce)
- [x] Dual attribute support: `data-field_api_name` (page divs) + `data-fieldapiname` (c-fieldlwc modals)
- [x] `findEditableWrapper()` with retry loop for lazy-rendered inputs
- [x] `detectFieldType()` auto-detection matching Java order
- [x] Modal-scoped locators (`modal__container`, `slds-modal`, `section[role='dialog']`)
- [x] Specialized handlers: lookup, picklist, multiselect, radio, checkbox, richtext, date, text

**Date Completed**: July 15, 2026  
**File Modified**: `src/project/pages/page-details-page.ts`  
**See Also**: `docs/migration-logs/SHADOW-DOM-FIELD-GUIDE.md`

---

## 🔧 Key Fixes Applied

### **Fix #1: API Filter - Salesforce Record ID Resolution**
**Issue**: `DIRECT_GRANT_YES_BA` filter used raw organization name instead of Salesforce ID  
**Solution**: Added `getIdOf()` call to resolve org name → record ID  
**File**: `src/framework/api/grantor-api-service.ts`  
**Date**: July 10, 2026

---

### **Fix #2: Rich Text Field Handling**
**Issue**: `lightning-input-rich-text` fields failed - contenteditable region is lazy-rendered  
**Solution**: Click to activate, wait for contenteditable, then type  
**File**: `src/project/pages/page-details-page.ts`  
**Date**: July 10, 2026

---

### **Fix #3: Flex Table Row Operations**
**Issue**: Enter/edit row steps were non-functional stubs  
**Solution**: Ported full Java logic with column mapping and type-aware cell filling  
**File**: `src/project/pages/flex-table-page.ts`  
**Date**: July 10, 2026

---

### **Fix #4: Save Value From Row**
**Issue**: Used hardcoded column index instead of dynamic mapping  
**Solution**: Construct column map from table headers, use column name  
**File**: `src/project/step-definitions/common/navigation-steps.ts`  
**Date**: July 10, 2026

---

### **Fix #5: Date Token Resolution**
**Issue**: `{Date:...}` tokens were never resolved  
**Solution**: Ported Java `TypeRegistryConfiguration.parseDate()` to TypeScript  
**File**: `src/framework/utils/date-token-parser.ts`  
**Date**: July 10, 2026

---

### **Fix #6: Numeric Excel Values**
**Issue**: `SavedValues.resolve()` crashed on numeric Excel cells (120, 100, 10000)  
**Solution**: Accept `unknown` input, convert to string before regex operations  
**File**: `src/framework/utils/saved-values.ts`  
**Date**: July 10, 2026

---

### **Fix #7: Date Field Input**
**Issue**: Numeric values in date fields weren't converted to dates  
**Solution**: Detect `lightning-datepicker`, parse numeric offset, format as MM/dd/yyyy  
**File**: `src/project/pages/page-details-page.ts`  
**Date**: July 10, 2026

---

### **Fix #8: Duplicate Step Definitions**
**Issue**: 169 ambiguous scenarios due to duplicate regex patterns  
**Solution**: Removed narrow duplicate, kept broader existing pattern  
**File**: `src/project/step-definitions/common/assertion-steps.ts`  
**Date**: July 10, 2026

---

### **Fix #9: Shadow DOM — XPath Cannot Pierce LWC**
**Issue**: Field wrappers located via XPath found nothing inside `c-fieldlwc` components in modals  
**Root Cause**: Playwright XPath does NOT pierce shadow DOM boundaries. CSS selectors DO.  
**Solution**: Replaced all field locators with CSS selectors (`[data-field_api_name]`, `c-fieldlwc[data-fieldapiname]`)  
**File**: `src/project/pages/page-details-page.ts` — `getFieldLocator()`  
**Date**: July 14, 2026

---

### **Fix #10: Dual Attribute — data-fieldapiname vs data-field_api_name**
**Issue**: Modal LWC fields use `data-fieldapiname` (camelCase) on `c-fieldlwc`, while page detail divs use `data-field_api_name` (underscore). Only the underscore variant was searched.  
**Root Cause**: CSS selector found background page element (no inputs) instead of modal form field  
**Solution**: Added `c-fieldlwc[data-fieldapiname='X']` to all CSS locators  
**File**: `src/project/pages/page-details-page.ts` — `getFieldLocator()`  
**Date**: July 15, 2026

---

### **Fix #11: Lazy-Rendered Inputs in c-fieldlwc**
**Issue**: `findEditableWrapper()` checked for inputs once and gave up. Modal fields (c-fieldlwc) render inputs async after the wrapper element is attached.  
**Root Cause**: 630ms after modal open, wrapper exists but `<input>` children haven't rendered yet. By 2s+ they appear.  
**Solution**: Retry loop — up to 5 attempts, 1s apart, waiting for editable children to appear  
**File**: `src/project/pages/page-details-page.ts` — `findEditableWrapper()`  
**Date**: July 15, 2026

---

### **Fix #12: Year Picklist Range**
**Issue**: Random year generation (2036-2085) produced values outside the Salesforce picklist dropdown  
**Solution**: Capped range to 2036-2060 (`random(0-24) + 10`)  
**File**: `src/project/step-definitions/common/navigation-steps.ts` — `enterUniqueYearHandler`  
**Date**: July 15, 2026

---

### **Fix #13: Soft Assertion Bug**
**Issue**: ~20 step definitions with `(softly see|see)` capture groups hard-failed on "softly" variants  
**Solution**: Added `softAssert()` helper wrapping assertions in try/catch for "softly" variants  
**File**: `src/project/step-definitions/common/assertion-steps.ts`  
**Date**: July 14, 2026

---

## 📊 Test Execution Results

### **Dry Run Validation**
```bash
npx cucumber-js --dry-run
```
**Result**: 5,226 scenarios, 0 undefined, 0 ambiguous, 0 duplicates ✅

### **TypeScript Compilation**
```bash
npx tsc --noEmit
```
**Result**: 0 errors ✅

### **Live Test Execution**

| Run | Date | Tag | Steps | Result | Root Cause / Notes |
|-----|------|-----|-------|--------|-------------------|
| 1-6 | Jul 10 | @56710 | 7→15/35 | Failed | Login, flex table, dropdown — iteratively fixed |
| **7** | **Jul 10** | **@56709** | **6/6** | **✅ PASS** | First full pass — login+nav+sidebar+table+assertion |
| **8** | **Jul 10** | **@504582** | **13/17** | Partial | 13 framework steps pass, fail is stale data |
| 9-10 | Jul 10 | @DG_API | 0→2/6 | Failed | Auth fixed → SF trigger bug (not framework) |
| **11** | **Jul 10** | **@504568** | **21/21** | **✅ PASS** | Modal + dropdown + form + Save + verify |
| **12** | **Jul 14** | **@521631** | **12/12** | **✅ PASS** | After soft assertion fix |
| 13 | Jul 14 | @489011 | 7/25 | Failed | Program__c lookup not found (XPath shadow DOM) |
| 14 | Jul 14 | @489011 | 8/25 | Failed | Year field as combobox not text |
| 15 | Jul 15 | @489011 | 8/25 | Failed | Text/picklist fields empty (wrong attribute) |
| 16 | Jul 15 | @489011 | 9/25 | Failed | Year 2083 out of picklist range |
| **17** | **Jul 15** | **@489011** | **25/25** | **✅ PASS** | All field types work — lookup, picklist, text |

---

## 🔄 Pending Work

### **High Priority**
- [ ] Run broader regression (10+ scenarios across multiple features)
- [ ] Complete composite API steps (currently stubs — createStandaloneGrant, etc.)
- [ ] Batch-remove static `I wait for "2" seconds` steps from Gherkin (~14,000 removable)

### **Medium Priority**
- [ ] Implement mail notification checker (IMAP)
- [ ] CI/CD pipeline integration
- [ ] Cross-project validation (run on 2nd GovGrants project)

### **Low Priority**
- [ ] Performance optimization
- [ ] Parallel execution support
- [ ] Old pattern (non-LWC) page interactions

---

## 📈 Migration Progress

| Component | Status | Completion |
|-----------|--------|------------|
| **Framework Setup** | ✅ Complete | 100% |
| **Page Objects** | ✅ Complete | 100% |
| **Step Definitions** | ✅ Complete | 100% |
| **Utilities** | ✅ Complete | 100% |
| **API Integration** | ✅ Complete | 100% |
| **Diagnostics** | ✅ Complete | 100% |
| **Field Handlers** | ✅ Complete | 100% |
| **Flex Tables** | ✅ Complete | 100% |
| **Token Resolution** | ✅ Complete | 100% |
| **JWT Authentication** | ✅ Complete | 100% |
| **Shadow DOM Handling** | ✅ Complete | 100% |
| **Live Testing** | 🔄 In Progress | 65% |
| **Composite API Steps** | 🔄 Stubs | 40% |

**Overall Progress**: 92%

---

## 🎯 Success Criteria

- [x] All Gherkin steps from Java framework ported
- [x] 0 undefined steps in dry-run
- [x] 0 ambiguous steps in dry-run
- [x] TypeScript compiles without errors
- [x] Diagnostic system captures failures
- [ ] Critical test scenarios pass live
- [ ] Static waits removed
- [ ] Framework validated across multiple features

---

## 📝 Lessons Learned

### **1. LWC Requires JavaScript Clicks**
Salesforce Lightning Web Components often need `dispatchEvent('click')` instead of regular `.click()` for event handlers to fire properly.

### **2. Lazy-Rendered Components**
Rich text editors and some modals render content only after user interaction. Must wait for child elements to appear.

### **3. Numeric Excel Values**
Excel reader returns numbers as `number` type, not strings. Framework must handle type coercion.

### **4. Date Field Flexibility**
Java framework accepts both formatted dates and numeric day offsets. Playwright must match this flexibility.

### **5. Dynamic Column Mapping**
Flex tables have varying column orders across orgs. Must construct column map from actual headers.

### **6. Shadow DOM in Playwright — XPath vs CSS**
Playwright CSS selectors auto-pierce open shadow DOM. XPath does NOT. This is the single most important difference from Java Selenium. All field locators must use CSS, not XPath.

### **7. Dual Attribute Pattern in GovGrants LWC**
GovGrants uses two attributes for field API names:
- `data-field_api_name` (underscore) — on `<div>` wrappers in page details
- `data-fieldapiname` (camelCase) — on `<c-fieldlwc>` components in modals

Both must be included in CSS selectors to cover all field contexts.

### **8. Lazy-Rendered LWC Inputs**
After a modal opens, `c-fieldlwc` wrapper elements attach immediately but their internal `<input>` children render asynchronously (often 1-3 seconds later). Must retry when checking for editable elements.

---

## 🔗 Related Files

- **Project Onboarding Guide**: `docs/PROJECT_ONBOARDING_GUIDE.md`
- **Test Reports**: `reports/cucumber-report.html`
- **Diagnostic Bundles**: `reports/diagnostics/`
- **Java Framework**: `D:\mean\innovations\govgrants-NYSED-automation\`

---

**Migration Lead**: Automation Team  
**Last Updated**: July 15, 2026  
**Next Review**: After broader regression validation
