import { chromium } from 'playwright';
import * as dotenv from 'dotenv';
import * as path from 'path';
import * as fs from 'fs';

dotenv.config({ path: path.resolve(__dirname, '../envs/.env.auto') });

(async () => {
  const browser = await chromium.launch({ headless: false, slowMo: 200 });
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 }, ignoreHTTPSErrors: true });
  const page = await context.newPage();
  page.setDefaultTimeout(45000);

  console.log('Navigating to login...');
  await page.goto(process.env['GRANTOR_BASE_URL']!, { waitUntil: 'domcontentloaded' });

  await page.locator(`//input[@name='username' or @id='username']`).first().fill(process.env['ADMIN_USERNAME']!);

  const pwdVisible = await page.locator(`//input[@type='password']`).first().isVisible({ timeout: 3000 }).catch(() => false);
  if (!pwdVisible) {
    console.log('Password not visible yet — clicking Next...');
    await page.locator(`//*[@type='submit' and not(contains(@value,'Register')) and not(contains(@value,'Cancel'))]`).first().click();
    await page.waitForLoadState('domcontentloaded');
  }

  await page.locator(`//input[@type='password']`).first().waitFor({ state: 'visible', timeout: 30000 });
  await page.locator(`//input[@type='password']`).first().fill(process.env['ADMIN_PASSWORD']!);
  await page.locator(`//*[@type='submit' and not(contains(@value,'Register')) and not(contains(@value,'Cancel'))]`).first().click();
  await page.waitForLoadState('domcontentloaded');
  console.log('Logged in at:', page.url());

  const mainTab = page.locator(`//div[contains(@class,'slds-no-print oneAppNavContainer')]//a[@title='Home' or @name='Home'] | //nav//ul//li//a[text()='Home']`).first();
  await mainTab.waitFor({ state: 'visible', timeout: 20000 });
  await mainTab.click();
  await page.waitForLoadState('domcontentloaded');
  console.log('Clicked Home tab');

  const sidebarSection = page.locator(`[gnt-sidebarlwc_sidebarlwc]`).first();
  await sidebarSection.waitFor({ state: 'attached', timeout: 20000 });

  const expandSub = page.locator(`//section[@gnt-sidebarlwc_sidebarlwc]//button[@title='Organization' and @aria-expanded='false']`);
  if (await expandSub.count() > 0) {
    await expandSub.first().click();
    console.log('Expanded Organization subheader');
  }

  const contentLink = page.locator(`//section[@gnt-sidebarlwc_sidebarlwc]//button[@title='Organization']/ancestor::section//a[text()='Internal'] | //div[contains(@class,'slds-split-view_container')]//section//button[@title='Organization']/parent::h2/parent::div/parent::section//a[text()='Internal']`);
  await contentLink.first().waitFor({ state: 'visible', timeout: 15000 });
  await contentLink.first().click({ force: true });
  console.log('Clicked Internal sidebar link');

  await page.waitForTimeout(6000);

  await page.screenshot({ path: 'scripts/after-sidebar.png', fullPage: false });
  console.log('Screenshot saved to scripts/after-sidebar.png');

  // List every c-lwc-flex-table on the page
  const allTableLocators = page.locator('c-lwc-flex-table');
  const tableCount2 = await allTableLocators.count();
  console.log(`Total c-lwc-flex-table elements: ${tableCount2}`);
  for (let i = 0; i < tableCount2; i++) {
    const name = await allTableLocators.nth(i).getAttribute('data-flextablename');
    const rows = await allTableLocators.nth(i).locator('tbody tr').count();
    console.log(`  [${i}] data-flextablename="${name}" rows=${rows}`);
  }

  // Dump sidebar HTML
  const sidebarLoc = page.locator('[gnt-sidebarlwc_sidebarlwc]').first();
  const sidebarCount = await sidebarLoc.count();
  if (sidebarCount > 0) {
    const sidebarHtml = await sidebarLoc.innerHTML();
    fs.writeFileSync('scripts/sidebar-dump.html', sidebarHtml.substring(0, 8000));
    console.log('Sidebar HTML -> scripts/sidebar-dump.html');
  } else {
    console.log('No [gnt-sidebarlwc_sidebarlwc] found');
  }

  // Dump all anchor hrefs from the sidebar area
  const sidebarLinks = page.locator('[gnt-sidebarlwc_sidebarlwc] a, gnt-side-bar-lwc a');
  const linkCount = await sidebarLinks.count();
  console.log(`Sidebar links count: ${linkCount}`);
  for (let i = 0; i < Math.min(linkCount, 20); i++) {
    const text = await sidebarLinks.nth(i).innerText();
    const href = await sidebarLinks.nth(i).getAttribute('href');
    console.log(`  link[${i}]: "${text.trim()}" href=${href}`);
  }

  await browser.close();
})();
