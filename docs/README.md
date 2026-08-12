# GovGrants Playwright Framework - Documentation

## 📚 Documentation Index

This folder contains all documentation for the GovGrants Playwright automation framework, including onboarding guides, migration logs, and project tracking.

---

## 📋 Available Documentation

### **1. Framework Overview**
**File**: `FRAMEWORK_OVERVIEW.md`  
**Purpose**: Technical deep-dive into framework architecture and design  
**Audience**: Framework Developers, Technical Leads

**Contents**:
- Framework architecture layers
- Component breakdown
- Data flow diagrams
- Design patterns
- Extension points
- Performance considerations

---

### **2. Project Onboarding Guide**
**File**: `PROJECT_ONBOARDING_GUIDE.md`  
**Purpose**: Step-by-step guide for adding new GovGrants projects to the framework  
**Audience**: QA Engineers, Automation Developers

**Contents**:
- Framework design principles
- Project setup steps
- Configuration guidelines
- Supported field types
- Token resolution system
- Troubleshooting guide
- Best practices

---

### **3. Migration Logs**
**Folder**: `migration-logs/`  
**Purpose**: Track migration progress for each GovGrants project  
**Format**: One markdown file per project

**Current Projects**:
- `NYSED-MIGRATION-LOG.md` - New York State Education Department (85% complete)

**Template**: `migration-logs/PROJECT-TEMPLATE.md` (use for new projects)

---

## 🎯 Quick Start

### **For New Project Onboarding**
1. Read `PROJECT_ONBOARDING_GUIDE.md`
2. Copy project files (Gherkin, Excel, properties)
3. Configure environment variables
4. Run dry-run validation
5. Execute smoke tests

### **For Migration Tracking**
1. Copy `migration-logs/PROJECT-TEMPLATE.md`
2. Rename to `<ProjectName>-MIGRATION-LOG.md`
3. Update project information
4. Track progress as you migrate
5. Document fixes and lessons learned

---

## 📊 Project Status Overview

| Project | Status | Progress | Migration Log |
|---------|--------|----------|---------------|
| **NYSED** | 🔄 Active | 85% | [View](migration-logs/NYSED-MIGRATION-LOG.md) |
| **Project-2** | ⏳ Pending | 0% | TBD |
| **Project-3** | ⏳ Pending | 0% | TBD |
| ... | ... | ... | ... |

---

## 🔧 Framework Components

### **Core Framework** (`src/framework/`)
- **API** - Salesforce REST API integration
- **Config** - Properties file loader
- **Hooks** - Browser lifecycle management
- **Utils** - Helpers (waits, clicks, logging, diagnostics)
- **World** - Cucumber custom world

### **Project-Specific** (`src/project/`)
- **Features** - Gherkin scenarios (`.feature`)
- **Step Definitions** - Step implementations
- **Pages** - Page object models
- **Data** - Excel test data
- **Config** - Properties files

---

## 📝 Documentation Standards

### **When to Update Documentation**

1. **After Major Framework Changes**
   - New utilities added
   - Page objects modified
   - Step definitions changed

2. **After Project Onboarding**
   - Create migration log
   - Update project status table
   - Document project-specific patterns

3. **After Bug Fixes**
   - Document issue in migration log
   - Update troubleshooting guide if applicable
   - Note lessons learned

### **Documentation Format**

- Use Markdown (`.md`) for all documentation
- Include code examples with syntax highlighting
- Add tables for structured data
- Use emojis for visual organization (📋 📊 ✅ 🔧 etc.)
- Keep language clear and concise

---

## 🔗 External Resources

- **Cucumber Documentation**: https://cucumber.io/docs/cucumber/
- **Playwright Documentation**: https://playwright.dev/
- **TypeScript Documentation**: https://www.typescriptlang.org/docs/
- **Salesforce LWC Guide**: https://developer.salesforce.com/docs/component-library/overview/components

---

## 📞 Support

For questions or issues:
1. Check relevant documentation first
2. Review migration logs for similar issues
3. Check diagnostic bundles in `reports/diagnostics/`
4. Compare with Java framework implementation

---

**Maintained By**: Automation Team  
**Last Updated**: July 11, 2026  
**Framework Version**: 1.0
