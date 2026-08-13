
import { logger } from './logger';

/**
 * Salesforce-specific wait utilities that understand Lightning framework behavior.
 * These waits are smarter than generic Playwright waits because they detect
 * Salesforce-specific loading states.
 */
export class SalesforceWaitHelper {
   __init() {this.pendingApiCalls = new Set()}

  constructor( page) {;this.page = page;SalesforceWaitHelper.prototype.__init.call(this);
    this.setupApiTracking();
  }

  /**
   * Track Salesforce API calls automatically
   */
   setupApiTracking() {
    this.page.on('request', (request) => {
      const url = request.url();
      // Track Salesforce-specific API patterns
      if (
        url.includes('/aura?') ||
        url.includes('/services/data/') ||
        url.includes('/services/apexrest/') ||
        url.includes('__REQUESTID__')
      ) {
        this.pendingApiCalls.add(request.url());
        logger.debug(`[SF-API] Request started: ${url.substring(0, 100)}`);
      }
    });

    this.page.on('response', (response) => {
      const url = response.url();
      if (this.pendingApiCalls.has(url)) {
        this.pendingApiCalls.delete(url);
        logger.debug(`[SF-API] Request completed: ${url.substring(0, 100)}`);
      }
    });
  }

  /**
   * Wait for all Salesforce API calls to complete
   */
  async waitForSalesforceAPI(timeout = 30000) {
    const startTime = Date.now();
    
    while (this.pendingApiCalls.size > 0) {
      if (Date.now() - startTime > timeout) {
        logger.warn(`[SF-API] Timeout waiting for ${this.pendingApiCalls.size} API calls`);
        break;
      }
      await this.page.waitForTimeout(100);
    }
    
    const duration = Date.now() - startTime;
    if (duration > 50) {
      logger.info(`[SF-API] All API calls completed - Duration: ${duration}ms`);
    }
  }

  /**
   * Wait for Aura framework to finish rendering
   */
  async waitForAuraReady(timeout = 10000) {
    const startTime = Date.now();
    
    try {
      await this.page.waitForFunction(
        () => {
          // Check if Aura framework is loaded
          if (!(window ).$A) return false;
          
          // Check if Aura is done rendering
          const aura = (window ).$A;
          return aura.finishedInit === true;
        },
        { timeout }
      );
      
      const duration = Date.now() - startTime;
      logger.info(`[SF-Aura] Framework ready - Duration: ${duration}ms`);
    } catch (e) {
      logger.debug('[SF-Aura] Not an Aura page or already ready');
    }
  }

  /**
   * Wait for Lightning Web Component Shadow DOM to be rendered
   */
  async waitForLWCReady(componentSelector, timeout = 10000) {
    const startTime = Date.now();
    
    try {
      await this.page.waitForFunction(
        (selector) => {
          const component = document.querySelector(selector);
          if (!component) return false;
          
          // Check if Shadow DOM exists
          if (!(component ).shadowRoot) return false;
          
          // Check if Shadow DOM has rendered content
          const shadowRoot = (component ).shadowRoot;
          return shadowRoot.children.length > 0;
        },
        componentSelector,
        { timeout }
      );
      
      const duration = Date.now() - startTime;
      logger.info(`[SF-LWC] Component ready: ${componentSelector} - Duration: ${duration}ms`);
    } catch (e) {
      logger.warn(`[SF-LWC] Component not ready: ${componentSelector}`);
      throw e;
    }
  }

  /**
   * Wait for Salesforce spinner to disappear (optimized)
   */
  async waitForSpinnerDisappear(timeout = 60000) {
    const startTime = Date.now();

    try {
      // Navigation logo spinner (Salesforce-specific)
      const navSpinner = this.page.locator('//div[@class=\'rowLevelOverlay1\']//div[@class=\'spinner-container slds-spinner\']');
      if (await navSpinner.isVisible({ timeout: 100 }).catch(() => false)) {
        logger.info('[SF-Spinner] Navigation spinner detected, waiting...');
        await navSpinner.waitFor({ state: 'hidden', timeout });
      }

      // Generic SLDS spinners
      const spinner = this.page.locator('.slds-spinner, .loadingSpinner, .loadingIndicator, .spinner');
      if (await spinner.first().isVisible({ timeout: 100 }).catch(() => false)) {
        logger.info('[SF-Spinner] Generic spinner detected, waiting...');
        await spinner.last().waitFor({ state: 'hidden', timeout });
      }
      
      const duration = Date.now() - startTime;
      if (duration > 50) {
        logger.info(`[SF-Spinner] All spinners disappeared - Duration: ${duration}ms`);
      }
    } catch (error) {
      const duration = Date.now() - startTime;
      logger.warn(`[SF-Spinner] Timeout - Duration: ${duration}ms`);
    }
  }

  /**
   * Wait for Salesforce modal to be fully loaded and stable
   */
  async waitForModalReady(timeout = 10000) {
    const startTime = Date.now();
    
    // Wait for modal container to exist
    const modalContainer = this.page.locator('//div[contains(@class,\'modal__container\')]').last();
    await modalContainer.waitFor({ state: 'visible', timeout });
    
    // Wait for modal animation (opacity) to settle. Evaluate directly on the resolved
    // element handle (instead of a fresh document.querySelector inside waitForFunction)
    // so it always targets the modal instance we just found visible — a global
    // querySelector can otherwise match a stale/duplicate ".modal__container" left in the
    // DOM whose opacity never reaches 1, forcing this check to burn its full timeout.
    const animationDeadline = Date.now() + 2000;
    while (Date.now() < animationDeadline) {
      const opacity = await modalContainer
        .evaluate((el) => parseFloat(window.getComputedStyle(el).opacity))
        .catch(() => 1);
      if (opacity >= 0.99) break;
      await this.page.waitForTimeout(100);
    }
    
    // Wait for any spinners inside modal
    await this.waitForSpinnerDisappear();
    
    const duration = Date.now() - startTime;
    logger.info(`[SF-Modal] Modal ready - Duration: ${duration}ms`);
  }

  /**
   * Wait for Salesforce table (flex table) to finish loading
   */
  async waitForFlexTableReady(tableId, timeout = 30000) {
    const startTime = Date.now();
    
    // Wait for table container
    const tableContainer = this.page.locator(
      `xpath=//c-lwc-flex-table[@data-flextablename='${tableId}'] | //*[@id='${tableId}']`
    ).first();
    
    await tableContainer.waitFor({ state: 'attached', timeout });
    
    // Wait for loading indicators to disappear
    const loadingIndicator = this.page.locator(
      `xpath=//*[@data-flextablename='${tableId}']//*[contains(@class, 'progress-bar')] | ` +
      `//*[@data-flextablename='${tableId}']//*[contains(@class,'slds-spinner')]`
    );
    
    if (await loadingIndicator.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      await loadingIndicator.last().waitFor({ state: 'hidden', timeout });
    }
    
    // Wait for at least one row to be present (or empty state message)
    await this.page.waitForFunction(
      (tblId) => {
        const table = document.querySelector(`[data-flextablename='${tblId}']`);
        if (!table) return false;
        
        const rows = table.querySelectorAll('tbody tr');
        const emptyMessage = table.querySelector('.slds-text-body_small');
        
        return rows.length > 0 || emptyMessage !== null;
      },
      tableId,
      { timeout: 10000 }
    ).catch(() => {});
    
    const duration = Date.now() - startTime;
    logger.info(`[SF-Table] Table ready: ${tableId} - Duration: ${duration}ms`);
  }

  /**
   * Wait for confirmation popup/dialog to appear and be ready
   */
  async waitForConfirmationPopup(timeout = 5000) {
    const startTime = Date.now();
    logger.info('[SF-Popup] Waiting for confirmation popup...');
    
    try {
      // Check for various confirmation popup patterns
      const popupLocator = this.page.locator(
        `//div[contains(@class,'modal__container')]//lightning-confirm, ` +
        `//div[contains(@class,'modal__container')]//header//h2[text()='Confirm'], ` +
        `//div[contains(@class,'modal__container')]//h2[text()='Confirm Action'], ` +
        `//div[contains(@class,'slds-modal')]//h2[contains(text(),'Confirm')], ` +
        `//div[@role='dialog']//h2[contains(text(),'Confirm')]`
      ).first();
      
      await popupLocator.waitFor({ state: 'visible', timeout });
      
      const duration = Date.now() - startTime;
      logger.info(`[SF-Popup] Confirmation popup ready - Duration: ${duration}ms`);
      return true;
    } catch (e2) {
      logger.info('[SF-Popup] No confirmation popup detected');
      return false;
    }
  }

  /**
   * Wait for modal to be fully loaded and ready for interaction
   */
  async waitForModalFullyLoaded(timeout = 10000) {
    const startTime = Date.now();
    logger.info('[SF-Modal] Waiting for modal to be fully loaded...');
    
    try {
      // Wait for modal container. Use .last() (not .first()) since Salesforce can leave
      // stale/closed modal containers behind in the DOM — .first() would keep matching
      // one of those instead of the currently-open modal.
      const modalContainer = this.page.locator(
        `//div[contains(@class,'modal__container')] | ` +
        `//div[contains(@class,'slds-modal')] | ` +
        `//div[@role='dialog']`
      ).last();
      
      await modalContainer.waitFor({ state: 'visible', timeout: 5000 });
      
      // Wait for modal animation to complete (CSS transitions). Evaluate directly on the
      // resolved element handle instead of a fresh document.querySelector so it always
      // targets the modal instance found above, not a stale duplicate elsewhere in the DOM.
      const animationDeadline = Date.now() + 3000;
      while (Date.now() < animationDeadline) {
        const isReady = await modalContainer.evaluate((el) => {
          const styles = window.getComputedStyle(el);
          const opacity = parseFloat(styles.opacity);
          const transform = styles.transform;
          return opacity >= 0.99 && (transform === 'none' || !transform.includes('matrix'));
        }).catch(() => true);
        if (isReady) break;
        await this.page.waitForTimeout(100);
      }
      
      // Wait for any spinners in modal to disappear
      const modalSpinner = this.page.locator(
        `//div[contains(@class,'modal__container')]//div[contains(@class,'slds-spinner')] | ` +
        `//div[contains(@class,'slds-modal')]//div[contains(@class,'slds-spinner')]`
      ).first();
      
      if (await modalSpinner.isVisible({ timeout: 1000 }).catch(() => false)) {
        await modalSpinner.waitFor({ state: 'hidden', timeout: 5000 }).catch(() => {});
      }
      
      // Wait for modal content to be stable
      await this.page.waitForLoadState('domcontentloaded');
      
      const duration = Date.now() - startTime;
      logger.info(`[SF-Modal] Modal fully loaded - Duration: ${duration}ms`);
      return true;
    } catch (e) {
      logger.warn(`[SF-Modal] Modal load wait failed: ${(e ).message}`);
      return false;
    }
  }

  /**
   * Accept confirmation popup (click OK/Yes/Continue)
   */
  async acceptConfirmationPopup(timeout = 5000) {
    logger.info('[SF-Popup] Attempting to accept confirmation popup...');
    
    try {
      const confirmButton = this.page.locator(
        `//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Ok' or text()='Yes' or text()='Continue'], ` +
        `//div[contains(@class,'slds-modal')]//button[text()='OK' or text()='Yes' or text()='Continue'], ` +
        `//div[@role='dialog']//button[text()='OK' or text()='Yes' or text()='Continue']`
      ).first();
      
      await confirmButton.waitFor({ state: 'visible', timeout });
      await confirmButton.click();
      
      // Wait for popup to disappear
      await confirmButton.waitFor({ state: 'hidden', timeout: 3000 }).catch(() => {});
      
      logger.info('[SF-Popup] Confirmation popup accepted');
      return true;
    } catch (e3) {
      logger.info('[SF-Popup] No confirmation button found or already closed');
      return false;
    }
  }

  /**
   * Wait for comment modal and handle it
   */
  async handleCommentModal(comment = 'Automation Testing', timeout = 5000) {
    logger.info('[SF-Modal] Checking for comment modal...');
    
    try {
      const commentModal = this.page.locator(
        `//div[contains(@class,'modalSectionContainer')]//h2[normalize-space()='Add Comment']`
      ).first();
      
      if (await commentModal.isVisible({ timeout: 2000 }).catch(() => false)) {
        logger.info('[SF-Modal] Comment modal detected, entering comment...');
        
        const commentInput = this.page.locator(
          `//div[contains(@class,'modalSectionContainer')]//input, ` +
          `//div[contains(@class,'modalSectionContainer')]//textarea`
        ).first();
        
        await commentInput.fill(comment);
        
        const okButton = this.page.locator(
          `//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Ok']`
        ).first();
        
        await okButton.click();
        await okButton.waitFor({ state: 'hidden', timeout: 3000 }).catch(() => {});
        
        logger.info('[SF-Modal] Comment modal handled');
        return true;
      }
      
      return false;
    } catch (e4) {
      logger.info('[SF-Modal] No comment modal detected');
      return false;
    }
  }

  /**
   * Wait for Salesforce record page to be fully loaded
   */
  async waitForRecordPageReady(timeout = 15000) {
    const startTime = Date.now();
    
    // Wait for spinners
    await this.waitForSpinnerDisappear();
    
    // Wait for record detail to be visible
    await this.page.waitForSelector(
      'records-lwc-detail-panel, force-record-layout-base, records-record-layout-base',
      { state: 'visible', timeout }
    ).catch(() => {});
    
    // Wait for any API calls to complete
    await this.waitForSalesforceAPI(5000);
    
    const duration = Date.now() - startTime;
    logger.info(`[SF-Record] Record page ready - Duration: ${duration}ms`);
  }

  /**
   * Smart wait that combines multiple Salesforce checks
   */
  async waitForPageReady(timeout = 30000) {
    const startTime = Date.now();
    
    // 1. Wait for spinners
    await this.waitForSpinnerDisappear();
    
    // 2. Wait for Aura (if applicable)
    await this.waitForAuraReady(5000);
    
    // 3. Wait for pending API calls
    await this.waitForSalesforceAPI(10000);
    
    const duration = Date.now() - startTime;
    logger.info(`[SF-Page] Page ready - Duration: ${duration}ms`);
  }

  /**
   * Wait for element to be ready in Salesforce context
   * This is smarter than Playwright's default wait because it considers:
   * - Salesforce spinners
   * - Shadow DOM rendering
   * - API calls
   */
  async waitForElementReady(locator, timeout = 15000) {
    const startTime = Date.now();
    
    // Wait for spinners first
    await this.waitForSpinnerDisappear();
    
    // Wait for element to be visible
    await locator.waitFor({ state: 'visible', timeout });
    
    // Wait for element to be stable (not animating)
    await locator.evaluate((el) => {
      return new Promise((resolve) => {
        // Check if element position is stable
        let lastRect = el.getBoundingClientRect();
        let stableCount = 0;
        
        const checkStability = () => {
          const currentRect = el.getBoundingClientRect();
          if (
            Math.abs(currentRect.top - lastRect.top) < 1 &&
            Math.abs(currentRect.left - lastRect.left) < 1
          ) {
            stableCount++;
            if (stableCount >= 3) {
              resolve(true);
              return;
            }
          } else {
            stableCount = 0;
          }
          lastRect = currentRect;
          setTimeout(checkStability, 50);
        };
        
        checkStability();
      });
    }).catch(() => {});
    
    const duration = Date.now() - startTime;
    if (duration > 50) {
      logger.info(`[SF-Element] Element ready - Duration: ${duration}ms`);
    }
  }
}
