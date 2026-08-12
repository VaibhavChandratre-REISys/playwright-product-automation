import { Locator } from 'playwright';
import { WaitHelper } from './wait-helper';
import { logger } from './logger';

/**
 * Robust click utilities with retry logic for Salesforce LWC.
 * Adapted from POC's ClickHelper.ts (123 lines, proven working).
 * Handles flaky clicks via 3-retry wrapper and JavaScript fallback.
 */
export class ClickHelper {
  private static readonly MAX_RETRIES = 3;
  private static readonly RETRY_DELAY = 1000;

  constructor(private wait: WaitHelper) {}

  async click(locator: Locator, options?: { timeout?: number }): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.info(`ClickHelper.click() - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilClickable(locator, options?.timeout);
        await locator.scrollIntoViewIfNeeded();
        await locator.click();
        await this.wait.waitForSpinnerDisappear();
      }, locatorString);

      const duration = Date.now() - startTime;
      logger.info(`ClickHelper.click() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`ClickHelper.click() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Failed to click element: ${locatorString}. Error: ${error}`);
    }
  }

  async doubleClick(locator: Locator, options?: { timeout?: number }): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.info(`ClickHelper.doubleClick() - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilClickable(locator, options?.timeout);
        await locator.scrollIntoViewIfNeeded();
        await locator.dblclick();
        await this.wait.waitForSpinnerDisappear();
      }, locatorString);

      const duration = Date.now() - startTime;
      logger.info(`ClickHelper.doubleClick() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`ClickHelper.doubleClick() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Failed to double click element: ${locatorString}. Error: ${error}`);
    }
  }

  async rightClick(locator: Locator, options?: { timeout?: number }): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.info(`ClickHelper.rightClick() - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilClickable(locator, options?.timeout);
        await locator.scrollIntoViewIfNeeded();
        await locator.click({ button: 'right' });
        await this.wait.waitForSpinnerDisappear();
      }, locatorString);

      const duration = Date.now() - startTime;
      logger.info(`ClickHelper.rightClick() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`ClickHelper.rightClick() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Failed to right click element: ${locatorString}. Error: ${error}`);
    }
  }

  async clickWithJavaScript(locator: Locator, options?: { timeout?: number }): Promise<void> {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.warn(`ClickHelper.clickWithJavaScript() - Using JavaScript fallback - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilAttached(locator, options?.timeout);
        await locator.evaluate((el: HTMLElement) => el.click());
        await this.wait.waitForSpinnerDisappear();
      }, locatorString);

      const duration = Date.now() - startTime;
      logger.info(`ClickHelper.clickWithJavaScript() - Success - Duration: ${duration}ms`);
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.error(`ClickHelper.clickWithJavaScript() - Failed - Duration: ${duration}ms - Error: ${error}`);
      throw new Error(`Failed to click element with JavaScript: ${locatorString}. Error: ${error}`);
    }
  }

  /** Convenience alias for clickWithJavaScript — shorter name for frequent use. */
  async jsClick(locator: Locator, options?: { timeout?: number }): Promise<void> {
    return this.clickWithJavaScript(locator, options);
  }

  private async retryOperation(operation: () => Promise<void>, locatorString: string): Promise<void> {
    let lastError: Error | undefined;

    for (let attempt = 1; attempt <= ClickHelper.MAX_RETRIES; attempt++) {
      try {
        await operation();
        return;
      } catch (error) {
        lastError = error as Error;
        logger.warn(`ClickHelper.retryOperation() - Attempt ${attempt}/${ClickHelper.MAX_RETRIES} failed for ${locatorString}`);

        if (attempt < ClickHelper.MAX_RETRIES) {
          await new Promise(resolve => setTimeout(resolve, ClickHelper.RETRY_DELAY));
        }
      }
    }

    throw lastError;
  }
}
