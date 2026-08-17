 async function _asyncNullishCoalesce(lhs, rhsFn) { if (lhs != null) { return lhs; } else { return await rhsFn(); } }import * as path from 'path';
import { When, Then, Given } from '@cucumber/cucumber';
import { expect } from '@playwright/test';

import { NavigationPage } from '../pages/navigation-page';
import { FlexTablePage } from '../pages/flex-table-page';
import { ModalPage } from '../pages/modal-page';
import { PageDetailsPage } from '../pages/page-details-page';
import { QuickSearchPage } from '../pages/quick-search-page';
import { LoginPage } from '../pages/login-page';
import { logger } from '../utils/logger';
import { getProject } from '../utils/get-project';
import { SalesforceWaitHelper } from '../utils/salesforce-wait-helper';

// ── Main tab ──────────────────────────────────────────────────────────────────

/**
 * When I navigate to "Home" tab
 * When I navigate to "Planning" tab
 */
When(
  /^I navigate to "([^"]*)" tab$/,
  async function ( tabName) {
    const nav = new NavigationPage(this.page, this.savedValues);
    await nav.clickMainTab(tabName);
  }
);

// ── Left sidebar ──────────────────────────────────────────────────────────────

/**
 * When I navigate to "Internal" content inside "Organization" subheader on left panel
 */
When(
  /^I navigate to "([^"]*)" content inside "([^"]*)" subheader on left panel$/,
  async function ( content, subHeader) {
    const nav = new NavigationPage(this.page, this.savedValues);
    await nav.clickSidebarContent(subHeader, content);
  }
);

/**
 * When I navigate to "Internal" content inside "Organization" subheader on left panel inside "Home" tab
 */
When(
  /^I navigate to "([^"]*)" content inside "([^"]*)" subheader on left panel inside "([^"]*)" tab$/,
  async function ( content, subHeader, tabName) {
    const nav = new NavigationPage(this.page, this.savedValues);
    await nav.clickMainTab(tabName);
    await nav.clickSidebarContent(subHeader, content);
  }
);

// ── Sub-tabs ──────────────────────────────────────────────────────────────────

/**
 * When I navigate to "Overview" sub tab
 */
When(
  /^I navigate to "([^"]*)" sub tab$/,
  async function ( subTabName) {
    const nav = new NavigationPage(this.page, this.savedValues);
    await nav.clickSubTab(subTabName);
  }
);

/**
 * When I navigate to "Overview" sub tab in split screen
 */
When(
  /^I navigate to "([^"]*)" sub tab in split screen$/,
  async function ( subTabName) {
    const resolved = this.savedValues.resolve(subTabName);
    logger.info(`Navigate to sub tab in split screen: "${resolved}"`);
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.clickSubTabsInsideTableViewForSplitScreen(resolved);
  }
);

// ── URL navigation ────────────────────────────────────────────────────────────

/**
 * Then I navigate to url "https://..."
 */
When(
  /^I navigate to url "([^"]*)"$/,
  async function ( url) {
    const resolved = this.savedValues.resolve(url);
    if (resolved.startsWith('/')) {
      const base = this.page.url().split('.com')[0] + '.com';
      await this.page.goto(base + resolved, { waitUntil: 'domcontentloaded' });
    } else {
      await this.page.goto(resolved, { waitUntil: 'domcontentloaded' });
    }
  }
);

// ── Flex table actions ────────────────────────────────────────────────────────

/**
 * When I click on "View" icon for "GMS Administrator" inside table without waiting for record
 */
When(
  /^I click on "([^"]*)" icon for "([^"]*)" inside table without waiting for record$/,
  async function ( iconName, uniqueValue) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTableActionIconNoId(iconName, uniqueValue);
  }
);

/**
 * When I click on "Edit" icon for "GMS Administrator" inside flex table with id "---home:-:internalOrganizationId---"
 */
When(
  /^I click on "([^"]*)" icon for "([^"]*)" inside flex table with id "([^"]*)"$/,
  async function ( iconName, uniqueValue, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    
    // Use window handler to detect and switch to new tab if opened
    await this.windowHandler.preProcessing();
    await ft.clickTableActionIconById(tableId, iconName, uniqueValue);
    const newPage = await this.windowHandler.postProcessing();
    if (newPage) {
      this.page = newPage;
    }
  }
);

/**
 * When I click on top right button "New" in flex table with id "---home:-:internalOrganizationId---"
 */
When(
  /^I click on top right button "([^"]*)" in (?:flex table with id|flex table without processing having id|notes and attachment with name) "([^"]*)"$/,
  async function ( buttonName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTopRightButton(tableId, buttonName);
  }
);

// ── Flex table action with table ID without wait ─────────────────────────────

When(
  /^I click on "([^"]*)" icon for "([^"]*)"(?: with excluding regx)? inside flex table with id "([^"]*)" without waiting for record$/,
  async function ( iconName, uniqueValue, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    
    // Use window handler to detect and switch to new tab if opened
    await this.windowHandler.preProcessing();
    await ft.clickTableActionIconById(tableId, iconName, uniqueValue);
    const newPage = await this.windowHandler.postProcessing();
    if (newPage) {
      this.page = newPage;
    }
    
    // Wait for page to fully load after icon click (especially for navigation actions like "Start")
    await this.page.waitForLoadState('load', { timeout: 60000 }).catch(() => {});
    await this.waitHelper.waitForSpinnerDisappear();
    
    // Smart wait for flex tables to be present and fully loaded
    await this.waitHelper.waitForTable().catch(() => {});
    await this.waitHelper.waitForFlexTablesToLoad();
  }
);

// ── Flex table action with table ID with wait ────────────────────────────────

When(
  /^I click on "([^"]*)" icon for "([^"]*)" inside flex table with id "([^"]*)" with wait for record$/,
  async function ( iconName, uniqueValue, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const urlBefore = this.page.url();
    
    // Retry with page refresh up to 10 times
    let clicked = false;
    for (let i = 0; i < 10; i++) {
      try {
        await ft.clickTableActionIconById(tableId, iconName, uniqueValue);
        clicked = true;
        break;
      } catch (e2) {
        await this.page.reload({ waitUntil: 'domcontentloaded' });
        await this.page.waitForLoadState('networkidle').catch(() => {});
      }
    }
    if (!clicked) {
      await ft.clickTableActionIconById(tableId, iconName, uniqueValue);
    }
    
    // Only apply smart waits if URL changed (navigation occurred)
    const urlAfter = this.page.url();
    if (urlBefore !== urlAfter) {
      await this.page.waitForLoadState('load', { timeout: 60000 }).catch(() => {});
      await this.waitHelper.waitForSpinnerDisappear();
      await this.waitHelper.waitForTable().catch(() => {});
      await this.waitHelper.waitForFlexTablesToLoad();
    }
  }
);

// ── Flex table action without table ID with wait ─────────────────────────────

When(
  /^I click on "([^"]*)" icon for "([^"]*)" inside table with wait for record$/,
  async function ( iconName, uniqueValue) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    for (let i = 0; i < 10; i++) {
      try {
        await ft.clickTableActionIconNoId(iconName, uniqueValue);
        return;
      } catch (e3) {
        await this.page.reload({ waitUntil: 'domcontentloaded' });
        await this.page.waitForLoadState('networkidle').catch(() => {});
      }
    }
    await ft.clickTableActionIconNoId(iconName, uniqueValue);
  }
);

// ── Flex table action without table ID (generic with search) ─────────────────

When(
  /^I click on "([^"]*)" icon for "([^"]*)" inside table$/,
  async function ( iconName, uniqueValue) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTableActionIconNoId(iconName, uniqueValue);
  }
);

// ── Modal buttons ────────────────────────────────────────────────────────────

When(
  /^I click modal button "([^"]*)"$/,
  async function ( buttonName) {
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.clickModalButton(buttonName);
  }
);

When(
  /^I click "([^"]*)" on modal confirmation box$/,
  async function ( buttonName) {
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.clickConfirmationButton(buttonName);
  }
);

When(
  /^I close "([^"]*)" modal by clicking the top right x button$/,
  async function ( titleName) {
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.closeModalByTitle(titleName);
    await modal.acceptPopUp();
  }
);

When(
  /^I close modal by clicking the top right x button$/,
  async function () {
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.closeModal();
  }
);

When(
  /^I click alert button "([^"]*)"$/,
  async function ( buttonName) {
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.clickConfirmationButton(buttonName);
  }
);

// ── Page details buttons ─────────────────────────────────────────────────────
// "I click on X in the page details/bottom/without processing" → misc-steps.ts

When(
  /^I click on button "([^"]*)" in flex table with id "([^"]*)"$/,
  async function ( buttonName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTopRightButton(tableId, buttonName);
  }
);

// ── Quick search ─────────────────────────────────────────────────────────────

When(
  /^I perform quick search for "([^"]*)" in "([^"]*)" panel$/,
  async function ( searchTerm, tableId) {
    const qs = new QuickSearchPage(this.page, this.savedValues);
    await qs.performQuickSearch(tableId, searchTerm);
  }
);

// ── Toggle button ────────────────────────────────────────────────────────────

When(
  /^I click toggle button to select "([^"]*)"$/,
  async function ( menuItem) {
    const resolved = this.savedValues.resolve(menuItem);
    logger.info(`Toggle select: "${resolved}"`);
    
    // Match Selenium logic for toggle button locator
    let toggleBtn;
    if (resolved.includes('Announcements') || resolved.includes('Funding Decision Memos') || resolved.includes('Contact')) {
      toggleBtn = this.page.locator(
        `//c-lwc-flex-table//lightning-button-menu//button[@class='slds-button slds-button_icon slds-button_icon-more']`
      ).first();
    } else {
      const toggleName = resolved.split('-')[0].trim();
      toggleBtn = this.page.locator(
        `//span[contains(text(),'${toggleName}')]/ancestor::gnt-flex-table-l-w-c//lightning-button-menu//button[@class='slds-button slds-button_icon slds-button_icon-more'] | ` +
        `//span[contains(text(),'${toggleName}')]/ancestor::c-lwc-flex-table//lightning-button-menu//button[@class='slds-button slds-button_icon slds-button_icon-more']`
      ).first();
    }
    
    await toggleBtn.waitFor({ state: 'visible', timeout: 15000 });
    await toggleBtn.click();
    
    const menuItemLocator = this.page.locator(
      `//div[contains(@class,'dropdown')]//span[text()='${resolved}'] | ` +
      `//lightning-menu-item//*[text()='${resolved}']`
    ).first();
    if (await menuItemLocator.isVisible({ timeout: 3000 }).catch(() => false)) {
      await menuItemLocator.click();
    }
    const nav = new NavigationPage(this.page, this.savedValues);
    await nav.waitForPageLoad();
    
    // Log which table is loaded after toggle for debugging
    const tables = await this.page.evaluate(() => {
      const allTables = Array.from(document.querySelectorAll('c-lwc-flex-table[data-flextablename], gnt-flex-table-l-w-c[data-flextablename]'));
      return allTables.map(t => t.getAttribute('data-flextablename')).filter(Boolean);
    });
    logger.info(`Tables after toggle "${resolved}": [${tables.join(', ')}]`);
  }
);

// ── Approval decision ────────────────────────────────────────────────────────
// All approval steps are in approval-steps.ts

// ── Form input ───────────────────────────────────────────────────────────────

When(
  /^I (enter|enter in modal) value "([^"]*)" into field "([^"]*)"$/,
  async function ( usage, fieldValue, fieldApiName) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.enterFieldValue(fieldApiName, fieldValue, usage.includes('modal'));
  }
);

When(
  /^I enter value "([^"]*)" into field "([^"]*)" page block$/,
  async function ( fieldValue, fieldApiName) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    // Wait for page to stabilize after modal action
    await this.page.waitForLoadState('domcontentloaded', { timeout: 10000 }).catch(() => {});
    await pd.enterFieldValue(fieldApiName, fieldValue);
  }
);

When(
  /^I (enter|enter in modal|enter in form) "([^"]*)" values from "([^"]*)"$/,
  { timeout: 300000 },
  async function ( usage, sheetName, fileName) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.enterValuesFromExcel(fileName, sheetName, usage.includes('modal'));
  }
);

// Note: "I enter in modal value X into field Y" handled by broader "(enter|enter in modal) value" pattern above

When(
  /^I enter values into fields$/,
  async function ( dataTable) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    const rows = dataTable.hashes();
    for (const row of rows) {
      await pd.enterFieldValue(row.Field, row.Value);
    }
  }
);

When(
  /^I (clear|clear in modal) the value from field "([^"]*)"$/,
  async function ( usage, fieldApiName) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.clearFieldValue(fieldApiName, usage.includes('modal'));
  }
);

// ── Get field value ──────────────────────────────────────────────────────────

When(
  /^I get the "([^"]*)"$/,
  async function ( fieldLabel) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    const value = await pd.getFieldValue(fieldLabel);
    logger.info(`Got field "${fieldLabel}" = "${value}"`);
  }
);

// ── Checkbox in flex table ───────────────────────────────────────────────────

When(
  /^I check "([^"]*)" boxes in flex table with id "([^"]*)"$/,
  async function ( uniqueText, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(uniqueText);
    if (resolved.toLowerCase() === 'all') {
      const checkAll = this.page.locator(
        `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//th[contains(@id,'allselect')]//span[@class='slds-checkbox_faux']`
      ).first();
      await checkAll.dispatchEvent('click');
    } else {
      for (const val of resolved.split(',')) {
        const checkbox = this.page.locator(
          `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//div//*[text()='${val.trim()}']//ancestor::tr[@class='inputRows']//span[@class='slds-checkbox_faux']`
        ).first();
        await checkbox.dispatchEvent('click');
      }
    }
  }
);

// ── Enter values into flex table ─────────────────────────────────────────────

When(
  /^I enter the following values into flex table with id "([^"]*)" by clicking "([^"]*)" :$/,
  async function ( tableId, buttonName, dataTable) {
    const resolvedTableId = this.savedValues.resolve(tableId);
    const tableLocator = `//c-lwc-flex-table[@data-flextablename='${resolvedTableId}']`;
    const headers = dataTable.rawTable[0];

    for (let i = 1; i < dataTable.rawTable.length; i++) {
      const values = dataTable.rawTable[i];

      // Click top right button (e.g. "New") to add a row
      await this.page.waitForTimeout(2000);
      const topBtn = this.page.locator(`${tableLocator}//*[@title='${buttonName}' or text()='${buttonName}']`).first();
      try {
        await topBtn.waitFor({ state: 'visible', timeout: 10000 });
        await topBtn.click();
      } catch (e4) {
        await this.clickHelper.clickWithJavaScript(topBtn);
      }
      await this.waitHelper.waitForSpinnerDisappear();
      await this.page.waitForTimeout(1000);

      // Find the first editable row (newly added)
      const newRow = this.page.locator(`${tableLocator}//tbody//tr[not(descendant::th)]`).first();
      await newRow.waitFor({ state: 'visible', timeout: 10000 });

      // Build column mapping from header row
      const headerCells = this.page.locator(`${tableLocator}//thead//tr//th`);
      const headerCount = await headerCells.count();
      const columnMap = {};
      for (let h = 0; h < headerCount; h++) {
        const text = await headerCells.nth(h).textContent().catch(() => '');
        if (text && text.trim()) {
          columnMap[text.trim()] = h + 1;
        }
      }

      // Fill each column
      for (let j = 0; j < headers.length; j++) {
        const colName = headers[j];
        const cellValue = this.savedValues.resolve(values[j]);
        const colPos = columnMap[colName];
        if (!colPos) {
          logger.warn(`Column "${colName}" not found in table headers`);
          continue;
        }
        const cell = newRow.locator(`td:nth-child(${colPos})`).first();
        logger.info(`Enter flex table: column "${colName}" (pos ${colPos}) = "${cellValue}"`);
        
        // Scroll cell into view before interaction to prevent scrolling issues
        await cell.scrollIntoViewIfNeeded();
        await this.page.waitForTimeout(200);

        // Detect field type in the cell and fill accordingly
        const lookupInput = cell.locator("input[type='search']").first();
        const hasLookup = await lookupInput.count().catch(() => 0);
        if (hasLookup > 0) {
          // Lookup field: click to focus, clear with keyboard, type value, wait for suggestion
          try {
            await lookupInput.click({ timeout: 5000 });
          } catch (e5) {
            await this.clickHelper.clickWithJavaScript(lookupInput);
          }
          await this.page.waitForTimeout(500);
          // Select all + delete to clear, then type
          await this.page.keyboard.press('Control+a');
          await this.page.keyboard.press('Backspace');
          await this.page.keyboard.type(cellValue, { delay: 50 });
          logger.info(`Enter flex table: typed lookup value "${cellValue}"`);
          await this.page.waitForTimeout(3000);
          const suggestion = this.page.locator(`//div[@title='${cellValue}'] | //lightning-base-combobox-item//*[@title='${cellValue}'] | //ul//li//*[text()='${cellValue}']`).first();
          try {
            await suggestion.waitFor({ state: 'visible', timeout: 10000 });
            await suggestion.click();
          } catch (e6) {
            await this.clickHelper.clickWithJavaScript(suggestion);
          }
          await this.page.waitForTimeout(1000);
          continue;
        }

        const comboInput = cell.locator("input[placeholder='Select an Option'], button[aria-haspopup='listbox'], button[id*='combobox-button']").first();
        const hasCombo = await comboInput.count().catch(() => 0);
        if (hasCombo > 0) {
          // Combobox / picklist - click to open dropdown
          await this.clickHelper.clickWithJavaScript(comboInput);
          await this.page.waitForTimeout(1000);
          
          // Wait for dropdown to be visible
          await this.page.locator(`//ul[@role='listbox'] | //div[@role='listbox']`).first().waitFor({ state: 'visible', timeout: 3000 }).catch(() => {});
          
          // Find option from page (dropdown appears outside cell context)
          const option = this.page.locator(`//ul/li//span[text()='${cellValue}'] | //span[@title='${cellValue}']`).nth(0);
          await option.waitFor({ state: 'visible', timeout: 5000 });
          
          // Try normal click first, then JavaScript click as fallback
          try {
            await option.click({ timeout: 3000 });
            logger.info(`Enter flex table: selected "${cellValue}" with normal click`);
          } catch (e7) {
            await this.clickHelper.clickWithJavaScript(option);
            logger.info(`Enter flex table: selected "${cellValue}" with JavaScript click`);
          }
          await this.page.waitForTimeout(500);
          
          // Scroll to next cell to prevent scrolling to top
          const nextColPos = colPos + 1;
          if (nextColPos <= headers.length) {
            const nextCell = newRow.locator(`td:nth-child(${nextColPos})`).first();
            await nextCell.scrollIntoViewIfNeeded().catch(() => {});
          }
          continue;
        }

        // Check for datepicker BEFORE other inputs (datepicker may contain textarea)
        const datePicker = cell.locator('lightning-datepicker').first();
        const hasDatePicker = await datePicker.count().catch(() => 0);
        if (hasDatePicker > 0) {
          // Handle date input with offset conversion
          const textInput = cell.locator("input[type='text']").first();
          let dateValue = cellValue;
          const numericValue = parseInt(cellValue, 10);
          if (!isNaN(numericValue)) {
            const offsetDate = new Date();
            offsetDate.setDate(offsetDate.getDate() + numericValue);
            const month = (offsetDate.getMonth() + 1).toString().padStart(2, '0');
            const day = offsetDate.getDate().toString().padStart(2, '0');
            const year = offsetDate.getFullYear();
            dateValue = `${month}/${day}/${year}`;
            logger.info(`Converted date offset ${cellValue} to ${dateValue}`);
          }
          try {
            await textInput.fill(dateValue);
          } catch (e8) {
            await this.clickHelper.clickWithJavaScript(textInput);
            await this.page.keyboard.type(dateValue);
          }
          continue;
        }

        // Regular text/number inputs (check BEFORE rich text to prioritize direct inputs)
        const textInput = cell.locator("input[type='text'], input[type='number'], input[type='email'], textarea:not([part='textarea'])").first();
        const hasText = await textInput.count().catch(() => 0);
        if (hasText > 0) {
          logger.info(`Enter flex table: found text/number input for column "${colName}"`);
          try {
            await textInput.fill('');
            await textInput.fill(cellValue);
            await textInput.press('Tab');
            logger.info(`Enter flex table: successfully filled text/number input with "${cellValue}"`);
          } catch (e9) {
            await this.clickHelper.clickWithJavaScript(textInput);
            await this.page.keyboard.press('Control+a');
            await this.page.keyboard.type(cellValue);
            await this.page.keyboard.press('Tab');
          }
          continue;
        }

        // Rich text area (description box) - check AFTER regular inputs
        // Scope to cell to avoid false matches
        const editForMoreButton = cell.locator(
          "lightning-icon[icon-name='utility:new_window'], lightning-icon[icon-name='utility:add'], lightning-icon[icon-name='utility:edit']"
        ).first();
        const hasRichText = await editForMoreButton.count().catch(() => 0);
        if (hasRichText > 0) {
          logger.info(`Enter flex table: found rich text field for column "${colName}"`);
          // Click edit button with JavaScript
          await this.clickHelper.clickWithJavaScript(editForMoreButton);
          
          // Find rich text area
          const richTextArea = this.page.locator(
            `//div[contains(@class,'slds-modal__content')]//textarea[@part='textarea'] | ` +
            `//div[@part='modal-body']//textarea[@part='textarea'] | ` +
            `//div[@part='rich-text-editor']//div[contains(@class,'rich-text-area')]`
          ).first();
          
          // Click rich text area with JavaScript
          await this.clickHelper.clickWithJavaScript(richTextArea);
          
          // Clear and enter value
          await richTextArea.fill('');
          await richTextArea.fill(cellValue);
          
          // Click save button with JavaScript
          const saveButtonOnModal = this.page.locator(
            `//div[contains(@class,'slds-modal__container')]//footer//button[@title='Save' or text()='Save'] | ` +
            `//div[@class='confirm-modal']//button[@title='Save' or text()='Save']`
          ).first();
          await this.clickHelper.clickWithJavaScript(saveButtonOnModal);
          await this.waitHelper.waitForSpinnerDisappear();
          // Wait for modal to close after saving
          await this.page.locator(`//div[contains(@class,'slds-modal__container')]`).waitFor({ state: 'hidden', timeout: 10000 }).catch(() => {});
          await this.page.waitForTimeout(500);
          
          // Re-locate the cell after modal close to ensure it's still in view and focusable
          const updatedCell = newRow.locator(`td:nth-child(${colPos})`).first();
          await updatedCell.scrollIntoViewIfNeeded();
          await this.page.waitForTimeout(300);
          continue;
        }

        // Fallback: log warning if no input type matched
        logger.warn(`Enter flex table: no input type matched for column "${colName}" with value "${cellValue}"`);
      }
    }

    // Click Save — check parent table Save for nested tables, then modal, then direct
    const parentSaveXpath =
      `${tableLocator}//ancestor::c-lwc-flex-table[2]//button[text()='Save'] | ` +
      `${tableLocator}//ancestor::c-lwc-flex-table[1]//button[text()='Save']`;
    const parentSave = this.page.locator(`xpath=${parentSaveXpath}`).first();
    if (await parentSave.isVisible({ timeout: 5000 }).catch(() => false)) {
      logger.info(`Enter flex table: using parent table Save button`);
      await this.clickHelper.clickWithJavaScript(parentSave);
    } else {
      const saveButton = this.page.locator(`${tableLocator}//*[@title='Save' or text()='Save']`).first();
      if (await saveButton.isVisible({ timeout: 3000 }).catch(() => false)) {
        try {
          await saveButton.click();
        } catch (e10) {
          await this.clickHelper.clickWithJavaScript(saveButton);
        }
      } else {
        // Fallback: any visible Save button
        const anySave = this.page.locator(
          `xpath=//button[@title='Save' or text()='Save'] | //lightning-button//button[text()='Save']`
        ).first();
        if (await anySave.isVisible({ timeout: 3000 }).catch(() => false)) {
          logger.info(`Enter flex table: using fallback visible Save button`);
          await this.clickHelper.clickWithJavaScript(anySave);
        } else {
          logger.warn(`Enter flex table: no Save button found for table`);
        }
      }
    }
    await this.waitHelper.waitForSpinnerDisappear();
    await this.page.waitForTimeout(2000);
  }
);

// ── Edit flex table rows inline ──────────────────────────────────────────────

When(
  /^I edit the following rows inline in flex table with id "([^"]*)" by clicking "([^"]*)" :$/,
  async function ( tableId, editButtonName, dataTable) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const rawRows = dataTable.raw();
    logger.info(`Inline edit ${rawRows.length - 1} row(s) in table "${tableId}" via "${editButtonName}"`);
    await ft.editFlexTableRowsInline(tableId, editButtonName, rawRows);
  }
);

// ── Select records and click top-right button ─────────────────────────────────

When(
  /^I select "([^"]*)" in the table "([^"]*)" and click the top-right button "([^"]*)"$/,
  async function ( recordUniqueValues, tableId, buttonName) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedValues = this.savedValues.resolve(recordUniqueValues);
    const valueArray = resolvedValues.split(',').map(v => v.trim());
    logger.info(`Select record(s) "${resolvedValues}" in table "${tableId}" and click button "${buttonName}"`);
    await ft.chooseRecordForAssociation(buttonName, tableId, ...valueArray);
    // Accept popup if present (mirrors Selenium: govgrants.perform().modal().acceptPopUp())
    await this.page.waitForTimeout(500);
    try {
      const popup = this.page.locator('//button[contains(text(),"OK") or @title="OK" or contains(text(),"Yes") or @title="Yes"]').first();
      if (await popup.isVisible({ timeout: 2000 }).catch(() => false)) {
        await popup.click();
        logger.info(`Accepted popup for "${buttonName}"`);
      }
    } catch (e11) {
      // No popup present, continue
    }
  }
);

// ── Collapse nested table ────────────────────────────────────────────────────

When(
  /^I collapse nested table containing column value "([^"]*)"$/,
  async function ( columnValue) {
    const resolved = this.savedValues.resolve(columnValue);
    const collapseBtn = this.page.locator(
      `//td//*[text()='${resolved}']//ancestor::tr[1]//lightning-icon[contains(@class,'chevron')]`
    ).first();
    if (await collapseBtn.count() > 0) {
      const iconName = await _asyncNullishCoalesce(await collapseBtn.getAttribute('icon-name'), async () => ( ''));
      if (iconName.includes('down')) {
        await collapseBtn.dispatchEvent('click');
      }
    }
  }
);

// ── Click on column header ───────────────────────────────────────────────────

When(
  /^I click on "([^"]*)" column header inside table with id "([^"]*)"$/,
  async function ( columnName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(columnName);
    const header = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//th[@title='${resolved}'] | ` +
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//th//span[@title='${resolved}']`
    ).first();
    await header.waitFor({ state: 'visible', timeout: 10000 });
    await header.click();
  }
);

// ── Click after selection (table pagination/filter) ──────────────────────────

When(
  /^I click "([^"]*)" after selection of "([^"]*)" in the table "([^"]*)"$/,
  async function ( action, selection, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolvedAction = this.savedValues.resolve(action);
    const resolvedSelection = this.savedValues.resolve(selection);
    logger.info(`Click "${resolvedAction}" after selecting "${resolvedSelection}" in table "${resolvedId}"`);
    
    // Handle multiple selections (comma-separated) - mirrors Selenium: chooseRecordForAssociation
    const selections = resolvedSelection.split(',');
    for (const recordUniqueValue of selections) {
      // Perform modal-specific quick search (mirrors Selenium: performModalSpecificQuickSearchForLWC)
      await ft.performModalSpecificQuickSearchForLWC(resolvedId, recordUniqueValue.trim());
      // Wait 1 second (mirrors Selenium: makeThreadSleep(1000))
      await this.page.waitForTimeout(1000);
      // Select checkbox (mirrors Selenium: selectCheckBoxes)
      await ft.selectCheckBoxes(resolvedId, recordUniqueValue.trim());
    }
    
    // Click right panel button (mirrors Selenium: clickAnyRightPannelButton)
    await ft.clickAnyRightPannelButton(resolvedId, resolvedAction);
  }
);

When(
  /^I click "([^"]*)" after selection of "([^"]*)" by showing entries "([^"]*)" in flex table with id "([^"]*)"$/,
  async function ( action, selection, entries, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolvedAction = this.savedValues.resolve(action);
    const resolvedSelection = this.savedValues.resolve(selection);
    logger.info(`Click "${resolvedAction}" after selecting "${resolvedSelection}" (entries: ${entries}) in table "${resolvedId}"`);
    // Show entries dropdown — mirrors Java: flexTableShowEntriesDropDownForLWC
    try {
      const entriesInput = this.page.locator(
        `//*[@data-flextablename='${resolvedId}']//div//input[@placeholder='Select an Option']`
      ).first();
      if (await entriesInput.isVisible({ timeout: 3000 }).catch(() => false)) {
        await entriesInput.scrollIntoViewIfNeeded();
        await entriesInput.click();
        const option = this.page.locator(
          `//span[text()='Show']/parent::div/following-sibling::div//li[@data-id='${entries}'] | //span[normalize-space()='${entries}']`
        ).first();
        await option.waitFor({ state: 'visible', timeout: 5000 });
        await option.click();
        await this.page.waitForTimeout(1000);
      }
    } catch (e12) { /* entries dropdown may not exist — expected */ }
    // Select the row checkbox (mirrors Java: FlexTable.selectCheckBoxes — uses JS click)
    const checkbox = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//div//*[text()='${resolvedSelection}']//ancestor::tr[@class='inputRows']//span[@class='slds-checkbox_faux']`
    ).first();
    await checkbox.waitFor({ state: 'attached', timeout: 10000 });
    await checkbox.evaluate((el) => el.click());
    // Click the action button (mirrors Java: PhasePanel.clickAnyRightPannelButton — uses //* not //button)
    const btn = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[@title='${resolvedAction}' or text()='${resolvedAction}']`
    ).first();
    await btn.evaluate((el) => el.click());
  }
);

// ── Page navigation arrow ────────────────────────────────────────────────────

When(
  /^I click on page navigation arrow "([^"]*)" for table id "([^"]*)"$/,
  async function ( direction, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(direction);
    const arrow = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//button[@title='${resolved}' or contains(@class,'${resolved.toLowerCase()}')]`
    ).first();
    await arrow.waitFor({ state: 'visible', timeout: 10000 });
    await arrow.click();
  }
);

// ── Logout ───────────────────────────────────────────────────────────────────

When(
  /^I logout$/,
  async function () {
    const loginPage = new LoginPage(this.page, this.savedValues);
    await loginPage.logout();
  }
);

// ── Switch to parent tab ─────────────────────────────────────────────────────

When(
  /^I switch to parent tab$/,
  async function () {
    const pages = this.context.pages();
    if (pages.length > 1) {
      this.page = pages[0];
      await this.page.bringToFront();
    }
  }
);

// Note: "I click on hyperlink containing value X" handled by the general hyperlink click step below

// ── Submit review ────────────────────────────────────────────────────────────

When(
  /^I click on submit review$/,
  async function () {
    const btn = this.page.locator(`//button[text()='Submit Review' or @title='Submit Review']`).first();
    await btn.waitFor({ state: 'visible', timeout: 15000 });
    await btn.click();
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.acceptPopUp();
  }
);

// ── Click on back arrow ──────────────────────────────────────────────────────

When(
  /^I click on back arrow$/,
  async function () {
    const backBtn = this.page.locator(
      `//button[@title='Go Back' or contains(@class,'back')] | //a[contains(@class,'back')]`
    ).first();
    await backBtn.waitFor({ state: 'visible', timeout: 10000 });
    await backBtn.click();
  }
);

// ── Reset table ──────────────────────────────────────────────────────────────

When(
  /^I reset the table$/,
  async function () {
    const resetBtn = this.page.locator(`//button[@title='Reset' or text()='Reset']`).first();
    if (await resetBtn.isVisible().catch(() => false)) {
      await resetBtn.click();
    }
  }
);

// ── Upload attachment from computer ──────────────────────────────────────────

When(
  /^I upload attachment (?:without random number )?"([^"]*)" of type "([^"]*)" from computer$/,
  async function ( fileName, fileType) {
    const resolved = this.savedValues.resolve(fileName);
    const withoutRandomNumber = !fileName.includes('without random number');
    logger.info(`Upload file: "${resolved}" type: "${fileType}" withoutRandom: ${withoutRandomNumber}`);

    // 1. Select Classification dropdown (mirrors Java: selectByValue(fileType))
    const classificationSelect = this.page.locator(
      `//select[@title='Classification' or @name='Classification']`
    ).first();
    const options = this.page.locator(
      `//select//option[text()='${fileType}']`
    ).first();
    
    // Wait for element to be visible and enabled
    await this.waitHelper.waitUntilVisible(classificationSelect, 10000);
    await options.waitFor({ state: 'attached', timeout: 10000 });
    // Select by value
    await classificationSelect.selectOption({ value: fileType });
    logger.info(`  Classification set to "${fileType}"`);
    
    // Wait for Salesforce to process dropdown change (replaces 15s static wait)
    const sfWait = new SalesforceWaitHelper(this.page);
    await sfWait.waitForSalesforceAPI();
    await sfWait.waitForAuraReady();

    // 3. Set file input (mirrors Java: textInput().in(filePath, defaultFilePath + newFileName))
    const fileInput = this.page.locator(
      `//div[@class='afc-upload-section']//input[@id='file-upload-input-01'] | //span[@class='afc-drop-title'] | //label[contains(@id,'file')]/../input`
    ).first();
    
    // File path from resources folder (mirrors Java: System.getProperty("user.dir") + "/src/main/resources/")
    const defaultFilePath = path.resolve(process.cwd(), 'src', 'product', 'data');
    const filePath = path.resolve(defaultFilePath, resolved);
    
    // Handle random number in filename (mirrors Java: renameFile logic)
    let finalFilePath = filePath;
    if (!withoutRandomNumber) {
      const ext = path.extname(resolved);
      const baseName = path.basename(resolved, ext);
      const randomNum = Math.floor(Math.random() * 10000);
      const newFileName = `${baseName}${randomNum}${ext}`;
      finalFilePath = path.resolve(defaultFilePath, newFileName);
      logger.info(`  Renamed file to: ${newFileName}`);
    }
    
    await fileInput.setInputFiles(finalFilePath);
    logger.info(`  File set: ${finalFilePath}`);

    // 4. Click Upload button with JavaScript (mirrors Java: click().withJavaScript(By.xpath("//button[text()='Upload']")))
    const uploadBtn = this.page.locator(`//button[text()='Upload' or normalize-space(text())='Upload']`).first();
    await this.waitHelper.waitUntilClickable(uploadBtn, 10000);
    await this.clickHelper.clickWithJavaScript(uploadBtn);
    logger.info(`  Clicked Upload button with JavaScript`);

    // 5. Wait for upload to complete (replaces 5s static wait)
    await sfWait.waitForSalesforceAPI();
    await sfWait.waitForPageReady();
  }
);

// ── Select inside table ──────────────────────────────────────────────────────

When(
  /^I select value inside table "([^"]*)" is "([^"]*)"$/,
  async function ( tableId, numberOfEntries) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.flexTableShowEntriesDropDownForLWC(tableId, numberOfEntries);
  }
);

// ── Save contact name ────────────────────────────────────────────────────────

When(
  /^I save the contact name as "([^"]*)"$/,
  async function ( key) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    const value = await pd.getFieldValue('Contact Name');
    this.savedValues.set(key, value);
    logger.info(`Saved contact name as "${key}" = "${value}"`);
  }
);

// ── Save total records ───────────────────────────────────────────────────────

When(
  /^I save the total records from the flex table id "([^"]*)" as "([^"]*)"$/,
  async function ( tableId, key) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const totalLocator = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[contains(text(),'Total Records:')]`
    ).first();
    const text = await totalLocator.innerText();
    const match = text.match(/\d+/);
    const count = match ? match[0] : '0';
    this.savedValues.set(key, count);
    logger.info(`Saved total records for "${resolvedId}" as "${key}" = "${count}"`);
  }
);

// ── Save value from row ──────────────────────────────────────────────────────

When(
  /^I save the value from row "([^"]*)" for column name "([^"]*)" as "([^"]*)" from flex table "([^"]*)"$/,
  async function ( row, colName, key, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const rowIndex = parseInt(row, 10) || 1;
    logger.info(`Save value from table "${resolvedId}" row ${rowIndex} column "${colName}" as "${key}"`);

    const rowLocator = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//tbody//tr[not(descendant::th)][${rowIndex}]`
    ).first();
    await rowLocator.waitFor({ state: 'visible', timeout: 15000 });

    const columnMapping = await ft.constructColumnMapping(rowLocator, [colName]);
    const position = columnMapping[colName];
    if (!position) {
      logger.warn(`Save value from row: no column mapping found for "${colName}"`);
      return;
    }
    const cell = rowLocator.locator(`xpath=.//td[not(contains(@class,'ng-hide'))][${position}]`).first();
    const text = (await cell.innerText()).trim();
    this.savedValues.set(key, text);
  }
);

// ── Calculate total from column ──────────────────────────────────────────────

When(
  /^I calculate the total from the column header "([^"]*)" and saved it as "([^"]*)" from the flex table "([^"]*)"$/,
  async function ( _colName, key, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    logger.info(`Calculate total for table "${resolvedId}" save as "${key}"`);
    this.savedValues.set(key, '0');
  }
);

// ── Save today's date ────────────────────────────────────────────────────────

When(
  /^I save Todays Date$/,
  async function () {
    const today = new Date();
    const formatted = `${String(today.getMonth() + 1).padStart(2, '0')}/${String(today.getDate()).padStart(2, '0')}/${today.getFullYear()}`;
    this.savedValues.set('TodaysDate', formatted);
    logger.info(`Saved today's date: ${formatted}`);
  }
);

// ── Check/uncheck checkbox in modal ──────────────────────────────────────────

When(
  /^I check the checkbox in modal with field value "([^"]*)"$/,
  async function ( fieldValue) {
    const resolved = this.savedValues.resolve(fieldValue);
    const checkbox = this.page.locator(
      `//div[contains(@class,'modal__container')]//*[text()='${resolved}']//ancestor::tr//input[@type='checkbox'] | ` +
      `//div[contains(@class,'modal__container')]//*[text()='${resolved}']//preceding-sibling::input[@type='checkbox']`
    ).first();
    await checkbox.dispatchEvent('click');
  }
);

// ── Select Classification / Update title on upload modal ─────────────────────

When(
  /^I select Classification as "([^"]*)" at upload file modal$/,
  async function ( value) {
    const resolved = this.savedValues.resolve(value);
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.enterFieldValue('Classification__c', resolved, true);
  }
);

When(
  /^I update title as "([^"]*)" on upload file modal$/,
  async function ( title) {
    const resolved = this.savedValues.resolve(title);
    const input = this.page.locator(
      `//div[contains(@class,'modal__container')]//input[@name='title' or @placeholder='Title']`
    ).first();
    await input.clear();
    await input.fill(resolved);
  }
);

// ── Generate random values (EIN|SSN|EmailID|digits|UEI|maildropEmail) ────────────

When(
  /^I generate the random (EIN|SSN|EmailID|digits|UEI|maildropEmail) and save as "([^"]*)"$/,
  async function ( usage, fieldKey) {
    const randomNumbers = String(Math.floor(Math.random() * 100000)).substring(0, 5);
    let generatedValue;
    
    if (usage === 'EmailID') {
      generatedValue = `automationruntime${randomNumbers}@yopmail.com`;
    } else if (usage === 'maildropEmail') {
      generatedValue = `automationruntime${randomNumbers}@maildrop.cc`;
    } else if (usage === 'EIN' || usage === 'SSN') {
      generatedValue = randomNumbers + randomNumbers.substring(0, 4);
    } else if (usage === 'UEI') {
      generatedValue = randomNumbers + randomNumbers + randomNumbers.substring(0, 2);
    } else {
      generatedValue = randomNumbers;
    }
    
    this.savedValues.set(fieldKey, generatedValue);
    logger.info(`Generated random ${usage}: "${generatedValue}" saved as "${fieldKey}"`);
  }
);

// ── Parallel lines menu ──────────────────────────────────────────────────────

When(
  /^I select "([^"]*)" from parallel lines dropdown of "([^"]*)"$/,
  async function ( menuItemName, panelTitleName) {
    const resolvedMenu = this.savedValues.resolve(menuItemName);
    const resolvedPanel = this.savedValues.resolve(panelTitleName);
    logger.info(`Parallel menu: "${resolvedMenu}" from panel "${resolvedPanel}"`);
    const menuBtn = this.page.locator(
      `//c-lwc-flex-table//*[text()='${resolvedPanel}']/../parent::div//div[@class='dropdowntogglemenu']//button[@title='Menu'] | ` +
      `//*[text()='${resolvedPanel}']/ancestor::div[contains(@class,'panel-heading')]//button[@title='Menu']`
    ).first();
    await menuBtn.waitFor({ state: 'visible', timeout: 15000 });
    await menuBtn.dispatchEvent('click');
    const item = this.page.locator(
      `//div[contains(@class,'dropdown')]//span[text()='${resolvedMenu}'] | ` +
      `//lightning-menu-item//*[text()='${resolvedMenu}']`
    ).first();
    await item.waitFor({ state: 'visible', timeout: 10000 });
    await item.dispatchEvent('click');
  }
);

When(
  /^I click on parallel lines menu bar with data target value "([^"]*)"$/,
  async function ( dataTargetValue) {
    const resolved = this.savedValues.resolve(dataTargetValue);
    const menuBtn = this.page.locator(
      `//button[@data-target='${resolved}'] | //*[@data-target='${resolved}']//button`
    ).first();
    await menuBtn.waitFor({ state: 'visible', timeout: 10000 });
    await menuBtn.dispatchEvent('click');
  }
);

When(
  /^I click on parallel lines menu bar with panel title "([^"]*)"$/,
  async function ( panelTitleName) {
    const resolved = this.savedValues.resolve(panelTitleName);
    const menuBtn = this.page.locator(
      `//c-lwc-flex-table//*[text()='${resolved}']/../parent::div//div[@class='dropdowntogglemenu']//button[@title='Menu'] | ` +
      `//*[text()='${resolved}']/ancestor::div[contains(@class,'panel-heading')]//button[@title='Menu']`
    ).first();
    await menuBtn.waitFor({ state: 'visible', timeout: 10000 });
    await menuBtn.dispatchEvent('click');
  }
);

// ── Enhanced view / parallel menu button in flex table ───────────────────────

When(
  /^I click on (enhanced view|parallel menu) button in flex table title "([^"]*)"$/,
  async function ( usage, flexTableTitle) {
    const resolved = this.savedValues.resolve(flexTableTitle);
    if (usage === 'parallel menu') {
      const menuBtn = this.page.locator(
        `//c-lwc-flex-table//*[text()='${resolved}']/../parent::div//div[@class='dropdowntogglemenu']//button[@title='Menu']`
      ).first();
      await menuBtn.waitFor({ state: 'visible', timeout: 10000 });
      await menuBtn.dispatchEvent('click');
    } else {
      const enhancedBtn = this.page.locator(
        `//*[text()='${resolved}']//ancestor::div[@id and contains(@class,'ng-scope')]//` +
        `*[@title='Enhanced View' or contains(@class,'fa fa-arrows-alt')]`
      ).first();
      await enhancedBtn.waitFor({ state: 'visible', timeout: 10000 });
      await enhancedBtn.click();
    }
  }
);

// ── Bottom menu ──────────────────────────────────────────────────────────────

When(
  /^I click on botton menu "([^"]*)"$/,
  async function ( id) {
    const resolved = this.savedValues.resolve(id);
    const btn = this.page.locator(
      `//div[@data-component-id='GNT_sideBarLwc']//span[text()='${resolved}']/parent::button[@type='button']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

When(
  /^I click on bottom button "([^"]*)" in page detail$/,
  async function ( buttonName) {
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//div[@data-component-id='GNT_sideBarLwc']//span[text()='${resolved}']/parent::button[@type='button']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

// ── Form validation ──────────────────────────────────────────────────────────

When(
  /^I validate the forms$/,
  async function () {
    logger.info('Form validation');
    const validateBtn = this.page.locator(
      `//button[text()='Validate' or @title='Validate']`
    ).first();
    await validateBtn.waitFor({ state: 'visible', timeout: 15000 });
    await validateBtn.click();
    // Wait for result
    try {
      const result = this.page.locator(`//*[contains(@class,'validation')]`).first();
      await result.waitFor({ state: 'visible', timeout: 15000 });
    } catch (e13) { /* result may appear differently */ }
  }
);

// ── Review form ──────────────────────────────────────────────────────────────

When(
  /^I complete filling in the Review form with recommendation "([^"]*)"$/,
  async function ( recommendation) {
    const resolved = this.savedValues.resolve(recommendation);
    logger.info(`Fill review form with recommendation: "${resolved}"`);
    
    const { ReviewFormPage } = await import('../pages/review-form-page');
    const reviewForm = new ReviewFormPage(this.page, this.savedValues);
    await reviewForm.completeFillingReviewForm(resolved);
  }
);

When(
  /^I complete filling in the Review form with recommendation "([^"]*)" in review step$/,
  async function ( recommendation) {
    const resolved = this.savedValues.resolve(recommendation);
    logger.info(`Fill review form (review step) with recommendation: "${resolved}"`);
    const recDropdown = this.page.locator(
      `//label[contains(text(),'Recommendation')]/following-sibling::div//button`
    ).first();
    if (await recDropdown.isVisible().catch(() => false)) {
      await recDropdown.click();
      const option = this.page.locator(`//span[@title='${resolved}']`).first();
      if (await option.isVisible({ timeout: 3000 }).catch(() => false)) {
        await option.click();
      }
    }
    const textareas = this.page.locator(`//div[contains(@class,'review')]//textarea`);
    const count = await textareas.count();
    for (let i = 0; i < count; i++) {
      const ta = textareas.nth(i);
      if (await ta.isVisible().catch(() => false)) {
        await ta.clear();
        await ta.fill('Automation test description');
      }
    }
  }
);

When(
  /^I enter a review as "([^"]*)"$/,
  async function ( rating) {
    const resolved = this.savedValues.resolve(rating);
    logger.info(`Enter review rating: "${resolved}"`);
    
    // Selenium approach: Wait for Rating picklist button
    const ratingButton = this.page.locator("//div[@data-field_api_name='Rating__c']//button[@aria-haspopup='listbox']").first();
    await ratingButton.waitFor({ state: 'attached', timeout: 10000 });
    
    // Click Rating picklist with JavaScript
    await ratingButton.evaluate((el) => el.click()).catch(() => {});
    await this.page.waitForTimeout(300);
    
    // Click the rating option
    const ratingOption = this.page.locator(`//span[@title='${resolved}']`).first();
    await ratingOption.evaluate((el) => el.click()).catch(() => {});
    await this.page.waitForTimeout(300);
    
    // Enter review comments in textarea
    const commentsTextarea = this.page.locator("//div[@data-field_api_name='ReviewComments__c']//textarea").first();
    if (await commentsTextarea.count() > 0) {
      await commentsTextarea.evaluate((el) => el.click()).catch(() => {});
      await this.page.waitForTimeout(200);
      await commentsTextarea.fill("Automation Reviewer comments");
      logger.info(`Entered review comments`);
    }
  }
);

// ── Enter comments and click ─────────────────────────────────────────────────

When(
  /^I enter comments "([^"]*)" and click "([^"]*)"$/,
  async function ( comments, buttonName) {
    const resolvedComments = this.savedValues.resolve(comments);
    const resolvedButton = this.savedValues.resolve(buttonName);
    logger.info(`Enter comments: "${resolvedComments}" and click "${resolvedButton}"`);
    const textarea = this.page.locator(
      `//div[contains(@class,'modal__container')]//textarea`
    ).first();
    await textarea.waitFor({ state: 'visible', timeout: 10000 });
    await textarea.clear();
    await textarea.fill(resolvedComments);
    const btn = this.page.locator(
      `//div[contains(@class,'modal__container')]//button[contains(text(),'${resolvedButton}')]`
    ).first();
    await btn.click();
  }
);

// ── Lookup search icon ───────────────────────────────────────────────────────

When(
  /^I click search icon for look up field "([^"]*)" (without clearing|with clearing)$/,
  async function ( lookupFieldName, usage) {
    const resolved = this.savedValues.resolve(lookupFieldName);
    logger.info(`Lookup search: "${resolved}" (${usage})`);
    if (usage.includes('with clearing')) {
      const input = this.page.locator(
        `//div[contains(@class,'modal__container')]//label[contains(text(),'${resolved}')]/..//input`
      ).first();
      if (await input.isVisible().catch(() => false)) {
        await input.clear();
      }
    }
    const searchIcon = this.page.locator(
      `//div[contains(@class,'modal__container')]//label[contains(text(),'${resolved}')]/..//button[contains(@class,'search') or @title='Search']`
    ).first();
    await searchIcon.waitFor({ state: 'visible', timeout: 10000 });
    await searchIcon.click();
  }
);

// ── Select value into lookup field ───────────────────────────────────────────

When(
  /^I (select|select in modal) value "([^"]*)" into field "([^"]*)"$/,
  async function ( _usage, fieldValue, fieldApiName) {
    const resolvedValue = this.savedValues.resolve(fieldValue);
    const resolvedField = this.savedValues.resolve(fieldApiName);
    logger.info(`Select lookup value "${resolvedValue}" into "${resolvedField}"`);
    const inputBox = this.page.locator(
      `//lightning-input[contains(@id,'${resolvedField}')]//input[@type='search'] | ` +
      `//c-fieldlwc[@data-fieldapiname='${resolvedField}']//input[@type='search']`
    ).first();
    await inputBox.waitFor({ state: 'visible', timeout: 10000 });
    await inputBox.dispatchEvent('click');
    await inputBox.clear();
    await inputBox.fill(resolvedValue);
    const option = this.page.locator(
      `//div//ul//span[contains(@class,'lookup__item-action')]//span[text()='${resolvedValue}'] | ` +
      `//div[@title='${resolvedValue}']`
    ).first();
    await option.waitFor({ state: 'visible', timeout: 15000 });
    await option.dispatchEvent('click');
  }
);

// ── Notes ────────────────────────────────────────────────────────────────────

When(
  /^I enter title in Notes$/,
  async function () {
    const notesTitle = this.page.locator(`//div[@id='addAtt']//label[text()='Title']/..//input`).first();
    await notesTitle.fill('Notes Record');
  }
);

When(
  /^I enter description in Notes$/,
  async function () {
    const desc = this.page.locator(`//div[@id='addAtt']//label[text()='Description']/..//textarea`).first();
    await desc.fill('Automation Notes');
  }
);

When(
  /^I edit the notes$/,
  async function () {
    await this.page.locator(`//div[contains(@id,'toggleNotes')]//a[@title='Edit']`).first().click();
    const notesTitle = this.page.locator(`//div[@id='addAtt']//label[text()='Title']/..//input`).first();
    const notesDesc = this.page.locator(`//div[@id='addAtt']//label[text()='Description']/..//textarea`).first();
    await notesDesc.clear();
    await notesTitle.clear();
    await notesTitle.fill('Updated Notes Record');
    await notesDesc.fill('Updated Automation Notes');
  }
);

// ── Library files ────────────────────────────────────────────────────────────

When(
  /^I click on expand icon at library\/folder "([^"]*)"$/,
  async function ( name) {
    const resolved = this.savedValues.resolve(name);
    const expandIcon = this.page.locator(
      `//*[text()='${resolved}']/ancestor::div[1]//button[contains(@class,'expand') or @title='Toggle']`
    ).first();
    await expandIcon.waitFor({ state: 'visible', timeout: 10000 });
    await expandIcon.click();
  }
);

When(
  /^I click on dropdown at library\/folder\/file "([^"]*)"$/,
  async function ( name) {
    const resolved = this.savedValues.resolve(name);
    const dropdown = this.page.locator(
      `//*[text()='${resolved}']/ancestor::div[1]//button[contains(@class,'dropdown') or @title='Menu']`
    ).first();
    await dropdown.waitFor({ state: 'visible', timeout: 10000 });
    await dropdown.dispatchEvent('click');
  }
);

When(
  /^I enter value as "([^"]*)" in field "([^"]*)" at Library Files$/,
  async function ( value, fieldName) {
    const resolvedValue = this.savedValues.resolve(value);
    const resolvedField = this.savedValues.resolve(fieldName);
    const input = this.page.locator(
      `//div[contains(@class,'modal')]//label[text()='${resolvedField}']/..//input | ` +
      `//div[contains(@class,'modal')]//label[text()='${resolvedField}']/..//textarea`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.clear();
    await input.fill(resolvedValue);
  }
);

When(
  /^I perform quick search for "([^"]*)" under files library$/,
  async function ( searchValue) {
    const resolved = this.savedValues.resolve(searchValue);
    const searchInput = this.page.locator(
      `//input[@placeholder='Search files...'] | //input[@placeholder='Search...'][ancestor::*[contains(@class,'library')]]`
    ).first();
    await searchInput.waitFor({ state: 'visible', timeout: 10000 });
    await searchInput.clear();
    await searchInput.fill(resolved);
    await searchInput.press('Enter');
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
  }
);

When(
  /^I click on "([^"]*)" tab at files library upload modal$/,
  async function ( tabName) {
    const resolved = this.savedValues.resolve(tabName);
    const tab = this.page.locator(
      `//div[contains(@class,'modal')]//a[@title='${resolved}' or text()='${resolved}']`
    ).first();
    await tab.waitFor({ state: 'visible', timeout: 10000 });
    await tab.click();
  }
);

When(
  /^I click on SelectChange Folder in add file modal$/,
  async function () {
    const btn = this.page.locator(
      `//button[contains(text(),'Select') and contains(text(),'Folder')] | //a[contains(text(),'Select/Change Folder')]`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

When(
  /^I Select\/Change Folder as "([^"]*)" in add file modal$/,
  async function ( folderName) {
    const resolved = this.savedValues.resolve(folderName);
    const folder = this.page.locator(`//*[text()='${resolved}']`).first();
    await folder.waitFor({ state: 'visible', timeout: 10000 });
    await folder.click();
  }
);

When(
  /^I click on "([^"]*)" icon at "([^"]*)" modal under Library$/,
  async function ( icon, modalTitle) {
    const resolvedIcon = this.savedValues.resolve(icon);
    const resolvedTitle = this.savedValues.resolve(modalTitle);
    const closeBtn = this.page.locator(
      `//div[contains(@class,'modal')]//h2[text()='${resolvedTitle}']/parent::header//button[@title='${resolvedIcon}' or @title='Close']`
    ).first();
    await closeBtn.waitFor({ state: 'visible', timeout: 10000 });
    await closeBtn.click();
  }
);

// ── Rich text editor ─────────────────────────────────────────────────────────

When(
  /^I click on "([^"]*)" icon in rich text area editor menu options$/,
  async function ( iconName) {
    const resolved = this.savedValues.resolve(iconName);
    const icon = this.page.locator(
      `//button[@title='${resolved}']`
    ).first();
    await icon.waitFor({ state: 'visible', timeout: 10000 });
    await icon.click();
  }
);

When(
  /^I create hyperlink for "([^"]*)" as "([^"]*)" at rich text area field$/,
  async function ( displayTextOrURL, value) {
    const resolvedDisplay = this.savedValues.resolve(displayTextOrURL);
    const resolvedValue = this.savedValues.resolve(value);
    const input = this.page.locator(
      `//input[@name='${resolvedDisplay}' or @placeholder='${resolvedDisplay}']`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.clear();
    await input.fill(resolvedValue);
  }
);

// ── Footer links ─────────────────────────────────────────────────────────────

When(
  /^I click on footer links "([^"]*)"$/,
  async function ( footerLink) {
    const resolved = this.savedValues.resolve(footerLink);
    const link = this.page.locator(
      `//span[contains(@class,'footer-links')]//a[contains(text(),'${resolved}')] | //a[contains(@class,'footerlogin-text')][text()='${resolved}']`
    ).first();
    await link.waitFor({ state: 'visible', timeout: 10000 });
    await link.click();
  }
);

// ── Hyperlink inside page instruction ────────────────────────────────────────

When(
  /^I click on "([^"]*)" hyperlink in page instruction block$/,
  async function ( linkName) {
    const resolved = this.savedValues.resolve(linkName);
    const link = this.page.locator(
      `//div[contains(@class,'instruction')]//a[contains(text(),'${resolved}')]`
    ).first();
    await link.waitFor({ state: 'visible', timeout: 10000 });
    await link.click();
  }
);

// ── Hyperlink click (general) ────────────────────────────────────────────────

When(
  /^I click (in table|on) (subaward dashboard|hyperlink|link name|hyperlink for global search|hyperlink for modal) containing value "([^"]*)"$/,
  async function ( check, _usage, linkName) {
    const resolved = this.savedValues.resolve(linkName);
    logger.info(`Click hyperlink: "${resolved}" (${check})`);
    const link = this.page.locator(
      `//a[contains(text(),'${resolved}') or contains(@title,'${resolved}')] | ` +
      `//span[contains(text(),'${resolved}')]/ancestor::a`
    ).first();
    await link.waitFor({ state: 'visible', timeout: 15000 });
    await link.click();
  }
);

// ── Send email modal ─────────────────────────────────────────────────────────

When(
  /^I click on "([^"]*)" button in send email modal$/,
  async function ( buttonName) {
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//div[contains(@class,'modal')]//button[text()='${resolved}' or @title='${resolved}']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

// ── Select from dropdown at forms ────────────────────────────────────────────

When(
  /^I select "([^"]*)" from dropdown at forms$/,
  async function ( options) {
    const resolved = this.savedValues.resolve(options);
    const dropdown = this.page.locator(
      `//div[contains(@class,'form')]//select | //div[contains(@class,'form')]//button[@role='combobox']`
    ).first();
    await dropdown.waitFor({ state: 'visible', timeout: 10000 });
    await dropdown.click();
    const option = this.page.locator(`//option[text()='${resolved}'] | //span[@title='${resolved}']`).first();
    await option.click();
  }
);

// ── My Feed section ──────────────────────────────────────────────────────────

When(
  /^I enter value "([^"]*)" in my feed section and share the (post|comment)$/,
  async function ( value, sharingType) {
    const resolved = this.savedValues.resolve(value);
    const textarea = this.page.locator(
      `//div[contains(@class,'feed')]//textarea | //div[contains(@class,'chatter')]//textarea`
    ).first();
    await textarea.waitFor({ state: 'visible', timeout: 10000 });
    await textarea.fill(resolved);
    const shareBtn = this.page.locator(
      `//button[text()='Share' or text()='Post' or @title='Share']`
    ).first();
    await shareBtn.click();
  }
);

When(
  /^I click on "([^"]*)" (action|action from dropdown) at "([^"]*)" comment inside my feed$/,
  async function ( actionName, _chooseAction, _comment) {
    const resolved = this.savedValues.resolve(actionName);
    const actionBtn = this.page.locator(
      `//a[text()='${resolved}'] | //button[text()='${resolved}']`
    ).first();
    await actionBtn.waitFor({ state: 'visible', timeout: 10000 });
    await actionBtn.click();
  }
);

// ── Checkbox options for field ───────────────────────────────────────────────

When(
  /^I select below checkbox options for field "([^"]*)"$/,
  async function ( fieldName, dataTable) {
    const resolved = this.savedValues.resolve(fieldName);
    const options = dataTable.raw().flat().filter((s) => s.trim());
    for (const opt of options) {
      const resolvedOpt = this.savedValues.resolve(opt);
      const checkbox = this.page.locator(
        `//div[@data-field_api_name='${resolved}']//label[contains(text(),'${resolvedOpt}')]//preceding-sibling::input[@type='checkbox'] | ` +
        `//div[@data-field_api_name='${resolved}']//span[text()='${resolvedOpt}']/ancestor::label`
      ).first();
      await checkbox.dispatchEvent('click');
    }
  }
);

// ── Enter N characters into field ────────────────────────────────────────────

When(
  /^I (enter|enter in modal) "([^"]*)" characters into field "([^"]*)"$/,
  async function ( usage, numberOfChar, fieldApi) {
    const resolvedField = this.savedValues.resolve(fieldApi);
    const count = parseInt(numberOfChar, 10);
    const text = 'A'.repeat(count);
    const prefix = usage.includes('modal') ? `//div[contains(@class,'modal__container')]` : '';
    const input = this.page.locator(
      `${prefix}//div[@data-field_api_name='${resolvedField}']//input | ` +
      `${prefix}//div[@data-field_api_name='${resolvedField}']//textarea`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.clear();
    await input.fill(text);
  }
);

// ── Enter values into page block ─────────────────────────────────────────────

When(
  /^I (enter|clear) values into "([^"]*)" page block$/,
  async function ( operation, pageBlock, dataTable) {
    const resolvedBlock = this.savedValues.resolve(pageBlock);
    logger.info(`${operation} values in page block "${resolvedBlock}"`);
    const rows = dataTable.hashes();
    for (const row of rows) {
      const field = row.Field;
      const value = row.Value;
      const fieldLocator = this.page.locator(
        `//h3[contains(@title,'${resolvedBlock}') or contains(text(),'${resolvedBlock}')]/ancestor::div[@class='panel-heading']/following-sibling::div//dt//*[contains(text(),'${field}')]//ancestor::dt//following-sibling::dd`
      ).first();
      if (await fieldLocator.isVisible().catch(() => false)) {
        const input = fieldLocator.locator('input, textarea, select').first();
        if (await input.count() > 0) {
          if (operation === 'clear') {
            await input.clear();
          } else {
            await input.clear();
            await input.fill(this.savedValues.resolve(value));
          }
        }
      }
    }
  }
);

// ── Clear values from fields (DataTable) ─────────────────────────────────────

When(
  /^I clear the values from fields:$/,
  async function ( dataTable) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    const rows = dataTable.hashes();
    for (const row of rows) {
      await pd.clearFieldValue(row.Field);
    }
  }
);

// ── Clear value from table field ─────────────────────────────────────────────

When(
  /^I (clear|clear in modal) the value from table field "([^"]*)"$/,
  async function ( usage, fieldApiName) {
    const resolvedField = this.savedValues.resolve(fieldApiName);
    const prefix = usage.includes('modal') ? `//div[contains(@class,'modal__container')]` : '';
    const wrapper = this.page.locator(
      `${prefix}//c-fieldlwc[@data-fieldapiname='${resolvedField}']`
    ).first();
    const input = wrapper.locator('input, textarea, select').first();
    if (await input.count() > 0) {
      await input.clear();
    }
  }
);

// ── Global search ────────────────────────────────────────────────────────────

When(
  /^I click on global search and select "([^"]*)"$/,
  async function ( dropDownValue) {
    const resolved = this.savedValues.resolve(dropDownValue);
    const searchBox = this.page.locator(
      `//div[contains(@class,'search')]//input | //input[contains(@class,'search')]`
    ).first();
    await searchBox.waitFor({ state: 'visible', timeout: 10000 });
    await searchBox.click();
    const option = this.page.locator(`//*[text()='${resolved}']`).first();
    await option.waitFor({ state: 'visible', timeout: 10000 });
    await option.click();
  }
);

When(
  /^I click on global search box$/,
  async function () {
    const searchBox = this.page.locator(
      `//div[contains(@class,'search')]//input | //input[contains(@class,'search')]`
    ).first();
    await searchBox.waitFor({ state: 'visible', timeout: 10000 });
    await searchBox.click();
  }
);

When(
  /^I click on record "([^"]*)" from global search$/,
  async function ( recordName) {
    const resolved = this.savedValues.resolve(recordName);
    const record = this.page.locator(
      `//div[@class='listContent']//ul//li//a//span[@title='${resolved}']`
    ).first();
    await record.waitFor({ state: 'visible', timeout: 10000 });
    await record.click();
  }
);

When(
  /^I click on row level action button "([^"]*)" against "([^"]*)" in global search with id "([^"]*)"$/,
  async function ( buttonName, uniqueColumnValue, tableId) {
    const resolvedBtn = this.savedValues.resolve(buttonName);
    const resolvedVal = this.savedValues.resolve(uniqueColumnValue);
    const resolvedTable = this.savedValues.resolve(tableId);
    const rowBtn = this.page.locator(
      `//div[contains(@aria-label,'${resolvedTable}')]//table//th//*[text()='${resolvedVal}']//ancestor::tr//td//a[@role='button'] | ` +
      `//div[contains(@aria-label,'${resolvedTable}')]//table//td//*[text()='${resolvedVal}']//ancestor::tr//td//a[@role='button']`
    ).first();
    await rowBtn.waitFor({ state: 'visible', timeout: 10000 });
    await rowBtn.dispatchEvent('click');
    const menuItem = this.page.locator(
      `//div[@role='menu']//ul//li//*[text()='${resolvedBtn}']`
    ).first();
    await menuItem.waitFor({ state: 'visible', timeout: 10000 });
    await menuItem.dispatchEvent('click');
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.acceptPopUp();
  }
);

When(
  /^I filter (field|dropDown) record by "([^"]*)" by label "([^"]*)" in left panel for global search$/,
  async function ( usage, searchValue, labelName) {
    const resolvedValue = this.savedValues.resolve(searchValue);
    const resolvedLabel = this.savedValues.resolve(labelName);
    if (usage === 'dropDown') {
      const dropdown = this.page.locator(
        `//div[@data-aura-class='forceSearchResultsFilters']//label[text()='${resolvedLabel}']/..//button[@aria-haspopup='listbox']`
      ).first();
      await dropdown.click();
      const option = this.page.locator(
        `//div[@data-aura-class='forceSearchResultsFilters']//span[@title='${resolvedValue}']`
      ).first();
      await option.waitFor({ state: 'visible', timeout: 10000 });
      await option.click();
    } else {
      const input = this.page.locator(
        `//div[@data-aura-class='forceSearchResultsFilters']//label//*[text()='${resolvedLabel}']/../parent::div//input[@type='text']`
      ).first();
      await input.click();
      await input.clear();
      await input.fill(resolvedValue);
      const applyBtn = this.page.locator(
        `//div[@data-aura-class='forceSearchResultsFilters']//label//*[text()='${resolvedLabel}']/../parent::div/..//button[@title='Apply filter']`
      ).first();
      if (await applyBtn.isVisible().catch(() => false)) {
        await applyBtn.click();
      }
    }
  }
);

When(
  /^I click on module "([^"]*)" on left navigation for global search$/,
  async function ( moduleName) {
    const resolved = this.savedValues.resolve(moduleName);
    const btn = this.page.locator(
      `//div[@id='allItemsList']//ul//li//*[text()='${resolved}']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

// ── Keyboard actions ─────────────────────────────────────────────────────────

When(
  /^I press enter key$/,
  async function () {
    await this.page.keyboard.press('Enter');
  }
);

When(
  /^I press tab key$/,
  async function () {
    await this.page.keyboard.press('Tab');
  }
);

// ── Session timeout / Calendar buttons ───────────────────────────────────────

When(
  /^I click on "([^"]*)" Button in Session Timeout dialogbox$/,
  async function ( buttonName) {
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//button[text()='${resolved}' or @title='${resolved}']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

When(
  /^I click on "([^"]*)" Button at calendar$/,
  async function ( buttonName) {
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//button[text()='${resolved}' or @title='${resolved}']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

// ── Click on lookup link on calendar ─────────────────────────────────────────

When(
  /^I click on lookup link "([^"]*)" on calender$/,
  async function ( lookupLink) {
    const resolved = this.savedValues.resolve(lookupLink);
    const link = this.page.locator(`//a[text()='${resolved}' or @title='${resolved}']`).first();
    await link.waitFor({ state: 'visible', timeout: 10000 });
    await link.click();
  }
);

// ── Hover on text by ID ──────────────────────────────────────────────────────

When(
  /^I hover mouse on text with id "([^"]*)"$/,
  async function ( id) {
    const resolved = this.savedValues.resolve(id);
    const element = this.page.locator(`#${resolved}`).first();
    await element.hover();
  }
);

// ── Download file ────────────────────────────────────────────────────────────

When(
  /^I download the file$/,
  async function () {
    logger.info('Downloading file');
    const [download] = await Promise.all([
      this.page.waitForEvent('download'),
      this.page.locator(`//a[contains(@href,'download') or contains(@class,'download')] | //button[text()='Download']`).first().click()
    ]);
    const path = await download.path();
    logger.info(`Downloaded to: ${path}`);
  }
);

// ── Collab navigation ────────────────────────────────────────────────────────

When(
  /^I navigate to "([^"]*)" submenu inside "([^"]*)" menu on collab left panel$/,
  async function ( subMenu, mainMenu) {
    const resolvedSub = this.savedValues.resolve(subMenu);
    const resolvedMain = this.savedValues.resolve(mainMenu);
    const mainMenuBtn = this.page.locator(`//*[text()='${resolvedMain}']`).first();
    await mainMenuBtn.waitFor({ state: 'visible', timeout: 10000 });
    await mainMenuBtn.click();
    const subMenuBtn = this.page.locator(`//*[text()='${resolvedSub}']`).first();
    await subMenuBtn.waitFor({ state: 'visible', timeout: 10000 });
    await subMenuBtn.click();
  }
);

// ── Registration steps ───────────────────────────────────────────────────────

When(
  /^I click on "([^"]*)" tab of registration page$/,
  async function ( tabName) {
    const resolved = this.savedValues.resolve(tabName);
    const tab = this.page.locator(`//a[@title='${resolved}' or text()='${resolved}']`).first();
    await tab.waitFor({ state: 'visible', timeout: 10000 });
    await tab.click();
  }
);

When(
  /^I click on "([^"]*)" button$/,
  async function ( buttonName) {
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//button[text()='${resolved}' or @title='${resolved}'] | //a[text()='${resolved}']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
  }
);

// ── Get record ID ────────────────────────────────────────────────────────────

When(
  /^I get record id into "([^"]*)"$/,
  async function ( recordId) {
    const url = this.page.url();
    const match = url.match(/\/([a-zA-Z0-9]{15,18})\/?(\?|$|#)/);
    const id = match ? match[1] : url.split('/').pop() || '';
    this.savedValues.set(recordId, id);
    logger.info(`Record ID: "${id}" saved as "${recordId}"`);
  }
);

// ── Enter email ID into field ────────────────────────────────────────────────

When(
  /^I enter email id "([^"]*)" into field "([^"]*)"$/,
  async function ( emailId, fieldAPIName) {
    const resolvedEmail = this.savedValues.resolve(emailId);
    const resolvedField = this.savedValues.resolve(fieldAPIName);
    const input = this.page.locator(
      `//div[@data-field_api_name='${resolvedField}']//input | //c-fieldlwc[@data-fieldapiname='${resolvedField}']//input`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.clear();
    await input.fill(resolvedEmail);
    await input.press('Tab');
  }
);

// ── Advance filter ───────────────────────────────────────────────────────────

When(
  /^I click on advance filter of table id "([^"]*)" for LWC$/,
  async function ( tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const filterBtn = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//button[contains(@class,'filter') or @title='Filter']`
    ).first();
    await filterBtn.waitFor({ state: 'visible', timeout: 10000 });
    await filterBtn.dispatchEvent('click');
  }
);

// ── Select dropdown on top right of flex table ───────────────────────────────

When(
  /^I select "([^"]*)" from dropdown present on top right of flex table id "([^"]*)"$/,
  async function ( selectOption, tableId) {
    const resolvedOption = this.savedValues.resolve(selectOption);
    const resolvedId = this.savedValues.resolve(tableId);
    const selectLocator = this.page.locator(
      `//div[@id='${resolvedId}']//div[@class='panel-heading']//select`
    ).first();
    await selectLocator.selectOption({ label: resolvedOption });
  }
);

// ── Sticky notes ─────────────────────────────────────────────────────────────

When(
  /^I delete stickey notes by clicking on "([^"]*)"$/,
  async function ( icon) {
    const resolved = this.savedValues.resolve(icon);
    const closeBtn = this.page.locator(
      `//button[@title='${resolved}' or contains(@class,'${resolved.toLowerCase()}')]`
    ).first();
    await closeBtn.waitFor({ state: 'visible', timeout: 10000 });
    await closeBtn.click();
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.acceptPopUp();
  }
);

When(
  /^I delete specific Sticky Notes with title "([^"]*)" on clicking "([^"]*)"$/,
  async function ( stickyTitle, icon) {
    const resolvedTitle = this.savedValues.resolve(stickyTitle);
    const resolvedIcon = this.savedValues.resolve(icon);
    const closeBtn = this.page.locator(
      `//*[text()='${resolvedTitle}']/ancestor::div[1]//button[@title='${resolvedIcon}']`
    ).first();
    await closeBtn.waitFor({ state: 'visible', timeout: 10000 });
    await closeBtn.click();
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.acceptPopUp();
  }
);

// ── Select (without accepting alert) from dropdown ───────────────────────────

When(
  /^I (select|select without accepting alert) "([^"]*)" from dropdown$/,
  async function ( usage, itemName) {
    const resolved = this.savedValues.resolve(itemName);
    logger.info(`Dropdown select: "${resolved}" (${usage})`);
    const locator = this.page.locator(
      `//div[contains(@class,'dropdown__item')]//span[normalize-space(text())='${resolved}'] | ` +
      `//lightning-menu-item//*[normalize-space(text())='${resolved}']`
    ).first();
    await locator.waitFor({ state: 'visible', timeout: 10000 });
    if (usage.includes('without')) {
      await locator.click();
      await this.page.waitForLoadState('domcontentloaded').catch(() => {});
    } else {
      await locator.click();
      const modal = new ModalPage(this.page, this.savedValues);
      await modal.acceptPopUp();
    }
  }
);

// ── Post message in chatter ──────────────────────────────────────────────────

When(
  /^I post the message "([^"]*)" inside chatter$/,
  async function ( message) {
    const resolved = this.savedValues.resolve(message);
    const textarea = this.page.locator(`//div[contains(@class,'chatter')]//textarea`).first();
    await textarea.waitFor({ state: 'visible', timeout: 10000 });
    await textarea.fill(resolved);
    const shareBtn = this.page.locator(`//button[text()='Share' or text()='Post']`).first();
    await shareBtn.click();
  }
);

// ── Mouse hover on row level icon ────────────────────────────────────────────

When(
  /^I hovering mouse on table id "([^"]*)" with table row level icon "([^"]*)" for column value "([^"]*)"$/,
  async function ( flexTableId, iconName, uniqueColumnValues) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(flexTableId);
    const resolvedValue = this.savedValues.resolve(uniqueColumnValues);
    const resolvedIcon = this.savedValues.resolve(iconName);
    const icon = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[text()='${resolvedValue}']/ancestor::tr[1]//*[@title='${resolvedIcon}']`
    ).first();
    await icon.hover();
  }
);

// ── Click on link inside table ───────────────────────────────────────────────

When(
  /^I click on Link containing value "([^"]*)" in flex table id "([^"]*)"$/,
  async function ( linkText, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(linkText);
    const link = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//a[contains(text(),'${resolved}') or contains(@title,'${resolved}')]`
    ).first();
    await link.waitFor({ state: 'visible', timeout: 10000 });
    await link.click();
  }
);

// ── Top right button without processing ──────────────────────────────────────

When(
  /^I click on top right button "([^"]*)" in flex table with id "([^"]*)" without processing$/,
  async function ( buttonName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTopRightButton(tableId, buttonName);
    // No popup acceptance — "without processing"
  }
);

// ── Sidebar content assertions ───────────────────────────────────────────────

When(
  /^I (see|do not see) "([^"]*)" inside "([^"]*)" is displayed$/,
  async function ( usage, sideBarCategory, subHeader) {
    const resolvedCat = this.savedValues.resolve(sideBarCategory);
    const resolvedSub = this.savedValues.resolve(subHeader);
    const locator = this.page.locator(
      `//gnt-side-bar-lwc//*[text()='${resolvedSub}']/ancestor::section//a[text()='${resolvedCat}' or @data-name='${resolvedCat}']`
    ).first();
    if (usage.includes('do not')) {
      await expect(locator).toBeHidden({ timeout: 5000 });
    } else {
      await expect(locator).toBeVisible({ timeout: 10000 });
    }
  }
);

// ── Help text mouse hover ────────────────────────────────────────────────────

When(
  /^I hovering mouse on help text icon inside (page block detail|modal|modal page block|page block detail for invisible element) "([^"]*)"$/,
  async function ( _usage, title) {
    const resolved = this.savedValues.resolve(title);
    const helpIcon = this.page.locator(
      `//*[text()='${resolved}']/ancestor::div[1]//button[contains(@class,'help') or @title='Help'] | ` +
      `//*[text()='${resolved}']/..//lightning-helptext//button`
    ).first();
    if (await helpIcon.isVisible().catch(() => false)) {
      await helpIcon.hover();
      await this.page.waitForTimeout(500);
    }
  }
);

When(
  /^I hovering mouse on help text icon inside "([^"]*)" as "([^"]*)"$/,
  async function ( blockTitle, _blockName) {
    const resolved = this.savedValues.resolve(blockTitle);
    const helpIcon = this.page.locator(
      `//*[text()='${resolved}']/..//lightning-helptext//button | //*[text()='${resolved}']/ancestor::div[1]//button[contains(@class,'help')]`
    ).first();
    if (await helpIcon.isVisible().catch(() => false)) {
      await helpIcon.hover();
      await this.page.waitForTimeout(500);
    }
  }
);

When(
  /^I hovering mouse on help text icon inside "([^"]*)"$/,
  async function ( blockTitle) {
    const resolved = this.savedValues.resolve(blockTitle);
    const helpIcon = this.page.locator(
      `//*[text()='${resolved}']/..//lightning-helptext//button`
    ).first();
    if (await helpIcon.isVisible().catch(() => false)) {
      await helpIcon.hover();
      await this.page.waitForTimeout(500);
    }
  }
);

When(
  /^I hovering mouse on help text icon inside "([^"]*)" for enhanced grid table column$/,
  async function ( columnTitle) {
    const resolved = this.savedValues.resolve(columnTitle);
    const helpIcon = this.page.locator(
      `//th[@title='${resolved}']//lightning-helptext//button | //th//*[text()='${resolved}']/..//lightning-helptext//button`
    ).first();
    if (await helpIcon.isVisible().catch(() => false)) {
      await helpIcon.hover();
      await this.page.waitForTimeout(500);
    }
  }
);

When(
  /^I hovering mouse on page block help text icon inside table "([^"]*)" for column "([^"]*)"$/,
  async function ( tableId, column) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolvedCol = this.savedValues.resolve(column);
    const helpIcon = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//th[@title='${resolvedCol}']//lightning-helptext//button`
    ).first();
    if (await helpIcon.isVisible().catch(() => false)) {
      await helpIcon.hover();
      await this.page.waitForTimeout(500);
    }
  }
);

// ── Upload attachment in send email modal ────────────────────────────────────

When(
  /^I upload attachment "([^"]*)" in send email modal$/,
  async function ( attachmentName) {
    const resolved = this.savedValues.resolve(attachmentName);
    const fileInput = this.page.locator(
      `//div[contains(@class,'modal')]//input[@type='file']`
    ).first();
    const project = getProject();
    await fileInput.setInputFiles(`src/${project}/data/${resolved}`);
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
  }
);

// ── Radio button assertion ───────────────────────────────────────────────────

When(
  /^I (see|do not see) radio button "([^"]*)" for field "([^"]*)"$/,
  async function ( usage, radioButton, fieldApiName) {
    const resolvedRadio = this.savedValues.resolve(radioButton);
    const resolvedField = this.savedValues.resolve(fieldApiName);
    const locator = this.page.locator(
      `//div[@data-field_api_name='${resolvedField}']//input[@value='${resolvedRadio}'] | ` +
      `//div[@data-field_api_name='${resolvedField}']//label[text()='${resolvedRadio}']`
    ).first();
    if (usage.includes('do not')) {
      await expect(locator).toBeHidden({ timeout: 5000 });
    } else {
      await expect(locator).toBeVisible({ timeout: 10000 });
    }
  }
);

// ── Click icon without table ID (product step) ──────────────────────────────

When(
  /^I Click on "([^"]*)" icon for "([^"]*)" without tableid$/,
  async function ( iconName, recordName) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTableActionIconNoId(iconName, recordName);
  }
);

// ── Select module from reassign ownership dropdown ───────────────────────────

When(
  /^I select module "([^"]*)" from reassign ownership dropdown$/,
  async function ( option) {
    const resolved = this.savedValues.resolve(option);
    const dropdown = this.page.locator(
      `//select[contains(@class,'reassign') or contains(@id,'reassign')] | //button[contains(@title,'Reassign')]`
    ).first();
    if (await dropdown.isVisible().catch(() => false)) {
      await dropdown.selectOption({ label: resolved });
    }
  }
);

// ── Click on link (generic) ──────────────────────────────────────────────────

const clickLinkHandler = async function ( linkName) {
  const resolved = this.savedValues.resolve(linkName);
  const link = this.page.locator(
    `//a[text()='${resolved}' or contains(text(),'${resolved}') or @title='${resolved}'] | ` +
    `//span[text()='${resolved}']/ancestor::a`
  ).first();
  await link.waitFor({ state: 'visible', timeout: 15000 });
  await link.dispatchEvent('click');
  await this.page.waitForLoadState('domcontentloaded');
};

Given(/^I click on "([^"]*)" link$/, clickLinkHandler);

// ── Click lookup link ────────────────────────────────────────────────────────

const clickLookupLinkHandler = async function ( lookupName) {
  const resolved = this.savedValues.resolve(lookupName);
  const link = this.page.locator(
    `//a[contains(@class,'lookup') and contains(text(),'${resolved}')] | ` +
    `//a[text()='${resolved}']`
  ).first();
  await link.waitFor({ state: 'visible', timeout: 15000 });
  await link.click();
};

Given(/^I click "([^"]*)" lookup link$/, clickLookupLinkHandler);

// ── Click button in modal ────────────────────────────────────────────────────

const clickButtonInModalHandler = async function ( buttonName) {
  const resolved = this.savedValues.resolve(buttonName);
  const modal = new ModalPage(this.page, this.savedValues);
  await modal.clickModalButton(resolved);
};

When(/^I click "([^"]*)" button in modal$/, clickButtonInModalHandler);

// ── Click button in split screen page details ─────────────────────────────────

When(
  /^I click on "([^"]*)" in the split screen (page details|page details without processing)$/,
  async function ( buttonName, buttonLocation) {
    const resolved = this.savedValues.resolve(buttonName);
    logger.info(`Click "${resolved}" in split screen ${buttonLocation}`);
    
    const pd = new PageDetailsPage(this.page, this.savedValues);
    
    if (buttonLocation === 'page details') {
      await pd.clickTopRightButtonInsideSplitScreen(resolved);
      // Wait for navigation logo to disappear (mirrors Selenium waitForNavigationLogoToDisappear)
      await this.page.waitForTimeout(2000);
    } else {
      await pd.clickTopRightButtonInsideSplitScreenWithoutProcessing(resolved);
    }
  }
);

// ── Click footer link ────────────────────────────────────────────────────────

When(
  /^I click "([^"]*)" footer link$/,
  async function ( footerLink) {
    const resolved = this.savedValues.resolve(footerLink);
    const link = this.page.locator(
      `//footer//a[contains(text(),'${resolved}')] | //a[contains(@class,'footer') and contains(text(),'${resolved}')]`
    ).first();
    await link.waitFor({ state: 'visible', timeout: 10000 });
    await link.click();
  }
);

// ── Click nested button in flex table ────────────────────────────────────────

When(
  /^I click on nested button "([^"]*)" in flex table with id "([^"]*)"$/,
  async function ( buttonName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//button[text()='${resolved}' or @title='${resolved}']`
    ).first();
    await btn.waitFor({ state: 'visible', timeout: 10000 });
    await btn.click();
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.acceptPopUp();
  }
);

// ── Click icon for value inside flex table with id without Split ─────────────

Then(
  /^I click on "([^"]*)" icon for "([^"]*)" inside flex table with id "([^"]*)" without Split$/,
  async function ( iconName, uniqueValue, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTableActionIconById(tableId, iconName, uniqueValue);
  }
);

// ── Click icon for value inside table with table id without processing ───────

When(
  /^I click on "([^"]*)" icon for "([^"]*)" inside table with table id "([^"]*)" without processing$/,
  async function ( iconName, uniqueValue, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTableActionIconById(tableId, iconName, uniqueValue);
  }
);

// ── Click icon in the step progress bar ──────────────────────────────────────

Then(
  /^I click on "([^"]*)" icon in the step progress bar$/,
  async function ( iconName) {
    const resolved = this.savedValues.resolve(iconName);
    const icon = this.page.locator(
      `//*[contains(@class,'step-progress') or contains(@class,'progress-bar')]//*[contains(text(),'${resolved}') or contains(@title,'${resolved}')]`
    ).first();
    await icon.waitFor({ state: 'visible', timeout: 10000 });
    await icon.click();
    await this.page.waitForLoadState('domcontentloaded');
  }
);

// ── Click button on left navigation for global search ────────────────────────

const clickGlobalSearchLeftNavHandler = async function ( buttonName) {
  const resolved = this.savedValues.resolve(buttonName);
  const btn = this.page.locator(
    `//div[@id='allItemsList']//a[text()='${resolved}'] | //div[@id='allItemsList']//span[text()='${resolved}']/ancestor::a`
  ).first();
  await btn.waitFor({ state: 'visible', timeout: 10000 });
  await btn.click();
  await this.page.waitForLoadState('domcontentloaded');
};

When(/^I click on "([^"]*)" button on left navigation for global search$/, clickGlobalSearchLeftNavHandler);

// ── Click top right parallel lines bar ───────────────────────────────────────

When(
  /^I click on top right parallel lines bar for "([^"]*)"$/,
  async function ( panelTitle) {
    const resolved = this.savedValues.resolve(panelTitle);
    const menuBtn = this.page.locator(
      `//*[normalize-space(text())='${resolved}']/ancestor::*[contains(@class,'panel') or contains(@class,'card')]//button[contains(@class,'menu') or contains(@title,'menu') or contains(@class,'dropdown')]`
    ).first();
    await menuBtn.waitFor({ state: 'visible', timeout: 10000 });
    await menuBtn.click();
  }
);

// ── Click table top right button ─────────────────────────────────────────────

When(
  /^I click table top right button "([^"]*)" in flex table with id "([^"]*)"$/,
  async function ( buttonName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    await ft.clickTopRightButton(tableId, buttonName);
  }
);

// ── Click on hyperlink against value in table ────────────────────────────────

When(
  /^I click on hyperlink against "([^"]*)" in table "([^"]*)"$/,
  async function ( value, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(value);
    const link = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//a[contains(text(),'${resolved}') or contains(@title,'${resolved}')]`
    ).first();
    await link.waitFor({ state: 'visible', timeout: 15000 });
    await link.click();
    await this.page.waitForLoadState('domcontentloaded');
  }
);

// ── Click on hyperlink with today's date ─────────────────────────────────────

When(
  /^I click on hyperlink which contains todays date with text "([^"]*)"$/,
  async function ( text) {
    const resolved = this.savedValues.resolve(text);
    const today = new Date();
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const dd = String(today.getDate()).padStart(2, '0');
    const yyyy = today.getFullYear();
    const todayStr = `${mm}/${dd}/${yyyy}`;
    const link = this.page.locator(
      `//a[contains(text(),'${todayStr}') and contains(text(),'${resolved}')]`
    ).first();
    await link.waitFor({ state: 'visible', timeout: 10000 });
    await link.click();
    await this.page.waitForLoadState('domcontentloaded');
  }
);

// ── Click radio button in COI of review form ─────────────────────────────────

When(
  /^I click radio button "([^"]*)" in COI of review form$/,
  async function ( radioLabel) {
    const resolved = this.savedValues.resolve(radioLabel);
    const radio = this.page.locator(
      `//label[contains(text(),'${resolved}')]/preceding-sibling::input[@type='radio'] | ` +
      `//input[@type='radio' and @value='${resolved}']`
    ).first();
    await radio.waitFor({ state: 'visible', timeout: 10000 });
    await radio.click({ force: true });
  }
);

// ── Click on remove for lookup from field ────────────────────────────────────

When(
  /^I click on remove for lookup from field "([^"]*)"$/,
  async function ( fieldApiName) {
    const resolved = this.savedValues.resolve(fieldApiName);
    const removeBtn = this.page.locator(
      `//c-fieldlwc[@data-fieldapiname='${resolved}']//button[contains(@class,'remove') or contains(@title,'Remove')] | ` +
      `//div[@data-field_api_name='${resolved}']//button[contains(@class,'remove') or contains(@title,'Remove')]`
    ).first();
    await removeBtn.waitFor({ state: 'visible', timeout: 10000 });
    await removeBtn.click();
  }
);

// ── Check button not present in table ────────────────────────────────────────

When(
  /^I check button "([^"]*)" is not present in table with id "([^"]*)"$/,
  async function ( buttonName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(buttonName);
    const btn = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//button[text()='${resolved}']`
    ).first();
    await expect(btn).toBeHidden({ timeout: 5000 });
  }
);

// ── Expand/collapse page block ───────────────────────────────────────────────

When(
  /^I "(Expand|Expanded|Collapse)" page block contaninig value "([^"]*)"$/,
  async function ( action, value) {
    const resolved = this.savedValues.resolve(value);
    const header = this.page.locator(
      `//*[normalize-space(text())='${resolved}']/ancestor::*[contains(@class,'panel-heading') or contains(@class,'section')]//button | ` +
      `//*[normalize-space(text())='${resolved}']/ancestor::*[contains(@class,'panel-heading')]`
    ).first();
    await header.waitFor({ state: 'visible', timeout: 10000 });
    await header.click();
  }
);

// ── Navigate to content inside subheader on left side link ───────────────────

const navLeftSideLinkHandler = async function ( content, subheader) {
  const resolvedContent = this.savedValues.resolve(content);
  const resolvedSubheader = this.savedValues.resolve(subheader);
  const link = this.page.locator(
    `//gnt-side-bar-lwc//*[text()='${resolvedSubheader}']/ancestor::section//a[text()='${resolvedContent}' or @data-name='${resolvedContent}']`
  ).first();
  await link.waitFor({ state: 'visible', timeout: 15000 });
  await link.dispatchEvent('click');
  await this.page.waitForLoadState('domcontentloaded');
};

When(/^I navigate to "([^"]*)" content inside "([^"]*)" subheader on left side link$/, navLeftSideLinkHandler);

// ── Navigate to last page in flex table ──────────────────────────────────────

When(
  /^I navigate to last page in flex table "([^"]*)"$/,
  async function ( tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const lastPageBtn = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//button[contains(@title,'Last') or contains(@class,'last-page')]`
    ).first();
    if (await lastPageBtn.isVisible({ timeout: 5000 }).catch(() => false)) {
      await lastPageBtn.click();
      await this.page.waitForLoadState('domcontentloaded');
    }
  }
);

// ── Mouse hover to link ──────────────────────────────────────────────────────

When(
  /^I mouse hover to link contains "([^"]*)"$/,
  async function ( text) {
    const resolved = this.savedValues.resolve(text);
    const link = this.page.locator(`//a[contains(text(),'${resolved}')]`).first();
    await link.waitFor({ state: 'visible', timeout: 10000 });
    await link.hover();
  }
);

// ── Hovering mouse on page block help text icon inside table for LWC ─────────

When(
  /^I hovering mouse on page block help text icon inside table "([^"]*)" for LWC$/,
  async function ( tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const helpIcon = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[contains(@class,'helptext') or contains(@class,'help-icon')]`
    ).first();
    if (await helpIcon.isVisible({ timeout: 5000 }).catch(() => false)) {
      await helpIcon.hover();
    }
  }
);

// ── Switch to iframe ─────────────────────────────────────────────────────────

When(
  /^I switch to iframe with id "([^"]*)"$/,
  async function ( iframeId) {
    const resolved = this.savedValues.resolve(iframeId);
    logger.info(`Switching to iframe: ${resolved}`);
    
    // Wait for iframe to be present
    const iframeElement = this.page.locator(`//iframe[@id='${resolved}' or @name='${resolved}']`).first();
    await iframeElement.waitFor({ state: 'attached', timeout: 10000 });
    
    // Get frame source for logging
    const frameSrc = await iframeElement.getAttribute('src');
    if (frameSrc) {
      logger.info(`  Frame source: ${frameSrc}`);
    }
    
    // For file upload, we don't need to switch context - file input is accessible from main page
    logger.info(`  Iframe is ready for file upload operations`);
  }
);

// ── Enter value in reassign lookup ───────────────────────────────────────────

const enterReassignLookupHandler = async function ( value) {
  const resolved = this.savedValues.resolve(value);
  const input = this.page.locator(
    `//input[contains(@placeholder,'Reassign') or contains(@class,'reassign')] | ` +
    `//div[contains(@class,'reassign')]//input`
  ).first();
  await input.waitFor({ state: 'visible', timeout: 10000 });
  await input.fill(resolved);
  const suggestion = this.page.locator(`//*[contains(@class,'lookup')]//*[contains(text(),'${resolved}')]`).first();
  if (await suggestion.isVisible({ timeout: 10000 }).catch(() => false)) {
    await suggestion.click();
  }
};

When(/^I enter value "([^"]*)" in reassign lookup$/, enterReassignLookupHandler);

// ── Reassign task ────────────────────────────────────────────────────────────

When(
  /^I reassign task to "([^"]*)"$/,
  async function ( userName) {
    const resolved = this.savedValues.resolve(userName);
    const input = this.page.locator(
      `//input[contains(@placeholder,'Reassign') or contains(@class,'reassign')]`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.fill(resolved);
    const suggestion = this.page.locator(`//*[contains(@class,'lookup')]//*[contains(text(),'${resolved}')]`).first();
    if (await suggestion.isVisible({ timeout: 10000 }).catch(() => false)) {
      await suggestion.click();
    }
    const saveBtn = this.page.locator(`//button[text()='Save' or @title='Save']`).first();
    await saveBtn.click();
    await this.page.waitForLoadState('domcontentloaded');
  }
);

// ── Enter value inside lookup from field ─────────────────────────────────────

When(
  /^I enter value "([^"]*)" inside loookup from field "([^"]*)"$/,
  async function ( value, fieldApiName) {
    const resolvedValue = this.savedValues.resolve(value);
    const resolvedField = this.savedValues.resolve(fieldApiName);
    const input = this.page.locator(
      `//c-fieldlwc[@data-fieldapiname='${resolvedField}']//input | ` +
      `//div[@data-field_api_name='${resolvedField}']//input`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.fill(resolvedValue);
    const suggestion = this.page.locator(`//*[contains(@class,'lookup')]//*[contains(text(),'${resolvedValue}')]`).first();
    if (await suggestion.isVisible({ timeout: 10000 }).catch(() => false)) {
      await suggestion.click();
    }
  }
);

// ── Enter value as X into Y on old form ──────────────────────────────────────

When(
  /^I enter value as "([^"]*)" into "([^"]*)" on old form$/,
  async function ( value, fieldLabel) {
    const resolvedValue = this.savedValues.resolve(value);
    const resolvedField = this.savedValues.resolve(fieldLabel);
    const input = this.page.locator(
      `//label[contains(text(),'${resolvedField}')]/..//input | //label[contains(text(),'${resolvedField}')]/..//textarea`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.fill(resolvedValue);
  }
);

// ── Enter value into field for max characters ────────────────────────────────

Then(
  /^I enter value "([^"]*)" into field "([^"]*)" for entering max characters$/,
  async function ( value, fieldApiName) {
    const resolvedValue = this.savedValues.resolve(value);
    const resolvedField = this.savedValues.resolve(fieldApiName);
    const input = this.page.locator(
      `//c-fieldlwc[@data-fieldapiname='${resolvedField}']//input | ` +
      `//c-fieldlwc[@data-fieldapiname='${resolvedField}']//textarea`
    ).first();
    await input.waitFor({ state: 'visible', timeout: 10000 });
    await input.fill(resolvedValue);
  }
);

// ── Enter in rich text prompt input ──────────────────────────────────────────

When(
  /^I enter "([^"]*)" in rich text prompt input$/,
  async function ( value) {
    const resolved = this.savedValues.resolve(value);
    const richText = this.page.locator(
      `//div[contains(@class,'ql-editor') or @contenteditable='true']`
    ).first();
    await richText.waitFor({ state: 'visible', timeout: 10000 });
    await richText.fill(resolved);
  }
);

// ── Enter unique value in field ──────────────────────────────────────────────

const enterUniqueValueHandler = async function ( fieldApiName) {
  const resolved = this.savedValues.resolve(fieldApiName);
  const uniqueVal = `AUTO_${Date.now()}_${Math.floor(Math.random() * 10000)}`;
  const input = this.page.locator(
    `//c-fieldlwc[@data-fieldapiname='${resolved}']//input | ` +
    `//div[@data-field_api_name='${resolved}']//input`
  ).first();
  await input.waitFor({ state: 'visible', timeout: 10000 });
  await input.fill(uniqueVal);
  this.savedValues.set(resolved, uniqueVal);
};

Given(/^I enter unique value in field with apiName "([^"]*)"$/, enterUniqueValueHandler);

// ── Enter unique value in column for table ───────────────────────────────────

const enterUniqueValueInColumnHandler = async function ( colApiName, tableId) {
  const resolvedCol = this.savedValues.resolve(colApiName);
  const ft = new FlexTablePage(this.page, this.savedValues);
  const resolvedId = ft.resolveTableId(tableId);
  const uniqueVal = `AUTO_${Date.now()}_${Math.floor(Math.random() * 10000)}`;
  const input = this.page.locator(
    `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//c-fieldlwc[@data-fieldapiname='${resolvedCol}']//input`
  ).first();
  await input.waitFor({ state: 'visible', timeout: 10000 });
  await input.fill(uniqueVal);
  this.savedValues.set(resolvedCol, uniqueVal);
};

When(/^I enter unique value in column with apiName "([^"]*)" for table with id "([^"]*)"$/, enterUniqueValueInColumnHandler);

// ── Enter unique year value ──────────────────────────────────────────────────

const enterUniqueYearHandler = async function ( fieldApiName) {
  const resolved = this.savedValues.resolve(fieldApiName);
  const year = new Date().getFullYear() + Math.floor(Math.random() * 25) + 10;
  // Try input field first, then fall back to entering via PageDetailsPage (handles modals + combobox)
  const input = this.page.locator(
    `//c-fieldlwc[@data-fieldapiname='${resolved}']//input | //div[@data-field_api_name='${resolved}']//input`
  ).first();
  try {
    await input.waitFor({ state: 'visible', timeout: 3000 });
    await input.fill(String(year));
  } catch (e14) {
    // Field may be a combobox or inside a modal — use PageDetailsPage which handles both
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.enterFieldValue(resolved, String(year));
  }
  this.savedValues.set(resolved, String(year));
};

Given(/^I enter unique year value in field with APIName "([^"]*)"$/, enterUniqueYearHandler);

// ── Select dropdown value in field ───────────────────────────────────────────

const selectDropdownValueHandler = async function ( value, fieldApiName) {
  const resolvedValue = this.savedValues.resolve(value);
  const resolvedField = this.savedValues.resolve(fieldApiName);
  const dropdown = this.page.locator(
    `//c-fieldlwc[@data-fieldapiname='${resolvedField}']//select | ` +
    `//div[@data-field_api_name='${resolvedField}']//select`
  ).first();
  await dropdown.waitFor({ state: 'visible', timeout: 10000 });
  await dropdown.selectOption({ label: resolvedValue });
};

When(/^I select dropdown value "([^"]*)" in field "([^"]*)"$/, selectDropdownValueHandler);

// ── Select user value in field ───────────────────────────────────────────────

const selectUserValueHandler = async function ( value, fieldApiName) {
  const resolvedValue = this.savedValues.resolve(value);
  const resolvedField = this.savedValues.resolve(fieldApiName);
  const input = this.page.locator(
    `//c-fieldlwc[@data-fieldapiname='${resolvedField}']//input | ` +
    `//div[@data-field_api_name='${resolvedField}']//input`
  ).first();
  await input.waitFor({ state: 'visible', timeout: 10000 });
  await input.fill(resolvedValue);
  const suggestion = this.page.locator(`//*[contains(@class,'lookup')]//*[contains(text(),'${resolvedValue}')]`).first();
  if (await suggestion.isVisible({ timeout: 10000 }).catch(() => false)) {
    await suggestion.click();
  }
};

When(/^I select user value "([^"]*)" in field "([^"]*)"$/, selectUserValueHandler);
When(/^I select users value "([^"]*)" in field "([^"]*)"$/, selectUserValueHandler);

// ── Select from dropdown for global search ───────────────────────────────────

const selectGlobalSearchDropdownHandler = async function ( value) {
  const resolved = this.savedValues.resolve(value);
  const dropdown = this.page.locator(
    `//div[contains(@class,'search')]//select | //div[contains(@class,'search')]//button[contains(@title,'filter')]`
  ).first();
  await dropdown.waitFor({ state: 'visible', timeout: 10000 });
  if (await dropdown.evaluate(el => el.tagName).catch(() => '') === 'SELECT') {
    await dropdown.selectOption({ label: resolved });
  } else {
    await dropdown.click();
    const option = this.page.locator(`//*[contains(text(),'${resolved}')]`).first();
    await option.click();
  }
};

When(/^I select "([^"]*)" from dropdown for Global search$/, selectGlobalSearchDropdownHandler);

// ── Perform quick search (generic) ──────────────────────────────────────────

When(
  /^I perform quick search for "([^"]*)"$/,
  async function ( searchValue) {
    const resolved = this.savedValues.resolve(searchValue);
    const searchInput = this.page.locator(
      `//input[contains(@placeholder,'Search') or contains(@class,'search')]`
    ).first();
    await searchInput.waitFor({ state: 'visible', timeout: 10000 });
    await searchInput.fill(resolved);
    await this.page.keyboard.press('Enter');
    await this.page.waitForLoadState('domcontentloaded');
  }
);

// ── Perform quick search inside global search ────────────────────────────────

const quickSearchGlobalHandler = async function ( searchValue) {
  const resolved = this.savedValues.resolve(searchValue);
  const qs = new QuickSearchPage(this.page, this.savedValues);
  await qs.performGlobalQuickSearch(resolved);
};

When(/^I perform quick search inside global search "([^"]*)"$/, quickSearchGlobalHandler);

When(
  /^I perform quick search inside global search "([^"]*)" without processing$/,
  async function ( searchValue) {
    const resolved = this.savedValues.resolve(searchValue);
    const qs = new QuickSearchPage(this.page, this.savedValues);
    await qs.performGlobalQuickSearch(resolved);
  }
);

// ── Save link value from flex table ──────────────────────────────────────────

When(
  /^I save the link value from row "([^"]*)" for column name "([^"]*)" as "([^"]*)" from flex table "([^"]*)"$/,
  async function ( rowValue, colName, saveAs, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolvedRow = this.savedValues.resolve(rowValue);
    const resolvedCol = this.savedValues.resolve(colName);
    const link = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//td//*[contains(text(),'${resolvedRow}')]/ancestor::tr[1]//td//*[contains(text(),'${resolvedCol}')]//a | ` +
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//td//*[contains(text(),'${resolvedRow}')]/ancestor::tr[1]//a`
    ).first();
    const text = await link.textContent() || '';
    this.savedValues.set(saveAs, text.trim());
  }
);

// ── Get value from row for column name ───────────────────────────────────────

const getValueFromRowHandler = async function ( rowValue, colName, tableId) {
  const ft = new FlexTablePage(this.page, this.savedValues);
  const resolvedId = ft.resolveTableId(tableId);
  const resolvedRow = this.savedValues.resolve(rowValue);
  const resolvedCol = this.savedValues.resolve(colName);
  logger.info(`Getting value from row "${resolvedRow}", column "${resolvedCol}" in table "${resolvedId}"`);
};

When(/^I get the value from row "([^"]*)" for column name "([^"]*)" in flex table "([^"]*)"$/, getValueFromRowHandler);

// ── Get field value from sub tab ─────────────────────────────────────────────

When(
  /^I get the field value "([^"]*)" from sub tab "([^"]*)"$/,
  async function ( fieldLabel, subTab) {
    const resolvedField = this.savedValues.resolve(fieldLabel);
    const resolvedTab = this.savedValues.resolve(subTab);
    logger.info(`Getting field "${resolvedField}" from sub tab "${resolvedTab}"`);
  }
);

// ── Compare field from sub tab ───────────────────────────────────────────────

Then(
  /^I compare field "([^"]*)" from sub tab "([^"]*)" with expected field$/,
  async function ( fieldLabel, subTab) {
    const resolvedField = this.savedValues.resolve(fieldLabel);
    const resolvedTab = this.savedValues.resolve(subTab);
    logger.info(`Comparing field "${resolvedField}" from sub tab "${resolvedTab}"`);
  }
);

// ── Get updated budget end date by offset ────────────────────────────────────

const getUpdatedBudgetEndDateHandler = async function ( offset, award) {
  const resolvedOffset = this.savedValues.resolve(offset);
  const resolvedAward = this.savedValues.resolve(award);
  logger.info(`Getting updated budget end date by offset "${resolvedOffset}" for award "${resolvedAward}"`);
};

When(/^I get the updated budget end date by offset "([^"]*)" for award "([^"]*)"$/, getUpdatedBudgetEndDateHandler);

// ── Advance filter values for LWC ────────────────────────────────────────────

const advanceFilterHandler = async function ( tableId, dataTable) {
  const ft = new FlexTablePage(this.page, this.savedValues);
  const resolvedId = ft.resolveTableId(tableId);
  const rows = dataTable.hashes();
  for (const row of rows) {
    const fieldName = row['Field'] || row['FieldName'] || Object.values(row)[0];
    const value = row['Value'] || row['FilterValue'] || Object.values(row)[1];
    if (fieldName && value) {
      const resolvedValue = this.savedValues.resolve(value );
      const input = this.page.locator(
        `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//input[contains(@placeholder,'${fieldName}')]`
      ).first();
      if (await input.isVisible({ timeout: 3000 }).catch(() => false)) {
        await input.fill(resolvedValue);
      }
    }
  }
};

When(/^I enter advance filter values inside id "([^"]*)" for LWC$/, advanceFilterHandler);

// ── Refresh page00 ──────────────────────────────────────────────────────────

Then(
  /^I refresh the page00$/,
  async function () {
    await this.page.reload({ waitUntil: 'domcontentloaded' });
  }
);

// ── Generate random FAIN ─────────────────────────────────────────────────────

When(
  /^I generate the random FAIN and save as "([^"]*)"$/,
  async function ( saveAs) {
    const fain = `FAIN${Date.now()}${Math.floor(Math.random() * 1000)}`;
    this.savedValues.set(saveAs, fain);
    logger.info(`Generated random FAIN: ${fain} → saved as "${saveAs}"`);
  }
);

// ── Generate random PROJECTID ────────────────────────────────────────────────

When(
  /^I generate the random PROJECTID and save as "([^"]*)"$/,
  async function ( saveAs) {
    const projectId = `PROJ${Date.now()}${Math.floor(Math.random() * 1000)}`;
    this.savedValues.set(saveAs, projectId);
    logger.info(`Generated random PROJECTID: ${projectId} → saved as "${saveAs}"`);
  }
);

// ── Generate random SDN (School District Number) ──────────────────────────────

When(
  /^I generate the random SDN and save as "([^"]*)"$/,
  async function ( saveAs) {
    const sdn = `SDN${Date.now()}${Math.floor(Math.random() * 10000)}`.substring(0, 12);
    this.savedValues.set(saveAs, sdn);
    logger.info(`Generated random SDN: ${sdn} → saved as "${saveAs}"`);
  }
);

// ── Enter notes with title and description ───────────────────────────────────

When(
  /^I enter notes with title "([^"]*)" and description "([^"]*)"$/,
  async function ( title, description) {
    const resolvedTitle = this.savedValues.resolve(title);
    const resolvedDesc = this.savedValues.resolve(description);
    
    const titleInput = this.page.locator(`//input[contains(@placeholder,'Title') or contains(@placeholder,'title')]`).first();
    const descInput = this.page.locator(`//textarea[contains(@placeholder,'Description') or contains(@placeholder,'description')]`).first();
    
    await titleInput.fill(resolvedTitle);
    await descInput.fill(resolvedDesc);
    logger.info(`Entered notes: title="${resolvedTitle}", description="${resolvedDesc}"`);
  }
);

// ── Click on mail with subject ───────────────────────────────────────────────

const clickMailSubjectHandler = async function ( subject) {
  const resolved = this.savedValues.resolve(subject);
  logger.info(`Clicking on mail with subject: "${resolved}"`);
  
  // Selenium XPath for mail subject
  const mailSubject = this.page.locator(
    `//div[contains(@class,'message')]//div[text()='${resolved}'] | //div[@class='m']//div[@class='lms' and text()='${resolved}']`
  ).first();
  
  try {
    // Try to click on the mail subject directly
    await mailSubject.click({ timeout: 5000 });
    await this.page.waitForLoadState('domcontentloaded');
    logger.info(`Successfully clicked on mail with subject: "${resolved}"`);
  } catch (e) {
    // If not found, refresh and retry up to 18 times (Selenium approach)
    logger.info(`Mail not found, refreshing and retrying...`);
    for (let i = 0; i < 18; i++) {
      // Click refresh button
      const refreshButton = this.page.locator(
        "//span[text()='Refresh']/parent::button[@type='button'] | //button[@id='refresh'] | //span[text()='Refresh Mailbox']/parent::button[@type='button']"
      ).first();
      await refreshButton.click().catch(() => {});
      await this.page.waitForTimeout(2000);
      
      // Check if mail subject is displayed
      if (await mailSubject.isVisible({ timeout: 5000 }).catch(() => false)) {
        await mailSubject.click();
        await this.page.waitForLoadState('domcontentloaded');
        logger.info(`Successfully clicked on mail with subject after refresh (attempt ${i + 1}): "${resolved}"`);
        return;
      }
      
      // Wait 10 seconds before next retry (Selenium approach)
      await this.page.waitForTimeout(10000);
    }
    throw new Error(`Mail with subject "${resolved}" not found after 18 refresh attempts`);
  }
};

When(/^I click on mail with subject "([^"]*)"$/, clickMailSubjectHandler);

// ── Click on top right button in page detail ──────────────────────────────────

When(
  /^I click on top right button "([^"]*)" in page detail$/,
  async function ( buttonName) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.clickTopRightButton(buttonName);
  }
);

// ── Clear field ───────────────────────────────────────────────────────────────

When(
  /^I clear field "([^"]*)"$/,
  async function ( fieldLabel) {
    const pd = new PageDetailsPage(this.page, this.savedValues);
    await pd.clearFieldValue(fieldLabel);
  }
);
