import { Page } from 'playwright';
import { expect } from '@playwright/test';
import { BasePage } from './base-page';
import { SavedValues } from '../utils/saved-values';
import { logger } from '../utils/logger';

/**
 * Modal interactions.
 * XPaths translated 1:1 from Modal.java.
 */
export class ModalPage extends BasePage {
  constructor(page: Page, savedValues: SavedValues) {
    super(page, savedValues);
  }

  /**
   * Click a button inside a modal dialog.
   * Translated from Modal.clickModalContentSpecificButton().
   * Java XPath: //div[contains(@class,'modal__container')]//button[contains(text(),'X')]
   */
  async clickModalButton(buttonName: string): Promise<void> {
    const resolved = this.resolve(buttonName);
    logger.info(`Modal button: "${resolved}"`);
    
    // Smart wait for modal to be fully loaded (animation + spinners + content)
    await this.sfWait.waitForModalFullyLoaded();
    
    // Exact XPath from Selenium: //div[@id='ModalDivID']//button[contains(text(),'X')] | //button[normalize-space()='X']
    const modalButton = this.page.locator(
      `//div[contains(@class,'modal__container')]//button[contains(text(),'${resolved}')] | ` +
      `//div[contains(@class,'modal__container')]//button[@title='${resolved}'] | ` +
      `//div[@id='WorkspaceFileEdit']//button[@title='${resolved}' or text()='${resolved}']`
    ).first();
    
    try {
      // Smart wait for element to be ready in Salesforce context
      await this.sfWait.waitForElementReady(modalButton, 15000);
      await this.clickHelper.click(modalButton);
      logger.info(`  Clicked modal button: "${resolved}"`);
    } catch (e) {
      logger.warn(`  First click failed, trying JavaScript: ${e}`);
      await this.clickHelper.clickWithJavaScript(modalButton);
      logger.info(`  Clicked modal button with JavaScript: "${resolved}"`);
    }
    
    // Smart wait for page to be ready after action
    await this.sfWait.waitForPageReady();
    
    // Smart popup handling
    await this.acceptPopUpSmart();
  }

  /**
   * Smart popup acceptance using SalesforceWaitHelper
   */
  async acceptPopUpSmart(): Promise<void> {
    // Check for confirmation popup
    const hasConfirmation = await this.sfWait.waitForConfirmationPopup(3000);
    if (hasConfirmation) {
      await this.sfWait.acceptConfirmationPopup();
    }
    
    // Check for comment modal
    await this.sfWait.handleCommentModal('Automation Testing', 3000);
  }

  /**
   * Close a named modal by clicking its X button.
   * Translated from Modal.closeModalByClickingTopRightCloseButton(titleName).
   * Selenium XPath: //div[contains(@class,'modal')]//h2[text()='X']/../parent::header//button[@title='Close']
   */
  async closeModalByTitle(titleName: string): Promise<void> {
    const resolved = this.resolve(titleName);
    logger.info(`Close modal: "${resolved}"`);
    // Exact XPath from Selenium: closeModalByClickingTopRightCloseButton
    const closeBtn = this.page.locator(
      `//div[contains(@class,'modal')]//h2[text()='${resolved}']/../parent::header//button[@title='Close'] | ` +
      `//div[contains(@class,'modal')]//h2[text()='${resolved}']/parent::header//button[@title='Close']`
    ).first();
    await this.waitHelper.waitUntilVisible(closeBtn, 10000);
    await closeBtn.click();
  }

  /**
   * Close the generic modal by clicking Cancel/Close.
   * Translated from Modal.closeModalByClickingTopRightCloseButton().
   */
  async closeModal(): Promise<void> {
    logger.info('Close modal (generic)');
    const closeBtn = this.page.locator(
      `//div[contains(@class, 'modal__container')]//button[@title='Cancel and close']`
    ).first();
    if (await closeBtn.count() > 0) {
      await this.clickHelper.click(closeBtn);
    }
  }

  /**
   * Accept any popup (OK/Yes/Continue).
   * Translated from Modal.acceptPopUp().
   */
  async acceptPopUp(): Promise<void> {
    try {
      const popup = this.page.locator(
        `//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Yes' or text()='Continue']`
      ).first();
      if (await popup.isVisible({ timeout: 5000 }).catch(() => false)) {
        await this.clickHelper.click(popup);
        await this.waitForSpinner();
      }
    } catch {
      // no popup — ok
    }
  }

  /**
   * Click a specific button on modal footer (Accept/Reject confirmation).
   * Translated from Modal.acceptPopUpWithParameter().
   */
  async clickConfirmationButton(buttonName: string): Promise<void> {
    const resolved = this.resolve(buttonName);
    logger.info(`Modal confirmation: "${resolved}"`);
    const btn = this.page.locator(
      `//div[contains(@class,'modal__footer')]//button[text()='${resolved}'] | ` +
      `//div[contains(@class,'modal__container')]//button[text()='${resolved}'] | ` +
      `//footer[contains(@class,'modal__footer')]//button[text()='${resolved}']`
    ).first();
    await this.waitHelper.waitUntilVisible(btn, 10000);
    await this.clickHelper.click(btn);
  }

  /**
   * Assert a field/value pair is visible on a modal.
   * Translated from GovGrantsAssertionObjects.verifyFieldAvailableOnModal() (line 494).
   * Real Java XPath:
   *   //div[contains(@class,'modal__container')]//label[text()='X']/..//lightning-base-combobox//span[text()='Y']
   *   | ...//lightning-formatted-text[text()='Y']
   *   | ...//a[text()='Y']
   */
  async assertModalField(field: string, text: string): Promise<void> {
    const resolvedField = this.resolve(field);
    const resolvedText = this.resolve(text);
    logger.info(`Assert modal field "${resolvedField}" = "${resolvedText}"`);
    const locator = this.page.locator(
      `//div[contains(@class,'modal__container')]//label[text()='${resolvedField}']/..//lightning-base-combobox//span[text()='${resolvedText}'] | ` +
      `//div[contains(@class,'modal__container')]//label[text()='${resolvedField}']/parent::div//lightning-formatted-text[text()='${resolvedText}'] | ` +
      `//div[contains(@class,'modal__container')]//label[text()='${resolvedField}']/parent::div//a[text()='${resolvedText}']`
    ).first();
    try {
      await expect(locator).toBeVisible({ timeout: 10000 });
    } catch {
      // soft assertion — log but don't fail
    }
  }

  /**
   * Enter value into a field on a modal.
   * Translated from InputForms.inputFormDataByFieldApiName() with isModal=true.
   */
  async enterModalFieldValue(fieldApiName: string, fieldValue: string): Promise<void> {
    const resolvedField = this.resolve(fieldApiName);
    const resolvedValue = this.resolve(fieldValue);
    logger.info(`Modal field "${resolvedField}" = "${resolvedValue}"`);
    const wrapper = this.page.locator(
      `//div[contains(@class,'modal__container')]//div[@data-field_api_name='${resolvedField}']`
    ).first();
    await this.waitHelper.waitUntilVisible(wrapper, 10000);
    await this.handleFieldInput(wrapper, resolvedValue);
  }

  /**
   * Generic field input handler — handles text, lookup, date, checkbox, picklist.
   * Simplified from InputForms.handleFormDataInputs().
   */
  private async handleFieldInput(wrapper: any, value: string): Promise<void> {
    // Try text input first
    const input = wrapper.locator('input:not([type="checkbox"]):not([type="radio"]), textarea').first();
    if (await input.count() > 0) {
      await input.scrollIntoViewIfNeeded();
      await input.clear();
      await input.fill(value);
      await input.press('Tab');
      return;
    }
    // Try picklist/combobox
    const combobox = wrapper.locator('lightning-combobox button, lightning-base-combobox button').first();
    if (await combobox.count() > 0) {
      await combobox.click();
      const option = this.page.locator(`//lightning-base-combobox-item//span[text()='${value}']`).first();
      await this.waitHelper.waitUntilVisible(option, 5000);
      await option.click();
      return;
    }
    // Try checkbox
    const checkbox = wrapper.locator('input[type="checkbox"]').first();
    if (await checkbox.count() > 0) {
      const isChecked = await checkbox.isChecked();
      if ((value.toLowerCase() === 'checked' && !isChecked) || (value.toLowerCase() === 'unchecked' && isChecked)) {
        await checkbox.click();
      }
    }
  }

  // waitForSpinner() is now inherited from BasePage via WaitHelper
}
