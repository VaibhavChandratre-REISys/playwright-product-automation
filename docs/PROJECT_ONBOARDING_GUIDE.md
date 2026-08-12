# GovGrants Playwright Framework - Project Onboarding Guide

## 📋 Overview

This guide explains how to add new GovGrants projects to the Playwright automation framework. The framework is designed to be **project-agnostic** - you only need to copy Gherkin files and configurations. All framework logic is reusable across all 15+ projects.

---

## 🎯 Framework Design Principles

### ✅ **What's Generic (Reused Across All Projects)**
- **Step Definitions** - Universal Gherkin step implementations
- **Page Objects** - Generic Salesforce LWC interaction logic
- **API Clients** - Salesforce REST API integration
- **Utilities** - SavedValues, WaitHelper, Excel readers, date parsers
- **Hooks** - Browser setup, failure diagnostics, logging

### 📦 **What's Project-Specific (Copied Per Project)**
- **Feature Files** - Gherkin scenarios (`.feature`)
- **Test Data** - Excel files (`.xlsx`)
- **Properties Files** - Environment configs (`.properties`)
- **Environment Variables** - Salesforce org credentials (`.env`)

---

## 🚀 Adding a New Project

### **Step 1: Create Project Directory Structure**

```bash
src/project/
├── features/
│   └── <ProjectName>/           # ← New project folder
│       ├── Module1/
│       │   └── Feature1.feature
│       ├── Module2/
│       │   └── Feature2.feature
│       └── ...
├── data/
│   └── <ProjectName>_*.xlsx    # ← Project-specific Excel files
└── config/
    └── properties/
        └── <ProjectName>EnvData.properties  # ← Project configs
```

### **Step 2: Copy Gherkin Files**

Copy feature files from the Java Selenium project:

```bash
# From Java project
cp -r /path/to/java-project/src/test/resources/features/<ProjectName>/ \
      src/project/features/<ProjectName>/
```

**No modifications needed!** The Gherkin steps are identical between Java and Playwright.

### **Step 3: Copy Test Data Files**

Copy Excel files from the Java project:

```bash
# From Java project
cp /path/to/java-project/src/test/resources/testData/*.xlsx \
   src/project/data/
```

**Supported Excel formats:**
- Field input sheets: `SubTab | Field API Name | Field Value`
- Flex table sheets: `Column1 | Column2 | Column3 | ...`

### **Step 4: Copy Properties Files**

Copy `.properties` files from the Java project:

```bash
# From Java project
cp /path/to/java-project/src/test/resources/properties/*.properties \
   src/project/config/properties/
```

**Common property files:**
- `<ENV>EnvData.properties` - Saved values, org names, user emails
- `announcement.properties` - Table IDs for announcement module
- `subAwardStandAlone.properties` - Table IDs for subaward module
- `directGrantAndAward.properties` - Table IDs for grant/award module
- etc.

### **Step 5: Configure Environment Variables**

Create a new `.env.<project>` file:

```bash
# Example: .env.myproject
SALESFORCE_BASE_URL=https://test8-internal--myproject.sandbox.my.salesforce.com
SALESFORCE_USERNAME=admin@myproject.com.auto
SALESFORCE_PASSWORD=YourPassword123
SALESFORCE_SECURITY_TOKEN=YourSecurityToken

# User credentials for different roles
PO_USERNAME=po@myproject.com.auto
PO_PASSWORD=Password123
FD_USERNAME=fd@myproject.com.auto
FD_PASSWORD=Password123
GRANTEE_SC_USERNAME=grantee@myproject.com.auto
GRANTEE_SC_PASSWORD=Password123
```

### **Step 6: Update User Resolver (If Needed)**

If your project uses different user role names, update `src/framework/utils/user-resolver.ts`:

```typescript
export const USER_CREDENTIALS: Record<string, UserCredentials> = {
  // ... existing users ...
  
  // Add new project-specific users
  'MY_PROJECT_ADMIN': {
    username: process.env.MY_PROJECT_ADMIN_USERNAME!,
    password: process.env.MY_PROJECT_ADMIN_PASSWORD!,
    displayName: 'My Project Admin',
  },
};
```

### **Step 7: Run Tests**

```bash
# Run all tests for the new project
npx cucumber-js --tags "@MyProjectTag"

# Run specific feature
npx cucumber-js src/project/features/MyProject/Module/Feature.feature

# Run with specific environment
ENV=myproject npx cucumber-js --tags "@smoke"
```

---

## 📊 Project Compatibility Checklist

### ✅ **Before Onboarding**
- [ ] Java Selenium tests are passing
- [ ] Feature files use standard Gherkin syntax
- [ ] Excel files follow framework format
- [ ] Properties files are properly structured
- [ ] Salesforce org credentials are available

### ✅ **After Onboarding**
- [ ] TypeScript compiles without errors (`npx tsc --noEmit`)
- [ ] Cucumber dry-run shows no undefined steps (`npx cucumber-js --dry-run`)
- [ ] Environment variables are loaded correctly
- [ ] Smoke tests pass
- [ ] Diagnostic system captures failures properly

---

## 🔧 Framework Components Reference

### **Step Definitions** (`src/project/step-definitions/`)
- `navigation-steps.ts` - Navigation, field input, flex tables (~200 steps)
- `assertion-steps.ts` - Validations, soft assertions (~185 steps)
- `login-steps.ts` - Authentication, re-login (~10 steps)
- `misc-steps.ts` - Waits, file operations (~40 steps)
- `composite-steps.ts` - API-based setup steps (~25 steps)
- `approval-steps.ts` - Workflow approvals (~20 steps)

### **Page Objects** (`src/project/pages/`)
- `login-page.ts` - Login, logout, portal navigation
- `navigation-page.ts` - Main tabs, sidebar, sub-tabs
- `page-details-page.ts` - Field input, Excel data entry
- `flex-table-page.ts` - Table interactions, row operations
- `modal-page.ts` - Modal dialogs, popups

### **API Services** (`src/framework/api/`)
- `salesforce-api-client.ts` - Salesforce REST API authentication
- `grantor-api-service.ts` - Program/announcement creation, filters

### **Utilities** (`src/framework/utils/`)
- `saved-values.ts` - Token resolution, runtime values
- `wait-helper.ts` - Dynamic waits (spinners, modals, toasts)
- `click-helper.ts` - LWC-compatible click strategies
- `excel-reader.ts` - Excel file parsing
- `date-token-parser.ts` - {Date:...} token parsing
- `logger.ts` - Scenario-level logging

---

## 🎯 Supported Field Types

The framework automatically detects and handles:

| Field Type | Detection Logic | Example |
|------------|----------------|---------|
| **Rich Text** | `lightning-input-rich-text` | Description fields |
| **Date** | `lightning-datepicker` | Start/end dates |
| **Text** | `input[type='text']` | Names, IDs |
| **Textarea** | `textarea` | Long text fields |
| **Combobox** | `lightning-combobox` | Dropdowns |
| **Checkbox** | `input[type='checkbox']` | Yes/No fields |
| **Lookup** | `.lookupInput` | Related records |
| **Multi-select** | `.listbox__item` | Multiple selections |
| **Radio** | `.slds-radio_faux` | Single choice |

---

## 🔍 Token Resolution System

The framework resolves these token formats automatically:

### **Runtime Values**
```gherkin
{SavedValue:myKey}              # Scenario-scoped saved values
```

### **Properties Files**
```gherkin
---module:-:propertyKey---      # Java .properties lookup
{---module:-:propertyKey---}    # Same with braces
```

### **Date Tokens**
```gherkin
{Date:M/d/yyyy}                 # Current date
{Date:M/d/yyyy::d+30}          # 30 days from now
{Date:M/d/yyyy::d-7}           # 7 days ago
{Date:M/d/yyyy::M+3;d=15}      # 3 months from now, 15th day
```

### **Table IDs**
```gherkin
{grantor_tableId:TableKey}      # Grantor table mapping
{grantee_tableId:TableKey}      # Grantee table mapping
```

---

## 🐛 Troubleshooting

### **Undefined Steps**
```bash
# Check for undefined steps
npx cucumber-js --dry-run

# If steps are undefined, check:
# 1. Step definition regex patterns
# 2. Gherkin syntax (quotes, spaces)
# 3. Parameter types
```

### **Ambiguous Steps**
```bash
# Multiple step definitions match the same Gherkin
# Solution: Make regex patterns more specific or remove duplicates
```

### **Field Not Found**
```bash
# Check:
# 1. Field API name is correct (data-field_api_name)
# 2. Field is visible (not hidden by tab/section)
# 3. Wait for spinners to disappear
# 4. Check diagnostics bundle in reports/diagnostics/
```

### **Excel Data Issues**
```bash
# Verify:
# 1. Sheet name matches exactly
# 2. Columns: SubTab | Field API Name | Field Value
# 3. Numeric values are handled (dates, amounts)
# 4. No extra spaces in headers
```

### **API Failures**
```bash
# Check:
# 1. Salesforce credentials in .env
# 2. Security token is correct
# 3. API user has proper permissions
# 4. Salesforce org is accessible
```

---

## 📝 Best Practices

### **1. Keep Framework Generic**
- Never hardcode project-specific values in framework code
- Use properties files and environment variables
- Make page objects detect field types dynamically

### **2. Maintain Gherkin Compatibility**
- Keep step definitions identical to Java framework
- Use same token formats ({SavedValue:...}, ---module:-:key---)
- Follow same Excel data structure

### **3. Use Dynamic Waits**
- Avoid `I wait for "X" seconds` in Gherkin
- Let framework handle waits automatically
- Use spinner/modal/toast detection

### **4. Leverage Diagnostics**
- Check `reports/diagnostics/` on failures
- Review screenshots, DOM snapshots, locator analysis
- Use framework logs for debugging

### **5. Document Project-Specific Patterns**
- Note any unique table IDs in properties files
- Document custom user roles
- Track environment-specific configurations

---

## 🔗 Related Documentation

- **Migration Logs**: `docs/migration-logs/`
- **Java Framework**: `D:\mean\innovations\govgrants-NYSED-automation\`
- **Cucumber Docs**: https://cucumber.io/docs/cucumber/
- **Playwright Docs**: https://playwright.dev/

---

## 📞 Support

For questions or issues:
1. Check this guide first
2. Review diagnostic bundles in `reports/diagnostics/`
3. Compare with working NYSED project examples
4. Check Java framework for reference implementation

---

**Last Updated**: July 11, 2026  
**Framework Version**: 1.0  
**Maintained By**: Automation Team
