import { Page } from 'playwright';
import { BasePage } from './base-page';
import { SavedValues } from '../utils/saved-values';
import { logger } from '../utils/logger';
import { getConfig } from '../config/config-loader';
import { dispatchLogin } from '../auth/login-dispatcher';

/**
 * Handles Salesforce login for both Grantor (internal) and Grantee (portal) portals.
 * Aligned with POC MainPageHelper.login() and Java MainPage.login().
 */
export class LoginPage extends BasePage {
  // ── Locators (match Java MainPage + POC MainPageHelper) ─────────────────
  private readonly logoutIframe = this.page.locator(
    `//iframe[@src='/secur/logout.jsp']`
  );
  private readonly usernameInput = this.page.locator(
    `//input[@name='username' or @id='username' or @name='userName' or @type='email' or @placeholder='Username' or contains(@name,'username')]`
  );
  private readonly loginSandboxBtn = this.page.locator(
    `//input[@value='Log In to Sandbox']`
  );
  private readonly passwordInput = this.page.locator(
    `//input[@type='password' or @placeholder='Password']`
  );
  private readonly acceptTerms = this.page.locator(
    `//input[contains(@id,'accept') or contains(@id,'Accept')]`
  );
  private readonly loginButton = this.page.locator(
    `//*[@type='submit' and not(contains(@value, 'Register')) and not(contains(@value, 'Cancel'))] | //div[@class='loginBtnWrap']//button | //div//button[@data-aura-class='uiButton--none uiButton']`
  );
  private readonly homeTab = this.page.locator(
    `//a[@title='Home Tab'] | //a[@title='Home Tab - Selected'] | //a[@title='Home']`
  );
  private readonly declinePhoneReg = this.page.locator(
    `//a[text()="I Don't Want to Register My Phone"] | //a[contains(text(),"Don't Want to Register")] | //p[contains(@class,'register-skip')]//a`
  );
  private readonly loginResult = this.page.locator(
    `//span[contains(@class, 'navbarBrandText')] | //li[contains(@class, 'main-title')] | //*[text()='GovGrants Launcher'] | //a[text()="I Don't Want to Register My Phone"]`
  );
  private readonly switchToLightning = this.page.locator(
    `//a[@class='switch-to-lightning']`
  );
  private readonly lightningHomeTab = this.page.locator(
    `//a[@title='Home']`
  );
  private readonly govGrantsLauncher = this.page.locator(
    `//ul/li/a[@title='GovGrants Launcher Tab'] | //div[contains(@class,'global-header')]//a[@title='GovGrants Launcher Tab']`
  );
  // ── Logout locators (match Java GovGrantsObjects.clickLogOut) ──────────────
  private readonly profileDropdown = this.page.locator(
    `//button[contains(@class,'userProfile-button') or @data-aura-class='profileTrigger'] | //span[contains(@class,'oneUserProfileCardTrigger')] | //div[contains(@class,'comm-user-profile-menu__trigger-icon')]`
  );
  private readonly logOutLinkLightning = this.page.locator(
    `//div[contains(@class,'profile-card-toplinks')]//a[text()='Log Out'] | //a[text()='Log Out']`
  );
  private readonly logOutLinkClassic = this.page.locator(
    `//div[contains(@class,'profile-card-toplinks')]//a[text()='Logout'] | //a[text()='Logout']`
  );

  constructor(page: Page, savedValues: SavedValues) {
    super(page, savedValues);
  }

  /**
   * Logout from Salesforce — mirrors Java GovGrantsObjects.clickLogOut().
   * Flow: click profile dropdown → click "Log Out" → clear cookies → wait.
   */
  async logout(): Promise<void> {
    logger.info('Logging out from Salesforce');
    try {
      // Wait for page to stabilize before clicking profile dropdown
      await this.page.waitForLoadState('domcontentloaded').catch(() => {});

      // Java: clickLoginDropDown() — wait for profile button then click
      await this.profileDropdown.first().waitFor({ state: 'visible', timeout: 5000 });
      await this.profileDropdown.first().click();

      // Java: clickLoginDropDownItems("Log Out" or "Logout") depending on Lightning/Classic
      const isLightning = this.page.url().includes('lightning');
      const logOutLink = isLightning ? this.logOutLinkLightning : this.logOutLinkClassic;
      await logOutLink.first().waitFor({ state: 'visible', timeout: 5000 });
      await logOutLink.first().click();
      logger.info('Clicked Log Out link');

      // Java: I.amPerforming().cookiesOperationsTo().deleteAllCookies()
      await this.page.context().clearCookies();

      // Wait for logout to complete — detect login page URL or wait for navigation
      await this.page.waitForURL(/login|secur\/logout|Login/, { timeout: 8000 }).catch(() => {});
      logger.info('Logout complete — cookies cleared');
    } catch (e) {
      // Fallback: if profile dropdown not found, force-navigate to logout URL
      logger.warn(`UI logout failed (${e}), falling back to /secur/logout.jsp`);
      const origin = new URL(this.page.url()).origin;
      await this.page.goto(`${origin}/secur/logout.jsp`, { waitUntil: 'load', timeout: 30000 }).catch(() => {});
      await this.page.context().clearCookies();
      await this.page.waitForLoadState('load').catch(() => {});
    }
  }

  /**
   * Navigate to a portal URL — mirrors Java MainPage.navigateToPortal().
   * Deletes cookies first, then navigates to the portal URL.
   * For SUBPORTAL, also clicks "Login to GFMS/Register" button.
   */
  async navigateToPortal(baseUrl: string, portalType?: string): Promise<void> {
    // Java: I.amPerforming().cookiesOperationsTo().deleteAllCookies()
    await this.page.context().clearCookies();

    // Java: I.amPerforming().browserOperationsTo().navigateToUrl(url)
    logger.info(`Navigating to portal: ${baseUrl}`);
    await this.navigateTo(baseUrl);

    // Java: if portalType == SUBPORTAL → click "Login to GFMS/Register"
    if (portalType && portalType.toUpperCase() === 'SUBPORTAL') {
      try {
        await this.page.waitForLoadState('load', { timeout: 60000 });
        const gfmsBtn = this.page.locator(
          `//button[text()='Login to GFMS/Register'] | //a[text()='Login to GFMS/Register']`
        ).first();
        await gfmsBtn.waitFor({ state: 'attached', timeout: 15000 });
        await gfmsBtn.evaluate((el: HTMLElement) => el.click());
        await this.page.waitForLoadState('load', { timeout: 60000 });
      } catch {
        logger.warn('SUBPORTAL Login to GFMS/Register button not found or not needed');
      }
    }
  }

  /**
   * Wait for the EGMS header (GovGrants app brand text) to confirm the
   * GovGrants custom app page has loaded.
   * Mirrors Java MainPage.waitForEgmsHeader():
   *   egmsHeader = By.xpath("//span[contains(@class, 'navbarBrandText')]")
   *   I.amPerforming().waitFor().ElementToBePresent(egmsHeader);
   */
  async waitForEgmsHeader(): Promise<void> {
    try {
      const egmsHeader = this.page.locator(
        `//span[contains(@class, 'navbarBrandText')]`
      );
      await egmsHeader.waitFor({ state: 'visible', timeout: 5000 });
      logger.info('EGMS header visible — GovGrants app loaded');
    } catch {
      logger.warn('EGMS header not found within 5s — may not be on GovGrants app page');
    }
  }

  /**
   * Navigate to the login URL and authenticate with the given credentials.
   * Aligned with Java MainPage.login() and POC MainPageHelper.login():
   *   1. Wait for logout iframe to disappear
   *   2. Fill username (+ "Log In to Sandbox" if present)
   *   3. Fill password (+ accept terms if present)
   *   4. Click login button
   *   5. Decline phone registration / handle MFA page
   *   6. Switch to Lightning Experience
   *   7. Click GovGrants Launcher Tab
   */
  async loginAs(baseUrl: string, username: string, password: string): Promise<void> {
    const config = getConfig();
    await dispatchLogin(this.page, baseUrl, username, password, config);
  }
}
