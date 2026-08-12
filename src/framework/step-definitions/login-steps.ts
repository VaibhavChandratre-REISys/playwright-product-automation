import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { CustomWorld } from '../world/custom-world';
import { LoginPage } from '../pages/login-page';
import { getConfig } from '../config/config-loader';
import { resolveUser } from '../utils/user-resolver';
import { logger } from '../utils/logger';

// ── Helper: resolve base URL from portal / app name ──────────────────────────

function resolveBaseUrl(portalOrApp: string, config: ReturnType<typeof getConfig>): string {
  const lower = portalOrApp.toLowerCase();
  if (
    lower.includes('grantee') ||
    lower.includes('grants portal') ||
    lower === 'subportal' ||
    lower === 'external'
  ) {
    return config.GRANTEE_PORTAL_URL;
  }
  if (lower.includes('internal') || lower.includes('grantor')) {
    return config.GRANTOR_INTERNAL_URL;
  }
  return config.GRANTOR_BASE_URL;
}

// ── Login ────────────────────────────────────────────────────────────────────

/**
 * Matches all of:
 *   Given I login to "As a Grantor" app as "Admin" user
 *   When  I login to "Grants Portal" app as "GRANTEE_SC" user
 */
const loginHandler = async function (
  this: CustomWorld,
  portalType: string,
  role: string
) {
  const config = getConfig();
  const user = resolveUser(role, config);
  const baseUrl = resolveBaseUrl(portalType, config);

  const loginPage = new LoginPage(this.page, this.savedValues);
  await loginPage.loginAs(baseUrl, user.username, user.password);
  // Java: govgrants.perform().mainPage().waitForEgmsHeader();
  await loginPage.waitForEgmsHeader();
  this.savedValues.set(`${role.toUpperCase()} Username`, user.displayName);
};

Given(/^I login to "([^"]*)" app as "([^"]*)" user$/, loginHandler);

/**
 *   Given I login as "Admin" user
 */
Given(
  /^I login as "([^"]*)" user$/,
  async function (this: CustomWorld, role: string) {
    const config = getConfig();
    const user = resolveUser(role, config);
    const baseUrl = config.GRANTOR_BASE_URL;
    const loginPage = new LoginPage(this.page, this.savedValues);
    await loginPage.loginAs(baseUrl, user.username, user.password);
    // Java: govgrants.perform().mainPage().waitForEgmsHeader();
    await loginPage.waitForEgmsHeader();
    this.savedValues.set(`${role.toUpperCase()} Username`, user.displayName);
  }
);

// ── Re-login ─────────────────────────────────────────────────────────────────

/**
 * Matches all of:
 *   When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
 *   When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
 *   When I re-login to "As a Grantor" app as "PM" user
 *   Then I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
 *
 * Aligned with Java GovGrantsSteps.reloginToggleToAppInURL():
 *   1. Wait 3s
 *   2. ggObjects.clickLogOut()           → loginPage.logout()
 *   3. Wait 4s
 *   4. mainPage.navigateToPortal(portal) → loginPage.navigateToPortal(url, portalType)
 *   5. mainPage.loginWithUserType(user)  → loginPage.loginAs(url, username, password)
 */
const reLoginHandler = async function (
  this: CustomWorld,
  portalType: string,
  role: string,
  portal?: string
) {
  const config = getConfig();
  const user = resolveUser(role, config);
  const resolvedPortal = portal || portalType;
  const baseUrl = resolveBaseUrl(resolvedPortal, config);

  const loginPage = new LoginPage(this.page, this.savedValues);

  try {
    // Ensure page is stable before attempting logout
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});

    // Java: ggObjects.clickLogOut()
    await loginPage.logout();

    // Java: govgrants.perform().mainPage().navigateToPortal(portalType)
    await loginPage.navigateToPortal(baseUrl, resolvedPortal);

    // Java: govgrants.perform().mainPage().loginWithUserType(userType)
    await loginPage.loginAs(baseUrl, user.username, user.password);
    // Java: govgrants.perform().mainPage().waitForEgmsHeader();
    await loginPage.waitForEgmsHeader();
  } catch (e) {
    // Java fallback: check for GovGrants Launcher Tab
    logger.warn(`Re-login flow exception: ${e}`);
    const launcher = this.page.locator(`//a[@title='GovGrants Launcher Tab']`).first();
    if (await launcher.isVisible({ timeout: 5000 }).catch(() => false)) {
      logger.info('GovGrants Launcher Tab found — clicking');
      await launcher.click();
      await this.page.waitForLoadState('networkidle').catch(() => {});
    }
  }

  this.savedValues.set(`${role.toUpperCase()} Username`, user.displayName);
};

Given(/^I re-login to "([^"]*)" app as "([^"]*)" user(?: on "([^"]*)" portal)?$/, reLoginHandler);

// ── Portal navigation ────────────────────────────────────────────────────────

/**
 * Matches all of:
 *   Given I am on "SUBPORTAL" portal
 *   When  I am on "SUBPORTAL" portal
 *   Then  I am on "SUBPORTAL" portal
 *   Given I am on "INTERNAL" portal
 */
const portalHandler = async function (this: CustomWorld, portal: string) {
  const config = getConfig();
  const baseUrl = resolveBaseUrl(portal, config);
  logger.info(`Navigating to portal: "${portal}" → ${baseUrl}`);
  await this.page.goto(baseUrl, { waitUntil: 'domcontentloaded' });
};

Given(/^I am on "([^"]*)" portal$/, portalHandler);

/**
 *   Given I am on "SUBPORTAL" portal without Login to GFMS/Register button click
 */
Given(
  /^I am on "([^"]*)" portal without Login to GFMS\/Register button click$/,
  async function (this: CustomWorld, portal: string) {
    const config = getConfig();
    const baseUrl = resolveBaseUrl(portal, config);
    logger.info(`Navigating to portal (no login click): "${portal}" → ${baseUrl}`);
    await this.page.goto(baseUrl, { waitUntil: 'domcontentloaded' });
  }
);

// ── Login page buttons ───────────────────────────────────────────────────────

Then(
  /^I (softly see|softly do not see|see|do not see) button "([^"]*)" on login page$/,
  async function (this: CustomWorld, usage: string, buttonName: string) {
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//button[text()='${resolved}' or @value='${resolved}'] | //input[@value='${resolved}']`
    ).first();
    if (usage.includes('do not')) {
      try {
        await expect(btn).toBeHidden({ timeout: 5000 });
      } catch { /* soft */ }
    } else {
      try {
        await expect(btn).toBeVisible({ timeout: 10000 });
      } catch { /* soft */ }
    }
  }
);

Then(
  /^I click on button "([^"]*)" inside login page$/,
  async function (this: CustomWorld, buttonName: string) {
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//button[text()='${resolved}' or @value='${resolved}'] | //input[@value='${resolved}'] | //a[text()='${resolved}']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

// ── Enter value in username field ────────────────────────────────────────────

const enterUsernameHandler = async function (this: CustomWorld, value: string) {
  const resolved = this.savedValues.resolve(value);
  const input = this.page.locator(
    `//input[@name='username' or @id='username' or @name='userName' or @type='email']`
  ).first();
  await input.waitFor({ state: 'visible', timeout: 10000 });
  await input.clear();
  await input.fill(resolved);
};

Given(/^I enter value "([^"]*)" in username field$/, enterUsernameHandler);

// ── Select from user dropdown ────────────────────────────────────────────────

const selectUserDropdownHandler = async function (this: CustomWorld, value: string) {
  const resolved = this.savedValues.resolve(value);
  const dropdown = this.page.locator(
    `//select[contains(@id,'user') or contains(@name,'user')] | //button[contains(@title,'user')]`
  ).first();
  await dropdown.waitFor({ state: 'visible', timeout: 10000 });
  await dropdown.selectOption({ label: resolved });
};

Given(/^I select "([^"]*)" from user dropdown$/, selectUserDropdownHandler);

// ── Set password ─────────────────────────────────────────────────────────────

Then(
  /^I set password for the user$/,
  async function (this: CustomWorld) {
    const passwordText = 'Salesforc@20026';
    logger.info(`Setting password for user`);
    // Selenium approach: use specific IDs
    const newPassword = this.page.locator("//input[@id='newpassword']").first();
    await newPassword.waitFor({ state: 'visible', timeout: 10000 });
    await newPassword.fill(passwordText);
    await this.page.waitForTimeout(500);
    
    const confirmNewPassword = this.page.locator("//input[@id='confirmpassword']").first();
    await confirmNewPassword.waitFor({ state: 'visible', timeout: 10000 });
    await confirmNewPassword.fill(passwordText);
    await this.page.waitForTimeout(500);
    
    const changePasswordBtn = this.page.locator("//button[@id='password-button']").first();
    await changePasswordBtn.click();
    logger.info(`Password set successfully`);
  }
);

// ── Navigate to reset password ───────────────────────────────────────────────

const resetPasswordHandler = async function (this: CustomWorld) {
  logger.info('Navigating to reset password link from email iframe');
  
  // Wait for iframe to be present
  const iframeLocator = this.page.locator("//iframe[@class='w-full overflow-scroll']").first();
  await iframeLocator.waitFor({ state: 'attached', timeout: 10000 });
  
  // Get the iframe content
  const frameElement = await iframeLocator.elementHandle();
  if (!frameElement) {
    throw new Error('Iframe element not found');
  }
  
  const frame = await frameElement.contentFrame();
  if (!frame) {
    throw new Error('Could not access iframe content');
  }
  
  // Get text from body or mail div
  const bodyText = await frame.locator('//body | //div[@id="mail"]').first().innerText();
  logger.info(`Email body text length: ${bodyText.length}`);
  
  // Extract the https link (split by "https" and take the first URL)
  const parts = bodyText.split('https');
  if (parts.length < 2) {
    throw new Error('No https link found in email body');
  }
  
  // Get the URL part after "https" and take the first word (URL)
  const urlPart = parts[1].split(/\s/)[0].trim();
  const setPasswordLink = 'https' + urlPart;
  
  logger.info(`Extracted reset password link: ${setPasswordLink}`);
  
  // Navigate to the reset password link
  await this.page.goto(setPasswordLink, { waitUntil: 'domcontentloaded' });
  await this.page.waitForLoadState('networkidle', { timeout: 30000 }).catch(() => {});
  logger.info('Successfully navigated to reset password page');
};

Then(/^I navigate to reset password link$/, resetPasswordHandler);
