# Install Official Cucumber Extension
Write-Host "Installing Official Cucumber Extension for Windsurf..." -ForegroundColor Cyan

# Try to uninstall the third-party extension first
Write-Host "Uninstalling third-party extension (if installed)..." -ForegroundColor Yellow
code --uninstall-extension alexkrechik.cucumberautocomplete 2>$null

# Install official Cucumber extension
Write-Host "Installing official Cucumber extension..." -ForegroundColor Yellow
code --install-extension CucumberOpen.cucumber-official

if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: Official Cucumber extension installed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "IMPORTANT: Reload Windsurf now!" -ForegroundColor Cyan
    Write-Host "1. Press Ctrl+Shift+P" -ForegroundColor Gray
    Write-Host "2. Type: reload" -ForegroundColor Gray
    Write-Host "3. Select: Developer: Reload Window" -ForegroundColor Gray
    Write-Host "4. Press Enter" -ForegroundColor Gray
} else {
    Write-Host "FAILED: Could not install extension" -ForegroundColor Red
    Write-Host ""
    Write-Host "Manual installation:" -ForegroundColor Yellow
    Write-Host "1. Press Ctrl+Shift+X" -ForegroundColor Gray
    Write-Host "2. Search: Cucumber" -ForegroundColor Gray
    Write-Host "3. Install: Cucumber (by CucumberOpen)" -ForegroundColor Gray
}
