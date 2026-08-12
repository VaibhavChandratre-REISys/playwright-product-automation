# ⚡ QUICK FIX - Windsurf IDE Cucumber Navigation

## The Problem
- You're using **Windsurf IDE** (not VS Code)
- "No references found for 'navigate'" warnings
- Can't jump to step definitions with F12

## The Solution (3 Steps)

### 1️⃣ Install Cucumber Extension
In Windsurf IDE:
- Press `Ctrl+Shift+X`
- Search: **Cucumber**
- Install: **"Cucumber (Gherkin) Full Support"**

### 2️⃣ Reload Windsurf
- Press `Ctrl+Shift+P`
- Type: `reload`
- Select: "Developer: Reload Window"

### 3️⃣ Test It
- Open any `.feature` file
- Press `F12` on a step
- Should jump to step definition!

## Configuration Already Done ✅
I've created `.windsurf/settings.json` with the correct configuration.

## If Extension Doesn't Work

### Alternative: Use Search
**Press `Ctrl+Shift+F`** (Find in Files)
- Search: `I navigate to`
- Enable regex: Click `.*` button
- Results show exact file location

### All Step Definitions Are Here:
```
src/framework/step-definitions/
├── navigation-steps.ts    ← Most steps are here
├── assertion-steps.ts     ← Validation steps
├── login-steps.ts         ← Login steps
└── misc-steps.ts          ← Wait, utility steps
```

## Important
✅ **Tests work fine** - The warning is cosmetic only  
✅ **Configuration created** - `.windsurf/settings.json`  
✅ **Just need extension** - Install in Windsurf IDE  

---

**DO THIS NOW:**
1. Open Windsurf Extensions (`Ctrl+Shift+X`)
2. Search "Cucumber"
3. Install it
4. Reload (`Ctrl+Shift+P` → "reload")
