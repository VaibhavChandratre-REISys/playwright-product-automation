# 🔍 Check Cucumber Extension Status

## The Problem
Your feature file still shows:
- ❌ "No references found for 'top'"
- ❌ No syntax highlighting (no colors)
- ❌ Language shows as "LANGUAGE_UNSPECIFIED"

This means the **Cucumber extension is NOT active**.

## ✅ Solution - Follow These Steps EXACTLY

### STEP 1: Check if Extension is Installed

1. **In Windsurf, press `Ctrl+Shift+X`** (Extensions panel opens on left)
2. **In the search box, type:** `cucumber`
3. **Look for:** "Cucumber (Gherkin) Full Support" by Alexander Krechik

**What you should see:**
- ✅ Extension listed with "Installed" or "Disable" button
- ❌ If you see "Install" button → Extension is NOT installed

### STEP 2: Install Extension (If Not Installed)

If you see "Install" button:
1. **Click "Install"**
2. **Wait** for installation to complete (5-10 seconds)
3. You'll see "Reload Required" or "Installed"

### STEP 3: Enable Extension (If Disabled)

If extension shows "Disabled":
1. **Click on the extension** to open details
2. **Click "Enable"** button
3. **Click "Enable Everywhere"** if asked

### STEP 4: Reload Windsurf Window

**CRITICAL - You MUST do this:**
1. **Press `Ctrl+Shift+P`**
2. **Type:** `reload`
3. **Select:** "Developer: Reload Window"
4. **Press Enter**

Windsurf will close and reopen (takes 3-5 seconds).

### STEP 5: Close and Reopen Feature File

After Windsurf reloads:
1. **Close** the feature file tab (click X)
2. **Reopen** it from file explorer

### STEP 6: Check Language Mode

**Look at bottom-right corner** of Windsurf window:
- Should show: **"Feature"** or **"Gherkin"** or **"Cucumber"**
- If shows: **"Plain Text"**:
  1. Click on "Plain Text"
  2. Type: `feature`
  3. Select "Feature" or "Gherkin"

## ✅ Expected Result After Setup

Once working, you should see:

**Syntax Highlighting:**
- `Given`, `When`, `Then`, `And` → Colored (purple/pink)
- Text in quotes → Colored (green/orange)
- Comments (#) → Colored (gray/green)

**Navigation:**
- Hover over step → Shows definition preview
- Press F12 → Jumps to step definition file
- No "No references found" warnings

## 🚨 If Extension Still Doesn't Work

### Option A: Try Different Extension

1. **Uninstall** "Cucumber (Gherkin) Full Support"
2. **Install** "Cucumber" by CucumberOpen (official)
3. **Reload** Windsurf

### Option B: Check Windsurf Version

Some extensions need newer Windsurf versions:
1. Help → About
2. Check version number
3. Update Windsurf if old

### Option C: Manual Installation

If marketplace doesn't work:
1. Download extension: https://marketplace.visualstudio.com/items?itemName=alexkrechik.cucumberautocomplete
2. In Windsurf: Extensions → ... (three dots) → Install from VSIX
3. Select downloaded file

## 🔧 Alternative: Use Without Extension

If extension won't work, you can still:

**Find Step Definitions:**
1. Press `Ctrl+Shift+F` (Find in Files)
2. Search: `I navigate to`
3. Click `.*` (regex button)
4. Results show exact file locations

**Navigate to Files:**
1. Press `Ctrl+P` (Quick Open)
2. Type: `navigation-steps.ts`
3. Opens the step definition file

## 📝 Checklist

Go through this checklist:

- [ ] Extension "Cucumber (Gherkin) Full Support" is installed
- [ ] Extension is enabled (not disabled)
- [ ] Windsurf window has been reloaded
- [ ] Feature file has been closed and reopened
- [ ] Bottom-right shows "Feature" (not "Plain Text")
- [ ] Settings file exists: `.windsurf/settings.json`

If ALL checked and still not working → Try Option A (different extension)

## 🆘 Still Not Working?

The step definitions ARE working at runtime. The warnings are cosmetic.

**Verify tests work:**
```powershell
$env:PROJECT="product"
npx cucumber-js --profile product --dry-run
```

Should show: "X steps (X skipped)" with 0 undefined steps.

**Use search instead of navigation:**
- `Ctrl+Shift+F` to find any step definition
- Works without any extension

---

**Start with STEP 1: Check if extension is installed!**
