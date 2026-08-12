

import { logger } from '../utils/logger';

/**
 * Review Form Page
 * Handles filling in review forms with various field types
 * Mirrors Selenium's completeFillingReviewFormForLwc functionality
 */
export class ReviewFormPage {
  
  

  constructor(page, savedValues) {
    this.page = page;
    this.savedValues = savedValues;
  }

  /**
   * Complete filling in the review form with recommendation
   * Mirrors Selenium's completeFillingReviewFormForLwc
   */
  async completeFillingReviewForm(recommendation) {
    logger.info(`Completing review form with recommendation: ${recommendation}`);

    try {
      // Handle Conflict of Interest if present - must be clicked BEFORE Review tab
      const conflictOfInterest = this.page.locator(
        `//span//input[@type='radio'][@value='I agree']`
      ).first();
      
      if (await conflictOfInterest.count() > 0) {
        logger.info('Clicking Conflict of Interest: I agree');
        try {
          // Wait for element to be present
          await conflictOfInterest.waitFor({ state: 'attached', timeout: 3000 });
          // Try normal click first
          await conflictOfInterest.click({ force: true, timeout: 3000 });
          logger.info('Conflict of Interest clicked successfully');
        } catch (error) {
          // Fallback to JavaScript click
          logger.warn('Using JavaScript click for Conflict of Interest radio button');
          await conflictOfInterest.evaluate((el) => el.click());
        }
        await this.page.waitForTimeout(1000);
      } else {
        logger.info('No Conflict of Interest radio button found - skipping');
      }

      // Click on Review tab
      const reviewTab = this.page.locator(`//div[@class='slds-tabs_default']//li[@title='Review' or @name='Review']`);
      if (await reviewTab.isVisible({ timeout: 2000 }).catch(() => false)) {
        logger.info('Clicking Review tab');
        await reviewTab.click();
        await this.page.waitForTimeout(500);
      }

      // Select recommendation
      logger.info(`Selecting recommendation: ${recommendation}`);
      
      // Try multiple locator strategies for recommendation field
      let recommendationSet = false;
      
      // Strategy 1: button[@name='Recommendation__c']
      const recommendationButton = this.page.locator(`//button[@name='Recommendation__c']`).first();
      if (await recommendationButton.isVisible({ timeout: 3000 }).catch(() => false)) {
        logger.info('Using recommendation button with name attribute');
        await recommendationButton.click();
        await this.page.waitForTimeout(500);

        const recommendationOption = this.page.locator(
          `//button[@name='Recommendation__c']/../..//span[text()='${recommendation}']`
        ).first();
        if (await recommendationOption.isVisible({ timeout: 5000 }).catch(() => false)) {
          await recommendationOption.click();
          await this.page.waitForTimeout(500);
          recommendationSet = true;
        }
      }
      
      // Strategy 2: Look for label "Recommendation" and find associated button/select
      if (!recommendationSet) {
        logger.info('Trying recommendation via label lookup');
        const recByLabel = this.page.locator(
          `//label[contains(text(),'Recommendation')]/following-sibling::div//button | ` +
          `//label[contains(text(),'Recommendation')]/following-sibling::div//select`
        ).first();
        
        if (await recByLabel.isVisible({ timeout: 3000 }).catch(() => false)) {
          await recByLabel.click();
          await this.page.waitForTimeout(500);
          
          const option = this.page.locator(
            `//span[@title='${recommendation}'] | //option[text()='${recommendation}'] | //span[text()='${recommendation}']`
          ).first();
          if (await option.isVisible({ timeout: 3000 }).catch(() => false)) {
            await option.click();
            await this.page.waitForTimeout(500);
            recommendationSet = true;
          }
        }
      }
      
      // Strategy 3: Direct input field
      if (!recommendationSet) {
        logger.warn('Recommendation dropdown not found, skipping or trying input field');
        const recInput = this.page.locator(`//input[@name='Recommendation__c']`).first();
        if (await recInput.isVisible({ timeout: 2000 }).catch(() => false)) {
          await recInput.fill(recommendation);
          recommendationSet = true;
        }
      }
      
      if (recommendationSet) {
        logger.info(`Recommendation "${recommendation}" set successfully`);
      } else {
        logger.warn(`Could not set recommendation "${recommendation}" - field may not be required on this form`);
      }

      // Fill summary comments
      logger.info('Filling summary comments');
      const summaryComments = this.page.locator(`//label[text()='Comments']/following-sibling::div//textarea`).first();
      if (await summaryComments.isVisible({ timeout: 2000 }).catch(() => false)) {
        await summaryComments.clear();
        await summaryComments.fill('Automation test description');
        await this.page.waitForTimeout(300);
      }

      // Get all form section titles
      const titles = await this.getFormSectionTitles();
      logger.info(`Found ${titles.length} form sections: ${titles.join(', ')}`);

      // Fill all field types for each section
      for (const title of titles) {
        const rowCount = await this.getRowCountForSection(title);
        logger.info(`Processing section "${title}" with ${rowCount} rows`);

        for (let rowIndex = 1; rowIndex <= rowCount; rowIndex++) {
          await this.fillTextAreaFields(title, rowIndex);
          await this.fillInputFields(title, rowIndex);
          await this.fillScoreFields(title, rowIndex);
          await this.fillDropdownFields(title, rowIndex);
          await this.fillPercentFields(title, rowIndex);
          await this.fillDollarFields(title, rowIndex);
          await this.fillDateFields(title, rowIndex);
        }
      }

      logger.info('Review form completed successfully');
    } catch (error) {
      logger.error(`Error completing review form: ${error}`);
      throw error;
    }
  }

  /**
   * Get all form section titles
   */
   async getFormSectionTitles() {
    const titleElements = this.page.locator(`//div[@class='slds-box pblock']//span[contains(@class,'slds-text-heading_medium')]`);
    const count = await titleElements.count();
    const titles = [];

    for (let i = 0; i < count; i++) {
      const text = await titleElements.nth(i).textContent();
      if (text && text.trim()) {
        titles.push(text.trim());
      }
    }

    return titles;
  }

  /**
   * Get row count for a section
   */
   async getRowCountForSection(title) {
    const rows = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field`
    );
    return await rows.count();
  }

  /**
   * Fill textarea fields
   */
   async fillTextAreaFields(title, rowIndex) {
    const textArea = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//textarea`
    );

    if (await textArea.count() > 0 && await textArea.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      logger.debug(`Filling textarea in section "${title}", row ${rowIndex}`);
      await textArea.first().clear();
      await textArea.first().fill('Automation test description');
    }
  }

  /**
   * Fill input fields (excluding percentage fields)
   */
   async fillInputFields(title, rowIndex) {
    const input = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//input[not(@placeholder='Enter a percentage')]`
    );

    if (await input.count() > 0 && await input.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      logger.debug(`Filling input in section "${title}", row ${rowIndex}`);
      await input.first().clear();
      await input.first().fill('Automation description');
    }
  }

  /**
   * Fill score fields (number input)
   */
   async fillScoreFields(title, rowIndex) {
    const scoreInput = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//input[@placeholder='Enter a Number']`
    );

    if (await scoreInput.count() > 0 && await scoreInput.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      logger.debug(`Filling score in section "${title}", row ${rowIndex}`);
      await scoreInput.first().clear();
      await scoreInput.first().fill('3');
    }
  }

  /**
   * Fill dropdown fields
   */
   async fillDropdownFields(title, rowIndex) {
    const dropdown = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//button[@role='combobox']`
    );

    if (await dropdown.count() > 0 && await dropdown.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      logger.debug(`Filling dropdown in section "${title}", row ${rowIndex}`);
      
      // Click to open dropdown
      await dropdown.first().click({ force: true });
      await this.page.waitForTimeout(500);

      // Select option (Yes or Medium)
      const option = this.page.locator(
        `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//button[@role='combobox']/../..//span[text()='Yes' or text()='Medium']`
      ).first();

      try {
        await option.waitFor({ state: 'visible', timeout: 3000 });
        await option.click({ force: true });
      } catch (error) {
        // Retry once if first attempt fails
        logger.warn(`Retrying dropdown selection for section "${title}", row ${rowIndex}`);
        await option.click({ force: true });
      }
      await this.page.waitForTimeout(300);
    }
  }

  /**
   * Fill percentage fields
   */
   async fillPercentFields(title, rowIndex) {
    const percentInput = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//input[@placeholder='Enter a percentage']`
    );

    if (await percentInput.count() > 0 && await percentInput.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      logger.debug(`Filling percentage in section "${title}", row ${rowIndex}`);
      await percentInput.first().clear();
      await percentInput.first().fill('25');
    }
  }

  /**
   * Fill dollar fields
   */
   async fillDollarFields(title, rowIndex) {
    const dollarInput = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//input[@placeholder='Enter a DOllar']`
    );

    if (await dollarInput.count() > 0 && await dollarInput.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      logger.debug(`Filling dollar amount in section "${title}", row ${rowIndex}`);
      await dollarInput.first().clear();
      await dollarInput.first().fill('1000');
    }
  }

  /**
   * Fill date fields
   */
   async fillDateFields(title, rowIndex) {
    const dateInput = this.page.locator(
      `//div[@class='slds-box pblock']//span[text()='${title}']//parent::div//c-review-form-field[${rowIndex}]//lightning-datepicker//input`
    );

    if (await dateInput.count() > 0 && await dateInput.first().isVisible({ timeout: 1000 }).catch(() => false)) {
      logger.debug(`Filling date in section "${title}", row ${rowIndex}`);
      await dateInput.first().clear();
      await dateInput.first().fill('11/5/2024');
      await this.page.keyboard.press('Tab');
      await this.page.waitForTimeout(300);
    }
  }
}
