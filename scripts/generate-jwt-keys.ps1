# JWT Key Generation Script for Product Environment
# This script generates RSA key pair for Salesforce JWT authentication

param(
    [string]$Project = "product",
    [switch]$Help
)

if ($Help) {
    Write-Host @"
JWT Key Generation Script

Usage:
    .\scripts\generate-jwt-keys.ps1 [-Project <project-name>]

Parameters:
    -Project    Project name (default: product)
    -Help       Show this help message

Examples:
    .\scripts\generate-jwt-keys.ps1
    .\scripts\generate-jwt-keys.ps1 -Project nysed

This script will:
1. Create certs/<project>/ directory if it doesn't exist
2. Generate RSA private key (server.key)
3. Generate self-signed certificate (server.crt)
4. Display next steps for Salesforce configuration

Note: Requires OpenSSL to be installed and in PATH
      Alternative: Use Git Bash which includes OpenSSL
"@
    exit 0
}

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$CertsDir = Join-Path $ProjectRoot "certs\$Project"

Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host "  JWT Key Generation for Project: $Project" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host ""

# Check if OpenSSL is available
$opensslPath = Get-Command openssl -ErrorAction SilentlyContinue

if (-not $opensslPath) {
    Write-Host "❌ OpenSSL not found in PATH" -ForegroundColor Red
    Write-Host ""
    Write-Host "Options:" -ForegroundColor Yellow
    Write-Host "  1. Install OpenSSL: https://slproweb.com/products/Win32OpenSSL.html" -ForegroundColor Yellow
    Write-Host "  2. Use Git Bash (includes OpenSSL):" -ForegroundColor Yellow
    Write-Host "     cd /d/AutomationFramework/govgrants-playwright-automation" -ForegroundColor Gray
    Write-Host "     bash scripts/generate-jwt-keys.sh $Project" -ForegroundColor Gray
    Write-Host "  3. Use WSL (Windows Subsystem for Linux)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Alternatively, if you already have the private key from Salesforce setup," -ForegroundColor Yellow
    Write-Host "copy it to: $CertsDir\server.key" -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ OpenSSL found: $($opensslPath.Source)" -ForegroundColor Green
Write-Host ""

# Create directory
if (-not (Test-Path $CertsDir)) {
    Write-Host "Creating directory: $CertsDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $CertsDir -Force | Out-Null
    Write-Host "✓ Directory created" -ForegroundColor Green
} else {
    Write-Host "✓ Directory exists: $CertsDir" -ForegroundColor Green
}
Write-Host ""

# Check if keys already exist
$keyPath = Join-Path $CertsDir "server.key"
$crtPath = Join-Path $CertsDir "server.crt"
$csrPath = Join-Path $CertsDir "server.csr"

if (Test-Path $keyPath) {
    Write-Host "⚠️  Private key already exists: $keyPath" -ForegroundColor Yellow
    $overwrite = Read-Host "Overwrite? (yes/no)"
    if ($overwrite -ne "yes") {
        Write-Host "Aborted. Existing keys preserved." -ForegroundColor Yellow
        exit 0
    }
}

# Generate private key
Write-Host "Generating RSA private key (2048-bit)..." -ForegroundColor Yellow
& openssl genrsa -out $keyPath 2048 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to generate private key" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Private key generated: $keyPath" -ForegroundColor Green
Write-Host ""

# Generate CSR
Write-Host "Generating Certificate Signing Request..." -ForegroundColor Yellow
Write-Host "(You can press Enter to skip all prompts)" -ForegroundColor Gray
& openssl req -new -key $keyPath -out $csrPath -subj "/CN=Playwright Automation $Project/O=GovGrants/C=US"
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to generate CSR" -ForegroundColor Red
    exit 1
}
Write-Host "✓ CSR generated: $csrPath" -ForegroundColor Green
Write-Host ""

# Generate self-signed certificate
Write-Host "Generating self-signed certificate (valid for 365 days)..." -ForegroundColor Yellow
& openssl x509 -req -days 365 -in $csrPath -signkey $keyPath -out $crtPath 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to generate certificate" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Certificate generated: $crtPath" -ForegroundColor Green
Write-Host ""

# Display certificate info
Write-Host "Certificate Information:" -ForegroundColor Cyan
& openssl x509 -in $crtPath -noout -subject -dates
Write-Host ""

# Success message
Write-Host "==================================================================" -ForegroundColor Green
Write-Host "  ✓ JWT Keys Generated Successfully!" -ForegroundColor Green
Write-Host "==================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Files created:" -ForegroundColor White
Write-Host "  🔑 Private Key: $keyPath" -ForegroundColor Gray
Write-Host "  📜 Certificate: $crtPath" -ForegroundColor Gray
Write-Host "  📄 CSR:         $csrPath" -ForegroundColor Gray
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Upload certificate to Salesforce Connected App" -ForegroundColor White
Write-Host "     - Login to: https://test8-internal--ggmergeqa2.sandbox.my.salesforce.com" -ForegroundColor Gray
Write-Host "     - Setup → Apps → App Manager → 'Playwright Automation'" -ForegroundColor Gray
Write-Host "     - Edit → Enable 'Use digital signatures'" -ForegroundColor Gray
Write-Host "     - Upload: $crtPath" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. Update environment file" -ForegroundColor White
Write-Host "     - File: envs\$Project\.env.merge-grantor" -ForegroundColor Gray
Write-Host "     - Set: SF_AUTH_MODE=jwt" -ForegroundColor Gray
Write-Host ""
Write-Host "  3. Test JWT authentication" -ForegroundColor White
Write-Host "     `$env:PROJECT=`"$Project`"; `$env:ENV=`"merge-grantor`"; npx cucumber-js --profile $Project --tags `"@smoke`"" -ForegroundColor Gray
Write-Host ""
Write-Host "⚠️  SECURITY: Never commit server.key to git (already in .gitignore)" -ForegroundColor Red
Write-Host ""
Write-Host "For detailed instructions, see: docs\JWT_SETUP_GUIDE.md" -ForegroundColor Cyan
Write-Host ""
