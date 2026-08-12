/**
 * Diagnostic: Navigate to Focus Areas and inspect what's actually in the DOM.
 * Run: npx ts-node --transpile-only scripts/inspect-focus-areas.ts
 */
import { chromium } from 'playwright';
import * as path from 'path';
import * as dotenv from 'dotenv';
dotenv.config({ path: path.resolve(__dirname, '../envs/.env.auto') });

(async () => {
  const browser = await chromium.launch({ headless: false, slowMo: 200 });
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 } });
  const page = await context.newPage();

  const baseUrl = process.env.GRANTOR_BASE_URL!;
  const username = process.env.EXE_USERNAME!;
  const password = process.env.EXE_PASSWORD!;

  console.log(`Navigating to ${baseUrl}`);
  await page.goto(baseUrl, { waitUntil: 'domcontentloaded', timeout: 60000 });

  // Login using same XPaths as LoginPage
  const usernameInput = page.locator(`//input[@name='username' or @id='username']`).first();
  await usernameInput.waitFor({ state: 'visible', timeout: 30000 });
  await usernameInput.fill(username);

  const passwordInput = page.locator(`//input[@type='password']`).first();
  const pwVisible = await passwordInput.isVisible({ timeout: 2000 }).catch(() => false);
  if (!pwVisible) {
    await page.locator(`//*[@type='submit']`).first().click();
    await page.waitForLoadState('domcontentloaded');
  }
  await passwordInput.waitFor({ state: 'visible', timeout: 30000 });
  await passwordInput.fill(password);
  await page.locator(`//*[@type='submit']`).first().click();
  await page.waitForLoadState('domcontentloaded', { timeout: 30000 });

  // Dismiss phone reg if shown
  const decline = page.locator(`//a[text()="I Don't Want to Register My Phone"]`);
  if (await decline.isVisible({ timeout: 3000 }).catch(() => false)) await decline.click();

  console.log('Logged in. URL:', page.url());
  await page.waitForTimeout(3000);

  // Click Planning tab
  const planningTab = page.locator(`//a[normalize-space(text())='Planning'] | //a[@title='Planning']`).first();
  await planningTab.waitFor({ state: 'visible', timeout: 20000 });
  await planningTab.dispatchEvent('click');
  await page.waitForLoadState('domcontentloaded', { timeout: 20000 });
  await page.waitForTimeout(2000);
  console.log('Clicked Planning tab. URL:', page.url());

  // Click Focus Areas sidebar
  const sidebar = page.locator(`//a[contains(normalize-space(text()),'Focus Area')] | //span[contains(normalize-space(text()),'Focus Area')]`).first();
  await sidebar.waitFor({ state: 'visible', timeout: 20000 });
  await sidebar.dispatchEvent('click');
  await page.waitForLoadState('domcontentloaded', { timeout: 20000 });
  await page.waitForTimeout(4000);
  console.log('Clicked Focus Areas. URL:', page.url());

  // Dump all c-lwc-flex-table data-flextablename values
  const tableNames = await page.evaluate(() => {
    const tables = (document as any).querySelectorAll('c-lwc-flex-table');
    return Array.from(tables).map((t: any) => ({
      name: t.getAttribute('data-flextablename'),
      class: t.className,
    }));
  });
  console.log('Flex tables on page:', JSON.stringify(tableNames, null, 2));

  // Also dump all buttons visible in the page
  const buttons = await page.evaluate(() => {
    return Array.from((document as any).querySelectorAll('button')).map((b: any) => ({
      text: b.textContent?.trim(),
      title: b.title,
      hidden: b.hidden,
      offsetParent: !!b.offsetParent,
    })).filter((b: any) => b.text || b.title);
  });
  console.log('Buttons on page:', JSON.stringify(buttons.slice(0, 30), null, 2));

  await page.screenshot({ path: 'scripts/focus-areas-page.png', fullPage: true });
  console.log('Screenshot saved to scripts/focus-areas-page.png');

  await browser.close();
})();
