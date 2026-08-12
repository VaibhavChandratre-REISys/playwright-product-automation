# VS Code Cucumber Extension Setup Script
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host "  VS Code Cucumber Extension Setup" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host ""

# Check if VS Code CLI is available
$codeCmd = Get-Command code -ErrorAction SilentlyContinue

if (-not $codeCmd) {
    Write-Host "X VS Code CLI not found" -ForegroundColor Red
    Write-Host ""
    Write-Host "Manual Installation:" -ForegroundColor Yellow
    Write-Host "  1. Open VS Code" -ForegroundColor Gray
    Write-Host "  2. Press Ctrl+Shift+X (Extensions)" -ForegroundColor Gray
    Write-Host "  3. Search: Cucumber Gherkin Full Support" -ForegroundColor Gray
    Write-Host "  4. Install by Alexander Krechik" -ForegroundColor Gray
    exit 1
}

Write-Host "OK VS Code CLI found" -ForegroundColor Green
Write-Host ""

# Install extension
Write-Host "Installing Cucumber extension..." -ForegroundColor Yellow
& code --install-extension alexkrechik.cucumberautocomplete

if ($LASTEXITCODE -eq 0) {
    Write-Host "OK Extension installed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "  1. Reload VS Code: Ctrl+Shift+P -> Developer: Reload Window" -ForegroundColor Gray
    Write-Host "  2. Open any .feature file" -ForegroundColor Gray
    Write-Host "  3. Press F12 on a step to navigate to definition" -ForegroundColor Gray
} else {
    Write-Host "X Failed to install" -ForegroundColor Red
}

Write-Host ""
Write-Host "Configuration files created in .vscode/" -ForegroundColor Cyan
Write-Host "See .vscode/README.md for details" -ForegroundColor Cyan
Write-Host ""
