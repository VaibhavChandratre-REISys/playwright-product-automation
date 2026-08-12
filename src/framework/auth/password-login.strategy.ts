import { Page } from 'playwright';
import { logger } from '../utils/logger';
import { WaitHelper } from '../utils/wait-helper';

/**
 * Password login strategy — the original loginAs() body moved here VERBATIM.
 * This is the fallback for SF_AUTH_MODE=password or Grantee/portal logins.
 *
 * Aligned with Java MainPage.login() and POC MainPageHelper.login().
 */
export async function passwordLogin(
  page: Page,
  baseUrl: string,
  username: string,
  password: string
): Promise<void> {
  // ── Locators (same XPaths as LoginPage) ──────────────────────────────────
  const logoutIframe = page.locator(
    `//iframe[@src='/secur/logout.jsp']`
  );
  const usernameInput = page.locator(
    `//input[@name='username' or @id='username' or @name='userName' or @type='email' or @placeholder='Username' or contains(@name,'username')]`
  );
  const loginSandboxBtn = page.locator(
    `//input[@value='Log In to Sandbox']`
  );
  const passwordInput = page.locator(
    `//input[@type='password' or @placeholder='Password']`
  );
  const acceptTerms = page.locator(
    `//input[contains(@id,'accept') or contains(@id,'Accept')]`
  );
  const loginButton = page.locator(
    `//*[@type='submit' and not(contains(@value, 'Register')) and not(contains(@value, 'Cancel'))] | //div[@class='loginBtnWrap']//button | //div//button[@data-aura-class='uiButton--none uiButton']`
  );
  const homeTab = page.locator(
    `//a[@title='Home Tab'] | //a[@title='Home Tab - Selected'] | //a[@title='Home']`
  );
  const declinePhoneReg = page.locator(
    `//a[text()="I Don't Want to Register My Phone"] | //a[contains(text(),"Don't Want to Register")] | //p[contains(@class,'register-skip')]//a`
  );
  const loginResult = page.locator(
    `//span[contains(@class, 'navbarBrandText')] | //li[contains(@class, 'main-title')] | //*[text()='GovGrants Launcher'] | //a[text()="I Don't Want to Register My Phone"]`
  );
  const switchToLightning = page.locator(
    `//a[@class='switch-to-lightning']`
  );
  const lightningHomeTab = page.locator(
    `//a[@title='Home']`
  );
  const govGrantsLauncher = page.locator(
    `//ul/li/a[@title='GovGrants Launcher Tab'] | //div[contains(@class,'global-header')]//a[@title='GovGrants Launcher Tab']`
  );

  const waitHelper = new WaitHelper(page);

  // ── Login flow (verbatim from LoginPage.loginAs) ─────────────────────────

  logger.info(`Logging in as: ${username}`);
  logger.info(`Navigating to: ${baseUrl}`);
  await page.goto(baseUrl, { waitUntil: 'domcontentloaded' });

  // 1. Wait for logout iframe to disappear (Java: IsElementPresentQuick → ElementToDisappear)
  try {
    if (await logoutIframe.isVisible()) {
      await logoutIframe.waitFor({ state: 'detached', timeout: 10000 }).catch(() => {});
    }
  } catch { /* not present */ }

  // 2. Fill username (Java: I.amPerforming().textInput().in(userName, userNameText))
  await usernameInput.first().waitFor({ state: 'visible', timeout: 30000 });
  await usernameInput.first().fill(username);

  // "Log In to Sandbox" button (username-first flow in sandbox environments)
  try {
    if (await loginSandboxBtn.isVisible()) {
      logger.info('Username-first flow detected — clicking "Log In to Sandbox"');
      await loginSandboxBtn.click();
    }
  } catch { /* not present */ }

  // 3. Fill password (Java: I.amPerforming().textInput().in(password, passwordText))
  await passwordInput.first().waitFor({ state: 'visible', timeout: 30000 });
  await passwordInput.first().fill(password);

  // Accept Terms checkbox (Java: if IsElementPresentQuick → click)
  try {
    if (await acceptTerms.isVisible()) {
      await acceptTerms.check();
    }
  } catch { /* not present */ }

  // 4. Click login button (Java: I.amPerforming().click().on(loginButton))
  try {
    if (page.url().includes('recipient')) {
      page.on('dialog', async (dialog) => { await dialog.accept(); });
    }
    logger.info('Clicking login button...');
    await loginButton.first().click({ timeout: 30000 });
    await page.waitForLoadState('load', { timeout: 60000 }).catch(() => {});
    // Wait for Salesforce multi-hop redirects (frontdoor.jsp → contentDoor → identity/*)
    await page.waitForLoadState('networkidle', { timeout: 15000 }).catch(() => {});
    logger.info(`After login click — URL: ${page.url()}`);
  } catch (e) {
    // Java: catch WebDriverException → getElementReference of Home tab
    await homeTab.first().waitFor({ state: 'attached', timeout: 5000 }).catch(() => {});
  }

  // 5. Decline phone registration (Java: if IsElementPresentQuick(declinePhoneRegistrationButton) → click)
  try {
    if (await declinePhoneReg.isVisible()) {
      await declinePhoneReg.click({ force: true });
      logger.info('Clicked "I Don\'t Want to Register My Phone"');
      await loginResult.first().waitFor({ state: 'visible', timeout: 10000 }).catch(() => {});
    }
  } catch { /* not present */ }

  // 5b. Handle MFA/identity verification pages — force-redirect to Lightning
  const postLoginUrl = page.url();
  if (postLoginUrl.includes('/identity/') || postLoginUrl.includes('contentDoor')) {
    logger.info(`Identity verification page detected (${postLoginUrl.substring(0, 120)}) — forcing redirect to Lightning`);
    const origin = new URL(baseUrl).origin;
    await page.goto(`${origin}/lightning/page/home`, { waitUntil: 'domcontentloaded', timeout: 30000 });
    await page.waitForLoadState('networkidle', { timeout: 15000 }).catch(() => {});
  }

  // 6. Switch to Lightning (Java: if IsElementPresentQuick(switchToLighteningButton) → click)
  try {
    if (await switchToLightning.isVisible()) {
      logger.info('Salesforce Classic detected — switching to Lightning');
      await switchToLightning.click({ timeout: 10000 });
      await lightningHomeTab.first().waitFor({ state: 'visible', timeout: 10000 }).catch(() => {});
    }
  } catch { /* not present */ }

  // 7. Click GovGrants Launcher Tab (Java: clickAdminNavBar("GovGrants Launcher Tab"))
  try {
    if (await govGrantsLauncher.first().isVisible()) {
      logger.info('Clicking GovGrants Launcher Tab');
      await govGrantsLauncher.first().click({ timeout: 10000 });
    }
  } catch { /* not present */ }

  await waitHelper.waitForSpinnerDisappear();
  logger.info(`Login successful — landed on: ${page.url()}`);
}
