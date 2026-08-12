import { When, } from '@cucumber/cucumber';

import { logger } from '../utils/logger';

/**
 * Window/Tab handling step definitions
 * Mirrors Selenium's window switching functionality
 */

// ── Switch to window by index ───────────────────────────────────────────────

When(
  /^I switch to window (\d+)$/,
  async function ( windowIndex) {
    const index = parseInt(windowIndex, 10);
    logger.info(`Switching to window index: ${index}`);
    const newPage = await this.windowHandler.switchToWindowByIndex(index);
    this.page = newPage;
    logger.info(`Switched to window ${index}`);
  }
);

// ── Close current window and switch to previous ─────────────────────────────

When(
  /^I close current window and switch to previous$/,
  async function () {
    logger.info('Closing current window and switching to previous');
    const newPage = await this.windowHandler.closeCurrentAndSwitchToPrevious();
    this.page = newPage;
    logger.info('Closed window and switched to previous');
  }
);

// ── Execute action with automatic new window detection ──────────────────────

/**
 * Example usage in other step definitions:
 * 
 * // Before clicking a link that opens a new tab
 * await this.windowHandler.preProcessing();
 * 
 * // Click the link
 * await this.page.click('a[target="_blank"]');
 * 
 * // Detect and switch to new tab
 * const newPage = await this.windowHandler.postProcessing();
 * this.page = newPage;
 * 
 * // OR use the convenience method:
 * const { newPage } = await this.windowHandler.executeWithWindowDetection(async () => {
 *   await this.page.click('a[target="_blank"]');
 * });
 * if (newPage) {
 *   this.page = newPage;
 * }
 */
