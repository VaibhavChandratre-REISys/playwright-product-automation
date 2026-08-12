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
  const homeTab = page.locator(`//div[contains(@class,'slds-no-print oneAppNavContainer')]//a[@title='Home']`).first();
  await homeTab.waitFor({ state: 'visible', timeout: 20000 });
  await homeTab.click();
  console.log('Home tab clicked');

  // Wait for sidebar data-name elements
  await page.locator(`[data-name]`).first().waitFor({ state: 'attached', timeout: 20000 });
  console.log('[data-name] elements present');

  // Click the Internal link (empty data-url = Organization > Internal)
  const internalEl = page.locator(`[data-name='Internal']`).first();
  await internalEl.waitFor({ state: 'attached', timeout: 15000 });
  console.log('Clicking Internal...');
  await internalEl.click({ force: true });

  // Wait for flex table
  console.log('Waiting for c-lwc-flex-table...');
  try {
    await page.locator('c-lwc-flex-table').first().waitFor({ state: 'attached', timeout: 20000 });
    console.log('flex table appeared!');
  } catch {
    console.log('No flex table after 20s');
  }

  await page.screenshot({ path: 'scripts/after-internal-final.png', fullPage: false });

  const allTables = page.locator('c-lwc-flex-table');
  const tc = await allTables.count();
  console.log(`flex table count: ${tc}`);
  for (let i = 0; i < tc; i++) {
    const name = await allTables.nth(i).getAttribute('data-flextablename');
    const rows = await allTables.nth(i).locator('tbody tr').count();
    console.log(`  [${i}] "${name}" rows=${rows}`);
  }

  // Check for GMS Administrator text anywhere on page
  const gmsEl = page.getByText('GMS Administrator');
  console.log('GMS Administrator elements:', await gmsEl.count());

  // Check if page content area changed
  console.log('Current URL:', page.url().substring(0, 120));

  // Save page HTML snapshot of the main content area
  const mainContent = await page.locator('.mainBody, one-app-nav-bar-item-root, [class*="content"]').first().innerHTML().catch(() => 'NOT FOUND');
  fs.writeFileSync('scripts/main-after-internal.html', mainContent.substring(0, 40000));
  console.log('Saved main-after-internal.html');

  await browser.close();
})();
