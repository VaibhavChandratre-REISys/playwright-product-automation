# Adding a New Project to the Framework

This document outlines the steps required to add a new project (e.g., a new state or organization) to the GovGrants Playwright automation framework.

## Overview

When adding a new project, you need to configure environment variables, update Cucumber profiles, add schema validation, and set up the project directory structure.

## Step-by-Step Guide

### 1. Create Project Directory Structure

Create the following directory structure under `src/`:

```
src/
└── <ProjectName>/
    ├── api/
    │   └── api-config.ts
    ├── config/
    │   └── (project-specific config files)
    ├── data/
    │   └── (test data files)
    ├── features/
    │   └── (feature files organized by module)
    ├── step-definitions/
    │   └── (project-specific step definitions, if needed)
    └── testdata/
        └── (Excel test data files)
```

**Example for Alaska:**
```
src/Alaska/
├── api/
│   └── api-config.ts
├── config/
│   └── (35 config files)
├── data/
│   └── (50 data files)
├── features/
│   └── (81 feature files)
└── testdata/
```

### 2. Create Environment Configuration File

Create an environment file at `envs/<ProjectName>/.env.<env>` where `<env>` is the environment name (e.g., `qa`, `uat`, `prod`).

**Required Environment Variables:**

```bash
# Project Configuration
PROJECT=<ProjectName>  # Must match directory name (case-insensitive)
ENV=<env>              # Environment name: qa, auto, ny, uat, prodcopy, merge-grantor
BROWSER=chromium
HEADLESS=false
SLOW_MO=0
DEFAULT_TIMEOUT_MS=30000

# Salesforce URLs
GRANTOR_BASE_URL=https://<instance>.sandbox.my.salesforce.com
GRANTOR_INTERNAL_URL=https://<instance>.sandbox.my.salesforce.com
GRANTEE_PORTAL_URL=https://<instance>.sandbox.my.site.com/recipient/s

# Required Grantor Roles (Mandatory per config-schema.ts)
ADMIN_USERNAME=<admin_username>
ADMIN_PASSWORD=<admin_password>
FO_USERNAME=<fo_username>
FO_PASSWORD=<fo_password>
PM_USERNAME=<pm_username>
PM_PASSWORD=<pm_password>
EXE_USERNAME=<exe_username>
EXE_PASSWORD=<exe_password>

# Project-Specific Grantor Roles (Optional)
# Add any additional roles specific to your project
# Example: CITY2_USERNAME, NPO_USERNAME, ANV_USERNAME, etc.

# Grantee Roles (Optional - only if PROJECT=product)
GRANTEE_ADMIN_USERNAME=<grantee_admin_username>
GRANTEE_ADMIN_PASSWORD=<grantee_admin_password>

# Salesforce API Configuration
SF_LOGIN_URL=https://<instance>.sandbox.my.salesforce.com
SF_CLIENT_ID=<connected_app_client_id>
SF_CLIENT_SECRET=<connected_app_client_secret>
SF_API_USERNAME=<api_username>
SF_API_PASSWORD=<api_password>
SF_AUTH_MODE=jwt

# JWT Authentication (MFA-proof login)
SF_CONSUMER_KEY=<connected_app_consumer_key>
SF_PRIVATE_KEY_PATH=./certs/<ProjectName>/server.key

# Username Display Names (for SavedValues)
# Use _DisplayName suffix to avoid conflicts with login usernames
EXE_DisplayName=Automation EXE
PM_DisplayName=Automation PM
# Add other display names as needed
```

**Example: `envs/alaska/.env.qa`**
```bash
PROJECT=Alaska
ENV=qa
BROWSER=chromium
HEADLESS=false
SLOW_MO=0
DEFAULT_TIMEOUT_MS=30000

GRANTOR_BASE_URL=https://govgrantsdemo--alsakaqaof.sandbox.my.salesforce.com
GRANTOR_INTERNAL_URL=https://govgrantsdemo--alsakaqaof.sandbox.my.salesforce.com
GRANTEE_PORTAL_URL=https://govgrantsdemo--alsakaqaof.sandbox.my.site.com/recipient/s

# Grantor roles
ADMIN_USERNAME=nathan.gill@ggp.lwc.alsakaqaof
ADMIN_PASSWORD=Akorg@12345
FO_USERNAME=automationpm1@yopmail.com
FO_PASSWORD=Alaska@2028
PM_USERNAME=automationpm1@yopmail.com
PM_PASSWORD=Alaska@2028
EXE_USERNAME=automationexealaska1@yopmail.com
EXE_PASSWORD=Alaska@2028

# Alaska-specific roles
CITY2_USERNAME=automation2ndclassspi@yopmail.com
CITY2_PASSWORD=Alaska@2028
NPO_USERNAME=automationnonprofitorgspi1@yopmail.com
NPO_PASSWORD=Alaska@2028
# ... additional roles

# Salesforce API
SF_LOGIN_URL=https://your-instance.sandbox.my.salesforce.com
SF_CLIENT_ID=YOUR_SALESFORCE_CONSUMER_KEY_HERE
SF_CLIENT_SECRET=YOUR_SALESFORCE_CONSUMER_SECRET_HERE
SF_API_USERNAME=your.username@example.com
SF_API_PASSWORD=YourPassword123
SF_AUTH_MODE=jwt

# JWT Authentication
SF_CONSUMER_KEY=YOUR_SALESFORCE_CONSUMER_KEY_HERE
SF_PRIVATE_KEY_PATH=./certs/alaska/server.key
```

### 3. Update Cucumber.js Configuration

Add a new profile for your project in `cucumber.js`:

```javascript
const project = process.env.PROJECT || 'nysed';

const common = {
  require: [
    'src/framework/support/timeout.ts',
    'src/framework/world/custom-world.ts',
    'src/framework/hooks/browser-hooks.ts',
    'src/framework/step-definitions/**/*.ts',
  ],
  requireModule: ['tsx/cjs'],
  format: [
    'progress-bar',
    `json:reports/${project}/cucumber-report.json`,
    `html:reports/${project}/cucumber-report.html`,
  ],
  formatOptions: { snippetInterface: 'async-await' },
};

module.exports = {
  default: {
    ...common,
    paths: [`src/${project}/features/**/*.feature`],
    tags: process.env.TAGS || 'not @wip',
  },
  nysed: {
    ...common,
    paths: ['src/nysed/features/**/*.feature'],
    tags: process.env.TAGS || 'not @wip',
  },
  ksde: {
    ...common,
    paths: ['src/ksde/features/**/*.feature'],
    tags: process.env.TAGS || 'not @wip',
  },
  product: {
    ...common,
    paths: ['src/product/features/**/*.feature'],
    tags: process.env.TAGS || 'not @wip',
  },
  <ProjectName>: {
    ...common,
    paths: ['src/<ProjectName>/features/**/*.feature'],
    tags: process.env.TAGS || 'not @wip',
  },
};
```

**Important Notes:**
- The profile name in `module.exports` must match the value you use with `--profile` flag
- The `paths` must point to your project's feature files
- Use lowercase for the profile name to match `getProject()` behavior

### 4. Update Config Schema Validation

Add project-specific environment variables to `src/framework/config/config-schema.ts`:

```typescript
import { z } from 'zod';

export const configSchema = z.object({
  PROJECT: z.string().default('nysed'),
  ENV: z.enum(['qa', 'auto', 'ny', 'uat', 'prodcopy', 'merge-grantor']).default('auto'),
  // ... existing required fields ...

  // Required roles (mandatory for all projects)
  ADMIN_USERNAME: z.string(),
  ADMIN_PASSWORD: z.string(),
  FO_USERNAME: z.string(),
  FO_PASSWORD: z.string(),
  PM_USERNAME: z.string(),
  PM_PASSWORD: z.string(),
  EXE_USERNAME: z.string(),
  EXE_PASSWORD: z.string(),

  // <ProjectName>-specific roles (optional - only needed when PROJECT=<ProjectName>)
  CITY2_USERNAME: z.string().optional(),
  CITY2_PASSWORD: z.string().optional(),
  NPO_USERNAME: z.string().optional(),
  NPO_PASSWORD: z.string().optional(),
  // Add other project-specific roles as optional fields

  DEFAULT_TIMEOUT_MS: z
    .string()
    .transform((v) => Number(v))
    .default('30000'),
});
```

**Important:**
- All project-specific roles should be marked as `optional()` to allow other projects to run without them
- Only the common roles (ADMIN, FO, PM, EXE) are required for all projects

### 5. Generate JWT Keys

Run the JWT key generation script to create authentication keys:

```powershell
.\scripts\generate-jwt-keys.ps1 -Project <ProjectName>
```

This will:
1. Create a directory `certs/<ProjectName>/`
2. Generate `server.key` (private key)
3. Generate `server.crt` (public certificate)
4. Provide instructions for uploading the certificate to Salesforce

**Steps to complete JWT setup:**
1. Upload `server.crt` to Salesforce Connected App
2. Configure the Connected App with the correct OAuth settings
3. Update the `.env` file with the Consumer Key from the Connected App
4. Ensure the `SF_PRIVATE_KEY_PATH` points to the correct location

### 6. Create Project-Specific API Config (Optional)

If your project has specific API configurations, create `src/<ProjectName>/api/api-config.ts`:

```typescript
export const apiConfig = {
  // Project-specific API endpoints or configurations
};
```

### 7. Add Project-Specific Step Definitions (Optional)

If your project requires custom step definitions that don't apply to other projects:

1. Create `src/<ProjectName>/step-definitions/` directory
2. Add TypeScript step definition files
3. **Note:** Update `cucumber.js` to include these if needed:

```javascript
const common = {
  require: [
    'src/framework/support/timeout.ts',
    'src/framework/world/custom-world.ts',
    'src/framework/hooks/browser-hooks.ts',
    'src/framework/step-definitions/**/*.ts',
    `src/${project}/step-definitions/**/*.ts`,  // Add this line
  ],
  // ...
};
```

### 8. Verify Setup

Test your project configuration:

```powershell
# Set environment variables
$env:PROJECT="<ProjectName>"
$env:ENV="qa"

# Run a simple test scenario
npx cucumber-js --profile <ProjectName> --tags "@<your_test_tag>"
```

**Common Issues and Solutions:**

| Issue | Solution |
|-------|----------|
| "Requested profile doesn't exist" | Ensure profile name in `cucumber.js` matches the `--profile` flag |
| "Config validation failed" | Check that all required fields (ADMIN_USERNAME, ADMIN_PASSWORD, FO_USERNAME, FO_PASSWORD, PM_USERNAME, PM_PASSWORD, EXE_USERNAME, EXE_PASSWORD) are present in `.env` file |
| "0 scenarios, 0 steps" | Verify `PROJECT` variable in `.env` matches the directory name (case-insensitive) |
| JWT authentication fails | Ensure certificate is uploaded to Salesforce and Consumer Key matches |

### 9. Running Tests for the New Project

```powershell
# Run all tests for the project
$env:PROJECT="<ProjectName>"
$env:ENV="qa"
npx cucumber-js --profile <ProjectName>

# Run specific tags
$env:PROJECT="<ProjectName>"
$env:ENV="qa"
npx cucumber-js --profile <ProjectName> --tags "@<tag_name>"

# Run specific feature file
$env:PROJECT="<ProjectName>"
$env:ENV="qa"
npx cucumber-js src/<ProjectName>/features/<module>/<feature_file>.feature
```

## Summary Checklist

- [ ] Create project directory structure under `src/<ProjectName>/`
- [ ] Create environment file `envs/<ProjectName>/.env.<env>`
- [ ] Add project profile to `cucumber.js`
- [ ] Add project-specific roles to `config-schema.ts` (as optional)
- [ ] Generate JWT keys using `generate-jwt-keys.ps1`
- [ ] Upload certificate to Salesforce Connected App
- [ ] Create API config if needed
- [ ] Add step definitions if needed
- [ ] Test configuration with a simple scenario
- [ ] Document any project-specific requirements

## File Locations Reference

| File/Directory | Purpose |
|----------------|---------|
| `src/<ProjectName>/` | Project source code |
| `envs/<ProjectName>/.env.<env>` | Environment configuration |
| `cucumber.js` | Cucumber profile configuration |
| `src/framework/config/config-schema.ts` | Environment variable validation |
| `certs/<ProjectName>/` | JWT authentication keys |
| `scripts/generate-jwt-keys.ps1` | JWT key generation script |
