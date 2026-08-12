
import { expect } from '@playwright/test';

import { WaitHelper } from '../utils/wait-helper';
import { ClickHelper } from '../utils/click-helper';
import { SalesforceWaitHelper } from '../utils/salesforce-wait-helper';
import { logger } from '../utils/logger';

/**
 * Base class for all page objects.
 * Provides common helpers used across every page.
 */
export  class BasePage {
  
  
  
  
  

  constructor(page, savedValues) {
    this.page = page;
    this.savedValues = savedValues;
    this.waitHelper = new WaitHelper(page);
    this.clickHelper = new ClickHelper(this.waitHelper);
    this.sfWait = new SalesforceWaitHelper(page);
  }

  /** Resolve any {SavedValue:KEY} tokens in a string before use. */
   resolve(input) {
    return this.savedValues.resolve(input);
  }

  /** Click a locator, scrolling into view first. */
   async click(locator) {
    await locator.scrollIntoViewIfNeeded();
    await locator.click();
  }

  /** Fill a field, clearing it first. */
   async fill(locator, value) {
    await locator.scrollIntoViewIfNeeded();
    await locator.clear();
    await locator.fill(value);
  }

  /** Wait for a locator to be visible (Playwright auto-waits, this is an explicit assertion). */
   async assertVisible(locator, message) {
    await expect(locator).toBeVisible({ timeout: 15000 });
    if (message) logger.info(message);
  }

  /** Wait for a locator to contain expected text. */
   async assertText(locator, expected) {
    await expect(locator).toContainText(expected);
  }

  /** Navigate to a URL. */
   async navigateTo(url) {
    logger.info(`Navigating to: ${url}`);
    await this.page.goto(url, { waitUntil: 'domcontentloaded' });
  }

  /** Wait for all spinners to disappear (multi-selector). */
   async waitForSpinner() {
    await this.waitHelper.waitForSpinnerDisappear();
  }

  /** Wait for page to be fully ready (domcontentloaded + spinners). */
   async waitForPageReady() {
    await this.waitHelper.waitForLightningReady();
  }

  /** Select a value from a <select> dropdown by its visible text. */
   async selectByText(locator, text) {
    await locator.selectOption({ label: text });
  }

  /** Get the inner text of a locator. */
   async getText(locator) {
    return (await locator.innerText()).trim();
  }
}
