# Windsurf IDE Configuration for Cucumber/Gherkin

## Setup Instructions

### 1. Install Cucumber Extension
1. Press `Ctrl+Shift+X` (Extensions)
2. Search: **Cucumber**
3. Install: **"Cucumber (Gherkin) Full Support"** by Alexander Krechik

### 2. Reload Windsurf
1. Press `Ctrl+Shift+P`
2. Type: `reload`
3. Select: "Developer: Reload Window"

### 3. Verify It Works
After reload:
- Open any `.feature` file
- Should see syntax highlighting (colored keywords)
- Hover over steps to see definitions
- Press `F12` to navigate to step definitions

## Configuration Files

### settings.json
- Cucumber autocomplete paths
- Step definition locations
- Feature file patterns
- Formatting rules

### extensions.json
- Recommended extensions for this project

## Troubleshooting

### No Syntax Highlighting?
1. Check bottom-right corner shows "Gherkin" (not "Plain Text")
2. If "Plain Text", click it and select "Gherkin"
3. Reload Windsurf window

### Extension Not Working?
1. Verify extension is installed: `Ctrl+Shift+X` → Search "Cucumber"
2. Check extension is enabled (not disabled)
3. Reload Windsurf window

### Can't Navigate to Step Definitions?
Use Find in Files as alternative:
1. Press `Ctrl+Shift+F`
2. Search for step text (e.g., "I navigate to")
3. Enable regex with `.*` button

## Step Definition Locations

All step definitions are in:
```
src/framework/step-definitions/
├── navigation-steps.ts    # Navigation, field input, Excel data
├── assertion-steps.ts     # Validations, assertions  
├── login-steps.ts         # Authentication
├── misc-steps.ts          # Waits, utilities
├── composite-steps.ts     # API-based setup
└── approval-steps.ts      # Workflow approvals
```

## Configuration Based On
This configuration matches the working setup from the NYSED_Playwright project.
