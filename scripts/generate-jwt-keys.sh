#!/bin/bash
# JWT Key Generation Script for Product Environment
# This script generates RSA key pair for Salesforce JWT authentication

set -e

PROJECT="${1:-product}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CERTS_DIR="$PROJECT_ROOT/certs/$PROJECT"

echo "=================================================================="
echo "  JWT Key Generation for Project: $PROJECT"
echo "=================================================================="
echo ""

# Check if OpenSSL is available
if ! command -v openssl &> /dev/null; then
    echo "❌ OpenSSL not found"
    echo ""
    echo "Please install OpenSSL:"
    echo "  - macOS: brew install openssl"
    echo "  - Ubuntu/Debian: sudo apt-get install openssl"
    echo "  - Windows: Use Git Bash (includes OpenSSL)"
    exit 1
fi

echo "✓ OpenSSL found: $(which openssl)"
echo ""

# Create directory
if [ ! -d "$CERTS_DIR" ]; then
    echo "Creating directory: $CERTS_DIR"
    mkdir -p "$CERTS_DIR"
    echo "✓ Directory created"
else
    echo "✓ Directory exists: $CERTS_DIR"
fi
echo ""

# Check if keys already exist
KEY_PATH="$CERTS_DIR/server.key"
CRT_PATH="$CERTS_DIR/server.crt"
CSR_PATH="$CERTS_DIR/server.csr"

if [ -f "$KEY_PATH" ]; then
    echo "⚠️  Private key already exists: $KEY_PATH"
    read -p "Overwrite? (yes/no): " overwrite
    if [ "$overwrite" != "yes" ]; then
        echo "Aborted. Existing keys preserved."
        exit 0
    fi
fi

# Generate private key
echo "Generating RSA private key (2048-bit)..."
openssl genrsa -out "$KEY_PATH" 2048 2>/dev/null
echo "✓ Private key generated: $KEY_PATH"
echo ""

# Generate CSR
echo "Generating Certificate Signing Request..."
openssl req -new -key "$KEY_PATH" -out "$CSR_PATH" \
    -subj "/CN=Playwright Automation $PROJECT/O=GovGrants/C=US"
echo "✓ CSR generated: $CSR_PATH"
echo ""

# Generate self-signed certificate
echo "Generating self-signed certificate (valid for 365 days)..."
openssl x509 -req -days 365 -in "$CSR_PATH" -signkey "$KEY_PATH" -out "$CRT_PATH" 2>/dev/null
echo "✓ Certificate generated: $CRT_PATH"
echo ""

# Display certificate info
echo "Certificate Information:"
openssl x509 -in "$CRT_PATH" -noout -subject -dates
echo ""

# Success message
echo "=================================================================="
echo "  ✓ JWT Keys Generated Successfully!"
echo "=================================================================="
echo ""
echo "Files created:"
echo "  🔑 Private Key: $KEY_PATH"
echo "  📜 Certificate: $CRT_PATH"
echo "  📄 CSR:         $CSR_PATH"
echo ""
echo "Next Steps:"
echo "  1. Upload certificate to Salesforce Connected App"
echo "     - Login to: https://test8-internal--ggmergeqa2.sandbox.my.salesforce.com"
echo "     - Setup → Apps → App Manager → 'Playwright Automation'"
echo "     - Edit → Enable 'Use digital signatures'"
echo "     - Upload: $CRT_PATH"
echo ""
echo "  2. Update environment file"
echo "     - File: envs/$PROJECT/.env.merge-grantor"
echo "     - Set: SF_AUTH_MODE=jwt"
echo ""
echo "  3. Test JWT authentication"
echo "     PROJECT=\"$PROJECT\" ENV=\"merge-grantor\" npx cucumber-js --profile $PROJECT --tags \"@smoke\""
echo ""
echo "⚠️  SECURITY: Never commit server.key to git (already in .gitignore)"
echo ""
echo "For detailed instructions, see: docs/JWT_SETUP_GUIDE.md"
echo ""
