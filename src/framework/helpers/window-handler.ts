import { Page, BrowserContext } from '@playwright/test';
import { logger } from '../utils/logger';

/**
 * Window/Tab Handler for Playwright
 * Mirrors Selenium's wlGgOnuIbI window handling functionality
 * Handles automatic detection and switching to new tabs/windows
 */
export class WindowHandler {
  private page: Page;
  private context: BrowserContext;
  private initialPages: Page[] = [];

  constructor(page: Page, context: BrowserContext) {
    this.page = page;
    this.context = context;
  }

  /**
   * Pre-processing: Store current pages/windows
   * Mirrors Selenium's preProcessingTestBlaze
   */
  async preProcessing(): Promise<void> {
    this.initialPages = this.context.pages();
    logger.debug(`[WindowHandler] Pre-processing: ${this.initialPages.length} page(s) tracked`);
  }

  /**
   * Post-processing: Detect and switch to new window/tab
   * Mirrors Selenium's postProcessingTestBlaze
   */
  async postProcessing(): Promise<Page> {
    try {
      const startTime = Date.now();
      
      // Wait for new page to be created (max 5 seconds)
      const newPage = await this.waitForNewPage(5000);
      
      if (newPage) {
        const duration = (Date.now() - startTime) / 1000;
        logger.info(`[WindowHandler] New tab detected in ${duration} seconds`);
        logger.info(`[WindowHandler] Switched to a new Window`);
        
        // Update initial pages list
        this.initialPages = this.context.pages();
        this.page = newPage;
        
        return newPage;
      } else {
        logger.info(`[WindowHandler] No new window detected`);
        return this.page;
      }
    } catch (error) {
      logger.info(`[WindowHandler] No new window detected`);
      return this.page;
    }
  }

  /**
   * Wait for a new page to be created
   * @param timeout - Maximum time to wait in milliseconds
   */
  private async waitForNewPage(timeout: number): Promise<Page | null> {
    const startTime = Date.now();
    const pollInterval = 100;

    while (Date.now() - startTime < timeout) {
      const currentPages = this.context.pages();
      
      if (currentPages.length > this.initialPages.length) {
        // Find the new page
        for (const page of currentPages) {
          if (!this.initialPages.includes(page)) {
            // Wait for the new page to be ready
            await page.waitForLoadState('domcontentloaded', { timeout: 5000 }).catch(() => {});
            return page;
          }
        }
      }
      
      await new Promise(resolve => setTimeout(resolve, pollInterval));
    }
    
    return null;
  }

  /**
   * Switch to window by index
   * @param handlerNumber - Window index (0 = parent, 1 = first child, etc.)
   */
  async switchToWindowByIndex(handlerNumber: number): Promise<Page> {
    const pages = this.context.pages();
    
    if (handlerNumber >= 0 && handlerNumber < pages.length) {
      this.page = pages[handlerNumber];
      logger.info(`[WindowHandler] Switched to window index ${handlerNumber}`);
      return this.page;
    } else {
      logger.warn(`[WindowHandler] Invalid window index ${handlerNumber}, total pages: ${pages.length}`);
      return this.page;
    }
  }

  /**
   * Get all window handles (pages)
   */
  getWindowHandles(): Page[] {
    return this.context.pages();
  }

  /**
   * Get current page
   */
  getCurrentPage(): Page {
    return this.page;
  }

  /**
   * Close current window and switch to previous
   */
  async closeCurrentAndSwitchToPrevious(): Promise<Page> {
    const pages = this.context.pages();
    const currentIndex = pages.indexOf(this.page);
    
    if (pages.length > 1) {
      await this.page.close();
      
      // Switch to previous page or first page
      const newIndex = currentIndex > 0 ? currentIndex - 1 : 0;
      this.page = this.context.pages()[newIndex];
      
      logger.info(`[WindowHandler] Closed window and switched to index ${newIndex}`);
      return this.page;
    } else {
      logger.warn(`[WindowHandler] Cannot close the only remaining page`);
      return this.page;
    }
  }

  /**
   * Execute action with automatic new window detection
   * @param action - Function that may open a new window
   */
  async executeWithWindowDetection<T>(action: () => Promise<T>): Promise<{ result: T; newPage: Page | null }> {
    await this.preProcessing();
    const result = await action();
    const newPage = await this.postProcessing();
    
    return {
      result,
      newPage: newPage !== this.page ? newPage : null
    };
  }
}
