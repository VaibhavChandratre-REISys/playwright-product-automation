# GovGrants Playwright Framework - Technical Overview

## 🎯 Framework Architecture

### **Design Philosophy**
The framework follows a **layered architecture** with clear separation between:
1. **Generic Framework Layer** - Reusable across all 15+ projects
2. **Project-Specific Layer** - Gherkin files, test data, configurations
3. **Salesforce Integration Layer** - LWC-specific patterns and API clients

---

## 🏗️ Layer Breakdown

### **Layer 1: Generic Framework** (`src/framework/`)

#### **API Integration** (`api/`)
- `salesforce-api-client.ts` - OAuth 2.0 authentication, REST API wrapper
- `grantor-api-service.ts` - Program/announcement creation, record ID resolution

**Key Features**:
- Token-based authentication with auto-refresh
- Retry logic for transient failures
- Environment-aware endpoint resolution

---

#### **Configuration** (`config/`)
- `properties-loader.ts` - Java `.properties` file parser

**Supported Formats**:
```properties
# Key-value pairs
savedValue.key=value

# Table ID mappings
grantor_tableId.TableKey=actual-table-name

# Environment-specific values
orgName=NYSED Automation
```

---

#### **Hooks** (`hooks/`)
- `browser-hooks.ts` - Cucumber lifecycle management

**Lifecycle Events**:
- `Before` - Clear logs, open browser
- `BeforeStep` - Track current step name
- `After` - Capture diagnostics on failure, close browser
- `AfterAll` - Cleanup resources

---

#### **Utilities** (`utils/`)

##### **SavedValues** (`saved-values.ts`)
Token resolution engine supporting:
- `{SavedValue:KEY}` - Runtime scenario values
- `---module:-:key---` - Properties file lookup
- `{Date:pattern::modifiers}` - Date formatting
- `{grantor_tableId:KEY}` - Table ID mapping
- Numeric value coercion from Excel

##### **WaitHelper** (`wait-helper.ts`)
Dynamic wait strategies:
- `waitForSpinnerDisappear()` - LWC spinner detection
- `waitForModal()` - Modal dialog appearance
- `waitForToast()` - Toast message detection
- `waitForTable()` - Flex table loading
- `waitForLookup()` - Lookup dropdown

##### **ClickHelper** (`click-helper.ts`)
LWC-compatible click strategies:
- `click()` - Standard Playwright click
- `clickWithJavaScript()` - JavaScript `dispatchEvent('click')`
- `jsClick()` - Alias for JavaScript click
- Retry logic with fallback strategies

##### **DateTokenParser** (`date-token-parser.ts`)
Java `TypeRegistryConfiguration.parseDate()` port:
- Pattern parsing (M/d/yyyy, MM/dd/yyyy, etc.)
- Modifier support (d+30, M-3, Y+1, d=15)
- Semicolon-separated modifier chains

##### **ExcelReader** (`excel-reader.ts`)
Excel file parsing with type preservation:
- Reads `.xlsx` files
- Returns data as 2D arrays
- Preserves numeric types
- Handles empty cells

##### **Logger** (`logger.ts`)
Scenario-level logging:
- Buffers last 500 entries
- Timestamped log entries
- Log levels (info, warn, error)
- Scenario-scoped clearing

##### **FailureDiagnostics** (`failure-diagnostics.ts`)
Comprehensive failure analysis:
- Full-page screenshots
- DOM snapshots (full + smart extraction)
- Locator analysis (failing XPath + alternatives)
- Browser console logs
- Framework execution logs
- UI state snapshot

---

#### **World** (`world/`)
- `custom-world.ts` - Cucumber World extension

**Provides**:
- Playwright `page` and `browser` instances
- Page object instances
- SavedValues instance
- FailureDiagnostics instance
- Current step tracking

---

### **Layer 2: Project-Specific** (`src/project/`)

#### **Features** (`features/`)
Gherkin scenario files organized by project:
```
features/
├── Grantor/
│   ├── Announcement/
│   ├── Program/
│   └── UserRegistration/
├── Grantee/
│   ├── Application/
│   ├── Award/
│   └── Budget/
└── Common/
```

---

#### **Step Definitions** (`step-definitions/`)

##### **navigation-steps.ts** (~200 steps)
- Navigation (tabs, sidebar, sub-tabs)
- Field input (text, rich text, date, checkbox)
- Excel data entry
- Flex table operations
- Button clicks

##### **assertion-steps.ts** (~185 steps)
- Field value assertions
- Visibility checks
- Table content validation
- Soft assertions
- Symbol/icon assertions

##### **login-steps.ts** (~10 steps)
- Login as user
- Logout
- Re-login
- Portal navigation

##### **misc-steps.ts** (~40 steps)
- Wait operations
- File uploads/downloads
- Email portal navigation
- Random value generation

##### **composite-steps.ts** (~25 steps)
- API-based setup (program creation, announcement publishing)
- Multi-step composite operations

##### **approval-steps.ts** (~20 steps)
- Workflow approvals
- Recommendation submission

---

#### **Pages** (`pages/`)

##### **BasePage** (`base-page.ts`)
Base class providing:
- `resolve()` - Token resolution
- `click()` - Click helper
- `fill()` - Input helper
- `assertVisible()` - Visibility check
- Wait helper access

##### **LoginPage** (`login-page.ts`)
- `loginAs()` - Login with credentials
- `logout()` - Logout with cleanup
- `navigateToPortal()` - Portal navigation

##### **NavigationPage** (`navigation-page.ts`)
- `clickMainTab()` - Main menu navigation
- `clickSidebarContent()` - Sidebar link navigation
- `clickSubTab()` - Sub-tab navigation

##### **PageDetailsPage** (`page-details-page.ts`)
- `enterFieldValue()` - Single field input
- `enterValuesFromExcel()` - Bulk Excel data entry
- `handleFieldInput()` - Type-aware field filling
- `handleDateInput()` - Date field with numeric offset
- `fillRichTextArea()` - Rich text editor
- `fillInputWithRetry()` - Retry logic for inputs

##### **FlexTablePage** (`flex-table-page.ts`)
- `enterFlexTableRows()` - Add new rows
- `editFlexTableRowsInline()` - Edit existing rows
- `constructColumnMapping()` - Dynamic column map
- `fillTableCell()` - Type-aware cell filling
- `clickTopRightButton()` - Table action buttons
- `clickTableActionIconById()` - Row-level icons

##### **ModalPage** (`modal-page.ts`)
- `clickModalButton()` - Modal button clicks
- `acceptPopUp()` - Popup confirmation
- `getModalTitle()` - Modal title extraction

---

#### **Data** (`data/`)
Excel test data files:
- `Award_Field_Values.xlsx`
- `Registration_Field_Values.xlsx`
- `Application_Field_Values.xlsx`
- etc.

**Format**:
```
| SubTab | Field API Name | Field Value |
|--------|----------------|-------------|
| Details | Name__c | Test Name |
| Budget | Amount__c | 10000 |
```

---

#### **Config** (`config/properties/`)
Properties files:
- `AUTOEnvData.properties` - Environment values
- `announcement.properties` - Table IDs
- `subAwardStandAlone.properties` - Table IDs
- etc.

---

## 🔄 Data Flow

### **Test Execution Flow**
```
1. Cucumber loads feature file
2. Hooks: Before → Open browser, clear logs
3. Step Definition executes
   ↓
4. Step calls Page Object method
   ↓
5. Page Object resolves tokens via SavedValues
   ↓
6. Page Object interacts with Playwright page
   ↓
7. WaitHelper ensures element ready
   ↓
8. ClickHelper performs action
   ↓
9. Logger records execution
   ↓
10. Hooks: After → Capture diagnostics if failed
```

### **Token Resolution Flow**
```
Input: "{SavedValue:orgName} - {Date:M/d/yyyy::d+30}"
  ↓
SavedValues.resolve()
  ↓
1. Check runtime store for "orgName" → "NYSED"
2. Parse date token → "08/10/2026"
  ↓
Output: "NYSED - 08/10/2026"
```

### **Excel Data Entry Flow**
```
Gherkin: And I enter "SheetName" values from "File.xlsx"
  ↓
1. ExcelReader reads File.xlsx, sheet SheetName
2. Returns: [["SubTab", "FieldAPI", "Value"], ["Details", "Name__c", "Test"]]
  ↓
3. PageDetailsPage.enterValuesFromExcel()
   - For each row:
     a. Resolve field API name (token resolution)
     b. Resolve field value (token resolution + type coercion)
     c. Navigate to SubTab if needed
     d. Call enterFieldValue()
        ↓
     e. handleFieldInput() detects field type
        - Rich text? → fillRichTextArea()
        - Date? → handleDateInput()
        - Text? → fillInputWithRetry()
        - Checkbox? → click if needed
```

---

## 🎯 Key Design Patterns

### **1. Page Object Pattern**
Each page/component has a dedicated class with methods for interactions.

### **2. Strategy Pattern**
Different click/wait/fill strategies based on element type.

### **3. Template Method Pattern**
Base classes define common operations, subclasses implement specifics.

### **4. Factory Pattern**
World creates page object instances on demand.

### **5. Singleton Pattern**
SavedValues, Logger are singleton-like (one per scenario).

---

## 🔧 Extension Points

### **Adding New Field Types**
1. Update `PageDetailsPage.handleFieldInput()`
2. Add detection logic (locator pattern)
3. Implement fill method
4. Add to priority order

### **Adding New Step Definitions**
1. Add regex pattern to appropriate step file
2. Extract parameters from Gherkin
3. Call page object method
4. Add logging

### **Adding New Page Objects**
1. Extend `BasePage`
2. Implement page-specific methods
3. Add to `CustomWorld`
4. Use in step definitions

### **Adding New Utilities**
1. Create utility class in `src/framework/utils/`
2. Export from utility file
3. Import in page objects or step definitions

---

## 📊 Performance Considerations

### **Wait Strategies**
- Use dynamic waits (spinner/modal detection)
- Avoid static `waitForTimeout()` except for external systems
- Set reasonable timeouts (30s for tables, 5s for modals)

### **Parallel Execution**
- Framework supports parallel execution via Cucumber workers
- Use `--parallel N` flag
- Ensure scenarios are independent

### **Resource Cleanup**
- Browsers closed after each scenario
- Logs cleared before each scenario
- Diagnostic files cleaned up periodically

---

## 🔒 Security

### **Credentials Management**
- Store in `.env` files (gitignored)
- Never hardcode in code
- Use environment-specific files (`.env.auto`, `.env.qa`)

### **API Tokens**
- Salesforce security tokens in `.env`
- OAuth tokens refreshed automatically
- No tokens in logs or diagnostics

---

## 📝 Maintenance

### **Regular Tasks**
- Update dependencies (`npm update`)
- Review and remove static waits
- Optimize slow tests
- Clean up old diagnostic bundles

### **When Adding Projects**
- Copy Gherkin files
- Copy Excel data
- Copy properties files
- Configure `.env` file
- Run dry-run validation
- Execute smoke tests

---

## 🔗 References

- **Cucumber**: https://cucumber.io/docs/cucumber/
- **Playwright**: https://playwright.dev/
- **TypeScript**: https://www.typescriptlang.org/docs/
- **Salesforce LWC**: https://developer.salesforce.com/docs/component-library/

---

**Last Updated**: July 11, 2026  
**Framework Version**: 1.0
