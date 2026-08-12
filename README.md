# GovGrants Playwright Automation Framework

## 📋 Overview

Enterprise-grade test automation framework for GovGrants Salesforce applications using **Playwright + TypeScript + Cucumber**. Designed to be **project-agnostic** and reusable across 15+ GovGrants projects.

---

## 🚀 Quick Start

### **Prerequisites**
- Node.js 18+ 
- npm or yarn

### **Installation**
```bash
npm install
```

### **Run Tests**
```bash
# Run all tests
npx cucumber-js

# Run specific tag
npx cucumber-js --tags "@smoke"

# Run specific feature
npx cucumber-js src/project/features/Grantor/Module/Feature.feature

# Dry run (validate steps)
npx cucumber-js --dry-run
```

### **TypeScript Validation**
```bash
npx tsc --noEmit
```

---

## 📚 Documentation

**📖 [Complete Documentation](docs/README.md)**

### **Key Documents**
- **[Project Onboarding Guide](docs/PROJECT_ONBOARDING_GUIDE.md)** - Add new projects to the framework
- **[NYSED Migration Log](docs/migration-logs/NYSED-MIGRATION-LOG.md)** - Current project status
- **[Migration Template](docs/migration-logs/PROJECT-TEMPLATE.md)** - Template for new projects

---

## 🏗️ Project Structure

```
govgrants-playwright-automation/
├── src/
│   ├── framework/              # Generic framework (reused across projects)
│   │   ├── api/               # Salesforce REST API clients
│   │   ├── config/            # Properties file loader
│   │   ├── hooks/             # Browser lifecycle hooks
│   │   ├── utils/             # Helpers (waits, clicks, logging, diagnostics)
│   │   └── world/             # Cucumber custom world
│   └── project/               # Project-specific code
│       ├── features/          # Gherkin scenarios (.feature)
│       ├── step-definitions/  # Step implementations
│       ├── pages/             # Page object models
│       ├── data/              # Excel test data
│       └── config/            # Properties files
├── docs/                      # Documentation & migration logs
├── reports/                   # Test reports & diagnostics
├── .env.auto                  # Environment variables
├── cucumber.js                # Cucumber configuration
├── tsconfig.json              # TypeScript configuration
└── package.json               # Dependencies
```

---

## 🎯 Framework Features

### **✅ Generic & Reusable**
- **Project-agnostic** - Works across all GovGrants projects
- **Gherkin-compatible** - 100% compatible with Java Selenium framework
- **Zero code changes** - Just copy Gherkin files and configs

### **✅ Salesforce LWC Support**
- JavaScript click strategies for LWC components
- Dynamic waits (spinners, modals, toasts)
- Lazy-rendered component handling
- Flex table operations with column mapping

### **✅ Advanced Field Handling**
- Rich text fields (`lightning-input-rich-text`)
- Date fields with numeric offsets
- Combobox/picklist
- Checkboxes, textareas
- Retry logic for Salesforce field inputs

### **✅ Token Resolution**
- `{SavedValue:KEY}` - Runtime scenario values
- `---module:-:key---` - Properties file lookup
- `{Date:pattern::modifiers}` - Date formatting with offsets
- `{grantor_tableId:KEY}` - Table ID mapping
- Numeric value handling from Excel

### **✅ Comprehensive Diagnostics**
- Full-page screenshots on failure
- DOM snapshots (full + smart extraction)
- Locator analysis (failing XPath + what exists)
- Browser console logs
- Framework execution logs
- UI state snapshot

---

## 🔧 Configuration

### **Environment Variables** (`.env.auto`)
```bash
SALESFORCE_BASE_URL=https://test8-internal--nysedauto.sandbox.my.salesforce.com
SALESFORCE_USERNAME=admin@example.com.auto
SALESFORCE_PASSWORD=YourPassword123
SALESFORCE_SECURITY_TOKEN=YourSecurityToken

# User credentials for different roles
PO_USERNAME=po@example.com.auto
PO_PASSWORD=Password123
FD_USERNAME=fd@example.com.auto
FD_PASSWORD=Password123
```

### **Properties Files** (`src/project/config/properties/`)
- `AUTOEnvData.properties` - Saved values, org names, user emails
- `announcement.properties` - Table IDs for announcement module
- `subAwardStandAlone.properties` - Table IDs for subaward module
- etc.

---

## 📊 Current Status

### **NYSED Project**
- **Status**: 🔄 85% Complete
- **Scenarios**: 5,226 total
- **Features**: 150+
- **Dry Run**: ✅ 0 undefined, 0 ambiguous
- **TypeScript**: ✅ 0 errors

### **Framework Completion**
- [x] Step definitions ported from Java
- [x] Page objects aligned with POC
- [x] API integration working
- [x] Excel reading functional
- [x] Token resolution complete
- [x] Date parsing implemented
- [x] Flex table operations working
- [x] Rich text field handling
- [x] Diagnostic system active
- [ ] Static waits removal (in progress)
- [ ] Additional field types (as needed)

---

## 🐛 Troubleshooting

### **Undefined Steps**
```bash
npx cucumber-js --dry-run
```
Check step definition regex patterns and Gherkin syntax.

### **Field Not Found**
Check `reports/diagnostics/` for:
- Screenshot of page state
- DOM snapshot
- Locator analysis

### **API Failures**
Verify Salesforce credentials in `.env` file and security token.

---

## 📝 Best Practices

1. **Keep Framework Generic** - Never hardcode project-specific values
2. **Use Dynamic Waits** - Avoid static `I wait for "X" seconds`
3. **Leverage Diagnostics** - Check `reports/diagnostics/` on failures
4. **Follow Java Patterns** - Maintain compatibility with Selenium framework
5. **Document Changes** - Update migration logs for project-specific fixes

---

## 🔗 Resources

- **Cucumber**: https://cucumber.io/docs/cucumber/
- **Playwright**: https://playwright.dev/
- **TypeScript**: https://www.typescriptlang.org/docs/
- **Salesforce LWC**: https://developer.salesforce.com/docs/component-library/overview/components

---

## 📞 Support

For questions or issues:
1. Check [documentation](docs/README.md)
2. Review [migration logs](docs/migration-logs/)
3. Check diagnostic bundles in `reports/diagnostics/`
4. Compare with Java framework implementation

---

**Maintained By**: Automation Team  
**Last Updated**: July 11, 2026  
**Framework Version**: 1.0
