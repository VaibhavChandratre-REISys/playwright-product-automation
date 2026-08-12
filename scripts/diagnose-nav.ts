/**
 * Quick diagnostic: login and inspect the top navigation bar structure.
 * Run: npx ts-node scripts/diagnose-nav.ts
 */
import { chromium } from 'playwright';
import { getConfig } from '../src/framework/config/config-loader';
import { resolveUser } from '../src/framework/utils/user-resolver';
import { LoginPage } from '../src/project/pages/login-page';
import { SavedValues } from '../src/framework/utils/saved-values';

(async () => {
  const config = getConfig();
  const user = resolveUser('Admin', config);
  const browser = await chromium.launch({ headless: false, slowMo: 500 });
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 }, ignoreHTTPSErrors: true });
  const page = await context.newPage();
  page.setDefaultTimeout(60000);

  const sv = new SavedValues();
  const loginPage = new LoginPage(page, sv);
  await loginPage.loginAs(config.GRANTOR_BASE_URL, user.username, user.password);

  // Wait for page to stabilize
  await page.waitForLoadState('networkidle');
  await page.waitForTimeout(5000);

  console.log('\n=== CURRENT URL ===');
  console.log(page.url());

  // Check various nav bar selectors
  const selectors = [
    `//div[contains(@class,'slds-no-print oneAppNavContainer')]`,
    `//nav[contains(@class,'appNav')]`,
    `//one-app-nav-bar`,
    `//a[@title='Home']`,
    `//a[text()='Home']`,
    `//one-app-nav-bar-item-root`,
    `//ul[contains(@class,'navItem')]//a`,
    `//nav//a`,
  ];

  for (const sel of selectors) {
    const count = await page.locator(sel).count();
    console.log(`${sel} → ${count} matches`);
    if (count > 0 && count <= 5) {
      for (let i = 0; i < count; i++) {
        const el = page.locator(sel).nth(i);
        const text = await el.innerText().catch(() => '(no text)');
        const tag = await el.evaluate(e => e.tagName).catch(() => '?');
        const title = await el.getAttribute('title').catch(() => null);
        const href = await el.getAttribute('href').catch(() => null);
        const cls = await el.getAttribute('class').catch(() => null);
        console.log(`  [${i}] <${tag}> text="${text.substring(0, 40)}" title="${title}" class="${cls?.substring(0, 60)}" href="${href?.substring(0, 60)}"`);
      }
    }
  }

  // Get outer HTML of nav area
  const navHtml = await page.evaluate(() => {
    const nav = document.querySelector('one-app-nav-bar') ||
                document.querySelector('nav') ||
                document.querySelector('[class*="appNav"]');
    return nav ? nav.outerHTML.substring(0, 3000) : 'NO NAV FOUND';
  });
  console.log('\n=== NAV HTML (first 3000 chars) ===');
  console.log(navHtml);

  await page.waitForTimeout(30000); // Keep open for manual inspection
  await browser.close();
})();
