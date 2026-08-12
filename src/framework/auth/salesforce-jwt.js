 function _nullishCoalesce(lhs, rhsFn) { if (lhs != null) { return lhs; } else { return rhsFn(); } } function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }import * as fs from 'fs';
import * as path from 'path';
import * as jwt from 'jsonwebtoken';
import axios from 'axios';
import { logger } from '../utils/logger';


// ── Types ────────────────────────────────────────────────────────────────────







// ── Session cache ────────────────────────────────────────────────────────────
// Module-level Map so a 200-scenario run makes ~10 token calls, not 200.
// Cache TTL = 150s (under the 180s JWT exp ceiling).

const SESSION_CACHE = new Map();
const CACHE_TTL_MS = 150000;

function getCached(username) {
  const cached = SESSION_CACHE.get(username);
  if (!cached) return null;
  if (Date.now() - cached.mintedAt > CACHE_TTL_MS) {
    SESSION_CACHE.delete(username);
    return null;
  }
  return cached;
}

// ── Error mapping (ported from POC sf_preflight.py) ──────────────────────────

function explainError(responseText, username) {
  if (responseText.includes('user hasn\'t approved this consumer') || responseText.includes('app_not_found')) {
    return (
      'FIX: The External Client App\'s permission set isn\'t authorizing this user.\n' +
      '     External Client App Manager -> Playwright Automation -> Policies\n' +
      '     -> App Policies -> Selected Permission Sets must include your\n' +
      '     \'Playwright Automation Access\' permission set, AND that permission\n' +
      '     set must be assigned to this specific user.'
    );
  }
  if (responseText.includes('invalid_grant')) {
    return (
      `FIX: invalid_grant is Salesforce's catch-all. Most likely one of:\n` +
      `     1. Username wrong/mistyped: '${username}'\n` +
      `        Verify the EXACT value in Setup -> Users.\n` +
      `     2. Private key doesn't match the uploaded .crt.\n` +
      `     3. Audience wrong -- sandbox MUST be https://test.salesforce.com\n` +
      `        (not your My Domain URL).\n` +
      `     4. User lacks 'API Enabled' permission.\n` +
      `     5. User is inactive in this sandbox.`
    );
  }
  if (responseText.includes('invalid_client_id')) {
    return 'FIX: Consumer Key is wrong, or the app hasn\'t finished propagating (wait ~10 min after any change).';
  }
  return `See raw response for details: ${responseText}`;
}

// ── JWT mint + token exchange ────────────────────────────────────────────────

export async function mintSession(username, config) {
  const consumerKey = config.SF_CONSUMER_KEY;
  const keyPath = config.SF_PRIVATE_KEY_PATH;
  const loginUrl = config.SF_LOGIN_URL || 'https://test.salesforce.com';

  if (!consumerKey || !keyPath) {
    throw new Error(
      'JWT config incomplete. Required: SF_CONSUMER_KEY, SF_PRIVATE_KEY_PATH in .env file.'
    );
  }

  // Resolve key path relative to project root
  const resolvedKeyPath = path.isAbsolute(keyPath)
    ? keyPath
    : path.resolve(process.cwd(), keyPath);

  if (!fs.existsSync(resolvedKeyPath)) {
    throw new Error(`Private key not found at: ${resolvedKeyPath}`);
  }

  const privateKey = fs.readFileSync(resolvedKeyPath, 'utf-8');
  const now = Math.floor(Date.now() / 1000);

  // Build JWT — aud MUST be https://test.salesforce.com for sandboxes
  const assertion = jwt.sign(
    {
      iss: consumerKey,
      sub: username,
      aud: 'https://test.salesforce.com',
      exp: now + 180,
    },
    privateKey,
    { algorithm: 'RS256' }
  );

  const tokenEndpoint = `${loginUrl.replace(/\/+$/, '')}/services/oauth2/token`;

  logger.info(`[JWT] Minting session for ${username} at ${tokenEndpoint}`);

  try {
    const params = new URLSearchParams();
    params.append('grant_type', 'urn:ietf:params:oauth:grant-type:jwt-bearer');
    params.append('assertion', assertion);

    const response = await axios.post(tokenEndpoint, params, {
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      timeout: 30000,
    });

    const { access_token, instance_url } = response.data;
    if (!access_token || !instance_url) {
      throw new Error(`Token response missing fields: ${JSON.stringify(response.data)}`);
    }

    const session = {
      accessToken: access_token,
      instanceUrl: instance_url,
      mintedAt: Date.now(),
    };

    SESSION_CACHE.set(username, session);
    logger.info(`[JWT] Session minted for ${username} — instance: ${instance_url}`);
    return session;
  } catch (error) {
    const status = _nullishCoalesce(_optionalChain([error, 'access', _ => _.response, 'optionalAccess', _2 => _2.status]), () => ( 'N/A'));
    const body = _optionalChain([error, 'access', _3 => _3.response, 'optionalAccess', _4 => _4.data])
      ? JSON.stringify(error.response.data)
      : error.message;
    const explanation = explainError(body, username);
    throw new Error(
      `JWT token exchange failed for ${username}:\n` +
      `  HTTP ${status}: ${body}\n` +
      `  ${explanation}`
    );
  }
}

// ── Cached session getter ────────────────────────────────────────────────────

export async function getOrMintSession(username, config) {
  const cached = getCached(username);
  if (cached) {
    logger.info(`[JWT] Using cached session for ${username} (age: ${Math.round((Date.now() - cached.mintedAt) / 1000)}s)`);
    return cached;
  }
  return mintSession(username, config);
}

// ── Frontdoor URL builder ────────────────────────────────────────────────────

export function buildFrontdoorUrl(
  instanceUrl,
  accessToken,
  retUrl = '/lightning/page/home'
) {
  return (
    `${instanceUrl}/secur/frontdoor.jsp` +
    `?sid=${encodeURIComponent(accessToken)}` +
    `&retURL=${encodeURIComponent(retUrl)}`
  );
}
