
import { BasePage } from './base-page';

import { logger } from '../utils/logger';
import { FlexTablePage } from './flex-table-page';

/**
 * Quick search interactions.
 * XPaths translated 1:1 from QuickSearch.java and GovGrantsObjects.java.
 */
export class QuickSearchPage extends BasePage {
  constructor(page, savedValues) {
    super(page, savedValues);
  }

  /**
   * Perform quick search inside a specific table by its table ID.
   * Translated from QuickSearch.performTableSpecificQuickSearchLwc().
   * Java XPath: //c-lwc-flex-table[@data-flextablename='X']//input[@placeholder='Search...' and @type='search']
   *
   * Generic handling for tables that may be:
   *   - Below the fold (scrolls page to trigger Salesforce lazy rendering)
   *   - Not yet in DOM (waits with retry for LWC component to mount)
   */
  async performQuickSearch(tableId, searchTerm) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    
    // Check if search term is "Record Id" - use saved EGMS ID instead (mirroring Selenium logic)
    let actualSearchTerm = searchTerm;
    if (searchTerm.toLowerCase() === 'record id') {
      // Check if EGMS ID exists in store before using it
      if (this.savedValues.has('EGMS ID')) {
        actualSearchTerm = '{SavedValue:EGMS ID}';
        logger.info(`Search term "Record Id" will use saved EGMS ID`);
      } else {
        logger.warn(`Search term "Record Id" but EGMS ID not found in saved values`);
      }
    }
    
    const resolvedTerm = this.resolve(actualSearchTerm);
    logger.info(`Quick search: "${resolvedTerm}" in table "${resolvedId}"`);

    const tableContainer = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']`
    ).first();
    const searchInput = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//input[@placeholder='Search...' and @type='search']`
    ).first();

    // Wait for the target table to appear in DOM — scroll progressively to trigger lazy load
    const tableFound = await this.waitForTableWithScroll(tableContainer, resolvedId);
    if (!tableFound) {
      throw new Error(
        `Quick search failed: table "${resolvedId}" not found in DOM after scrolling. ` +
        `Ensure the correct sidebar content is loaded.`
      );
    }

    // Scroll table into view and wait for search input
    await tableContainer.scrollIntoViewIfNeeded().catch(() => {});
    await searchInput.waitFor({ state: 'visible', timeout: 15000 });
    await searchInput.clear();
    await searchInput.fill(resolvedTerm);
    await searchInput.press('Enter');
    await this.waitHelper.waitForSpinnerDisappear();
    await this.page.waitForTimeout(1000);
  }

  /**
   * Scroll the page progressively to trigger Salesforce Lightning lazy rendering
   * of LWC flex tables that are below the initial viewport.
   * Returns true if the target table is found in DOM.
   */
   async waitForTableWithScroll(
    tableLocator,
    tableId,
    maxAttempts = 10,
    scrollStep = 600
  ) {
    // Quick check — table might already be in DOM
    if (await tableLocator.count() > 0) {
      logger.info(`Table "${tableId}" already in DOM`);
      return true;
    }

    logger.info(`Table "${tableId}" not in DOM — scrolling to trigger lazy load`);

    // Get the scrollable content container (Salesforce Lightning main area)
    const scrollContainer = this.page.locator(
      '.mainContentMark, .oneContent, .slds-template__container'
    ).first();

    for (let attempt = 1; attempt <= maxAttempts; attempt++) {
      // Scroll down progressively
      await this.page.evaluate(
        ({ step, attempt: att }) => {
          // Try scrolling the main content area, fall back to document
          const containers = document.querySelectorAll(
            '.mainContentMark, .oneContent, .slds-template__container, .stage'
          );
          let scrolled = false;
          containers.forEach((el) => {
            if (el.scrollHeight > el.clientHeight) {
              el.scrollTop = step * att;
              scrolled = true;
            }
          });
          if (!scrolled) {
            window.scrollTo(0, step * att);
          }
        },
        { step: scrollStep, attempt }
      );

      // Wait a bit for Salesforce LWC to render
      await this.page.waitForTimeout(800);
      await this.waitHelper.waitForSpinnerDisappear();

      // Check if table appeared
      if (await tableLocator.count() > 0) {
        logger.info(`Table "${tableId}" found after ${attempt} scroll(s)`);
        return true;
      }
    }

    // Final attempt: scroll to very bottom
    await this.page.evaluate(() => window.scrollTo(0, document.body.scrollHeight));
    await this.page.waitForTimeout(1500);
    await this.waitHelper.waitForSpinnerDisappear();

    if (await tableLocator.count() > 0) {
      logger.info(`Table "${tableId}" found after full scroll`);
      return true;
    }

    logger.warn(`Table "${tableId}" NOT found after ${maxAttempts} scroll attempts`);
    return false;
  }

  /**
   * Perform global quick search (above sidebar).
   * Translated from QuickSearch.performGlobalQuickSearch().
   */
  async performGlobalQuickSearch(searchTerm) {
    const resolvedTerm = this.resolve(searchTerm);
    logger.info(`Global quick search: "${resolvedTerm}"`);
    const searchInput = this.page.locator(
      `//div[contains(@class,'hasEntitySelector')]//input | //div[@class='body-search']//input`
    ).first();
    await searchInput.waitFor({ state: 'visible', timeout: 15000 });
    await searchInput.clear();
    await searchInput.fill(resolvedTerm);
    await searchInput.press('Enter');
    await this.page.waitForTimeout(1000);
  }
}
