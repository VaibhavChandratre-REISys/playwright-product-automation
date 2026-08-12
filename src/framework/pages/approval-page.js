

import { BasePage } from './base-page';

import { logger } from '../utils/logger';

/**
 * Approval decision interactions.
 * XPaths translated 1:1 from Approval.java helper.
 */
export class ApprovalPage extends BasePage {
    __init() {this.container = '//c-approval-decision'}

  constructor(page, savedValues) {
    super(page, savedValues);ApprovalPage.prototype.__init.call(this);;
  }

  /** Click toast action if displayed (mirrors Selenium: ifToastActionIsDisplayed) */
  async clickToastActionIfPresent() {
    try {
      // Use single specific locator matching Selenium
      const toastAction = this.page.locator(`//button[@aria-label='View approval request details']`).nth(0);
      
      // Check if toast is present
      const isPresent = await toastAction.isVisible({ timeout: 5000 }).catch(() => false);
      if (!isPresent) {
        logger.info(`  Toast action button not found - approval decision may already be visible`);
        return;
      }
      
      // Wait until element is clickable and click
      await this.waitHelper.waitUntilClickable(toastAction, 3000);
      await toastAction.click();
      logger.info(`  Toast action clicked - waiting for approval decision to load`);
    } catch (e) {
      // Toast action not present - ok
      logger.debug(`  Toast action not present: ${e}`);
    }
  }

  /** Select a radio button option in the approval decision */
  async selectRadioButton(optionName) {
    const resolved = this.resolve(optionName);
    logger.info(`Approval: select radio "${resolved}"`);
    
    try {
      // Updated xpath from Selenium: radioButtonLocator
      const radio = this.page.locator(
        `//c-approval-decision//div[text()='${resolved}']//ancestor::div[@role='radio'] | ` +
        `//c-approval-decision//div[@data-value='${resolved}'] | ` +
        `//c-approval-decision//div//span[text()='${resolved}'] | ` +
        `//c-approval-decision//div//span//input[@value='${resolved}']`
      ).first();
      
      await this.waitHelper.waitUntilVisible(radio, 15000);
      // Use JavaScript click like Selenium (withJavaScript)
      await this.clickHelper.clickWithJavaScript(radio);
    } catch (e) {
      let error = (e ).message;
      
      // Enhanced error handling matching Selenium
      if (!(await this.isVisible())) {
        error = 'Approval decision was not visible on the page';
      } else if (!(await this.areRadioButtonsVisible())) {
        error = 'No approval radio buttons were visible on the page';
      } else if (!(await this.isRadioButtonVisible(resolved))) {
        const options = await this.getApprovalOptions();
        error = `Matching radio button was not found in the page.\nThe following radio buttons were found: ${options.join(', ')}`;
      }
      
      logger.error(`Could not select radio button '${resolved}' in the approval decision.`);
      logger.error(error);
      throw new Error(`Could not select radio button '${resolved}': ${error}`);
    }
  }
  
  /** Check if any radio buttons are visible */
   async areRadioButtonsVisible() {
    const radios = this.page.locator(`${this.container}//div[@role='radio'] | ${this.container}//input[@type='radio']`);
    return await radios.count() > 0;
  }

  /** Select a user from the user lookup dropdown */
  async selectUser(userName) {
    const resolved = this.resolve(userName);
    logger.info(`Approval: select user "${resolved}"`);
    const lookup = this.page.locator(
      `${this.container}//input[@type='text' or @placeholder='Search User...']`
    ).first();
    await this.waitHelper.waitUntilVisible(lookup, 10000);
    await lookup.clear();
    await lookup.fill(resolved);
    // Wait for lookup options to appear
    const option = this.page.locator(
      `//div[@title='${resolved}'] | //span[text()='${resolved}'][contains(@class,'lookup')]`
    ).first();
    await option.waitFor({ state: 'visible', timeout: 3000 }).catch(() => {});
    await this.waitHelper.waitUntilVisible(option, 10000);
    await option.dispatchEvent('click');
  }

  /** Enter a comment in the approval comment box */
  async enterComment(comment) {
    const resolved = this.resolve(comment);
    logger.info(`Approval: enter comment "${resolved}"`);
    const textarea = this.page.locator(
      `${this.container}//textarea`
    ).first();
    await this.waitHelper.waitUntilVisible(textarea, 10000);
    await textarea.clear();
    await textarea.fill(resolved);
  }

  /** Click the Submit button in the approval decision */
  async submitApproval(withProcessing = true) {
    logger.info(`Approval: submit (processing=${withProcessing})`);
    // Updated xpath from Selenium: submitButtonLocator
    const submitBtn = this.page.locator(
      `//c-approval-decision//button[normalize-space()='Submit Decision'] | ` +
      `//c-approval-decision//button[@title='Submit' and text()='Submit']`
    ).first();
    await this.waitHelper.waitUntilVisible(submitBtn, 15000);
    await this.clickHelper.click(submitBtn);
    if (withProcessing) {
      // Click submit confirmation if present (mirrors Selenium: submitConfirmationLocator)
      await this.clickSubmitConfirmationIfPresent();
      await this.waitForSpinner();
    }
  }

  /** Check if approval decision component is visible */
  async isVisible() {
    const locator = this.page.locator(this.container).first();
    return await locator.isVisible({ timeout: 5000 }).catch(() => false);
  }

  /** Wait for approval decision component to be visible */
  async waitForApprovalVisible(timeout = 15000) {
    const locator = this.page.locator(this.container).first();
    try {
      await locator.waitFor({ state: 'visible', timeout });
      logger.info('Approval decision component is now visible');
      return true;
    } catch (e2) {
      logger.warn('Approval decision component did not become visible');
      return false;
    }
  }

  /** Check if comment box is visible */
  async isCommentBoxVisible() {
    const textarea = this.page.locator(`${this.container}//textarea`).first();
    return await textarea.isVisible({ timeout: 3000 }).catch(() => false);
  }

  /** Check if submit button is visible */
  async isSubmitButtonVisible() {
    const btn = this.page.locator(`${this.container}//button[@title='Submit']`).first();
    return await btn.isVisible({ timeout: 3000 }).catch(() => false);
  }

  /** Check if a radio button is visible */
  async isRadioButtonVisible(name) {
    const resolved = this.resolve(name);
    const radio = this.page.locator(
      `${this.container}//input[@value='${resolved}'] | ${this.container}//span[text()='${resolved}']`
    ).first();
    return await radio.isVisible({ timeout: 3000 }).catch(() => false);
  }

  /** Check if a user is present in the lookup */
  async isUserPresentInLookup(user) {
    const resolved = this.resolve(user);
    const lookup = this.page.locator(
      `${this.container}//input[@type='text']`
    ).first();
    await lookup.clear();
    await lookup.fill(resolved);
    // Wait for lookup dropdown to appear
    const option = this.page.locator(`//div[@title='${resolved}']`).first();
    await option.waitFor({ state: 'visible', timeout: 3000 }).catch(() => {});
    return await option.isVisible({ timeout: 3000 }).catch(() => false);
  }

  /** Check if a message is visible in the approval decision */
  async isMessageVisible(message) {
    const resolved = this.resolve(message);
    const locator = this.page.locator(
      `${this.container}//*[contains(text(),'${resolved}')]`
    ).first();
    return await locator.isVisible({ timeout: 5000 }).catch(() => false);
  }

  /** Get the list of radio button options */
  async getApprovalOptions() {
    const labels = this.page.locator(`${this.container}//input[@type='radio']/following-sibling::label`);
    const count = await labels.count();
    const options = [];
    for (let i = 0; i < count; i++) {
      options.push((await labels.nth(i).innerText()).trim());
    }
    return options;
  }

  /** Get the list of approval messages */
  async getApprovalMessages() {
    const msgs = this.page.locator(`${this.container}//*[contains(@class,'message')]`);
    const count = await msgs.count();
    const messages = [];
    for (let i = 0; i < count; i++) {
      messages.push((await msgs.nth(i).innerText()).trim());
    }
    return messages;
  }

  /** Click submit confirmation if present (mirrors Selenium: submitConfirmationLocator) */
  async clickSubmitConfirmationIfPresent() {
    try {
      const confirmBtn = this.page.locator(
        `//div[@class='confirm-modal']//button[contains(text(),'Continue')]`
      ).first();
      if (await confirmBtn.isVisible({ timeout: 3000 }).catch(() => false)) {
        await confirmBtn.click();
        logger.info(`  Submit confirmation clicked`);
      }
    } catch (e) {
      // No confirmation - ok
      logger.debug(`  Submit confirmation not present: ${e}`);
    }
  }

  /** Accept popup with comprehensive handling (mirrors Selenium: acceptPopUp) */
  async acceptPopUp() {
    try {
      // Main confirmation popup
      const popup = this.page.locator(
        `//div[contains(@class,'modal__container')]//lightning-confirm | ` +
        `//div[contains(@class,'modal__container')]//header//h2[text()='Confirm'] | ` +
        `//div[contains(@class,'modal__container')]//h2[text()='Confirm Action'] | ` +
        `//div[contains(@class,'modal__container')]//*[text()='Confirm']`
      ).first();
      if (await popup.isVisible({ timeout: 3000 }).catch(() => false)) {
        const okBtn = this.page.locator(
          `//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Yes' or text()='Continue']`
        ).first();
        await okBtn.click();
        logger.info(`  Popup accepted`);
      }
    } catch (e) {
      // No popup - ok
      logger.debug(`  Popup not present: ${e}`);
    }

    // Comment box handler (mirrors Selenium: comment box handler in acceptPopUp)
    try {
      const addCommentModal = this.page.locator(
        `//div[contains(@class,'modalSectionContainer')]//h2[normalize-space()='Add Comment']`
      ).first();
      if (await addCommentModal.isVisible({ timeout: 3000 }).catch(() => false)) {
        const commentInput = this.page.locator(
          `//div[contains(@class,'modalSectionContainer')]//input`
        ).first();
        if (await commentInput.count() > 0) {
          await commentInput.fill('Automated Test');
        }
        const continueBtn = this.page.locator(
          `//div[contains(@class,'modalSectionContainer')][.//h2[text()='Add Comment']]//button[text()='Continue' or text()='OK']`
        ).first();
        await continueBtn.click();
        logger.info(`  Comment modal handled`);
      }
    } catch (e) {
      logger.debug(`  Comment modal not present: ${e}`);
    }

    // Confirm modal with input handler (mirrors Selenium: confirm modal handler)
    try {
      const confirmInput = this.page.locator(
        `//div[contains(@class,'modalContent confirm-modal-body')]//input | ` +
        `//div[contains(@class,'modal__container')]//lightning-prompt//input | ` +
        `//div[contains(@class,'modal__container')]//div[@class='confirm-modal']//input | ` +
        `//div[contains(@class,'modal__container')]//div[@class='confirm-modal']//lightning-modal-footer[contains(@class,'confirm-modalfooter')]`
      ).first();
      if (await confirmInput.count() > 0) {
        await confirmInput.fill('Automated Test');
        const confirmBtn = this.page.locator(
          `//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Yes' or text()='Continue']`
        ).first();
        await confirmBtn.click();
        logger.info(`  Confirm modal with input handled`);
      }
    } catch (e) {
      logger.debug(`  Confirm modal with input not present: ${e}`);
    }
  }

  // waitForSpinner() is now inherited from BasePage via WaitHelper
}
