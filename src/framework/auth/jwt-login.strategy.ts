import { Page } from 'playwright';
import { logger } from '../utils/logger';
import { AppConfig } from '../config/config-schema';
import { getOrMintSession, buildFrontdoorUrl } from './salesforce-jwt';

/**
 * Salesforce identity/enrollment page patterns that can be bypassed.
 * These pages appear after frontdoor login for users whose org/profile
 * requires passkey enrollment or MFA registration. They are NOT hard
 * blocks — the user already has a valid API session from JWT.
 *
 * Known interceptor pages:
 *   - AddPasskeyUi          — "Create a Passkey" enrollment prompt
 *   - addTwoFactorOnly      — "Insufficient Privileges — connect an authenticator app"
 *   - identity/verification — "Verify Your Identity" / "Approve sign in request"
 *   - identity/challenge    — MFA push notification challenge
 *   - _ui/identity          — Generic identity UI pages
 */
const IDENTITY_BYPASS_PATTERNS = [
  'AddPasskeyUi',
  'addTwoFactorOnly',
  'addTwoFactor',
  'identity/verification',
  'identity/webauthn',
  'identity/challenge',
  '_ui/identity',
];

/**
 * Detect and bypass Salesforce identity/enrollment interceptor pages.
 * Strategy: extract retURL from query params or DOM cancelURL input,
 * then navigate directly to the destination (usually Lightning home).
 * Runs up to 3 iterations to handle chained redirects (e.g. passkey → 2FA).
 */
async function bypassIdentityPages(
  page: Page,
  username: string,
  instanceUrl: string
): Promise<void> {
  const baseUrl = instanceUrl.replace(/\/$/, '');

  // Derive the Lightning domain from the instance URL.
  // e.g. test8-internal--nysedauto.sandbox.my.salesforce.com
  //   →  test8-internal--nysedauto.sandbox.lightning.force.com
  const lightningBase = baseUrl
    .replace('.my.salesforce.com', '.lightning.force.com')
    .replace('.sandbox.salesforce.com', '.sandbox.lightning.force.com');

  let lastPattern = '';
  let samePatternCount = 0;

  for (let attempt = 0; attempt < 3; attempt++) {
    const currentUrl = page.url();

    // Check if current URL matches any identity interceptor pattern
    const matchedPattern = IDENTITY_BYPASS_PATTERNS.find((p) =>
      currentUrl.includes(p)
    );
    if (!matchedPattern) {
      return; // Not on an interceptor page — done
    }

    // Detect if we're stuck in a redirect loop (same pattern 2+ times)
    if (matchedPattern === lastPattern) {
      samePatternCount++;
      if (samePatternCount >= 2) {
        logger.warn(
          `[JWT] Identity bypass loop detected for ${username} — ` +
          `pattern "${matchedPattern}" repeated ${samePatternCount + 1} times. ` +
          `Trying Lightning domain directly.`
        );
        // Break out by navigating to Lightning domain (different from instance URL)
        const lightningHome = `${lightningBase}/lightning/page/home`;
        await page.goto(lightningHome, { waitUntil: 'domcontentloaded', timeout: 30000 });
        await page.waitForLoadState('networkidle', { timeout: 15000 }).catch(() => {});
        return;
      }
    } else {
      samePatternCount = 0;
    }
    lastPattern = matchedPattern;

    logger.info(
      `[JWT] Identity page detected for ${username} (pattern: ${matchedPattern}, attempt ${attempt + 1}) — bypassing`
    );

    // Try to extract retURL from the page URL query params
    let retUrl = '';
    try {
      const urlObj = new URL(currentUrl);
      retUrl = urlObj.searchParams.get('retURL') || '';
    } catch { /* malformed URL */ }

    // Fallback: read cancelURL hidden input from the DOM
    if (!retUrl) {
      retUrl = await page.locator('#cancelURL').getAttribute('value')
        .catch(() => '') || '';
    }

    // Default fallback: Lightning home
    if (!retUrl) {
      retUrl = '/lightning/page/home';
    }

    // Build absolute URL — prefer Lightning domain over instance URL on later attempts
    // to avoid Salesforce identity interception on the .my.salesforce.com domain
    const targetBase = attempt >= 2 ? lightningBase : baseUrl;
    const targetUrl = retUrl.startsWith('http') ? retUrl : `${targetBase}${retUrl}`;
    logger.info(`[JWT] Navigating past identity page to: ${targetUrl}`);
    await page.goto(targetUrl, { waitUntil: 'domcontentloaded', timeout: 30000 });
    await page.waitForLoadState('networkidle', { timeout: 15000 }).catch(() => {});
  }
}

/**
 * JWT login strategy: mint a Salesforce session via OAuth 2.0 JWT Bearer flow,
 * then hand it to the browser via /secur/frontdoor.jsp.
 *
 * The browser lands already authenticated — no username/password form, no MFA.
 *
 * Post-login: handles switch-to-Lightning and GovGrants Launcher Tab click
 * (same as steps 6-7 in the original password loginAs flow).
 */
export async function jwtLogin(
  page: Page,
  username: string,
  config: AppConfig
): Promise<void> {
  // 1. Get or mint cached session
  const session = await getOrMintSession(username, config);

  // 2. Navigate to frontdoor URL
  const frontdoorUrl = buildFrontdoorUrl(session.instanceUrl, session.accessToken);
  logger.info(`[JWT] Navigating to frontdoor for ${username}`);
  await page.goto(frontdoorUrl, { waitUntil: 'domcontentloaded', timeout: 45000 });

  // 3. Wait for Salesforce multi-hop redirects to settle
  //    (ported from POC: networkidle then bounded retry on URL/content read)
  await page.waitForLoadState('networkidle', { timeout: 10000 }).catch(() => {});

  // 3b. Bypass Salesforce identity/enrollment interceptor pages.
  //     Some users get chained prompts (passkey → 2FA → etc.) after frontdoor.
  //     These are NOT hard blocks — the JWT session is valid at API level.
  //     We dismiss them by navigating directly to the retURL/Lightning home.
  await bypassIdentityPages(page, username, session.instanceUrl);

  // 4. Wait for Lightning shell — this doubles as our MFA canary.
  //    Lightning components render inside shadow DOM, so standard CSS selectors
  //    may not find them. We use a two-pronged approach:
  //    a) Try CSS selectors for common Lightning shell elements
  //    b) Fall back to URL + page.evaluate() to detect Lightning Aura app
  const lightningShell = page.locator(
    '.slds-global-header, one-appnav, .oneHeader, .lafAppLayoutHost, .oneCenterStage, one-app-nav-bar'
  ).first();

  /**
   * Check if Lightning has finished rendering by evaluating the Aura framework
   * status or detecting key elements inside shadow DOM.
   */
  async function isLightningReady(): Promise<boolean> {
    try {
      return await page.evaluate(() => {
        // Check if Aura framework is initialized
        if (typeof (window as any).$A !== 'undefined') return true;
        // Check for Lightning navigation bar in shadow DOM
        const navBar = document.querySelector('one-app-nav-bar');
        if (navBar) return true;
        // Check for global header container (may be in light DOM on some orgs)
        const header = document.querySelector('.oneHeader, .slds-global-header_container');
        if (header) return true;
        return false;
      });
    } catch {
      return false;
    }
  }

  /** Combined check: CSS locator OR JS-based Lightning detection */
  async function waitForLightning(timeout: number): Promise<boolean> {
    const deadline = Date.now() + timeout;
    // First try the fast CSS locator path
    try {
      await lightningShell.waitFor({ state: 'visible', timeout: Math.min(timeout, 15000) });
      return true;
    } catch { /* fall through to JS-based check */ }

    // Poll with JS evaluate for the remaining time
    while (Date.now() < deadline) {
      if (await isLightningReady()) return true;
      await page.waitForTimeout(2000);
    }
    return false;
  }

  let lightningLoaded = await waitForLightning(30000);

  if (!lightningLoaded) {
    // Maybe identity page appeared after a delayed redirect — try bypass again
    await bypassIdentityPages(page, username, session.instanceUrl);
    lightningLoaded = await waitForLightning(15000);
  }

  if (!lightningLoaded) {
    // Last resort: reload the page — slow sandboxes sometimes stall on initial load
    logger.warn(`[JWT] Lightning shell not visible after bypass — reloading page for ${username}`);
    await page.reload({ waitUntil: 'domcontentloaded', timeout: 30000 });
    await page.waitForLoadState('networkidle', { timeout: 15000 }).catch(() => {});
    lightningLoaded = await waitForLightning(20000);
  }

  if (!lightningLoaded) {
    // Final diagnostics — check for MFA or login bounce
    const currentUrl = page.url();
    const body = await page.content().catch(() => '');
    const bodyLower = body.toLowerCase();

    const mfaSignals = [
      'verify your identity', 'security key', 'authenticator app',
      'verification code', 'two-factor', 'multi-factor',
    ];
    const hitMfa = mfaSignals.some((s) => bodyLower.includes(s));

    if (hitMfa) {
      throw new Error(
        `[JWT] MFA challenge detected after frontdoor login for ${username}.\n` +
        `  URL: ${currentUrl}\n` +
        `  This should not happen with JWT+frontdoor. Debug the Connected App / permission set config.`
      );
    }
    if (currentUrl.includes('/login') || bodyLower.includes('id="username"')) {
      throw new Error(
        `[JWT] Bounced to login page after frontdoor for ${username}.\n` +
        `  URL: ${currentUrl}\n` +
        `  Check the 'web' OAuth scope is enabled on the External Client App.`
      );
    }
    throw new Error(
      `[JWT] Lightning shell not found after frontdoor login for ${username}.\n` +
      `  URL: ${currentUrl}\n` +
      `  Expected Lightning Aura framework ($A) or shell elements within 60s.`
    );
  }

  logger.info(`[JWT] Authenticated — landed on: ${page.url()}`);

  // 5. Switch to Lightning if in Classic (same as password loginAs step 6)
  const switchToLightning = page.locator(`//a[@class='switch-to-lightning']`);
  try {
    if (await switchToLightning.isVisible()) {
      logger.info('[JWT] Salesforce Classic detected — switching to Lightning');
      await switchToLightning.click({ timeout: 10000 });
      await page.locator(`//a[@title='Home']`).first()
        .waitFor({ state: 'visible', timeout: 10000 }).catch(() => {});
    }
  } catch { /* not in Classic */ }

  // 6. Click GovGrants Launcher Tab (same as password loginAs step 7)
  const govGrantsLauncher = page.locator(
    `//ul/li/a[@title='GovGrants Launcher Tab'] | //div[contains(@class,'global-header')]//a[@title='GovGrants Launcher Tab']`
  );
  try {
    if (await govGrantsLauncher.first().isVisible()) {
      logger.info('[JWT] Clicking GovGrants Launcher Tab');
      await govGrantsLauncher.first().click({ timeout: 10000 });
    }
  } catch { /* not present */ }

  // 7. Wait for spinner (same pattern as password loginAs)
  try {
    const spinner = page.locator(
      `//div[contains(@class,'slds-spinner')] | //div[contains(@class,'loadingSpinner')]`
    ).first();
    if (await spinner.isVisible()) {
      await spinner.waitFor({ state: 'hidden', timeout: 10000 }).catch(() => {});
    }
  } catch { /* no spinner */ }

  logger.info(`[JWT] Login complete — final URL: ${page.url()}`);
}
