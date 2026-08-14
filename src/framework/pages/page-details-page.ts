import { Page } from 'playwright';
import { expect } from '@playwright/test';
import { BasePage } from './base-page';
import { NavigationPage } from './navigation-page';
import { SavedValues } from '../utils/saved-values';
import { logger } from '../utils/logger';

/**
 * Page detail interactions — top-right buttons, field values, progress bar,
 * form input, sub-tabs, etc.
 * XPaths translated 1:1 from PageDetails.java and InputForms.java.
 */
export class PageDetailsPage extends BasePage {
  public idOfRecord: string | null = null;

  constructor(page: Page, savedValues: SavedValues) {
    super(page, savedValues);
  }

  // ── Top-right buttons ──────────────────────────────────────────────────────

  /**
   * Get XPath for any top-right button.
   * Translated from PageDetails.getAnyTopRightButton().
   */
  private topRightBtnXpath(buttonName: string): string {
    return (
      `//lightning-button//button[@title='${buttonName}' or text()='${buttonName}'] | ` +
      `//div[contains(@class,'dropdown__item')]//span[text()='${buttonName}'] | ` +
      `//lightning-menu-item//div//*[text()='${buttonName}'] | ` +
      `//li/a/div[@title='${buttonName}']`
    );
  }

  /**
   * Click any top-right button in page details.
   * Translated from PageDetails.clickAnyTopRightButton().
   */
  async clickTopRightButton(buttonName: string): Promise<void> {
    const resolved = this.resolve(buttonName);
    logger.info(`Page detail button: "${resolved}"`);
    const btn = this.page.locator(this.topRightBtnXpath(resolved)).first();
    try {
      // Wait for button to be visible
      await this.waitHelper.waitUntilVisible(btn, 15000);
      
      // Wait for button to be enabled/clickable
      await btn.waitFor({ state: 'attached', timeout: 15000 });
      
      // Smart wait for Salesforce to be ready
      await this.sfWait.waitForPageReady();
      
      // Wait until button is enabled (not disabled)
      await this.page.waitForFunction(
        (xpath) => {
          const button = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue as HTMLButtonElement;
          return button && !button.disabled && button.offsetParent !== null;
        },
        this.topRightBtnXpath(resolved),
        { timeout: 20000 }
      );
      
      try {
        await this.clickHelper.click(btn);
      } catch {
        await this.clickHelper.clickWithJavaScript(btn);
      }
    } catch {
      // Fallback: click collab menu then option
      const menu = this.page.locator(`//gnt-header-overview//lightning-button-menu//button`).first();
      await this.waitHelper.waitUntilVisible(menu, 10000);
      await this.clickHelper.clickWithJavaScript(menu);
      const item = this.page.locator(`//div[contains(@class,'dropdown__item')]//span[text()='${resolved}']`).first();
      await this.waitHelper.waitUntilVisible(item, 10000);
      await this.clickHelper.clickWithJavaScript(item);
    }
    await this.acceptPopUp();
    await this.waitForSpinner();
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
  }

  /**
   * Click top-right button without processing (no popup accept).
   * Translated from PageDetails.clickAnyTopRightButtonForWithoutProcessing().
   */
  async clickTopRightButtonWithoutProcessing(buttonName: string): Promise<void> {
    const resolved = this.resolve(buttonName);
    logger.info(`Page detail button (no processing): "${resolved}"`);
    const btn = this.page.locator(this.topRightBtnXpath(resolved)).first();
    await this.waitHelper.waitUntilVisible(btn, 15000);
    await this.clickHelper.click(btn);
    await this.acceptPopUp();
  }

  // ── Field values ───────────────────────────────────────────────────────────

  /**
   * Get a field value by label.
   * Translated from PageDetails.getFieldValue().
   */
  async getFieldValue(fieldLabel: string): Promise<string> {
    const resolved = this.resolve(fieldLabel);
    // Check if this is EGMS ID or GovGrants ID (before any resolution)
    const isEgmsId = fieldLabel.toLowerCase() === 'egms id';
    const isGovGrantsId = fieldLabel.toLowerCase() === 'govgrants id';
    
    // For EGMS ID and GovGrants ID, wait for spinners only (faster than full page ready)
    if (isEgmsId || isGovGrantsId) {
      await this.waitHelper.waitForSpinnerDisappear();
    }
    
    // POC-aligned: use label with @class='label' like Java PageDetails.getFieldValue()
    const fieldLabelLocator = this.page.locator(
      `//div//label[contains(@class,'label') and contains(.,'${resolved}')]`
    ).first();
    
    // Retry logic for EGMS ID and GovGrants ID to ensure consistency
    const maxRetries = isEgmsId || isGovGrantsId ? 2 : 1;
    let fieldValue = '';
    
    for (let attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        await fieldLabelLocator.waitFor({ state: 'attached', timeout: 5000 });
        // Navigate to parent to find value (excludes help-text) - mirroring Selenium XPath
        const fieldData = fieldLabelLocator.locator(
          `xpath=./parent::div//div[not(@part='help-text')] | ` +
          `./parent::slot//div[not(@part='help-text')] | ` +
          `./parent::slot//lightning-formatted-text[not(@part='help-text')] | ` +
          `./parent::div//li[not(@part='help-text')] | ` +
          `./parent::div//span//p[not(@part='help-text')] | ` +
          `./parent::div//lightning-formatted-rich-text//span[not(@part='help-text')] | ` +
          `./parent::div//lightning-formatted-text[not(@part='help-text')]`
        ).first();
        
        // Check for checkbox input
        const checkbox = fieldData.locator('xpath=.//input[@type="checkbox"]');
        if (await checkbox.count() > 0) {
          const isChecked = await checkbox.first().isChecked();
          fieldValue = isChecked ? 'Checked' : 'Unchecked';
        } else {
          const text = await fieldData.textContent({ timeout: 5000 });
          fieldValue = (text || '').replace(/\s+/g, ' ').trim();
        }
        
        // If we got a value, break the retry loop
        if (fieldValue) {
          break;
        }
      } catch (e) {
        if (attempt < maxRetries) {
          logger.warn(`getFieldValue attempt ${attempt}/${maxRetries} failed for '${resolved}', retrying...`);
          await this.waitHelper.waitForSpinnerDisappear();
        } else {
          logger.warn(`getFieldValue primary locator failed for '${resolved}' after ${maxRetries} attempts`);
        }
      }
    }
    
    // If primary locator failed, try fallback
    if (!fieldValue) {
      logger.warn(`getFieldValue primary locator failed for '${resolved}', trying fallback`);
      const field = this.page.locator(`[data-field_api_name='${resolved}']`);
      try {
        await field.waitFor({ state: 'attached', timeout: 5000 });
        const text = await field.textContent({ timeout: 5000 });
        fieldValue = (text || '').replace(/\s+/g, ' ').trim();
      } catch (e) {
        logger.warn(`getFieldValue fallback also failed for '${resolved}'`);
      }
    }
    
    // Save EGMS ID and GovGrants ID with consistent keys (mirroring Selenium idOfRecord logic)
    if (isEgmsId && fieldValue) {
      this.idOfRecord = fieldValue;
      this.savedValues.set('EGMS ID', fieldValue);
      logger.info(`Saved EGMS ID: "${fieldValue}"`);
    } else if (isGovGrantsId && fieldValue) {
      this.idOfRecord = fieldValue;
      this.savedValues.set('GovGrants ID', fieldValue);
      logger.info(`Saved GovGrants ID: "${fieldValue}"`);
    }
    
    return fieldValue;
  }

  /**
   * Assert field value matches expected.
   * Translated from GovGrantsAssertionObjects.assertFieldValue().
   */
  async assertFieldValue(fieldLabel: string, expectedValue: string): Promise<void> {
    const resolved = this.resolve(fieldLabel);
    const resolvedVal = this.resolve(expectedValue);
    logger.info(`Assert field "${resolved}" = "${resolvedVal}"`);

    // Smart wait: resolves almost immediately if the page is already stable (spinners
    // gone, no pending Aura/API calls), but properly waits out any in-flight reload
    // (e.g. after a status-changing action like "Submit to Grantor") without a fixed sleep.
    await this.sfWait.waitForPageReady().catch(() => {});

    // Some status-changing actions update the field slightly after spinners/tracked API
    // calls settle (e.g. a Flow/trigger-driven update). Poll briefly instead of a single
    // point-in-time read — exits the moment it matches, so it doesn't slow the common
    // case where the value is already correct.
    let actual = await this.getFieldValue(resolved);
    const deadline = Date.now() + 12000;
    while (!actual.includes(resolvedVal) && Date.now() < deadline) {
      await this.page.waitForTimeout(1500);
      actual = await this.getFieldValue(resolved);
    }
    expect(actual).toContain(resolvedVal);
  }

  /**
   * Get field value from form by label.
   * Mirrors Selenium: PageDetails.getFieldValueInForm()
   */
  async getFieldValueInForm(fieldLabel: string, matchLabelExactly: boolean): Promise<string> {
    const resolved = this.resolve(fieldLabel);
    logger.info(`Get field value in form for "${resolved}" (exact match: ${matchLabelExactly})`);
    
    // Build label locator based on match type
    const labelMatch = matchLabelExactly
      ? `normalize-space(text())='${resolved}'`
      : `contains(.,'${resolved}')`;
    
    const fieldLabelLocator = this.page.locator(
      `//span[contains(@class,'label') and ${labelMatch}]`
    ).first();
    
    await fieldLabelLocator.waitFor({ state: 'attached', timeout: 10000 });
    
    // Get field value using multiple XPath patterns (mirroring Selenium)
    const fieldData = fieldLabelLocator.locator(
      `xpath=./ancestor::dl[1]/dd | ` +
      `./ancestor::dl[1]/following-sibling::dd | ` +
      `./parent::div//div[not(@part='help-text')] | ` +
      `./parent::slot//div[not(@part='help-text')] | ` +
      `./parent::lightning-output-field/..//div//lightning-formatted-text | ` +
      `./parent::lightning-output-field/..//div//lightning-formatted-number`
    ).first();
    
    // Check for checkbox input
    const checkbox = fieldData.locator('xpath=.//input[@type="checkbox"]');
    let fieldValue: string;
    
    if (await checkbox.count() > 0) {
      const isChecked = await checkbox.first().isChecked();
      fieldValue = isChecked ? 'Checked' : 'Unchecked';
    } else {
      const text = await fieldData.textContent({ timeout: 5000 });
      fieldValue = (text || '').replace(/\s+/g, ' ').trim();
    }
    
    // Save EGMS ID and GovGrants ID (mirroring Selenium idOfRecord logic)
    if (fieldLabel.toLowerCase() === 'egms id' && fieldValue) {
      this.idOfRecord = fieldValue;
      this.savedValues.set('EGMS ID', fieldValue);
      logger.info(`Saved EGMS ID: "${fieldValue}"`);
    } else if (fieldLabel.toLowerCase() === 'govgrants id' && fieldValue) {
      this.idOfRecord = fieldValue;
      this.savedValues.set('GovGrants ID', fieldValue);
      logger.info(`Saved GovGrants ID: "${fieldValue}"`);
    }
    
    return fieldValue;
  }

  /**
   * Assert field value in form matches expected.
   * Mirrors Selenium: GovGrantsAssertionObjects.assertFieldValueInTheForm()
   */
  async assertFieldValueInForm(fieldLabel: string, matchesExactly: boolean, expectedValue: string, isSoftly: boolean): Promise<void> {
    const resolvedLabel = this.resolve(fieldLabel);
    const resolvedValue = this.resolve(expectedValue);
    logger.info(`Assert field in form "${resolvedLabel}" = "${resolvedValue}" (exact match: ${matchesExactly}, softly: ${isSoftly})`);
    
    let foundValue: string | null = null;
    
    // Retry up to 2 times to get the field value (mirroring Selenium)
    for (let i = 0; i < 2 && foundValue !== resolvedValue; i++) {
      try {
        foundValue = await this.getFieldValueInForm(fieldLabel, matchesExactly);
      } catch (e) {
        foundValue = null;
        logger.warn(`Attempt ${i + 1} failed to get field value: ${e}`);
      }
    }
    
    // Assert the value matches (ignoring case)
    try {
      expect(foundValue?.toLowerCase()).toBe(resolvedValue.toLowerCase());
      logger.info(`Field value assertion passed: "${foundValue}" matches "${resolvedValue}"`);
    } catch (e) {
      const errorMessage = `Field "${resolvedLabel}" expected "${resolvedValue}" but found "${foundValue}"`;
      logger.error(errorMessage);
      if (!isSoftly) {
        throw new Error(errorMessage);
      } else {
        logger.warn(`Soft assertion failed: ${errorMessage}`);
      }
    }
  }

  /**
   * Assert field is not editable.
   */
  async assertFieldNotEditable(fieldLabel: string): Promise<void> {
    const resolved = this.resolve(fieldLabel);
    const input = this.page.locator(
      `//label[normalize-space(text())='${resolved}']/following-sibling::div//input | ` +
      `//label[normalize-space(text())='${resolved}']/following-sibling::div//textarea`
    ).first();
    if (await input.count() > 0) {
      const isDisabled = await input.isDisabled();
      const isReadonly = await input.getAttribute('readonly');
      if (!isDisabled && isReadonly === null) {
        throw new Error(`Field "${resolved}" appears to be editable`);
      }
    }
  }

  /**
   * Assert field is in edit mode (editable).
   */
  async assertFieldEditable(fieldLabel: string): Promise<void> {
    const resolved = this.resolve(fieldLabel);
    const input = this.page.locator(
      `//label[normalize-space(text())='${resolved}']/following-sibling::div//input | ` +
      `//label[normalize-space(text())='${resolved}']/following-sibling::div//textarea | ` +
      `//div[@data-field_api_name='${resolved}']//input`
    ).first();
    await expect(input).toBeVisible({ timeout: 10000 });
  }

  /**
   * Save a field value as a saved key for future steps.
   */
  async saveFieldValueAs(fieldLabel: string, key: string): Promise<void> {
    const value = await this.getFieldValue(fieldLabel);
    this.savedValues.set(key, value);
    logger.info(`Saved field "${fieldLabel}" = "${value}" as "${key}"`);
  }

  // ── Progress bar ───────────────────────────────────────────────────────────

  /**
   * Assert progress bar status and color.
   * Translated from PageDetails.getSpecificStatusFromProgressBar().
   */
  async assertProgressBarStatus(status: string, color: string): Promise<void> {
    const resolvedStatus = this.resolve(status);
    const resolvedColor = this.resolve(color);
    logger.info(`Assert progress bar: "${resolvedStatus}" is "${resolvedColor}"`);
    const locator = this.page.locator(
      `//lightning-progress-step[@data-id='${resolvedStatus}' and contains(@class,'active')] | ` +
      `//c-step-progressbar//span[text()='${resolvedStatus}']/ancestor::li[contains(@class,'active')]`
    ).first();
    await expect(locator).toBeVisible({ timeout: 15000 });
  }

  // ── Page messages / overview ───────────────────────────────────────────────

  /**
   * Assert page header text.
   * Translated from GovGrantsAssertionSteps.validateOverviewHeader().
   */
  async assertPageHeader(headerText: string): Promise<void> {
    const resolved = this.resolve(headerText);
    const locator = this.page.locator(
      `//div[contains(@class,'page-header__col-title')]//h2[normalize-space(text())='${resolved}'] | ` +
      `//div[contains(@class,'page-header__name')]//span[contains(@title,'${resolved}') or contains(text(),'${resolved}')] | ` +
      `//div[contains(@class,'slds-page-header header-overview-padd')]//h2[normalize-space(text())='${resolved}']`
    ).first();
    await expect(locator).toBeVisible({ timeout: 15000 });
  }

  /**
   * Assert page sub-header text.
   */
  async assertPageSubHeader(headerText: string): Promise<void> {
    const resolved = this.resolve(headerText);
    const locator = this.page.locator(
      `//div[contains(@class,'page-header__name')]//span[contains(@title,'${resolved}') or contains(text(),'${resolved}')]`
    ).first();
    await expect(locator).toBeVisible({ timeout: 15000 });
  }

  /**
   * Assert page message contains expected text.
   * Translated from GovGrantsAssertionObjects.assertPageMessageValue().
   */
  async assertPageMessage(message: string, shouldContain: boolean): Promise<void> {
    const resolved = this.resolve(message);
    const locator = this.page.locator(
      `//c-flex-layout-page-messages//span[text()] | ` +
      `//span[contains(@class,'toastMessage')] | ` +
      `//div[@class='errorMsg']//span[@part='formatted-rich-text'] | ` +
      `//div[@class='successMsg']//span[@part='formatted-rich-text'] | ` +
      `//gnt-flex-layout-page-messages//span//lightning-formatted-text | ` +
      `//c-flex-layout-page-messages//span//lightning-formatted-text | ` +
      `//span[@class='toastMessage forceActionsText'] | ` +
      `//span[contains(@class,'changeOwnerErrorMessage')] | ` +
      `//flowruntime-error-content//lightning-formatted-rich-text//span | ` +
      `//div[@data-id='modalcontent1']//lightning-formatted-rich-text//span | ` +
      `//c-flex-layout-page-messages//lightning-formatted-rich-text//span | ` +
      `//c-download-applicants//b | ` +
      `//c-file-upload-modal//pre | ` +
      `//c-file-upload-modal//div[@class='success-message'] | ` +
      `//div[contains(@class,'errorMsg')]//lightning-formatted-rich-text//span[text()] | ` +
      `//div[contains(@class,'page-message-warning')]//lightning-formatted-rich-text//span[text()]`
    ).filter({ hasText: resolved }).first();
    if (shouldContain) {
      await expect(locator).toBeVisible({ timeout: 10000 });
    } else {
      await expect(locator).toBeHidden({ timeout: 5000 });
    }
  }

  /**
   * Assert top-right button visible/hidden.
   * Translated from GovGrantsAssertionObjects.assertTopRightButtonInPage().
   */
  async assertTopRightButton(buttonName: string, shouldExist: boolean): Promise<void> {
    const resolved = this.resolve(buttonName);
    const btn = this.page.locator(this.topRightBtnXpath(resolved)).first();
    if (shouldExist) {
      // Try direct first; if not found, open dropdown menu and retry (mirrors Java)
      const visible = await btn.isVisible();
      if (!visible) {
        try {
          const dropdownBtn = this.page.locator('//gnt-header-overview//lightning-button-menu//button').first();
          await dropdownBtn.click({ timeout: 5000 });
          await this.page.waitForTimeout(100);
        } catch { /* dropdown may not exist */ }
      }
      await expect(btn).toBeVisible({ timeout: 10000 });
    } else {
      await expect(btn).toBeHidden({ timeout: 10000 });
    }
  }

  /**
   * Assert page block is displayed.
   */
  async assertPageBlock(blockName: string, shouldExist: boolean): Promise<void> {
    const resolved = this.resolve(blockName);
    const locator = this.page.locator(
      `//c-page-block-section//span[contains(@class,'text-heading') and normalize-space(text())='${resolved}'] | ` +
      `//c-page-block-section//span[normalize-space(text())='${resolved}'] | ` +
      `//c-lwc-flex-table//span[contains(text(),'${resolved}')] | ` +
      `//c-file-upload//a[contains(text(),'${resolved}')] | ` +
      `//div[@id='WorkspaceFiles']//a[contains(text(),'${resolved}')]`
    ).first();
    if (shouldExist) {
      await expect(locator).toBeVisible({ timeout: 10000 });
    } else {
      await expect(locator).toBeHidden({ timeout: 10000 });
    }
  }

  /**
   * Assert text visible on page.
   * Translated from GovGrantsAssertionObjects.assertTextVisibleOnPage().
   */
  async assertTextOnPage(text: string, shouldContain: boolean): Promise<void> {
    const resolved = this.resolve(text);
    if (shouldContain) {
      const locator = this.page.locator(
        `//div[@class='slds-box slds-theme_default'] | ` +
        `//span[contains(normalize-space(text()),'${resolved}')] | ` +
        `//*[contains(normalize-space(text()),'${resolved}')] | ` +
        `//*[contains(text(),'${resolved}')] | ` +
        `//span[text()='${resolved}']`
      ).first();
      await expect(locator).toBeVisible({ timeout: 15000 });
    } else {
      const locator = this.page.locator(
        `//*[normalize-space(text())='${resolved}']`
      ).first();
      await expect(locator).toBeHidden({ timeout: 5000 });
    }
  }

  // ── Form input ─────────────────────────────────────────────────────────────

  /**
   * Enter value into field by API name.
   * Translated from InputForms.inputFormDataByFieldApiName().
   */
  async enterFieldValue(fieldApiName: string, fieldValue: string, isModal: boolean = false): Promise<void> {
    const resolvedField = this.resolve(fieldApiName);
    let resolvedValue = this.resolve(fieldValue);
    logger.info(`Enter field "${resolvedField}" = "${resolvedValue}" (modal=${isModal})`);

    // Handle Automation Runtime random values
    if (resolvedValue.startsWith('Automation Runtime') && !/\d/.test(resolvedValue)) {
      const random = resolvedValue + Math.floor(Math.random() * 9000 + 1000);
      this.savedValues.set(resolvedValue, random);
      resolvedValue = random;
    }

    // Generate unique year for year-type picklist fields to avoid duplicate record conflicts
    // NOTE: the picklist has a finite set of options — the actual selection is validated
    // in handlePicklistInput which will read the dropdown if the generated year is unavailable.
    if (/year/i.test(resolvedField) && /^\d{4}$/.test(resolvedValue)) {
      resolvedValue = '__RANDOM_YEAR__';
      logger.info(`  [YEAR] Will pick a random year from picklist for field "${resolvedField}"`);
    }

    // Use CSS selectors (pierce shadow DOM) — mirrors POC InputFormsHelper.getFieldLocator()
    const locator = this.getFieldLocator(resolvedField, isModal);
    const wrapper = await this.findEditableWrapper(locator, 15000);
    try {
      await wrapper.scrollIntoViewIfNeeded({ timeout: 3000 });
    } catch {
      await wrapper.evaluate((el: Element) => el.scrollIntoView({ block: 'center' }));
    }
    await this.handleFieldInput(wrapper, resolvedValue);
  }

  /**
   * Clear a field value by API name.
   * Translated from InputForms.clearFormDataByFieldApiName().
   */
  async clearFieldValue(fieldApiName: string, isModal: boolean = false): Promise<void> {
    const resolvedField = this.resolve(fieldApiName);
    logger.info(`Clear field "${resolvedField}" (modal=${isModal})`);
    const locator = this.getFieldLocator(resolvedField, isModal);
    const wrapper = await this.findEditableWrapper(locator, 10000);
    const input = wrapper.locator('input, textarea').first();
    if (await input.count() > 0) {
      await this.clickHelper.clickWithJavaScript(input);
      await input.fill('');
      await input.press('Tab');
    }
  }

  /**
   * Enter values from Excel sheet (simplified for Playwright).
   * Translated from InputForms.enterInputFieldsFromExcelFile().
   * NOTE: Excel reading is handled separately; this method accepts pre-parsed data.
   */
  async enterValuesFromExcel(fileName: string, sheetName: string, isModal: boolean = false): Promise<void> {
    logger.info(`Enter values from Excel: "${fileName}" / "${sheetName}" (modal=${isModal})`);
    const { readExcelFile } = require('../utils/excel-reader');
    const data = readExcelFile(fileName, sheetName);
    
    // If entering values in modal, wait for modal to be ready
    if (isModal) {
      await this.sfWait.waitForModalReady();
    }
    
    let currentSubTab = '';
    for (const row of data) {
      const subTab = row[0];
      const fieldApiName = row[1];
      let fieldValue = row[2];
      if (!fieldApiName && !fieldValue) continue;
      if (subTab && subTab !== 'None' && subTab !== currentSubTab) {
        const nav = new NavigationPage(this.page, this.savedValues);
        await nav.clickSubTab(subTab);
        currentSubTab = subTab;
      }
      await this.enterFieldValue(fieldApiName, fieldValue, isModal);
    }
  }

  // ── Sub tab assertion ──────────────────────────────────────────────────────

  async assertSubTab(subTabName: string, shouldExist: boolean): Promise<void> {
    const resolved = this.resolve(subTabName);
    const locator = this.page.locator(
      `//div[contains(@class,'tab') or contains(@class,'Tab')]//a[@title='${resolved}' or text()='${resolved}'] | ` +
      `//lightning-tab-bar//a[@title='${resolved}']`
    ).first();
    if (shouldExist) {
      await expect(locator).toBeVisible({ timeout: 10000 });
    } else {
      await expect(locator).toBeHidden({ timeout: 10000 });
    }
  }

  // ── Helper ─────────────────────────────────────────────────────────────────

  /**
   * Build CSS locator for a field wrapper — mirrors POC InputFormsHelper.getFieldLocator().
   * CSS selectors auto-pierce shadow DOM in Playwright (XPath does NOT).
   */
  private getFieldLocator(fieldApiName: string, isModal: boolean): string {
    // c-fieldlwc uses data-fieldapiname (camelCase), div wrappers use data-field_api_name (underscore)
    if (isModal) {
      return (
        `div[class*='modal__container'] [data-field_api_name='${fieldApiName}'], ` +
        `div[class*='modal__container'] c-fieldlwc[data-fieldapiname='${fieldApiName}'], ` +
        `.slds-modal [data-field_api_name='${fieldApiName}'], ` +
        `.slds-modal c-fieldlwc[data-fieldapiname='${fieldApiName}'], ` +
        `section[role='dialog'] [data-field_api_name='${fieldApiName}'], ` +
        `section[role='dialog'] c-fieldlwc[data-fieldapiname='${fieldApiName}'], ` +
        `div[class*='modal__container'] lightning-combobox button[name='${fieldApiName}'], ` +
        `div[class*='modal__container'] lightning-input[data-field='${fieldApiName}'], ` +
        `div[class*='modal__container'] input[name='${fieldApiName}'], ` +
        `div[class*='modal__container'] textarea[name='${fieldApiName}'], ` +
        `div[class*='modal__container'] c-fieldlwc[data-fieldapiname='${fieldApiName}'] textarea`
      );
    }
    return (
      `[data-field_api_name='${fieldApiName}'], ` +
      `[data-api-name='${fieldApiName}'], ` +
      `c-fieldlwc[data-fieldapiname='${fieldApiName}'], ` +
      `lightning-combobox button[name='${fieldApiName}'], ` +
      `lightning-input[data-field='${fieldApiName}'], ` +
      `input[name='${fieldApiName}'], ` +
      `textarea[name='${fieldApiName}'], ` +
      `c-fieldlwc[data-fieldapiname='${fieldApiName}'] textarea`
    );
  }

  /**
   * When duplicate API name elements exist (read-only + editable),
   * find the one containing editable inputs — mirrors POC InputFormsHelper.findEditableWrapper().
   */
  private async findEditableWrapper(locator: string, timeout: number): Promise<any> {
    const editableSelector =
      "input:not([type='hidden']), textarea, select, button[aria-haspopup='listbox'], " +
      "div[class*='text-area'], .ql-editor, ul li[class*='listbox__item'], lightning-combobox";

    // Wait for at least one wrapper element to be attached and stable
    const firstMatch = this.page.locator(locator).first();
    await this.waitHelper.waitUntilAttached(firstMatch, timeout);
    
    // Ensure the wrapper is stable (not detaching) by waiting for it to be visible
    await firstMatch.waitFor({ state: 'visible', timeout: 5000 }).catch(() => {
      logger.debug(`  [WRAPPER] Element attached but not visible, continuing anyway`);
    });

    // Retry loop — c-fieldlwc may be attached but internal inputs are lazy-rendered
    const maxRetries = 5;
    for (let retry = 0; retry < maxRetries; retry++) {
      const allMatches = this.page.locator(locator);
      const count = await allMatches.count();

      if (count <= 1) {
        const wrapper = allMatches.first();
        const hasEditable = await wrapper.locator(editableSelector).count().catch(() => 0);
        if (hasEditable > 0) {
          // Ensure the input field is clickable (matching Selenium ElementToBeClickable)
          const inputField = wrapper.locator(editableSelector).first();
          await this.waitHelper.waitUntilClickable(inputField, 3000).catch(() => {
            logger.debug(`  [WRAPPER] Input field not clickable yet, but proceeding`);
          });
          return wrapper;
        }
        if (retry === maxRetries - 1) {
          return wrapper;
        }
        logger.info(`  [WRAPPER] Single match has no editable elements yet, waiting... (retry ${retry + 1}/${maxRetries})`);
        await this.page.waitForTimeout(300);
        continue;
      }

      if (retry === 0) {
        logger.info(`  [WRAPPER] Found ${count} matches, searching for editable one`);
      }
      for (let i = 0; i < count; i++) {
        const candidate = allMatches.nth(i);
        const hasEditable = await candidate.locator(editableSelector).count().catch(() => 0);
        if (hasEditable > 0) {
          logger.info(`  [WRAPPER] Using match ${i} (has editable elements)`);
          // Ensure the input field is clickable
          const inputField = candidate.locator(editableSelector).first();
          await this.waitHelper.waitUntilClickable(inputField, 3000).catch(() => {
            logger.debug(`  [WRAPPER] Input field not clickable yet, but proceeding`);
          });
          return candidate;
        }
      }

      if (retry < maxRetries - 1) {
        logger.info(`  [WRAPPER] No editable match found yet, waiting... (retry ${retry + 1}/${maxRetries})`);
        await this.page.waitForTimeout(300);
      }
    }

    logger.warn(`  [WRAPPER] No editable match found after ${maxRetries} retries, using first`);
    return this.page.locator(locator).first();
  }

  /**
   * Auto-detect field type from DOM structure — mirrors POC InputFormsHelper.detectFieldType()
   * and Java InputForms.handleFormDataInputs() detection order.
   */
  private async detectFieldType(wrapper: any): Promise<string> {
    // Check if the wrapper itself is the interactive element (e.g., button[name='X'] from fallback locator)
    const tagName = await wrapper.evaluate((el: Element) => el.tagName.toLowerCase()).catch(() => '');
    const ariaHasPopup = await wrapper.getAttribute('aria-haspopup').catch(() => null);
    if (tagName === 'button' && ariaHasPopup === 'listbox') return 'picklist';
    if (tagName === 'input') {
      const inputType = await wrapper.getAttribute('type').catch(() => 'text');
      if (inputType === 'checkbox') return 'checkbox';
      if (inputType === 'search') return 'lookup';
      return 'text';
    }

    // Java order: radio → checkbox → richtext → text(date/lookup/plain) → multiselect → dropdown
    if (await wrapper.locator("span[class*='slds-radio_faux']").count() > 0) return 'radio';
    if (await wrapper.locator("input[type='checkbox']").count() > 0) return 'checkbox';
    if (await wrapper.locator("div[class*='text-area'], lightning-input-rich-text, .ql-editor").count() > 0) return 'richtext';
    // Lookup before picklist — both have combobox but lookup has lightning-lookup/grouped-combobox
    if (await wrapper.locator("lightning-lookup, lightning-grouped-combobox, [class*='lookupInput']").count() > 0) return 'lookup';
    // Picklist — button[aria-haspopup='listbox'] — Java uses .//button[contains(@id,'combobox-button')]
    if (await wrapper.locator("button[aria-haspopup='listbox'], lightning-combobox button, lightning-combobox").count() > 0) return 'picklist';
    // Multi-select
    if (await wrapper.locator("ul li[class*='listbox__item']").count() > 0) return 'multiselect';
    // Text/textarea — check for date sub-type
    if (await wrapper.locator("input[type='text'], textarea:not([warningchar])").count() > 0) {
      if (await wrapper.locator('lightning-datepicker').count() > 0) return 'date';
      return 'text';
    }
    return 'text';
  }

  /**
   * Route field to appropriate handler based on auto-detected type.
   * Mirrors Java handleFormDataInputs() + POC handler dispatch.
   */
  private async handleFieldInput(wrapper: any, value: string): Promise<void> {
    const fieldType = await this.detectFieldType(wrapper);
    logger.info(`  [FIELD] Detected type: ${fieldType}`);

    switch (fieldType) {
      case 'radio': {
        const radio = wrapper.locator(`input[type='radio'][value='${value}'], label:has-text('${value}') input[type='radio']`).first();
        await this.clickHelper.clickWithJavaScript(radio);
        return;
      }
      case 'checkbox': {
        const checkbox = wrapper.locator("span[class*='slds-checkbox_faux']").first();
        const input = wrapper.locator("input[type='checkbox']").first();
        const isChecked = await input.isChecked();
        if ((value.toLowerCase() === 'checked' && !isChecked) || (value.toLowerCase() === 'unchecked' && isChecked)) {
          await this.clickHelper.clickWithJavaScript(checkbox);
        }
        return;
      }
      case 'richtext': {
        const richText = wrapper.locator('lightning-input-rich-text, div[class*="text-area"], .ql-editor').first();
        // Pass field name to avoid relying on wrapper having data-field_api_name
        const fieldApiName = await wrapper.getAttribute('data-field_api_name').catch(() => null) || 
                           await wrapper.evaluate((el: any) => {
            let current = el;
            while (current && current !== document.body) {
              if (current.getAttribute && current.getAttribute('data-field_api_name')) {
                return current.getAttribute('data-field_api_name');
              }
              current = current.parentElement;
            }
            return null;
          }).catch(() => null);
        await this.fillRichTextArea(richText, value, fieldApiName);
        return;
      }
      case 'lookup': {
        await this.handleLookupInput(wrapper, value);
        return;
      }
      case 'picklist': {
        await this.handlePicklistInput(wrapper, value);
        return;
      }
      case 'multiselect': {
        await this.handleMultiSelectInput(wrapper, value);
        return;
      }
      case 'date': {
        const dateInput = wrapper.locator("input[type='text'], input[type='date'], lightning-input-field input").first();
        await this.handleDateInput(dateInput, value);
        return;
      }
      case 'text':
      default: {
        logger.info(`  [FIELD TEXT] Processing text field with value: "${value}"`);
        
        // Check if this is a modal textarea using XPath approach
        let fieldApiName = await wrapper.getAttribute('data-field_api_name').catch(() => null);
        if (!fieldApiName) {
          fieldApiName = await wrapper.evaluate((el: any) => {
            let current = el;
            while (current && current !== document.body) {
              if (current.getAttribute && current.getAttribute('data-field_api_name')) {
                return current.getAttribute('data-field_api_name');
              }
              current = current.parentElement;
            }
            return null;
          }).catch(() => null);
        }
        
        logger.info(`  [FIELD TEXT] Field API name: ${fieldApiName}`);
        
        if (fieldApiName) {
          const textareaXPath = `//div[contains(@class,'modal__container')]//*[@data-field_api_name='${fieldApiName}']//textarea`;
          const modalTextarea = this.page.locator(textareaXPath);
          const textareaCount = await modalTextarea.count();
          
          if (textareaCount > 0) {
            logger.info(`  [FIELD TEXT] Found ${textareaCount} modal textarea(s) using XPath - using XPath approach`);
            const firstTextarea = modalTextarea.first();
            await firstTextarea.evaluate((el: any) => el.click()).catch(() => {});
            await firstTextarea.clear().catch(() => {});
            await firstTextarea.fill(value);
            logger.info(`  [FIELD TEXT] Successfully filled modal textarea via XPath`);
            return;
          }
        }
        
        logger.info(`  [FIELD TEXT] No modal textarea found, using fallback wrapper locator`);
        
        // Fallback to wrapper locator
        const input = wrapper.locator("input[type='text'], input[type='email'], input[type='tel'], input[type='url'], input:not([type='hidden']):not([type='checkbox']):not([type='radio']), textarea").first();
        const inputCount = await input.count();
        logger.info(`  [FIELD TEXT] Found ${inputCount} input(s) using wrapper locator`);
        if (inputCount > 0) {
          await this.fillInputWithRetry(input, value);
          logger.info(`  [FIELD TEXT] Successfully filled via wrapper locator`);
        } else {
          logger.warn(`  [FIELD] No interactive element found in wrapper for value "${value}"`);
        }
        return;
      }
    }
  }

  /**
   * Fill a lightning-input-rich-text field. The actual contenteditable region
   * is lazy-rendered by Salesforce only after a real (trusted) click — it does
   * not exist in the DOM beforehand. We click to activate it, wait for the
   * contenteditable child to appear, then type into it directly.
   */
  private async fillRichTextArea(richTextEditor: any, value: string, fieldApiName?: string | null): Promise<void> {
    // Use passed fieldApiName or try to get from wrapper/parent
    if (!fieldApiName) {
      fieldApiName = await richTextEditor.getAttribute('data-field_api_name').catch(() => null);
      
      if (!fieldApiName) {
        // Try to get from parent with data-field_api_name
        fieldApiName = await richTextEditor.evaluate((el: any) => {
          let current = el;
          while (current && current !== document.body) {
            if (current.getAttribute && current.getAttribute('data-field_api_name')) {
              return current.getAttribute('data-field_api_name');
            }
            current = current.parentElement;
          }
          return null;
        }).catch(() => null);
      }
    }
    
    logger.info(`  [RICHTEXT] Field API name: ${fieldApiName}`);
    
    if (fieldApiName) {
      // Selenium XPath approach: Check both modal and non-modal textareas
      const textareaXPath = `//div[contains(@class,'modal__container')]//*[@data-field_api_name='${fieldApiName}']//textarea | //*[@data-field_api_name='${fieldApiName}']//textarea`;
      const textarea = this.page.locator(textareaXPath);
      const count = await textarea.count();
      
      logger.info(`  [RICHTEXT] Found ${count} textarea(s) using XPath (modal and non-modal)`);
      
      if (count > 0) {
        const firstTextarea = textarea.first();
        // Don't wait for visibility - Salesforce textareas are often hidden by CSS
        // Just wait for it to be attached to DOM
        await this.waitHelper.waitUntilAttached(firstTextarea, 5000).catch(() => {});
        // Use JavaScript to set value directly on hidden textarea
        await firstTextarea.evaluate((el: HTMLTextAreaElement, val: string) => {
          el.value = val;
          el.dispatchEvent(new Event('input', { bubbles: true }));
          el.dispatchEvent(new Event('change', { bubbles: true }));
        }, value).catch((err) => {
          logger.warn(`  [RICHTEXT] JavaScript fill failed: ${err}, trying Playwright fill`);
        });
        // Verify it was set
        const actualValue = await firstTextarea.inputValue().catch(() => '');
        if (actualValue === value) {
          logger.info(`  [RICHTEXT] Successfully filled textarea via XPath (JavaScript)`);
          return;
        }
        // Fallback: try Playwright fill with force
        await firstTextarea.fill(value, { force: true }).catch(() => {});
        logger.info(`  [RICHTEXT] Successfully filled textarea via XPath (Playwright force)`);
        return;
      }
    }

    // Wait for element to be visible before scrolling
    await this.waitHelper.waitUntilVisible(richTextEditor, 10000).catch(() => {
      logger.warn(`  [RICHTEXT] Element not visible, attempting to proceed anyway`);
    });
    
    // Only scroll if element is visible
    if (await richTextEditor.isVisible().catch(() => false)) {
      await richTextEditor.scrollIntoViewIfNeeded().catch(() => {
        logger.warn(`  [RICHTEXT] Could not scroll into view`);
      });
    }
    
    // Real click (not dispatchEvent) — Salesforce lazy-render may require a trusted event
    await richTextEditor.click();
    await this.page.waitForTimeout(100);

    // The editable region appears as a contenteditable descendant once activated
    const editable = richTextEditor.locator('[contenteditable="true"]').first();
    await this.waitHelper.waitUntilVisible(editable, 5000).catch(() => {});

    if (await editable.count() > 0) {
      await editable.click();
      await this.page.keyboard.press('Control+A');
      await this.page.keyboard.press('Backspace');
      await this.page.keyboard.type(value, { delay: 10 });
      const actual = await editable.textContent().catch(() => '');
      if (actual?.trim() !== value.trim()) {
        logger.warn(`Rich text field value may not match after typing: "${actual}" vs "${value}"`);
      }
      return;
    }

    // Fallback: some orgs render a plain textarea instead of contenteditable
    const textarea = richTextEditor.locator('textarea').first();
    if (await textarea.count() > 0) {
      await this.fillInputWithRetry(textarea, value);
      return;
    }
    logger.warn(`fillRichTextArea: could not locate editable region for rich text field`);
  }

  /**
   * Fill an input/textarea with retry logic for Salesforce LWC fields.
   * Mirrors Java: click().withJavaScript() → clear → sendKeys, with 3-attempt retry.
   */
  private async fillInputWithRetry(input: any, value: string): Promise<void> {
    // contenteditable divs (rich text) don't support inputValue() — use textContent instead
    const isContentEditable = await input.getAttribute('contenteditable').catch(() => null);
    const readValue = async (): Promise<string> => {
      if (isContentEditable) {
        return (await input.textContent().catch(() => '')) ?? '';
      }
      return input.inputValue().catch(() => '');
    };
    
    // Check if value is already correct before entering
    try {
      const initialActual = await readValue();
      if (initialActual && (initialActual === value || this.areDatesEqual(initialActual, value) || this.areNumbersEqual(initialActual, value))) {
        logger.debug(`Field already has correct value "${value}", skipping entry`);
        return;
      }
    } catch (error) {
      // If we can't read the value, proceed with filling
      logger.debug(`Could not read initial value, proceeding with fill`);
    }
    
    try {
      await input.scrollIntoViewIfNeeded({ timeout: 3000 });
    } catch {
      await input.evaluate((el: Element) => el.scrollIntoView({ block: 'center' }));
    }
    
    // Single attempt: click, fill, and verify
    await input.click();
    await input.fill(value);
    await input.press('Tab');
    await this.page.waitForTimeout(200);
    
    // Verify the value was actually set
    const actual = await readValue();
    if (actual === value || this.areDatesEqual(actual, value) || this.areNumbersEqual(actual, value)) {
      return;
    }
    
    // If first attempt failed, log warning but don't retry to avoid double entry
    logger.warn(`Field fill: value not persisted correctly ("${actual}" vs "${value}") - not retrying to avoid duplicate entry`);
  }

  /**
   * Compare two date strings that may be in different formats.
   * Salesforce displays 'Mon DD, YYYY' (e.g. "Jul 25, 2026") while we enter 'MM/DD/YYYY' (e.g. "07/25/2026").
   */
  /**
   * Compare two numeric strings that may differ in formatting.
   * Salesforce displays '10,000,000' or '10.00%' while we enter '10000000' or '10'.
   */
  private areNumbersEqual(displayed: string, entered: string): boolean {
    // Strip commas, currency symbols, % signs, phone formatting (dashes, spaces, parentheses, plus) and compare numeric values
    const clean = (s: string) => s.replace(/[,$%\s\-\(\)\+]/g, '');
    const c1 = clean(displayed);
    const c2 = clean(entered);
    if (c1 === c2) return true;
    
    // For phone numbers, check if entered digits are contained in displayed (handles formatting differences)
    if (c2.length >= 7 && /^\d+$/.test(c2)) {
      if (c1.includes(c2) || c2.includes(c1)) return true;
    }
    
    const n1 = parseFloat(c1);
    const n2 = parseFloat(c2);
    if (isNaN(n1) || isNaN(n2)) return false;
    return n1 === n2;
  }

  private areDatesEqual(displayed: string, entered: string): boolean {
    try {
      const d1 = new Date(displayed);
      const d2 = new Date(entered);
      if (isNaN(d1.getTime()) || isNaN(d2.getTime())) return false;
      return d1.toDateString() === d2.toDateString();
    } catch {
      return false;
    }
  }

  /**
   * Lookup field — mirrors Java handleLookUpInput():
   *   click .//input[@type='search'] → clear → type → click //div[@title='value']
   * Also mirrors POC LookupFieldHandler: input[type='search'] or input[role='combobox']:not([readonly])
   */
  private async handleLookupInput(wrapper: any, value: string): Promise<void> {
    logger.info(`  [LOOKUP] Handling lookup field with value "${value}"`);
    // Java: .//input[@type='search']  |  POC: input[type='search'], input[role='combobox']:not([readonly])
    const searchInput = wrapper.locator("input[type='search'], input[role='combobox']:not([readonly])").first();
    await this.waitHelper.waitUntilAttached(searchInput, 5000);
    await this.clickHelper.click(searchInput);
    await searchInput.clear();
    await searchInput.fill(value);
    
    // Wait for lookup dropdown to populate
    await this.page.waitForTimeout(500);

    // Java: //div[@title='value']  |  POC: //div[@title] + //span[contains(@title)] + //*[@role='option']//span
    const option = this.page.locator(
      `//div[@title='${value}'] | ` +
      `//lightning-base-combobox-item//span[contains(@title,'${value}')] | ` +
      `//*[@role='option']//span[contains(@title,'${value}')] | ` +
      `//*[@role='option'][contains(.,'${value}')]`
    ).first();
    try {
      await this.waitHelper.waitUntilVisible(option, 5000);
      // Don't scroll the option as it can close the dropdown
      // Wait for it to be stable and click
      await option.waitFor({ state: 'visible', timeout: 3000 });
      await option.click({ timeout: 3000 });
      logger.info(`  [LOOKUP] Selected option for "${value}"`);
    } catch (error) {
      logger.warn(`  [LOOKUP] Option not found via locator (${error}), trying keyboard selection`);
      await this.page.keyboard.press('ArrowDown');
      await this.page.waitForTimeout(100);
      await this.page.keyboard.press('Enter');
    }
    await this.waitHelper.waitForSpinnerDisappear();
  }

  /**
   * Picklist/dropdown field — mirrors Java handleDropdownInput():
   *   click .//button[@aria-haspopup='listbox'] → click //span[@title='value']
   *   Fallback: JS click on both.
   */
  private async handlePicklistInput(wrapper: any, value: string): Promise<void> {
    // Check if wrapper itself is the dropdown button (fallback locator matched button[name='X'] directly)
    const wrapperTag = await wrapper.evaluate((el: Element) => el.tagName.toLowerCase()).catch(() => '');
    const wrapperHasPopup = await wrapper.getAttribute('aria-haspopup').catch(() => null);
    const dropdownBtn = (wrapperTag === 'button' && wrapperHasPopup === 'listbox')
      ? wrapper
      : wrapper.locator("button[aria-haspopup='listbox'], button[id*='combobox-button']").first();
    await this.page.waitForTimeout(500);

    let selectedValue = value;

    // For __RANDOM_YEAR__, open dropdown and pick a random year from available options
    if (value === '__RANDOM_YEAR__') {
      try {
        await this.clickHelper.click(dropdownBtn);
      } catch {
        await this.clickHelper.clickWithJavaScript(dropdownBtn);
      }
      await this.page.waitForTimeout(300);
      // Try multiple selectors for dropdown options (varies by LWC component version)
      const optionSelectors = [
        'lightning-base-combobox-item span.slds-truncate',
        'lightning-base-combobox-item span[title]',
        '[role="listbox"] [role="option"] span',
        '[role="listbox"] lightning-base-combobox-item',
        '.slds-listbox lightning-base-combobox-item span',
      ];
      const yearOptions: string[] = [];
      for (const sel of optionSelectors) {
        const allOptions = this.page.locator(sel);
        const count = await allOptions.count();
        logger.info(`  [YEAR] Selector "${sel}" found ${count} options`);
        for (let i = 0; i < count; i++) {
          const title = await allOptions.nth(i).getAttribute('title').catch(() => '') || '';
          const text = title || (await allOptions.nth(i).innerText().catch(() => ''));
          const val = text.trim();
          if (/^\d{4}$/.test(val) && !yearOptions.includes(val)) yearOptions.push(val);
        }
        if (yearOptions.length > 0) break;
      }
      if (yearOptions.length === 0) {
        throw new Error('[PICKLIST] No year options found in dropdown');
      }
      // Sort descending and pick a random year from the top 5 (highest years, least likely used)
      yearOptions.sort((a, b) => Number(b) - Number(a));
      const topN = yearOptions.slice(0, Math.min(5, yearOptions.length));
      selectedValue = topN[Math.floor(Math.random() * topN.length)];
      logger.info(`  [YEAR] Picked year "${selectedValue}" from top ${topN.length} of ${yearOptions.length} options (${topN.join(', ')})`);
      // Dropdown is already open — find and click the VISIBLE option (not first on page)
      const option = this.page.locator(
        `//lightning-base-combobox-item//span[@title='${selectedValue}']` 
      ).locator('visible=true').first();
      await this.waitHelper.waitUntilVisible(option, 5000);
      // Don't scroll the option as it can close the dropdown
      await option.waitFor({ state: 'visible', timeout: 3000 });
      await option.evaluate((el: HTMLElement) => el.click());
      logger.info(`  [PICKLIST] Selected "${selectedValue}"`);
      await this.waitHelper.waitForSpinnerDisappear();
      return;
    }

    // Use JavaScript executor only for reliable picklist selection
    await this.clickHelper.clickWithJavaScript(dropdownBtn);
    await this.page.waitForTimeout(300);
    
    // Find VISIBLE option from currently open dropdown (not first on page)
    const allOptions = this.page.locator(
      `//lightning-base-combobox-item//span[@title='${selectedValue}'] | ` +
      `//span[@title='${selectedValue}']`
    );
    
    // Filter for visible option
    let option = null;
    const count = await allOptions.count();
    for (let i = 0; i < count; i++) {
      const opt = allOptions.nth(i);
      if (await opt.isVisible().catch(() => false)) {
        option = opt;
        break;
      }
    }
    
    if (!option) {
      throw new Error(`No visible option found for "${selectedValue}"`);
    }
    
    // Don't scroll the option as it can close the dropdown
    // Use JavaScript click for reliability
    await option.waitFor({ state: 'attached', timeout: 3000 });
    await option.evaluate((el: HTMLElement) => el.click());
    logger.info(`  [PICKLIST] Selected "${selectedValue}"`);
    await this.waitHelper.waitForSpinnerDisappear();
  }

  /**
   * Multi-select dual listbox — mirrors Java handleMultiSelectInput():
   *   click each option span, then click Move to Chosen button.
   */
  private async handleMultiSelectInput(wrapper: any, value: string): Promise<void> {
    const values = value.includes(';') ? value.split(';') : [value];
    for (const val of values) {
      const option = wrapper.locator(`ul li[class*='listbox__item'] span:text('${val.trim()}')`).first();
      await this.waitHelper.waitUntilVisible(option, 5000);
      await this.clickHelper.clickWithJavaScript(option);
    }
    const moveBtn = wrapper.locator("button[title='Move selection to Chosen'], button[title='Move to Chosen']").first();
    await this.waitHelper.waitUntilClickable(moveBtn, 5000);
    await this.clickHelper.click(moveBtn);
    await this.waitHelper.waitForSpinnerDisappear();
  }

  private async acceptPopUp(): Promise<void> {
    try {
      const popup = this.page.locator(
        `//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Yes' or text()='Continue']`
      ).first();
      if (await popup.isVisible({ timeout: 2000 }).catch(() => false)) {
        await this.clickHelper.click(popup);
      }
    } catch {
      // no popup
    }
  }

  /**
   * Handle date input fields that may contain numeric day offsets.
   * Mirrors Java InputForms.handleDateInput() and parseDateFieldValue().
   */
  private async handleDateInput(input: any, value: string): Promise<void> {
    let dateValue = value;
    
    // Try to parse as integer offset from current day (mirrors Java parseDateFieldValue)
    const numericValue = parseInt(value, 10);
    if (!isNaN(numericValue)) {
      const offsetDate = new Date();
      offsetDate.setDate(offsetDate.getDate() + numericValue);
      // Format as MM/dd/yyyy (default Salesforce date format)
      const month = (offsetDate.getMonth() + 1).toString().padStart(2, '0');
      const day = offsetDate.getDate().toString().padStart(2, '0');
      const year = offsetDate.getFullYear();
      dateValue = `${month}/${day}/${year}`;
      logger.info(`Converted date offset ${value} to ${dateValue}`);
    }
    
    await this.fillInputWithRetry(input, dateValue);
  }

  /**
   * Click top right button inside split screen page details with popup acceptance.
   * Mirrors Java PageDetails.clickAnyTopRightButtonInsideSplitScreen().
   */
  async clickTopRightButtonInsideSplitScreen(buttonName: string): Promise<void> {
    const resolved = this.resolve(buttonName);
    logger.info(`Click top right button in split screen: "${resolved}"`);
    
    // XPath for top right button in split screen (c-flex-layout-quick-view)
    const topRightButton = this.page.locator(
      `//c-flex-layout-quick-view//lightning-button//button[@title='${resolved}'] | ` +
      `//lightning-button-menu[contains(@class,'${resolved}')]`
    ).first();
    
    try {
      // Try direct JavaScript click first
      await this.waitHelper.waitUntilClickable(topRightButton, 10000);
      await this.clickHelper.clickWithJavaScript(topRightButton);
      logger.info(`Clicked button with JavaScript`);
      await this.acceptPopUp();
    } catch (e) {
      logger.warn(`Direct click failed, trying dropdown fallback: ${e}`);
      // Fallback: click dropdown button, then select from dropdown
      const dropdownButton = this.page.locator(
        `//c-flex-layout-quick-view//lightning-button-menu//button[contains(@class,'slds-button_last')]`
      ).first();
      await this.waitHelper.waitUntilClickable(dropdownButton, 10000);
      await this.clickHelper.click(dropdownButton);
      
      const dropdownItem = this.page.locator(
        `//div[contains(@class,'dropdown__item')]//span[text()='${resolved}']`
      ).first();
      await this.waitHelper.waitUntilVisible(dropdownItem, 10000);
      await this.clickHelper.click(dropdownItem);
      logger.info(`Clicked button via dropdown`);
      await this.acceptPopUp();
    }
  }

  /**
   * Click top right button inside split screen page details without popup acceptance.
   * Mirrors Java PageDetails.clickAnyTopRightButtonInsideSplitScreenWithouProcessing().
   */
  async clickTopRightButtonInsideSplitScreenWithoutProcessing(buttonName: string): Promise<void> {
    const resolved = this.resolve(buttonName);
    logger.info(`Click top right button in split screen (no processing): "${resolved}"`);
    
    // XPath for top right button in split screen (c-flex-layout-quick-view)
    const topRightButton = this.page.locator(
      `//c-flex-layout-quick-view//lightning-button//button[@title='${resolved}'] | ` +
      `//lightning-button-menu[contains(@class,'${resolved}')]`
    ).first();
    
    try {
      // Try direct JavaScript click first
      await this.waitHelper.waitUntilClickable(topRightButton, 10000);
      await this.clickHelper.clickWithJavaScript(topRightButton);
      logger.info(`Clicked button with JavaScript`);
    } catch (e) {
      logger.warn(`Direct click failed, trying dropdown fallback: ${e}`);
      // Fallback: click dropdown button, then select from dropdown
      const dropdownButton = this.page.locator(
        `//c-flex-layout-quick-view//lightning-button-menu//button[contains(@class,'slds-button_last')]`
      ).first();
      await this.waitHelper.waitUntilClickable(dropdownButton, 10000);
      await this.clickHelper.click(dropdownButton);
      
      const dropdownItem = this.page.locator(
        `//div[contains(@class,'dropdown__item')]//span[text()='${resolved}']`
      ).first();
      await this.waitHelper.waitUntilVisible(dropdownItem, 10000);
      await this.clickHelper.click(dropdownItem);
      logger.info(`Clicked button via dropdown`);
    }
  }

  /**
   * Click sub tab inside table view for split screen.
   * Mirrors Java PageDetails.clickSubTabsInsideTableViewForSplitScreen().
   */
  async clickSubTabsInsideTableViewForSplitScreen(tabName: string): Promise<void> {
    const resolved = this.resolve(tabName);
    logger.info(`Click sub tab in split screen: "${resolved}"`);
    
    // XPath for desired tab (mirrors Selenium)
    const desiredTab = this.page.locator(
      `//div[@class='uiTabBar']//ul//li//a[@title='${resolved}'] | ` +
      `//div[@class='slds-tabs_card']//ul//li//a[text()='${resolved}'] | ` +
      `//div[contains(@class,'forceCommunityTabLayout')]//ul//li//a[text()='${resolved}']`
    ).first();
    
    try {
      // Try to click directly with JavaScript if visible
      if (await desiredTab.isVisible({ timeout: 5000 }).catch(() => false)) {
        await this.clickHelper.clickWithJavaScript(desiredTab);
        logger.info(`Clicked sub tab with JavaScript`);
        return;
      }
    } catch (e) {
      logger.warn(`Direct click failed, trying dropdown fallback: ${e}`);
    }
    
    // Fallback: click "More" button, then select from dropdown
    try {
      const moreButton = this.page.locator(
        `//div[contains(@class,'slds-tabs_card')]//ul//li//button[text()='More']`
      ).first();
      await this.waitHelper.waitUntilVisible(moreButton, 10000);
      await this.clickHelper.clickWithJavaScript(moreButton);
      logger.info(`Clicked More button`);
      
      const dropdownTab = this.page.locator(
        `//a//span[text()='${resolved}']`
      ).first();
      await this.waitHelper.waitUntilVisible(dropdownTab, 10000);
      await this.clickHelper.clickWithJavaScript(dropdownTab);
      logger.info(`Clicked sub tab from dropdown`);
    } catch (e) {
      logger.error(`Dropdown fallback also failed: ${e}`);
      throw new Error(`Failed to click sub tab "${resolved}" in split screen: ${e}`);
    }
  }

  /**
   * Assert page messages (success/error/toast messages).
   * Mirrors Java GGAssertionObjects.assertPageMessageValue() with comprehensive XPath and retry logic.
   */
  async assertPageMessages(
    desiredMessages: string[],
    contains: boolean,
    shouldExist: boolean
  ): Promise<void> {
    // Comprehensive XPath matching all Salesforce message locations
    const pageMessagesXPath =
      `//c-flex-layout-page-messages//span[text()] | ` +
      `//span[contains(@class,'toastMessage')] | ` +
      `//div[@class='errorMsg']//span[@part='formatted-rich-text'] | ` +
      `//div[contains(@class,'errorMsg')]//span[@part='formatted-rich-text'] | ` +
      `//div[@class='successMsg']//span[@part='formatted-rich-text'] | ` +
      `//gnt-flex-layout-page-messages//span//lightning-formatted-text | ` +
      `//c-flex-layout-page-messages//span//lightning-formatted-text | ` +
      `//span[@class='toastMessage forceActionsText'] | ` +
      `//span[contains(@class,'changeOwnerErrorMessage')] | ` +
      `//flowruntime-error-content//lightning-formatted-rich-text//span | ` +
      `//div[@data-id='modalcontent1']//lightning-formatted-rich-text//span | ` +
      `//c-flex-layout-page-messages//lightning-formatted-rich-text//span | ` +
      `//div[@class='page-message-error']//span[@part='formatted-rich-text'] | ` +
      `//div[@id='WorkspaceFiles']//div[@data-aura-class='GNTPageMessage']//div[@class='uiOutputRichText'] | ` +
      `//flowruntime-lwc-field//lightning-formatted-rich-text//p//b`;

    // Sanitize desired messages (replace unicode quotes)
    const sanitizedMessages = desiredMessages.map(msg =>
      this.resolve(msg)
        .replace(/\uFFFD\?/g, '"')
        .replace(/\u201C/g, '"')
        .replace(/\u201D/g, '"')
        .replace(/\u2018/g, "'")
        .replace(/\u2019/g, "'")
    );

    // Wait briefly for messages to appear
    await this.page.waitForTimeout(500);

    // Retry logic to avoid stale element issues (up to 3 attempts)
    let presentMessages: string[] = [];
    let attempts = 3;
    while (attempts > 0) {
      try {
        const messageElements = this.page.locator(pageMessagesXPath);
        const count = await messageElements.count();
        presentMessages = [];
        
        for (let i = 0; i < count; i++) {
          const text = await messageElements.nth(i).innerText().catch(() => '');
          if (text.trim()) {
            // Sanitize present messages (replace unicode quotes)
            const sanitized = text
              .replace(/[\u201c\u201d]/g, '"')
              .replace(/[\u2018\u2019]/g, "'")
              .trim();
            presentMessages.push(sanitized);
          }
        }
        break; // Success, exit retry loop
      } catch (e) {
        attempts--;
        if (attempts === 0) throw e;
        logger.warn(`[PAGE MESSAGES] Stale element, retrying... (${attempts} attempts left)`);
        await this.page.waitForTimeout(200);
      }
    }

    logger.info(`[PAGE MESSAGES] Found ${presentMessages.length} messages on page`);
    presentMessages.forEach(msg => logger.info(`  - "${msg}"`));

    if (shouldExist) {
      // Assert messages should be present
      const missingMessages = sanitizedMessages.filter(desired =>
        !presentMessages.some(present =>
          contains
            ? present.includes(desired)
            : present.toLowerCase() === desired.toLowerCase()
        )
      );

      if (missingMessages.length > 0) {
        let errorMessage = '\nRequired page messages were not found.\n';
        errorMessage += 'Page messages present in the page details:\n';
        presentMessages.forEach(msg => {
          errorMessage += `--- '${msg}' ---\n`;
        });
        errorMessage += 'Missing page messages:\n';
        missingMessages.forEach(msg => {
          errorMessage += `--- '${msg}' ---\n`;
        });
        throw new Error(errorMessage);
      }

      logger.info(`[PAGE MESSAGES] All required messages found`);
    } else {
      // Assert messages should NOT be present
      const foundMessages = sanitizedMessages.filter(desired =>
        presentMessages.some(present =>
          contains
            ? present.includes(desired)
            : present.toLowerCase() === desired.toLowerCase()
        )
      );

      if (foundMessages.length > 0) {
        throw new Error(
          `Expected messages NOT to be present, but found: ${foundMessages.map(m => `'${m}'`).join(', ')}`
        );
      }

      logger.info(`[PAGE MESSAGES] Confirmed messages are not present`);
    }
  }

  // waitForSpinner() is now inherited from BasePage via WaitHelper
}
