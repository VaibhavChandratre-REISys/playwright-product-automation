import { chromium } from 'playwright';
import * as dotenv from 'dotenv';
import * as path from 'path';
import * as fs from 'fs';

dotenv.config({ path: path.resolve(__dirname, '../envs/.env.auto') });

(async () => {
  const browser = await chromium.launch({ headless: false, slowMo: 300 });
  const ctx = await browser.newContext({ ignoreHTTPSErrors: true });
  const page = await ctx.newPage();
  page.setDefaultTimeout(40000);

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
  console.log('Logged in:', page.url().split('?')[0]);

  await page.locator(`//div[contains(@class,'slds-no-print oneAppNavContainer')]//a[@title='Home']`).first().waitFor({ state: 'visible' });
  await page.locator(`//div[contains(@class,'slds-no-print oneAppNavContainer')]//a[@title='Home']`).first().click();
  await page.waitForTimeout(3000);
  console.log('Clicked Home tab');

  // The [data-name='Internal'] with url="" is the Organization > Internal link.
  // It appears twice (section + a element). We click the <a> with empty data-url.
  const internalLinks = page.locator(`[data-name='Internal']`);
  const totalInternal = await internalLinks.count();
  console.log(`data-name=Internal count: ${totalInternal}`);

  // Click the first one that has empty data-url (Organization > Internal)
  let clicked = false;
  for (let i = 0; i < totalInternal; i++) {
    const url = await internalLinks.nth(i).getAttribute('data-url');
    const isSection = await internalLinks.nth(i).getAttribute('data-recordtype');
    console.log(`  [${i}] data-url="${url}" data-recordtype="${isSection}"`);
    if ((url === '' || url === null) && !isSection) {
      console.log(`  -> Clicking index ${i}`);
      await internalLinks.nth(i).click({ force: true });
      clicked = true;
      break;
    }
  }
  if (!clicked) {
    // fallback: click the first one
    console.log('Fallback: clicking first [data-name=Internal]');
    await internalLinks.first().click({ force: true });
  }

  await page.waitForTimeout(8000);

  // Check iframes
  const frames = page.frames();
  console.log('Total frames:', frames.length);
  for (const f of frames) {
    console.log('  frame url:', f.url().substring(0, 100));
    const ftInFrame = await f.locator('c-lwc-flex-table').count();
    if (ftInFrame > 0) console.log(`    -> ${ftInFrame} flex table(s) in this frame!`);
  }

  const tables = await page.locator('c-lwc-flex-table').count();
  console.log('flex tables in main frame:', tables);

  await page.screenshot({ path: 'scripts/after-internal-click.png' });
  console.log('Screenshot: scripts/after-internal-click.png');

  // Dump page URL after click
  console.log('Current URL:', page.url().substring(0, 120));

  // List all data-name links visible in sidebar
  const allLinks = page.locator(`[data-name]`);
  const cnt = await allLinks.count();
  console.log(`[data-name] elements: ${cnt}`);
  for (let i = 0; i < cnt; i++) {
    const name = await allLinks.nth(i).getAttribute('data-name');
    const url = await allLinks.nth(i).getAttribute('data-url');
    console.log(`  [${i}] name="${name}" url="${(url ?? '').substring(0, 60)}"`);
  }

  // Also print all visible text nodes in the sidebar accordion
  const allSidebarTexts = await page.locator('[gnt-sidebarlwc_sidebarlwc]').allInnerTexts();
  console.log('Sidebar text:', allSidebarTexts.join('|').substring(0, 500));

  await browser.close();
})();
