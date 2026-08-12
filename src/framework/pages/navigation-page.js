
import { BasePage } from './base-page';

import { logger } from '../utils/logger';

/**
 * Handles the Salesforce Lightning app-level navigation:
 * - Top tab bar (Home, Planning, Announcements, etc.)
 * - Left sidebar accordion (subheader + content links)
 * - Sub-tabs inside a record detail page
 *
 * XPaths are translated 1:1 from MainPage.java and SideBar.java.
 */
export class NavigationPage extends BasePage {
  constructor(page, savedValues) {
    super(page, savedValues);
  }

  /**
   * Click a top-level Lightning tab by its title attribute.
   * Translated from MainPage.clickMainMenuBarForLwc().
   * Uses JavaScript click (dispatchEvent) — aligned with POC clickWithJavaScript.
   *
   * If the tab is already active, uses direct URL navigation (goto) to force a
   * full page reload. This ensures sidebar content resets and all LWC components
   * re-render — critical when the same tab is clicked twice in a scenario.
   */
  async clickMainTab(tabName) {
    const resolved = this.resolve(tabName);
    logger.info(`Navigating to main tab: "${resolved}"`);
    const locator = this.page.locator(
      `//div[contains(@class,'slds-no-print') and contains(@class,'oneAppNavContainer')]//a[@title='${resolved}' or @name='${resolved}'] | //nav//ul//li//a[text()='${resolved}']`
    );
    await locator.first().waitFor({ state: 'attached', timeout: 30000 });

    // Extract href for fallback navigation
    const href = await locator.first().getAttribute('href').catch(() => null);

    // Check if this tab is already active — Lightning SPA won't reload if we just click it
    const activeTab = this.page.locator(
      `//div[contains(@class,'oneAppNavContainer')]//li[contains(@class,'slds-is-active')]//a[@title='${resolved}'] | ` +
      `//one-app-nav-bar-item-root[contains(@class,'slds-is-active')]//a[@title='${resolved}']`
    );
    const isAlreadyActive = await activeTab.count().catch(() => 0) > 0;

    if (isAlreadyActive && href) {
      // Tab already active — force full page reload via direct URL navigation
      logger.info(`Tab "${resolved}" already active — forcing page reload via URL`);
      const baseOrigin = new URL(this.page.url()).origin;
      const fullUrl = href.startsWith('http') ? href : `${baseOrigin}${href}`;
      await this.page.goto(fullUrl, { waitUntil: 'domcontentloaded', timeout: 30000 });
    } else {
      // Tab not active — normal click navigation
      try {
        await locator.first().click({ timeout: 5000 });
      } catch (e2) {
        // Fallback to JS click if real click fails (e.g. overlay)
        await this.clickHelper.jsClick(locator.first());
      }
    }

    // Wait for page to load and spinner to disappear
    await this.waitForSpinner();

    // Verify sidebar loaded — if not, fall back to direct URL navigation
    const sidebarLoaded = await this.page.locator('gnt-side-bar-lwc section').first()
      .waitFor({ state: 'attached', timeout: 10000 })
      .then(() => true)
      .catch(() => false);

    if (!sidebarLoaded && href) {
      logger.warn(`Sidebar did not load after tab click — navigating directly to: ${href}`);
      const baseOrigin = new URL(this.page.url()).origin;
      const fullUrl = href.startsWith('http') ? href : `${baseOrigin}${href}`;
      await this.page.goto(fullUrl, { waitUntil: 'domcontentloaded', timeout: 30000 });
      await this.waitForSpinner();
    }
  }

  /**
   * Click a left-sidebar content link under the given subheader.
   * Aligned with POC SideBarHelper.clickSideBarContent() + handleSideBarContentExpanded().
   */
  async clickSidebarContent(subHeader, contentName) {
    const resolvedSub = this.resolve(subHeader);
    const resolvedContent = this.resolve(contentName);
    logger.info(`Sidebar: "${resolvedSub}" → "${resolvedContent}"`);

    // POC: wait for gnt-side-bar-lwc section with 60s timeout
    await this.page.locator(`gnt-side-bar-lwc section`).first()
      .waitFor({ state: 'attached', timeout: 60000 });

    // POC: wait for specific subheader button to be present
    const subheaderButton = this.page.locator(
      `//gnt-side-bar-lwc//section//button[@title='${resolvedSub}']`
    ).first();
    await subheaderButton.waitFor({ state: 'attached', timeout: 30000 });

    // POC: expand parent accordion (summary1 wrapper) if collapsed
    const parentAccordion = this.page.locator(
      `//gnt-side-bar-lwc//section//button[@title='${resolvedSub}']/ancestor::ul//div[contains(@class,'summary1')]//button[@aria-expanded='false']`
    );
    if (await parentAccordion.count() > 0) {
      logger.info(`  Expanding parent accordion for: "${resolvedSub}"`);
      await parentAccordion.first().dispatchEvent('click');
      await this.page.waitForTimeout(500);
    }

    // POC: expand subheader itself if collapsed
    const subAccordion = this.page.locator(
      `//gnt-side-bar-lwc//section//h2//button[@title='${resolvedSub}' and @aria-expanded='false']`
    );
    if (await subAccordion.count() > 0) {
      logger.info(`  Expanding sub-accordion: "${resolvedSub}"`);
      await subAccordion.first().dispatchEvent('click');
      await this.page.waitForTimeout(500);
    }

    // POC: find the sidebar link scoped to the subheader section (matching Selenium implementation)
    // Use only the specific scoped XPath to avoid matching wrong elements
    const linkByName = this.page.locator(
      `//gnt-side-bar-lwc//section//h2//button[@title='${resolvedSub}']//ancestor::section[@data-my-type='header']//c-accordion-content//button[@title='${resolvedContent}']`
    );
    await linkByName.waitFor({ state: 'attached', timeout: 30000 });

    // POC: use JavaScript click with retry
    try {
      await this.clickHelper.jsClick(linkByName.first());
    } catch (e) {
      logger.warn(`  First sidebar click failed, retrying: ${e}`);
      await this.clickHelper.jsClick(linkByName.first());
    }

    // Wait for page load after sidebar navigation
    await this.page.waitForLoadState('load', { timeout: 60000 }).catch(() => {});
    await this.waitForSpinner();

    // Wait for at least one flex table to appear (sidebar content loaded)
    await this.page.locator('c-lwc-flex-table, gnt-flex-table-l-w-c').first()
      .waitFor({ state: 'attached', timeout: 30000 })
      .catch(() => logger.warn('No flex table appeared after sidebar navigation'));
    await this.waitHelper.waitForFlexTablesToLoad();
  }

  /**
   * Click a sub-tab inside a record detail page.
   * Aligned with Selenium PageDetailsHelper.clickSubTabsInsideTableViewForLWC().
   */
  async clickSubTab(subTabName) {
    const resolved = this.resolve(subTabName);
    logger.info(`Sub-tab: "${resolved}"`);
    
    // Wait for spinner to disappear before interacting with tabs
    await this.waitHelper.waitForSpinnerDisappear();
    
    // Use simpler XPath matching Selenium implementation
    const desiredTab = this.page.locator(
      `//div[@class='slds-tabs_default']//ul//li[@title='${resolved}']`
    ).first();
    const moreTabs = this.page.locator(
      `//div[@class='slds-tabs_default']//li[not(contains(@style,'hidden'))]//button[@title='More Tabs'] | //button[@title='More Tabs']`
    ).first();

    try {
      const tabVisible = await desiredTab.isVisible({ timeout: 5000 }).catch(() => false);
      if (tabVisible) {
        await desiredTab.scrollIntoViewIfNeeded().catch(() => {});
        // Wait for element to be clickable before clicking
        await this.waitHelper.waitUntilClickable(desiredTab, 10000);
        // Use JavaScript click by default (matching Selenium)
        await this.clickHelper.jsClick(desiredTab);
      } else {
        // Tab might be in "More Tabs" overflow
        await moreTabs.scrollIntoViewIfNeeded().catch(() => {});
        await this.waitHelper.waitUntilClickable(moreTabs, 10000);
        await this.clickHelper.jsClick(moreTabs);
        await desiredTab.waitFor({ state: 'visible', timeout: 5000 });
        await desiredTab.scrollIntoViewIfNeeded().catch(() => {});
        await this.waitHelper.waitUntilClickable(desiredTab, 10000);
        await this.clickHelper.jsClick(desiredTab);
      }
    } catch (ex) {
      logger.warn(`Sub-tab click failed - Retrying with JavaScript: ${ex}`);
      // Retry mechanism matching Selenium
      const tabVisible = await desiredTab.isVisible({ timeout: 5000 }).catch(() => false);
      if (tabVisible) {
        await this.waitHelper.waitUntilClickable(desiredTab, 10000);
        await this.clickHelper.jsClick(desiredTab);
      } else {
        await this.waitHelper.waitUntilClickable(moreTabs, 10000);
        await this.clickHelper.jsClick(moreTabs);
        await desiredTab.waitFor({ state: 'visible', timeout: 5000 });
        await this.waitHelper.waitUntilClickable(desiredTab, 10000);
        await this.clickHelper.jsClick(desiredTab);
      }
    }
    await this.waitHelper.waitForFlexTablesToLoad();
    
    // Wait for at least one flex table to appear after sub-tab navigation
    await this.page.locator('c-lwc-flex-table, gnt-flex-table-l-w-c').first()
      .waitFor({ state: 'attached', timeout: 15000 })
      .catch(() => logger.warn(`No flex table appeared after sub-tab navigation to "${resolved}"`));
    
    // Additional wait for spinners after table appears
    await this.waitHelper.waitForSpinnerDisappear();
  }

  /**
   * Wait for the Salesforce Lightning spinner / navigation overlay to disappear.
   * Uses multi-selector WaitHelper for comprehensive spinner detection.
   */
  async waitForPageLoad() {
    await this.waitHelper.waitForSpinnerDisappear();
  }
}
