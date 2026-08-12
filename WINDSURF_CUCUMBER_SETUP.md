# Cucumber Step Navigation Setup for Windsurf IDE

## Issue
You're using **Windsurf IDE** (not VS Code), and the Cucumber extension needs to be installed and configured differently.

## Solution - Follow These Steps

### STEP 1: Install Cucumber Extension in Windsurf

1. **Open Windsurf IDE**
2. **Press** `Ctrl+Shift+X` (Extensions panel)
3. **Search**: `Cucumber`
4. **Install** one of these extensions:
   - **"Cucumber (Gherkin) Full Support"** by Alexander Krechik (Recommended)
   - OR **"Cucumber"** by CucumberOpen (Official)

### STEP 2: Reload Windsurf

After installing the extension:
1. **Press** `Ctrl+Shift+P`
2. **Type**: `reload`
3. **Select**: "Developer: Reload Window"

### STEP 3: Verify Configuration

The configuration file has been created at:
`.windsurf/settings.json`

It contains:
```json
{
  "cucumberautocomplete.steps": [
    "src/framework/step-definitions/**/*.ts"
  ],
  "cucumberautocomplete.syncfeatures": "src/**/*.feature",
  "files.associations": {
    "*.feature": "cucumber"
  }
}
```

### STEP 4: Check File Association

1. **Open** any `.feature` file
2. **Look** at bottom-right corner of Windsurf
3. Should show: **"Cucumber"** or **"Gherkin"**
4. If it shows **"Plain Text"**:
   - Click on "Plain Text"
   - Select "Configure File Association for '.feature'"
   - Choose **"Cucumber"**

### STEP 5: Test Navigation

1. **Open**: `src/Product/features/Grantor/15.BusinessSanity/productBusinessFlowSanity.feature`
2. **Find** line: `When I navigate to "Planning" tab`
3. **Hover** over the step - should show definition preview
4. **Press F12** or **Ctrl+Click** - should jump to:
   `src/framework/step-definitions/navigation-steps.ts`

## Expected Behavior After Setup

✅ **Syntax Highlighting**: Steps colored (green/blue based on theme)  
✅ **No Warnings**: "No references found" disappears  
✅ **Hover Tooltips**: Hover shows step definition  
✅ **Navigation**: F12 jumps to step definition  
✅ **Autocomplete**: Type "When I" shows suggestions  

## Troubleshooting

### Extension Not Showing in Extensions Panel?

Windsurf uses the VS Code extension marketplace. Try:
1. **Settings** → **Extensions**
2. Ensure "Enable Extensions" is checked
3. Restart Windsurf completely

### Still Showing "No references found"?

**Option A: Try Official Cucumber Extension**
1. Uninstall "Cucumber (Gherkin) Full Support"
2. Install "Cucumber" by CucumberOpen
3. Reload Windsurf

**Option B: Manual Navigation**
Since step definitions ARE working (tests run fine), you can:
1. **Press** `Ctrl+P` (Quick Open)
2. **Type**: `navigation-steps.ts`
3. **Open** the file
4. **Press** `Ctrl+F` (Find)
5. **Search**: `I navigate to.*tab`
6. Enable regex (click `.*` button)

### Check Extension Output

1. **View** → **Output** (or `Ctrl+Shift+U`)
2. **Select** "Cucumber" from dropdown
3. Look for errors or "Steps found: X" messages

### Verify Step Definitions Exist

Run this to confirm steps are recognized:
```powershell
$env:PROJECT="product"
npx cucumber-js --profile product --dry-run
```

Should show: "X steps (X skipped)" with no undefined steps.

## Alternative: Use Search Instead of Navigation

If extension doesn't work, you can still find step definitions:

**Method 1: Global Search**
1. **Press** `Ctrl+Shift+F` (Find in Files)
2. **Search**: `I navigate to.*tab`
3. **Enable** regex (click `.*` button)
4. Results show exact file and line

**Method 2: Quick Open**
1. **Press** `Ctrl+P`
2. **Type**: `@navigate` (searches symbols)
3. Or type filename: `navigation-steps.ts`

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

The step `I navigate to "Planning" tab` is in:
- **File**: `src/framework/step-definitions/navigation-steps.ts`
- **Line**: ~100-150 (search for "navigate to.*tab")

## Important Notes

### Windsurf vs VS Code
- Windsurf is a fork of VS Code with AI features
- Uses same extension marketplace
- Configuration goes in `.windsurf/` folder (not `.vscode/`)
- Most VS Code extensions work in Windsurf

### Configuration Files
- ✅ `.windsurf/settings.json` - Created for you
- ❌ `.vscode/settings.json` - Not used in Windsurf (deleted)

### Tests Still Work
Even without IDE navigation, your tests run perfectly:
```powershell
$env:PROJECT="product"
$env:ENV="merge-grantor"
npx cucumber-js --profile product --tags "@72335"
```

The "No references found" warning is **cosmetic only** - it doesn't affect test execution.

## Next Steps

1. ✅ Install Cucumber extension in Windsurf (STEP 1)
2. ✅ Reload Windsurf (STEP 2)
3. ✅ Test navigation (STEP 5)
4. ✅ If still not working, use Ctrl+Shift+F to search for steps

---

**Start with STEP 1: Install the Cucumber extension in Windsurf IDE!**
