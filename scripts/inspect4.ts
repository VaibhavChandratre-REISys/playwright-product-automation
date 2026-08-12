import { chromium } from 'playwright';
import * as dotenv from 'dotenv';
import * as path from 'path';
import * as fs from 'fs';

dotenv.config({ path: path.resolve(__dirname, '../envs/.env.auto') });

(async () => {
  const browser = await chromium.launch({ headless: false, slowMo: 100 });
  const ctx = await browser.newContext({ ignoreHTTPSErrors: true });
  const page = await ctx.newPage();
  page.setDefaultTimeout(45000);

  // Login
  await page.goto(process.env['GRANTOR_BASE_URL']!, { waitUntil: 'domcontentloaded' });
  await page.locator(`//input[@name='username' or @id='username']`).first().fill(process.env['ADMIN_USERNAME']!);
  const pwdVisible = await page.locator(`//input[@type='password']`).first().isVisible({ timeout: 3000 }).catch(() => false);
  if (!pwdVisible) {
    await page.locator(`//*[@type='submit']`).first().click();
    await page.waitForLoadState('domcontentloaded');
  }
  await page.locator(`//input[@type='password']`).first().fill(process.env['ADMIN_PASSWORD']!);
  await page.locator(`//*[@type='submit' and not(contains(@value,'Register')) and not(contains(@value,'Cancel'))]`).first().click();
  await page.waitForLoadState('domcontentloaded');

  // Click Home tab
  await page.locator(`//div[contains(@class,'slds-no-print oneAppNavContainer')]//a[@title='Home']`).first().waitFor({ state: 'visible', timeout: 20000 });
  await page.locator(`//div[contains(@class,'slds-no-print oneAppNavContainer')]//a[@title='Home']`).first().click();
  await page.waitForTimeout(3000);

  // Wait for sidebar a[data-name='Internal'] to appear
  await page.locator(`a[data-name='Internal']`).first().waitFor({ state: 'attached', timeout: 15000 });
  const internals = page.locator(`a[data-name='Internal']`);
  const iCount = await internals.count();
  console.log(`a[data-name='Internal'] count: ${iCount}`);
  for (let i = 0; i < iCount; i++) {
    const url = await internals.nth(i).getAttribute('data-url');
    console.log(`  [${i}] data-url="${url}"`);
  }

  // Try clicking via JS dispatchEvent (mimics Selenium's withJavaScript click)
  console.log('Clicking first Internal link via JS dispatchEvent...');
  await internals.first().dispatchEvent('click');
  await page.waitForTimeout(3000);

  let tableCount = await page.locator('c-lwc-flex-table').count();
  console.log(`Tables after JS dispatchEvent click: ${tableCount}`);

  if (tableCount === 0) {
    console.log('No table yet - trying regular click on first...');
    await internals.first().click({ force: true });
    await page.waitForTimeout(5000);
    tableCount = await page.locator('c-lwc-flex-table').count();
    console.log(`Tables after regular click: ${tableCount}`);
  }

  if (tableCount === 0) {
    console.log('No table yet - trying regular click on second...');
    await internals.last().click({ force: true });
    await page.waitForTimeout(5000);
    tableCount = await page.locator('c-lwc-flex-table').count();
    console.log(`Tables after click second: ${tableCount}`);
  }

  console.log(`Final table count: ${tableCount}`);
  for (let i = 0; i < tableCount; i++) {
    const n = await page.locator('c-lwc-flex-table').nth(i).getAttribute('data-flextablename');
    const r = await page.locator('c-lwc-flex-table').nth(i).locator('tbody tr').count();
    console.log(`  table[${i}] "${n}" rows=${r}`);
  }

  // Wait a bit more for rows to populate
  await page.waitForTimeout(3000);

  const rows = await page.locator(`c-lwc-flex-table[data-flextablename='InternalOrganizationHierarchyEnhanced'] tbody tr`).count();
  console.log(`rows: ${rows}`);

  // Find the action button for GMS Administrator row
  const gmsRow = page.locator(
    `//c-lwc-flex-table[@data-flextablename='InternalOrganizationHierarchyEnhanced']//tbody/tr[.//*[normalize-space(text())='GMS Administrator']]//td[contains(@class,'actionTd')]//button[@aria-haspopup='true']`
  ).first();
  const gmsRowCount = await gmsRow.count();
  console.log(`GMS Administrator row action button count: ${gmsRowCount}`);

  if (gmsRowCount > 0) {
    await gmsRow.click({ force: true });
    await page.waitForTimeout(1000);

    // Check what appeared after clicking the button
    const menuItems = page.locator(`[role='menu'] li, [role='menu'] a, [role='menuitem'], .slds-dropdown__item`);
    const menuCount = await menuItems.count();
    console.log(`Menu items after click: ${menuCount}`);
    for (let i = 0; i < menuCount; i++) {
      const text = await menuItems.nth(i).innerText().catch(() => '');
      console.log(`  menu[${i}]: "${text.trim().substring(0, 40)}"`);
    }

    // Also dump the full dropdown area
    const dropdownEl = page.locator(`.slds-dropdown, [role='menu'], .slds-dropdown-trigger_click.slds-is-open`).first();
    const ddCount = await dropdownEl.count();
    if (ddCount > 0) {
      const ddHtml = await dropdownEl.innerHTML();
      fs.writeFileSync('scripts/dropdown-dump.html', ddHtml.substring(0, 5000));
      console.log('dropdown HTML -> scripts/dropdown-dump.html');
    }

    await page.screenshot({ path: 'scripts/menu-open.png', fullPage: false });
    console.log('screenshot after menu open: scripts/menu-open.png');
  }

  await page.screenshot({ path: 'scripts/table-loaded.png', fullPage: false });
  console.log('screenshot: scripts/table-loaded.png');

  await browser.close();
})();
