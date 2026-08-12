# Fix Cucumber Step Navigation - FOLLOW THESE STEPS

## Current Status
- ✅ Extension installed: `alexkrechik.cucumberautocomplete@3.1.0`
- ✅ Settings configured: `.vscode/settings.json`
- ❌ Not working yet - Need to reload and verify

## STEP 1: Force Reload VS Code (CRITICAL)

### Option A: Reload Window
1. Press `Ctrl+Shift+P`
2. Type: `reload`
3. Select: **"Developer: Reload Window"**
4. Wait for VS Code to fully reload

### Option B: Complete Restart
1. Close VS Code completely (File → Exit or Alt+F4)
2. Wait 5 seconds
3. Reopen VS Code
4. Open the workspace folder again

## STEP 2: Verify Extension is Active

After reload:
1. Press `Ctrl+Shift+X` (Extensions panel)
2. Search: `cucumber`
3. You should see: **"Cucumber (Gherkin) Full Support"**
4. Status should be: **"Enabled"** (not "Disabled")

If it shows "Disabled":
- Click the extension
- Click "Enable" button
- Reload window again

## STEP 3: Check Extension Output

1. Press `Ctrl+Shift+U` (Output panel)
2. In the dropdown (top right), select: **"Cucumber (Gherkin) Full Support"**
3. Look for messages like:
   - "Steps found: X"
   - "Features synced: X"
   
If you see errors, copy them and share.

## STEP 4: Test Navigation

1. Open: `src/Product/features/Grantor/15.BusinessSanity/productBusinessFlowSanity.feature`
2. Find line with: `When I navigate to "Planning" tab`
3. **Hover** over the step - should show definition preview
4. **Press F12** or **Ctrl+Click** - should jump to step definition

## STEP 5: If Still Not Working

### Check File Association
1. Open any `.feature` file
2. Look at bottom right corner of VS Code
3. Should show: **"Cucumber"** or **"Gherkin"**
4. If it shows "Plain Text":
   - Click on "Plain Text"
   - Select "Configure File Association for '.feature'"
   - Choose "Cucumber"

### Manually Trigger Extension
1. Open Command Palette: `Ctrl+Shift+P`
2. Type: `Cucumber: Gherkin Autocomplete`
3. Run any cucumber command to wake up the extension

### Check Settings Applied
Run this command:
```powershell
Get-Content .vscode\settings.json | Select-String "cucumberautocomplete.steps"
```

Should show:
```
"cucumberautocomplete.steps": [
```

## STEP 6: Alternative - Use Different Extension

If `alexkrechik.cucumberautocomplete` doesn't work, try official extension:

1. Uninstall current extension:
   ```powershell
   code --uninstall-extension alexkrechik.cucumberautocomplete
   ```

2. Install official Cucumber extension:
   ```powershell
   code --install-extension CucumberOpen.cucumber-official
   ```

3. Reload VS Code

## Troubleshooting

### Extension Installed But Not Loading?

**Check VS Code Version:**
```powershell
code --version
```
Extension requires VS Code 1.60.0 or higher.

**Check Extension Logs:**
1. Help → Toggle Developer Tools
2. Go to "Console" tab
3. Look for errors mentioning "cucumber"

**Reset Extension:**
```powershell
# Uninstall
code --uninstall-extension alexkrechik.cucumberautocomplete

# Clear cache (close VS Code first)
Remove-Item -Recurse -Force "$env:USERPROFILE\.vscode\extensions\alexkrechik.cucumberautocomplete-*"

# Reinstall
code --install-extension alexkrechik.cucumberautocomplete

# Reload VS Code
```

## What Should Work After Setup

✅ **Syntax Highlighting**: Steps colored green/blue  
✅ **Autocomplete**: Type "When I" and see suggestions  
✅ **Hover**: Hover over step to see definition  
✅ **Navigation**: F12 or Ctrl+Click to jump to definition  
✅ **No Warnings**: "No references found" should disappear  

## Current Configuration

**Step Definitions**: `src/framework/step-definitions/**/*.ts`  
**Feature Files**: `src/**/*.feature`  
**Extension**: `alexkrechik.cucumberautocomplete@3.1.0`  

## If Nothing Works

The step definitions ARE working at runtime (verified with dry-run).  
The IDE warnings are cosmetic only.

You can still:
- ✅ Run tests successfully
- ✅ Use Ctrl+P to search for files
- ✅ Search for step text with Ctrl+Shift+F

To find step definition manually:
1. Press `Ctrl+Shift+F` (Find in Files)
2. Search for: `I enter.*values from`
3. Enable regex: Click `.*` button
4. Results will show: `navigation-steps.ts:299`

---

**Try STEP 1 first (Reload VS Code) and see if that fixes it!**
