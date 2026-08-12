#!/usr/bin/env ts-node
 function _nullishCoalesce(lhs, rhsFn) { if (lhs != null) { return lhs; } else { return rhsFn(); } } function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }/**
 * Standalone preflight script — verifies JWT + frontdoor login works
 * for all internal personas. Port of POC sf_preflight.py.
 *
 * Usage:  npm run preflight
 *         npx ts-node src/framework/auth/preflight.ts
 */

import * as path from 'path';
import * as dotenv from 'dotenv';
import { chromium } from 'playwright';
import { mintSession, buildFrontdoorUrl } from './salesforce-jwt';
import { configSchema } from '../config/config-schema';
import { getProject } from '../utils/get-project';

// ── Load config ──────────────────────────────────────────────────────────────

const project = getProject();
const env = (_nullishCoalesce(process.env['ENV'], () => ( 'auto'))).toLowerCase();
const envFile = path.resolve(__dirname, `../../../envs/${project}/.env.${env}`);
dotenv.config({ path: envFile });

const result = configSchema.safeParse(process.env);
if (!result.success) {
  console.error('Config validation failed:', result.error.issues);
  process.exit(1);
}
const config = result.data;

// ── Internal personas to check ───────────────────────────────────────────────

const PERSONAS = {
  ADMIN: config.ADMIN_USERNAME,
  PM:    config.PM_USERNAME,
  EXE:   config.EXE_USERNAME,
  FO:    config.FO_USERNAME,
  PO:    _nullishCoalesce(config.PO_USERNAME, () => ( config.ADMIN_USERNAME)),
  FD:    _nullishCoalesce(config.FD_USERNAME, () => ( config.ADMIN_USERNAME)),
  PM1:   _nullishCoalesce(config.PM1_USERNAME, () => ( config.PM_USERNAME)),
  EXE1:  _nullishCoalesce(config.EXE1_USERNAME, () => ( config.EXE_USERNAME)),
  FO1:   _nullishCoalesce(config.FO1_USERNAME, () => ( config.FO_USERNAME)),
  FD1:   _nullishCoalesce(config.FD1_USERNAME, () => ( config.ADMIN_USERNAME)),
};

const MFA_SIGNALS = [
  'verify your identity', 'security key', 'authenticator app',
  'verification code', 'passkey', 'two-factor', 'multi-factor',
];

// ── Token exchange check ─────────────────────────────────────────────────────










async function checkToken(role, username) {
  try {
    const session = await mintSession(username, config);
    return {
      role, username, success: true,
      accessToken: session.accessToken,
      instanceUrl: session.instanceUrl,
    };
  } catch (e) {
    return { role, username, success: false, error: e.message };
  }
}

// ── Browser session check ────────────────────────────────────────────────────



async function checkBrowserSession(
  instanceUrl,
  accessToken,
  role
) {
  const url = buildFrontdoorUrl(instanceUrl, accessToken);
  const browser = await chromium.launch({ headless: false, slowMo: 150 });
  const context = await browser.newContext();
  const page = await context.newPage();

  try {
    await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 30000 });

    try {
      await page.waitForLoadState('networkidle', { timeout: 15000 });
    } catch (e2) { /* some SF pages never go fully idle */ }

    let currentUrl = null;
    let body = null;

    for (let attempt = 0; attempt < 5; attempt++) {
      try {
        await page.waitForTimeout(1000);
        currentUrl = page.url();
        body = (await page.content()).toLowerCase();
        break;
      } catch (e3) { continue; }
    }

    if (!body || !currentUrl) {
      return { verdict: 'UNKNOWN', detail: `Page never settled. Last URL: ${page.url()}` };
    }

    // Bypass passkey enrollment page if detected
    if (currentUrl.includes('AddPasskeyUi')) {
      console.log(`   [PASSKEY] Enrollment page detected for ${role} — bypassing via retURL`);
      let retUrl = '';
      try {
        const urlObj = new URL(currentUrl);
        retUrl = urlObj.searchParams.get('retURL') || '';
      } catch (e4) { /* malformed URL */ }
      if (!retUrl) {
        retUrl = await page.locator('#cancelURL').getAttribute('value').catch(() => '') || '';
      }
      if (!retUrl) retUrl = '/lightning/page/home';
      const baseUrl = instanceUrl.replace(/\/$/, '');
      const targetUrl = retUrl.startsWith('http') ? retUrl : `${baseUrl}${retUrl}`;
      await page.goto(targetUrl, { waitUntil: 'domcontentloaded', timeout: 30000 });
      await page.waitForLoadState('networkidle', { timeout: 15000 }).catch(() => {});
      currentUrl = page.url();
      try { body = (await page.content()).toLowerCase(); } catch (e5) { body = ''; }
    }

    const hitMfa = MFA_SIGNALS.filter((s) => body.includes(s));
    if (hitMfa.length > 0) {
      return {
        verdict: 'MFA_CHALLENGE',
        detail: `Blocked at: ${currentUrl}\nSignals: ${hitMfa.join(', ')}`,
      };
    }

    if (currentUrl.includes('/login') || body.includes('id="username"')) {
      return { verdict: 'LOGIN_PAGE', detail: `Bounced to login: ${currentUrl}` };
    }

    const authed =
      (await page.locator('.slds-global-header, one-appnav, .oneHeader').count()) > 0 ||
      currentUrl.includes('/lightning/');

    if (authed) {
      return { verdict: 'AUTHENTICATED', detail: `Landed at: ${currentUrl}` };
    }

    return { verdict: 'UNKNOWN', detail: `Unrecognized page: ${currentUrl}` };
  } finally {
    await page.waitForTimeout(1500);
    await browser.close();
  }
}

// ── Main ─────────────────────────────────────────────────────────────────────

async function main() {
  console.log('='.repeat(70));
  console.log('SALESFORCE JWT + FRONTDOOR PREFLIGHT (TypeScript)');
  console.log(`Org:      ${config.SF_LOGIN_URL}`);
  console.log(`Personas: ${Object.keys(PERSONAS).join(', ')}`);
  console.log('='.repeat(70));
  console.log();

  // Phase 1: Token exchange for all personas
  const results = [];
  for (const [role, username] of Object.entries(PERSONAS)) {
    process.stdout.write(`Checking ${role.padEnd(6)} (${username}) ... `);
    const result = await checkToken(role, username);
    if (result.success) {
      console.log('TOKEN_OK');
    } else {
      console.log('TOKEN_FAILED');
      console.log(`   └─ ${_optionalChain([result, 'access', _ => _.error, 'optionalAccess', _2 => _2.replace, 'call', _3 => _3(/\n/g, '\n      ')])}`);
    }
    results.push(result);
  }

  console.log();
  console.log('='.repeat(70));
  const tokenOk = results.filter((r) => r.success);
  const tokenFailed = results.filter((r) => !r.success);
  console.log(`Token exchange: ${tokenOk.length}/${results.length} succeeded`);
  if (tokenFailed.length > 0) {
    console.log(`Failed: ${tokenFailed.map((r) => r.role).join(', ')} -- see FIX notes above.`);
  }
  console.log('='.repeat(70));

  // Phase 2: Browser session check for first 2 successes
  const browserTargets = tokenOk.slice(0, 2);
  if (browserTargets.length === 0) {
    console.log('\nNo persona produced a valid token — cannot run browser check.');
    process.exit(1);
  }

  let allAuthenticated = tokenFailed.length === 0;

  for (const target of browserTargets) {
    console.log(`\nOpening browser for ${target.role} (${target.username})...`);
    const { verdict, detail } = await checkBrowserSession(
      target.instanceUrl, target.accessToken, target.role
    );
    console.log(`BROWSER VERDICT [${target.role}]: ${verdict}`);
    console.log(`   ${detail}`);

    if (verdict !== 'AUTHENTICATED') {
      allAuthenticated = false;
    }

    if (verdict === 'MFA_CHALLENGE') {
      console.log('\n🛑 STOP — frontdoor is being intercepted by MFA enforcement.');
      console.log('   Debug the Connected App / permission set config.');
    } else if (verdict === 'LOGIN_PAGE') {
      console.log('\n⚠️  Token was valid but session was rejected.');
      console.log("   Check the 'web' OAuth scope is enabled on the External Client App.");
    }
  }

  console.log();
  if (allAuthenticated) {
    console.log('✅ All tokens succeeded and browser sessions authenticated.');
    console.log('   JWT + frontdoor is working. Safe to run the suite with SF_AUTH_MODE=jwt.');
    process.exit(0);
  } else {
    console.log('❌ Some checks failed — see details above.');
    process.exit(1);
  }
}

main().catch((err) => {
  console.error('Preflight crashed:', err);
  process.exit(1);
});
