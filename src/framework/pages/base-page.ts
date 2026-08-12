import { Page, Locator } from 'playwright';
import { expect } from '@playwright/test';
import { SavedValues } from '../utils/saved-values';
import { WaitHelper } from '../utils/wait-helper';
import { ClickHelper } from '../utils/click-helper';
import { SalesforceWaitHelper } from '../utils/salesforce-wait-helper';
import { logger } from '../utils/logger';

/**
 * Base class for all page objects.
 * Provides common helpers used across every page.
 */
export abstract class BasePage {
  protected page: Page;
  protected savedValues: SavedValues;
  protected waitHelper: WaitHelper;
  protected clickHelper: ClickHelper;
  protected sfWait: SalesforceWaitHelper;

  constructor(page: Page, savedValues: SavedValues) {
    this.page = page;
    this.savedValues = savedValues;
    this.waitHelper = new WaitHelper(page);
    this.clickHelper = new ClickHelper(this.waitHelper);
    this.sfWait = new SalesforceWaitHelper(page);
  }

  /** Resolve any {SavedValue:KEY} tokens in a string before use. */
  protected resolve(input: string): string {
    return this.savedValues.resolve(input);
  }

  /** Click a locator, scrolling into view first. */
  protected async click(locator: Locator): Promise<void> {
    await locator.scrollIntoViewIfNeeded();
    await locator.click();
  }

  /** Fill a field, clearing it first. */
  protected async fill(locator: Locator, value: string): Promise<void> {
    await locator.scrollIntoViewIfNeeded();
    await locator.clear();
    await locator.fill(value);
  }

  /** Wait for a locator to be visible (Playwright auto-waits, this is an explicit assertion). */
  protected async assertVisible(locator: Locator, message?: string): Promise<void> {
    await expect(locator).toBeVisible({ timeout: 15000 });
    if (message) logger.info(message);
  }

  /** Wait for a locator to contain expected text. */
  protected async assertText(locator: Locator, expected: string): Promise<void> {
    await expect(locator).toContainText(expected);
  }

  /** Navigate to a URL. */
  protected async navigateTo(url: string): Promise<void> {
    logger.info(`Navigating to: ${url}`);
    await this.page.goto(url, { waitUntil: 'domcontentloaded' });
  }

  /** Wait for all spinners to disappear (multi-selector). */
  protected async waitForSpinner(): Promise<void> {
    await this.waitHelper.waitForSpinnerDisappear();
  }

  /** Wait for page to be fully ready (domcontentloaded + spinners). */
  protected async waitForPageReady(): Promise<void> {
    await this.waitHelper.waitForLightningReady();
  }

  /** Select a value from a <select> dropdown by its visible text. */
  protected async selectByText(locator: Locator, text: string): Promise<void> {
    await locator.selectOption({ label: text });
  }

  /** Get the inner text of a locator. */
  protected async getText(locator: Locator): Promise<string> {
    return (await locator.innerText()).trim();
  }
}
