import { Locator, Page } from 'playwright';
import { logger } from './logger';

/**
 * Robust wait utilities for Salesforce Lightning pages.
 * Adapted from POC's WaitHelper.ts (228 lines, proven working).
 * Handles spinners, modals, tables, toasts, and element state waits.
 */
export class WaitHelper {
  private static readonly DEFAULT_TIMEOUT = 30000;
  private static readonly SPINNER_TIMEOUT = 60000;

  constructor(private page: Page) {}

  async waitUntilVisible(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    try {
      await locator.waitFor({ state: 'visible', timeout });
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitUntilVisible() - Success - Duration: ${duration}ms - Locator: ${locatorString}`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.waitUntilVisible() - Failed - Duration: ${duration}ms - Locator: ${locatorString} - Error: ${error}`);
      throw new Error(`Element not visible: ${locatorString}. Error: ${error}`);
    }
  }

  async waitUntilEnabled(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    try {
      await locator.waitFor({ state: 'visible', timeout });
      await locator.isEnabled({ timeout });
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitUntilEnabled() - Success - Duration: ${duration}ms - Locator: ${locatorString}`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.waitUntilEnabled() - Failed - Duration: ${duration}ms - Locator: ${locatorString} - Error: ${error}`);
      throw new Error(`Element not enabled: ${locatorString}. Error: ${error}`);
    }
  }

  async waitUntilHidden(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    try {
      await locator.waitFor({ state: 'hidden', timeout }).catch(() => {});
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitUntilHidden() - Success - Duration: ${duration}ms - Locator: ${locatorString}`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.warn(`WaitHelper.waitUntilHidden() - Timeout - Duration: ${duration}ms - Locator: ${locatorString}`);
    }
  }

  async waitUntilAttached(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    try {
      await locator.waitFor({ state: 'attached', timeout });
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitUntilAttached() - Success - Duration: ${duration}ms - Locator: ${locatorString}`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.waitUntilAttached() - Failed - Duration: ${duration}ms - Locator: ${locatorString} - Error: ${error}`);
      throw new Error(`Element not attached: ${locatorString}. Error: ${error}`);
    }
  }

  async waitUntilClickable(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    try {
      // Wait for element to be visible
      await locator.waitFor({ state: 'visible', timeout });
      
      // Wait for element to be enabled (poll until enabled or timeout)
      const endTime = startTime + timeout;
      while (Date.now() < endTime) {
        const isEnabled = await locator.isEnabled().catch(() => false);
        if (isEnabled) {
          const duration = Date.now() - startTime;
          logger.info(`WaitHelper.waitUntilClickable() - Success - Duration: ${duration}ms - Locator: ${locatorString}`);
          return;
        }
        await this.page.waitForTimeout(100); // Poll every 100ms
      }
      
      throw new Error('Element not enabled within timeout');
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.waitUntilClickable() - Failed - Duration: ${duration}ms - Locator: ${locatorString} - Error: ${error}`);
      throw new Error(`Element not clickable: ${locatorString}. Error: ${error}`);
    }
  }

  async waitForLightningReady(): Promise<void> {
    const startTime = Date.now();

    try {
      await this.page.waitForLoadState('domcontentloaded');
      await this.waitForSpinnerDisappear();
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitForLightningReady() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.waitForLightningReady() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Lightning not ready: ${error}`);
    }
  }

  async waitForSpinnerDisappear(): Promise<void> {
    const startTime = Date.now();

    try {
      // Navigation logo spinner (matches Selenium: rowLevelOverlay1)
      // Reduce timeout from 1000ms to 100ms for faster detection
      const navSpinner = this.page.locator('//div[@class=\'rowLevelOverlay1\']//div[@class=\'spinner-container slds-spinner\']');
      if (await navSpinner.isVisible({ timeout: 100 }).catch(() => false)) {
        logger.info('WaitHelper.waitForSpinnerDisappear() - Navigation logo spinner detected, waiting...');
        await navSpinner.waitFor({ state: 'hidden', timeout: WaitHelper.SPINNER_TIMEOUT }).catch(() => {});
      }

      // Generic spinners - use first() instead of count() + last() for better performance
      const spinner = this.page.locator('.slds-spinner, .loadingSpinner, .loadingIndicator, .spinner');
      if (await spinner.first().isVisible({ timeout: 100 }).catch(() => false)) {
        await spinner.last().waitFor({ state: 'hidden', timeout: WaitHelper.SPINNER_TIMEOUT }).catch(() => {});
      }
      
      const duration = Date.now() - startTime;
      // Only log if duration > 50ms to reduce log noise
      if (duration > 50) {
        logger.info(`WaitHelper.waitForSpinnerDisappear() - Success - Duration: ${duration}ms`);
      }
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.warn(`WaitHelper.waitForSpinnerDisappear() - Timeout - Duration: ${duration}ms`);
    }
  }

  async waitForModal(): Promise<void> {
    const startTime = Date.now();

    try {
      // Exclude auraError dialog which is always in DOM as hidden [role="dialog"]
      const modal = this.page.locator('.slds-modal, .modal, [role="dialog"]:not(#auraError)');
      await modal.first().waitFor({ state: 'visible', timeout: WaitHelper.DEFAULT_TIMEOUT });
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitForModal() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.warn(`WaitHelper.waitForModal() - No modal appeared - Duration: ${duration}ms`);
    }
  }

  /**
   * Wait for flex table loading indicators to disappear.
   * Matches Java FlexTable.waitForFlexTablesToLoad():
   *   //*[@id='flexTableDivId' or @id='flexGridDivId']//*[contains(@class, 'progress-bar')]
   * Also waits for LWC flex table loading spinners.
   */
  async waitForFlexTablesToLoad(): Promise<void> {
    const startTime = Date.now();
    try {
      const loadingIndicator = this.page.locator(
        `xpath=//*[@id='flexTableDivId' or @id='flexGridDivId']//*[contains(@class, 'progress-bar')] | //c-lwc-flex-table//*[contains(@class,'progress-bar')] | //c-lwc-flex-table//*[contains(@class,'slds-spinner')]`
      );
      let retries = 0;
      while (retries < 20) {
        const visible = await loadingIndicator.first().isVisible().catch(() => false);
        if (!visible) break;
        await this.page.waitForTimeout(500);
        retries++;
      }
      const duration = Date.now() - startTime;
      if (retries > 0) {
        logger.info(`WaitHelper.waitForFlexTablesToLoad() - Done - Duration: ${duration}ms`);
      }
    } catch {
      /* table loading indicator not present — OK */
    }
  }

  async waitForTable(): Promise<void> {
    const startTime = Date.now();

    try {
      const tables = this.page.locator('table, c-lwc-flex-table, gnt-flex-table-l-w-c');
      const deadline = Date.now() + WaitHelper.DEFAULT_TIMEOUT;
      while (Date.now() < deadline) {
        const count = await tables.count();
        for (let i = 0; i < count; i++) {
          if (await tables.nth(i).isVisible()) {
            const duration = Date.now() - startTime;
            logger.info(`WaitHelper.waitForTable() - Success - Duration: ${duration}ms`);
            return;
          }
        }
        await this.page.waitForTimeout(500);
      }
      throw new Error('No visible table found within timeout');
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.waitForTable() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Table not visible: ${error}`);
    }
  }

  async waitForLookup(): Promise<void> {
    const startTime = Date.now();

    try {
      const lookup = this.page.locator('.slds-modal, .forceLookup, .lookup');
      await lookup.first().waitFor({ state: 'visible', timeout: WaitHelper.DEFAULT_TIMEOUT });
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitForLookup() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.waitForLookup() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Lookup not visible: ${error}`);
    }
  }

  async waitForToast(): Promise<void> {
    const startTime = Date.now();

    try {
      const toast = this.page.locator('.slds-notify, .toast, .forceToastManager');
      await toast.first().waitFor({ state: 'visible', timeout: 10000 }).catch(() => {});
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.waitForToast() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.warn(`WaitHelper.waitForToast() - Timeout - Duration: ${duration}ms`);
    }
  }

  // Backward compatibility aliases
  async visible(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    return this.waitUntilVisible(locator, timeout);
  }

  async enabled(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    return this.waitUntilEnabled(locator, timeout);
  }

  async attached(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    return this.waitUntilAttached(locator, timeout);
  }

  async hidden(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    return this.waitUntilHidden(locator, timeout);
  }

  async spinnerDisappear(): Promise<void> {
    return this.waitForSpinnerDisappear();
  }

  async pageReady(): Promise<void> {
    return this.waitForLightningReady();
  }

  async networkIdle(): Promise<void> {
    const startTime = Date.now();
    try {
      await this.page.waitForLoadState('domcontentloaded');
      const duration = Date.now() - startTime;
      logger.info(`WaitHelper.networkIdle() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`WaitHelper.networkIdle() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Network not idle: ${error}`);
    }
  }

  async waitForElementToBeClickable(locator: Locator, timeout: number = WaitHelper.DEFAULT_TIMEOUT): Promise<void> {
    return this.waitUntilClickable(locator, timeout);
  }
}
