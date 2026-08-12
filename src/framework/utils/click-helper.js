 function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }

import { logger } from './logger';

/**
 * Robust click utilities with retry logic for Salesforce LWC.
 * Adapted from POC's ClickHelper.ts (123 lines, proven working).
 * Handles flaky clicks via 3-retry wrapper and JavaScript fallback.
 */
export class ClickHelper {
   static  __initStatic() {this.MAX_RETRIES = 3}
   static  __initStatic2() {this.RETRY_DELAY = 1000}

  constructor( wait) {;this.wait = wait;}

  async click(locator, options) {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.info(`ClickHelper.click() - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilClickable(locator, _optionalChain([options, 'optionalAccess', _ => _.timeout]));
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

  async doubleClick(locator, options) {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.info(`ClickHelper.doubleClick() - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilClickable(locator, _optionalChain([options, 'optionalAccess', _2 => _2.timeout]));
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

  async rightClick(locator, options) {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.info(`ClickHelper.rightClick() - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilClickable(locator, _optionalChain([options, 'optionalAccess', _3 => _3.timeout]));
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

  async clickWithJavaScript(locator, options) {
    const startTime = Date.now();
    const locatorString = locator.toString();

    logger.warn(`ClickHelper.clickWithJavaScript() - Using JavaScript fallback - Locator: ${locatorString}`);

    try {
      await this.retryOperation(async () => {
        await this.wait.waitUntilAttached(locator, _optionalChain([options, 'optionalAccess', _4 => _4.timeout]));
        await locator.evaluate((el) => el.click());
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
  async jsClick(locator, options) {
    return this.clickWithJavaScript(locator, options);
  }

   async retryOperation(operation, locatorString) {
    let lastError;

    for (let attempt = 1; attempt <= ClickHelper.MAX_RETRIES; attempt++) {
      try {
        await operation();
        return;
      } catch (error) {
        lastError = error ;
        logger.warn(`ClickHelper.retryOperation() - Attempt ${attempt}/${ClickHelper.MAX_RETRIES} failed for ${locatorString}`);

        if (attempt < ClickHelper.MAX_RETRIES) {
          await new Promise(resolve => setTimeout(resolve, ClickHelper.RETRY_DELAY));
        }
      }
    }

    throw lastError;
  }
} ClickHelper.__initStatic(); ClickHelper.__initStatic2();
