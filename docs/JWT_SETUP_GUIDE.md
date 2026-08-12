# JWT Authentication Setup Guide for Product Environment

## Overview
This guide explains how to set up JWT authentication for the Product project's `merge-grantor` environment.

## Current Status
- ✅ Directory created: `certs/product/`
- ✅ Consumer Key configured: `SF_CONSUMER_KEY=3MVG9nN49A55...`
- ❌ Private key missing: `certs/product/server.key`
- ⚠️ Currently using: `SF_AUTH_MODE=password` (fallback)

## What You Need

### Option 1: Use Existing Private Key (Recommended if Connected App is already configured)
If the Salesforce Connected App for Product environment already has a certificate uploaded:

1. **Locate the existing private key** that was used to generate the certificate uploaded to Salesforce
2. **Copy it to**: `certs/product/server.key`
3. **Update env file**: Set `SF_AUTH_MODE=jwt` in `.env.merge-grantor`

### Option 2: Generate New Key Pair (If starting fresh)
If you need to create a new JWT setup from scratch:

#### Step 1: Generate Private Key and Certificate

**Using OpenSSL (Git Bash, WSL, or Linux):**
```bash
# Navigate to project root
cd d:/AutomationFramework/govgrants-playwright-automation

# Generate private key (2048-bit RSA)
openssl genrsa -out certs/product/server.key 2048

# Generate certificate signing request
openssl req -new -key certs/product/server.key -out certs/product/server.csr

# Generate self-signed certificate (valid for 365 days)
openssl x509 -req -days 365 -in certs/product/server.csr -signkey certs/product/server.key -out certs/product/server.crt
```

**Using PowerShell (Windows native):**
```powershell
# Navigate to project root
cd D:\AutomationFramework\govgrants-playwright-automation

# Generate certificate with private key
$cert = New-SelfSignedCertificate -Subject "CN=Playwright Automation Product" `
    -CertStoreLocation "Cert:\CurrentUser\My" `
    -KeyExportPolicy Exportable `
    -KeySpec Signature `
    -KeyLength 2048 `
    -KeyAlgorithm RSA `
    -HashAlgorithm SHA256 `
    -NotAfter (Get-Date).AddYears(1)

# Export certificate (public key)
Export-Certificate -Cert $cert -FilePath "certs\product\server.crt"

# Export private key (requires password)
$pwd = ConvertTo-SecureString -String "temp123" -Force -AsPlainText
Export-PfxCertificate -Cert $cert -FilePath "certs\product\server.pfx" -Password $pwd

# Convert PFX to PEM format (requires OpenSSL or manual conversion)
# If you have OpenSSL:
# openssl pkcs12 -in certs/product/server.pfx -nocerts -out certs/product/server.key -nodes -passin pass:temp123
```

#### Step 2: Upload Certificate to Salesforce Connected App

1. **Login to Salesforce** (Product merge-grantor org): https://test8-internal--ggmergeqa2.sandbox.my.salesforce.com
2. **Navigate to**: Setup → Apps → App Manager
3. **Find**: "Playwright Automation" Connected App (or create new one)
4. **Edit** → Enable OAuth Settings
5. **Enable**: "Use digital signatures"
6. **Upload**: `certs/product/server.crt` (the certificate file, NOT the .key file)
7. **Configure OAuth Scopes**:
   - Access and manage your data (api)
   - Perform requests on your behalf at any time (refresh_token, offline_access)
   - Access the identity URL service (id)
8. **Save** and note the **Consumer Key** (should match your SF_CONSUMER_KEY in .env)

#### Step 3: Create Permission Set

1. **Setup** → Users → Permission Sets
2. **Create** "Playwright Automation Access" (if not exists)
3. **System Permissions**: Enable "API Enabled"
4. **Assign** to all test users (ADMIN, EXE, PM, FO, PO, FD, etc.)

#### Step 4: Pre-authorize Users

1. **Connected App** → Manage
2. **Permitted Users**: "Admin approved users are pre-authorized"
3. **Manage Profiles/Permission Sets** → Add "Playwright Automation Access"

## Verification

### Test JWT Login
```powershell
# Set environment variables
$env:PROJECT="product"
$env:ENV="merge-grantor"

# Run preflight check (if available)
npm run preflight

# Or run a simple test
npx cucumber-js --profile product --tags "@smoke"
```

### Expected Behavior
- ✅ No MFA prompts
- ✅ Direct login via frontdoor.jsp
- ✅ Session cached for subsequent logins
- ✅ Logs show: `[AUTH] Mode: JWT | User: <username>`

### Troubleshooting

**Error: "Private key not found"**
- Verify file exists: `certs/product/server.key`
- Check file permissions (should be readable)
- Verify path in .env: `SF_PRIVATE_KEY_PATH=./certs/product/server.key`

**Error: "invalid_grant" from Salesforce**
- Certificate in Salesforce doesn't match private key
- Consumer Key is incorrect
- User not pre-authorized (check permission set assignment)
- JWT `aud` claim must be `https://test.salesforce.com` for sandboxes

**Error: "user hasn't approved this consumer"**
- User needs permission set assigned
- Connected App not pre-authorized
- Check "Permitted Users" setting in Connected App

## Security Notes

⚠️ **NEVER commit private keys to git**
- `certs/` directory is already in `.gitignore`
- Private keys are credentials - treat like passwords
- Each environment should have its own key pair

## Current Configuration

**File**: `envs/product/.env.merge-grantor`
```env
SF_AUTH_MODE=password              # Change to 'jwt' after key setup
SF_LOGIN_URL=https://test8-internal--ggmergeqa2.sandbox.my.salesforce.com
SF_CONSUMER_KEY=3MVG9nN49A55.GBH4brW2vRP9B1WnCZ0MMIwIJXm_b2c5JyiKYkT1nx4QGelRn6yHCJie8G0Q3k3j6heku92g
SF_PRIVATE_KEY_PATH=./certs/product/server.key
```

## Next Steps

1. ✅ Choose Option 1 or Option 2 above
2. ✅ Obtain or generate the private key
3. ✅ Place key at: `certs/product/server.key`
4. ✅ Update `.env.merge-grantor`: `SF_AUTH_MODE=jwt`
5. ✅ Run tests to verify

## References

- JWT Bearer Flow: https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_jwt_flow.htm
- Connected Apps: https://help.salesforce.com/s/articleView?id=sf.connected_app_create.htm
- Framework JWT Docs: `WINDSURF_TASK_sf_jwt_auth.md`
