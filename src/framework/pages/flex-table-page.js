 function _nullishCoalesce(lhs, rhsFn) { if (lhs != null) { return lhs; } else { return rhsFn(); } }
import { expect } from '@playwright/test';
import { BasePage } from './base-page';
import { ModalPage } from './modal-page';

import { logger } from '../utils/logger';

/**
 * All flex-table interactions.
 * XPaths translated 1:1 from FlexTable.java and GovGrantsAssertionObjects.java.
 *
 * Table IDs in feature files use the pattern:
 *   ---<module>:-:<propertyKey>---
 * These are resolved at runtime from properties files.
 * In the new framework we resolve them via the tableId resolver helper.
 */
export class FlexTablePage extends BasePage {
  constructor(page, savedValues) {
    super(page, savedValues);
  }

  /**
   * Resolve a table ID token like "---home:-:internalOrganizationId---"
   * to the actual DOM data-flextablename value.
   * The token format is: ---<module>:-:<propertyKey>---
   */
  resolveTableId(rawTableId) {
    // Primary: use saved-values.resolve() which now handles ---module:-:key---
    // tokens via properties-loader (Phase 1 upgrade)
    const resolved = this.resolve(rawTableId);
    if (resolved !== rawTableId) {
      return resolved;
    }

    // Fallback: static TABLE_ID_MAP for backward compatibility
    const token = rawTableId.match(/^---([^:]+):-:(.+)---$/);
    if (token) {
      const module = token[1];
      const key = token[2];
      if (this.savedValues.has(`tableId:${module}:${key}`)) {
        return this.savedValues.get(`tableId:${module}:${key}`);
      }
      if (this.savedValues.has(`tableId:${key}`)) {
        return this.savedValues.get(`tableId:${key}`);
      }
      return _nullishCoalesce(_nullishCoalesce(TABLE_ID_MAP[`${module}:${key}`], () => ( TABLE_ID_MAP[key])), () => ( rawTableId));
    }
    return rawTableId;
  }

  /**
   * Open the row-level action dropdown for the row containing uniqueValue,
   * then assert that buttonName is (or is not) visible in the dropdown.
   * Translated from GovGrantsAssertionObjects.assertCanOrCannotSeeRowLevelButtonInFlexTableByIdForLWC().
   */
  async assertRowLevelButton(
    tableId,
    uniqueValue,
    buttonName,
    shouldExist
  ) {
    const resolvedId = this.resolveTableId(tableId);
    const resolvedValue = this.resolve(uniqueValue);
    logger.info(`Assert row-level button "${buttonName}" [${shouldExist ? 'visible' : 'hidden'}] for "${resolvedValue}" in table "${resolvedId}"`);

    // Exact Java XPath for dropdown trigger (from GovGrantsAssertionObjects)
    const dropdownTrigger = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//tbody/tr//*[text()='${resolvedValue}']//ancestor::td/div[not(contains(@class,'inputRows'))]/parent::td/preceding-sibling::td//button`
    ).first();

    await this.waitHelper.waitUntilVisible(dropdownTrigger, 20000);
    await dropdownTrigger.dispatchEvent('click');

    // Exact Java XPath for action icon (from FlexTable.getTableActionIcon)
    const actionButton = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//td//*[text()='${buttonName}'] | //td//*[@title='${buttonName}']`
    ).first();

    if (shouldExist) {
      await expect(actionButton).toBeVisible({ timeout: 10000 });
    } else {
      await expect(actionButton).toBeHidden({ timeout: 10000 });
    }

    // Close the dropdown so subsequent steps can re-open it cleanly
    await this.page.keyboard.press('Escape');
    await this.page.waitForTimeout(300);
  }

  /**
   * Click an action icon (View, Edit, Delete) on the row matching uniqueValue
   * without a table ID (uses global row scan).
   * Translated from FlexTable.clickTableActionIcons().
   */
  async clickTableActionIconNoId(iconName, uniqueValue) {
    // Check if uniqueValue is "Record id" - use saved EGMS ID instead (mirroring Selenium logic)
    let actualValue = uniqueValue;
    if (uniqueValue.toLowerCase() === 'record id') {
      if (this.savedValues.has('EGMS ID')) {
        actualValue = '{SavedValue:EGMS ID}';
        logger.info(`Unique value "Record id" will use saved EGMS ID`);
      } else {
        logger.warn(`Unique value "Record id" but EGMS ID not found in saved values`);
      }
    }
    
    const resolved = this.resolve(actualValue);
    logger.info(`Click icon "${iconName}" on row containing "${resolved}"`);

    // Wait for row containing the value to be present (rows load async in LWC)
    await this.waitHelper.waitUntilVisible(
      this.page.locator(`//td//*[text()='${resolved}']`).first(), 20000
    );

    // Exact Java XPath: //td//*[text()='X']/ancestor::tr[1]//button
    const rowTrigger = this.page.locator(
      `//td//*[text()='${resolved}']/ancestor::tr[1]//button`
    ).first();
    await this.waitHelper.waitUntilClickable(rowTrigger, 15000);
    await rowTrigger.scrollIntoViewIfNeeded();
    await rowTrigger.click({ force: true });
    await this.page.waitForTimeout(500);

    // Exact Java XPath: //td//a//span[text()='View']
    const iconLocator = this.page.locator(
      `//td//a//span[text()='${iconName}']`
    ).first();
    await this.waitHelper.waitUntilVisible(iconLocator, 10000);
    await iconLocator.dispatchEvent('click');
  }

  /**
   * Click an action icon on the row matching uniqueValue inside a specific table.
   * Aligned with POC FlexTableHelper.clickTableActionIcon() — exact Java XPaths.
   * Enhanced with visibility check and JavaScript click fallback for non-visible elements.
   */
  async clickTableActionIconById(
    tableId,
    iconName,
    uniqueValue
  ) {
    const resolvedId = this.resolveTableId(tableId);
    
    // Check if uniqueValue is "Record Id" - use saved EGMS ID instead (mirroring Selenium logic)
    let actualValue = uniqueValue;
    if (uniqueValue.toLowerCase() === 'record id') {
      if (this.savedValues.has('EGMS ID')) {
        actualValue = '{SavedValue:EGMS ID}';
        logger.info(`Unique value "Record Id" will use saved EGMS ID`);
      } else {
        logger.warn(`Unique value "Record Id" but EGMS ID not found in saved values`);
      }
    }
    
    const resolvedValue = this.resolve(actualValue);
    logger.info(`Click icon "${iconName}" for "${resolvedValue}" in table "${resolvedId}"`);

    await this.waitHelper.waitForTable();

    // POC exact XPath for dropdown trigger (matches Java FlexTable.java)
    const dropdownTrigger = this.page.locator(
      `xpath=//c-lwc-flex-table[@data-flextablename='${resolvedId}']//tbody/tr//*[text()='${resolvedValue}']/ancestor::td/div[not(contains(@class,'inputRows'))]/parent::td/preceding-sibling::td//button`
    );

    // Check visibility and try normal click first, then JavaScript click
    const isDropdownVisible = await dropdownTrigger.isVisible().catch(() => false);
    if (isDropdownVisible) {
      try {
        await this.clickHelper.click(dropdownTrigger);
        logger.info(`Dropdown trigger clicked normally`);
      } catch (e) {
        logger.warn(`Normal click failed, trying JavaScript: ${e}`);
        await this.clickHelper.jsClick(dropdownTrigger);
        logger.info(`Dropdown trigger clicked with JavaScript`);
      }
    } else {
      logger.info(`Dropdown trigger not visible, trying JavaScript click directly`);
      await this.clickHelper.jsClick(dropdownTrigger);
      logger.info(`Dropdown trigger clicked with JavaScript (not visible)`);
    }

    // POC exact XPath for action icon scoped to the same row
    const iconLocator = this.page.locator(
      `xpath=//c-lwc-flex-table[@data-flextablename='${resolvedId}']//td//*[@title='${resolvedValue}' or text()='${resolvedValue}']/ancestor::tr[1]//td//lightning-menu-item[@title='${iconName}'] | //c-lwc-flex-table[@data-flextablename='${resolvedId}']//td//*[@title='${resolvedValue}' or text()='${resolvedValue}']/ancestor::tr[1]//td//*[text()='${iconName}' or @title='${iconName}'][not(self::span)]`
    ).first();

    // Check visibility and try normal click first, then JavaScript click
    const isIconVisible = await iconLocator.isVisible().catch(() => false);
    if (isIconVisible) {
      try {
        await this.clickHelper.click(iconLocator);
        logger.info(`Icon clicked normally`);
      } catch (e) {
        logger.warn(`Normal click failed, trying JavaScript: ${e}`);
        await this.clickHelper.jsClick(iconLocator);
        logger.info(`Icon clicked with JavaScript`);
      }
    } else {
      logger.info(`Icon not visible, trying JavaScript click directly`);
      await this.clickHelper.jsClick(iconLocator);
      logger.info(`Icon clicked with JavaScript (not visible)`);
    }

    await this.waitForSpinner();
  }

  /**
   * Assert that a field on the highlight/detail panel is showing the expected status.
   * Translated from GovGrantsAssertionObjects.isStatusPresentInHighlightPanel().
   */
  async assertHighlightPanelStatus(record, status) {
    const resolved = this.resolve(status);
    logger.info(`Assert highlight panel: "${record}" is in "${resolved}" status`);
    const locator = this.page.locator(
      `//h2[normalize-space(text())='${record}']/parent::div/../..//c-page-block-section//*[text()='${resolved}'] | ` +
      `//c-page-block-section//label[normalize-space(text())='${record}']/..//*[text()='${resolved}'] | ` +
      `//span[text()='${record}']/ancestor::div/../..//c-page-block-section//*[text()='${resolved}'] | ` +
      `//span[text()='${record}']//following-sibling::div//lightning-formatted-text[text()='${resolved}'] | ` +
      `//label[text()='${record}']//parent::slot//a[text()='${resolved}']`
    ).first();
    await expect(locator).toBeVisible({ timeout: 15000 });
  }

  /** Assert text is visible somewhere inside a named flex table */
  async assertTextInFlexTable(tableId, text) {
    const resolvedId = this.resolveTableId(tableId);
    const resolved = this.resolve(text);
    const locator = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[normalize-space(text())='${resolved}']`
    ).first();
    await expect(locator).toBeVisible({ timeout: 15000 });
  }

  /** Assert text is NOT visible inside a named flex table */
  async assertTextNotInFlexTable(tableId, text) {
    const resolvedId = this.resolveTableId(tableId);
    const resolved = this.resolve(text);
    const locator = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[normalize-space(text())='${resolved}']`
    ).first();
    await expect(locator).toBeHidden({ timeout: 10000 });
  }

  /** Get a locator for a top-right button inside a flex table (POC-aligned XPaths) */
  topRightButtonLocator(tableId, buttonName) {
    const resolvedId = this.resolveTableId(tableId);
    const xpathParts = [
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[text()='${buttonName}' or @value='${buttonName}' or @title='${buttonName}' or @type='${buttonName}']`,
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//button[@Title='${buttonName}' or @title='${buttonName}']`,
      `//*[@id='${resolvedId}']//*[text()='${buttonName}' or @value='${buttonName}' or @title='${buttonName}']`,
      `//*[@id='${resolvedId}']//div[contains(@class,'panel-heading')]//button[contains(text(),'${buttonName}')]`,
      `//*[@data-flextablename='${resolvedId}']//*[text()='${buttonName}' or @value='${buttonName}' or @title='${buttonName}']`
    ];
    return this.page.locator(`xpath=${xpathParts.join(' | ')}`).first();
  }

  /**
   * Click a top-right button inside a flex table.
   * Aligned with Java PhasePanel.clickTableTopRightButton() + getTopRightButtonLocatorByTableId():
   *   //*[@id='{tableId}']//div[contains(@class, 'panel-heading')]//*[text()='{btn}' or @value='{btn}' or @type='{btn}']
   * Also handles LWC flex tables with data-flextablename.
   */
  async clickTopRightButton(tableId, buttonName) {
    const resolvedId = this.resolveTableId(tableId);
    logger.info(`Click top-right button "${buttonName}" in table "${resolvedId}"`);

    // Wait for page + spinners + flex table loading indicators (critical after sub-tab navigation)
    await this.waitHelper.waitForSpinnerDisappear();
    await this.waitHelper.waitForFlexTablesToLoad();
    await this.waitHelper.waitForLightningReady();

    // Scroll to the specific table container so the button is in view
    const tableContainer = this.page.locator(
      `xpath=//c-lwc-flex-table[@data-flextablename='${resolvedId}'] | //*[@id='${resolvedId}'] | //*[@data-flextablename='${resolvedId}']`
    ).first();
    try {
      await tableContainer.waitFor({ state: 'attached', timeout: 30000 });
      await tableContainer.scrollIntoViewIfNeeded({ timeout: 5000 });
      await this.page.waitForTimeout(500);
    } catch (e3) {
      logger.warn(`Table container not found or not scrollable for "${resolvedId}"`);
    }

    // Button XPaths — Java pattern first (highest priority), then LWC variants
    const xpathParts = [
      // Java: getTopRightButtonLocatorByTableId — exact match
      `//*[@id='${resolvedId}']//div[contains(@class,'panel-heading')]//*[text()='${buttonName}' or @value='${buttonName}' or @type='${buttonName}']`,
      // LWC flex table variants
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[text()='${buttonName}' or @value='${buttonName}' or @title='${buttonName}' or @type='${buttonName}']`,
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//button[@title='${buttonName}']`,
      // Broader ID-based fallbacks
      `//*[@id='${resolvedId}']//*[text()='${buttonName}' or @value='${buttonName}' or @title='${buttonName}']`,
      `//*[@data-flextablename='${resolvedId}']//*[text()='${buttonName}' or @value='${buttonName}' or @title='${buttonName}']`
    ];
    const allButtons = this.page.locator(`xpath=${xpathParts.join(' | ')}`);
    // Scroll button into view before visibility check (mirrors Java scroll.withMouseToElement)
    try {
      await allButtons.first().scrollIntoViewIfNeeded({ timeout: 3000 });
    } catch (e4) { /* button may not exist yet */ }
    const directButtonExists = await allButtons.first().isVisible({ timeout: 10000 }).catch(() => false);

    if (directButtonExists) {
      // Direct button found — click the first visible one
      const count = await allButtons.count();
      logger.info(`  Found ${count} "${buttonName}" button(s) in table "${resolvedId}"`);

      let clicked = false;
      for (let i = 0; i < count; i++) {
        const btn = allButtons.nth(i);
        if (await btn.isVisible().catch(() => false)) {
          logger.info(`  Clicking visible button at index ${i}`);
          await this.clickHelper.jsClick(btn);
          clicked = true;
          break;
        }
      }
      if (!clicked) {
        logger.warn(`  No visible button found, JS-clicking last one`);
        await this.clickHelper.jsClick(allButtons.nth(count - 1));
      }
    } else {
      // Fallback: button may be inside a dropdown/hamburger menu (☰)
      logger.info(`  Button "${buttonName}" not directly visible — checking dropdown menu`);
      const menuBtn = this.page.locator(
        `xpath=//c-lwc-flex-table[@data-flextablename='${resolvedId}']//div[contains(@class,'dropdowntogglemenu')]//button[@title='Menu'] | ` +
        `//*[@id='${resolvedId}']//div[contains(@class,'dropdowntogglemenu')]//button[@title='Menu'] | ` +
        `//*[@data-flextablename='${resolvedId}']//div[contains(@class,'dropdowntogglemenu')]//button[@title='Menu']`
      ).first();
      await menuBtn.waitFor({ state: 'visible', timeout: 15000 });
      logger.info(`  Opening dropdown menu in table "${resolvedId}"`);
      await this.clickHelper.jsClick(menuBtn);

      // Wait for dropdown to open and click the menu item
      const menuItem = this.page.locator(
        `xpath=//lightning-menu-item//*[text()='${buttonName}'] | ` +
        `//div[contains(@class,'dropdown')]//span[text()='${buttonName}'] | ` +
        `//lightning-menu-item[@data-value='${buttonName}']`
      ).first();
      try {
        await menuItem.waitFor({ state: 'visible', timeout: 5000 });
        logger.info(`  Clicking menu item "${buttonName}"`);
        await this.clickHelper.jsClick(menuItem);
      } catch (e5) {
        // Menu item not found — button may be standalone (not in a dropdown menu)
        logger.info(`  Menu item "${buttonName}" not found in dropdown — retrying as direct button`);
        const retryBtn = this.page.locator(`xpath=${xpathParts.join(' | ')}`).first();
        await retryBtn.waitFor({ state: 'visible', timeout: 10000 });
        await this.clickHelper.jsClick(retryBtn);
      }
    }

    await this.waitHelper.waitForModal();
    
    // Accept popup after button click (mirrors Selenium acceptPopUp())
    // Handles confirmation dialogs and comment boxes
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.acceptPopUp();
  }

  /**
   * Build a mapping from column header label -> 1-based column position.
   * Mirrors Java FlexTable.constructColumnMapping().
   */
  async constructColumnMapping(row, headerLabels) {
    // Match Selenium exactly: .//ancestor::table[1]//th//ancestor::tr[position()=1]
    const headerRow = row.locator("xpath=.//ancestor::table[1]//th//ancestor::tr[position()=1]").first();
    const columnCount = await headerRow.locator('th').count();
    const mapping = {};
    
    logger.info(`constructColumnMapping: searching for headers: ${JSON.stringify(headerLabels)}`);
    
    for (const headerLabel of headerLabels) {
      for (let i = 1; i <= columnCount; i++) {
        // Match Selenium exactly: .//*[(local-name()='th' or local-name()='td') and not(contains(@class, 'ng-hide'))][i]//span[text()='headerLabel']
        const cell = headerRow.locator(
          `xpath=.//*[(local-name()='th' or local-name()='td') and not(contains(@class,'ng-hide'))][${i}]//span[text()='${headerLabel}']`
        );
        if (await cell.count() > 0) {
          mapping[headerLabel] = i;
          logger.info(`constructColumnMapping: found "${headerLabel}" at position ${i}`);
          break;
        }
      }
      
      // If not found, log warning
      if (!mapping[headerLabel]) {
        logger.warn(`constructColumnMapping: header "${headerLabel}" not found in table`);
      }
    }
    
    return mapping;
  }

  /**
   * Enter values into a newly-created row in a flex table (e.g. after clicking "New").
   * Mirrors Java FlexTable.enterFlexTableRowsForLWC().
   */
  async enterFlexTableRows(
    tableId,
    buttonName,
    rows
  ) {
    const resolvedId = this.resolveTableId(tableId);
    let columnMapping = null;

    for (const rowValues of rows) {
      await this.page.waitForTimeout(1000);
      await this.clickTopRightButton(tableId, buttonName);

      const table = this.page.locator(
        `xpath=//c-lwc-flex-table[@data-flextablename='${resolvedId}']//table | //*[@id='${resolvedId}']//table`
      ).first();
      const newRow = table.locator("xpath=(.//tr[not(descendant::th)])[1]");
      await newRow.waitFor({ state: 'visible', timeout: 15000 });

      if (!columnMapping) {
        columnMapping = await this.constructColumnMapping(newRow, Object.keys(rowValues));
      }

      for (const [column, rawValue] of Object.entries(rowValues)) {
        const value = this.resolve(rawValue);
        const position = columnMapping[column];
        if (!position) {
          logger.warn(`enterFlexTableRows: no column mapping found for "${column}"`);
          continue;
        }
        const cell = newRow.locator(`xpath=.//td[not(contains(@class,'ng-hide'))][${position}]`);
        await this.fillTableCell(cell, value);
      }
    }

    // Save the newly-entered rows
    const saveTopRight = this.topRightButtonLocator(tableId, 'Save');
    if (await saveTopRight.isVisible({ timeout: 3000 }).catch(() => false)) {
      await this.clickTopRightButton(tableId, 'Save');
    } else {
      const modalSave = this.page.locator(
        "xpath=//div[contains(@class,'modal__container')]//c-lwc-flex-table//*[@title='Save' or text()='Save']"
      ).first();
      if (await modalSave.isVisible({ timeout: 3000 }).catch(() => false)) {
        await this.clickHelper.jsClick(modalSave);
      } else {
        // For nested tables, try multiple save button locations
        const parentTableSave = this.page.locator(
          `xpath=//c-lwc-flex-table[@data-flextablename='${resolvedId}']/ancestor::c-lwc-flex-table[1]//*[@title='Save' or text()='Save']`
        ).first();
        if (await parentTableSave.isVisible({ timeout: 3000 }).catch(() => false)) {
          await this.clickHelper.jsClick(parentTableSave);
        } else {
          // Try any visible Save button in the viewport (button or lightning-button)
          const anySave = this.page.locator(
            `xpath=//button[@title='Save' or text()='Save'] | //lightning-button[@title='Save' or contains(text(),'Save')]//button`
          ).first();
          if (await anySave.isVisible({ timeout: 3000 }).catch(() => false)) {
            logger.info(`Using any visible Save button as fallback for table "${resolvedId}"`);
            await this.clickHelper.jsClick(anySave);
          } else {
            logger.warn(`No Save button found for table "${resolvedId}" - skipping save`);
          }
        }
      }
    }
    await this.waitHelper.waitForSpinnerDisappear();
  }

  /**
   * Fill a single table cell based on its input type.
   * Mirrors Java FlexTable.handleFlexTableDataInputs() priority order:
   * lookup -> text/number/email (with date sub-check) -> checkbox -> description-box (rich text).
   */
   async fillTableCell(cell, value) {
    logger.info(`Enter flex table: filling cell with "${value}"`);
    
    // Click cell first to activate any lazy-loaded inputs
    await cell.click({ timeout: 2000 }).catch(() => {});
    await this.page.waitForTimeout(300);
    
    // Lookup / typeahead input
    const searchInput = cell.locator("input[type='search']");
    if (await searchInput.count() > 0) {
      logger.info(`Enter flex table: found search input for "${value}"`);
      await this.clickHelper.jsClick(searchInput);
      await searchInput.fill('');
      await searchInput.fill(value);
      const option = this.page.locator(`xpath=//div[@title='${value}']`);
      await this.waitHelper.waitUntilVisible(option, 8000).catch(() => {});
      if (await option.count() > 0) {
        await this.clickHelper.jsClick(option);
      }
      return;
    }

    // Date picker — checked before generic text since lightning-datepicker also contains input[type=text]
    const hasDatepicker = await cell.locator('lightning-datepicker').count() > 0;
    if (hasDatepicker) {
      const dateInput = cell.locator('lightning-datepicker input').first();
      // Handle date offset conversion (numeric values are days offset from today)
      let dateValue = value;
      const numericValue = parseInt(value, 10);
      if (!isNaN(numericValue)) {
        const offsetDate = new Date();
        offsetDate.setDate(offsetDate.getDate() + numericValue);
        const month = (offsetDate.getMonth() + 1).toString().padStart(2, '0');
        const day = offsetDate.getDate().toString().padStart(2, '0');
        const year = offsetDate.getFullYear();
        dateValue = `${month}/${day}/${year}`;
        logger.info(`fillTableCell: converted date offset ${value} to ${dateValue}`);
      }
      await dateInput.fill('');
      await dateInput.fill(dateValue);
      await dateInput.press('Tab');
      return;
    }

    // c-fieldlwc custom component (budget fields) - check BEFORE plain text handler
    // This ensures budget numeric fields (5000, etc.) are handled via Shadow DOM
    const fieldLwc = cell.locator('c-fieldlwc').first();
    if (await fieldLwc.count() > 0) {
      logger.info(`fillTableCell: found c-fieldlwc component for "${value}"`);
      try {
        // Click the cell first to focus it and ensure the input is rendered
        await cell.click({ timeout: 2000 }).catch(() => {});
        await this.page.waitForTimeout(200);
        
        // Use JavaScript to access shadow DOM and fill the input
        const result = await fieldLwc.evaluate((el, val) => {
          try {
            // Access shadow root
            const shadowRoot = el.shadowRoot;
            if (!shadowRoot) {
              return { success: false, reason: 'no shadowRoot' };
            }
            
            // Log all elements in shadow DOM for debugging
            const allElements = shadowRoot.querySelectorAll('*') ;
            const elementTags = Array.from(allElements).map(e => e.tagName).join(', ');
            
            // Find input element (can be input or lightning-input)
            let input = shadowRoot.querySelector('input');
            if (!input) {
              const lightningInput = shadowRoot.querySelector('lightning-input');
              if (lightningInput) {
                if (lightningInput.shadowRoot) {
                  input = lightningInput.shadowRoot.querySelector('input');
                } else {
                  // lightning-input has no shadowRoot, try finding input directly inside it
                  input = lightningInput.querySelector('input');
                }
              }
            }
            
            if (input) {
              // Clear and set value
              const oldValue = input.value;
              input.value = '';
              input.value = val;
              
              // Trigger input and change events
              input.dispatchEvent(new Event('input', { bubbles: true }));
              input.dispatchEvent(new Event('change', { bubbles: true }));
              input.dispatchEvent(new Event('blur', { bubbles: true }));
              
              return { success: true, reason: 'filled', oldValue, newValue: input.value, tags: elementTags };
            }
            return { success: false, reason: 'no input found', tags: elementTags };
          } catch (e) {
            return { success: false, reason: `error: ${String(e)}` };
          }
        }, value);
        
        logger.info(`fillTableCell: c-fieldlwc result = ${JSON.stringify(result)}`);
        
        if (result.success) {
          logger.info(`fillTableCell: successfully filled c-fieldlwc with "${value}" (old: ${result.oldValue}, new: ${result.newValue})`);
          // Press Tab to move to next field
          await this.page.keyboard.press('Tab');
          return;
        } else {
          logger.warn(`fillTableCell: c-fieldlwc failed for "${value}" - ${result.reason}, tags: ${result.tags}`);
        }
      } catch (e) {
        logger.warn(`fillTableCell: c-fieldlwc fill failed for "${value}": ${e}`);
      }
    }

    // Combobox / Picklist (check EARLY to avoid false matches with edit icons)
    const comboboxTrigger = cell.locator(
      "input[placeholder='Select an Option'], button[aria-haspopup='listbox'], button[id*='combobox-button']"
    ).first();
    if (await comboboxTrigger.count() > 0) {
      logger.info(`fillTableCell: found combobox for "${value}"`);
      await this.clickHelper.jsClick(comboboxTrigger);
      await this.page.waitForTimeout(200);
      
      // Try to find and click the option
      const option = this.page.locator(
        `//lightning-base-combobox-item[@data-value='${value}'] | ` +
        `//lightning-base-combobox-item//span[@title='${value}'] | ` +
        `//span[@class='slds-media__body']//span[@title='${value}']`
      ).first();
      
      const optionVisible = await option.isVisible({ timeout: 3000 }).catch(() => false);
      if (optionVisible) {
        logger.info(`fillTableCell: selected "${value}" with normal click`);
        await this.page.waitForTimeout(100);
        await option.click();
      } else {
        logger.warn(`fillTableCell: option "${value}" not found in combobox, trying keyboard`);
        await this.page.keyboard.type(value);
        await this.page.keyboard.press('Enter');
      }
      await this.page.waitForTimeout(300);
      await this.waitHelper.waitForSpinnerDisappear();
      return;
    }

    // Plain text / number / email / textarea (check BEFORE rich text to prioritize direct inputs)
    const textInput = cell.locator("input[type='text'], input[type='number'], input[type='email'], textarea:not([part='textarea'])");
    if (await textInput.count() > 0) {
      logger.info(`Enter flex table: found text/number input for "${value}"`);
      try {
        await textInput.fill('');
        await textInput.fill(value);
        await textInput.press('Tab');
        logger.info(`Enter flex table: successfully filled text/number input with "${value}"`);
      } catch (e) {
        logger.warn(`fillTableCell: standard fill failed for "${value}", trying JavaScript click + keyboard: ${e}`);
        await this.clickHelper.jsClick(textInput);
        await this.page.keyboard.press('Control+a');
        await this.page.keyboard.press('Backspace');
        await this.page.keyboard.type(value);
        await this.page.keyboard.press('Tab');
      }
      return;
    }

    // Checkbox — handle with dedicated method
    const wantChecked = value.toLowerCase() === 'checked';
    const wantUnchecked = value.toLowerCase() === 'unchecked';
    
    if (wantChecked || wantUnchecked) {
      await this.handleCheckboxCell(cell, value);
      return;
    }

    // Description box (rich text opened via "expand" icon into a modal)
    // HandleTextArea method from Selenium - SCOPE TO CELL to avoid false matches
    // Check this AFTER regular inputs to avoid treating number fields as rich text
    const editForMoreButton = cell.locator(
      "lightning-icon[icon-name='utility:new_window'], lightning-icon[icon-name='utility:add'], lightning-icon[icon-name='utility:edit']"
    ).first();
    
    if (await editForMoreButton.count() > 0) {
      // Click edit button with JavaScript (mirrors Selenium: click().withJavaScript(editForMoreButton))
      await this.clickHelper.jsClick(editForMoreButton);
      
      // Find rich text area (mirrors Selenium: richTextArea xpath)
      const richTextArea = this.page.locator(
        `//div[contains(@class,'slds-modal__content')]//textarea[@part='textarea'] | ` +
        `//div[@part='modal-body']//textarea[@part='textarea'] | ` +
        `//div[@part='rich-text-editor']//div[contains(@class,'rich-text-area')]`
      ).first();
      
      // Click rich text area with JavaScript (mirrors Selenium: click().withJavaScript(richTextArea))
      await this.clickHelper.jsClick(richTextArea);
      
      // Clear and enter value (mirrors Selenium: textInput().toClear() and textInput().in())
      await richTextArea.fill('');
      await richTextArea.fill(value);
      
      // Click save button with JavaScript (mirrors Selenium: click().withJavaScript(saveButtonOnModal))
      const saveButtonOnModal = this.page.locator(
        `//div[contains(@class,'slds-modal__container')]//footer//button[@title='Save' or text()='Save'] | ` +
        `//div[@class='confirm-modal']//button[@title='Save' or text()='Save']`
      ).first();
      await this.clickHelper.jsClick(saveButtonOnModal);
      return;
    }
    
    // Fallback for utility:new_window icon (legacy)
    const expandIcon = cell.locator("lightning-icon[icon-name='utility:new_window']").first();
    if (await expandIcon.count() > 0) {
      await this.clickHelper.jsClick(expandIcon);
      const richTextArea = this.page.locator(
        `//div[contains(@class,'slds-modal__content')]//textarea[@part='textarea'] | ` +
        `//div[@part='modal-body']//textarea[@part='textarea'] | ` +
        `//div[@part='rich-text-editor']//div[contains(@class,'rich-text-area')]`
      ).first();
      await this.waitHelper.waitUntilVisible(richTextArea, 5000);
      await richTextArea.fill('');
      await richTextArea.fill(value);
      const saveBtn = this.page.locator(
        `//div[contains(@class,'slds-modal__container')]//footer//button[@title='Save' or text()='Save'] | ` +
        `//div[@class='confirm-modal']//button[@title='Save' or text()='Save']`
      ).first();
      await this.clickHelper.jsClick(saveBtn);
      return;
    }

    // Lightning-input wrapper (common for currency/number fields in budget tables)
    const lightningInput = cell.locator("lightning-input").first();
    if (await lightningInput.count() > 0) {
      const input = lightningInput.locator("input").first();
      if (await input.count() > 0) {
        logger.info(`fillTableCell: filling lightning-input with "${value}"`);
        try {
          // Click cell first to activate input
          await cell.click({ timeout: 2000 }).catch(() => {});
          await this.page.waitForTimeout(300);
          await input.click({ timeout: 3000 });
          await input.fill('');
          await input.fill(value);
          await input.press('Tab');
          return;
        } catch (e) {
          logger.warn(`fillTableCell: lightning-input fill failed, trying keyboard: ${e}`);
          await this.clickHelper.jsClick(input);
          await this.page.keyboard.press('Control+a');
          await this.page.keyboard.type(value);
          await this.page.keyboard.press('Tab');
          return;
        }
      }
    }

    // Fallback: some cells (e.g. number/currency fields in inline-edit mode) render
    // their input lazily or only after the cell is clicked. Click cell first to activate.
    const anyInput = cell.locator("input:not([type='hidden']), textarea").first();
    if (await anyInput.count() > 0) {
      logger.info(`fillTableCell: filling fallback input with "${value}"`);
      try {
        // Click cell first to ensure input is active
        await cell.click({ timeout: 2000 }).catch(() => {});
        await this.page.waitForTimeout(300);
        await anyInput.click({ timeout: 3000 });
        await anyInput.fill('');
        await anyInput.fill(value);
        await anyInput.press('Tab');
        return;
      } catch (e) {
        logger.warn(`fillTableCell: fallback input fill failed, trying keyboard: ${e}`);
        await this.clickHelper.jsClick(anyInput);
        await this.page.keyboard.press('Control+a');
        await this.page.keyboard.type(value);
        await this.page.keyboard.press('Tab');
        return;
      }
    }

    logger.warn(`fillTableCell: could not determine input type for value "${value}"`);
  }

  /**
   * Handle checkbox cells in flex tables
   * Searches at row level since checkbox may not be inside the cell element
   */
   async handleCheckboxCell(cell, value) {
    const wantChecked = value.toLowerCase() === 'checked';
    const wantUnchecked = value.toLowerCase() === 'unchecked';
    
    logger.info(`handleCheckboxCell: processing checkbox for "${value}"`);
    
    // Get the parent row to search for checkbox at row level using XPath
    const row = cell.locator('..').locator('..').locator('..'); // cell -> td -> tr (go up 3 levels)
    
    // Try multiple checkbox selector patterns at row level
    const checkboxSelectors = [
      "span.slds-checkbox_faux",  // Standard Lightning checkbox overlay
      "span.slds-checkbox--faux",  // Alternative checkbox overlay
      "input[type='checkbox']",  // Standard checkbox input
      "lightning-primitive-input-checkbox input",  // Lightning primitive checkbox
      "lightning-input[type='checkbox'] input",  // Lightning input checkbox
      "lightning-input input[type='checkbox']",  // Nested checkbox in lightning-input
      ".slds-checkbox input",  // Checkbox within slds-checkbox class
      "[type='checkbox']"  // Any checkbox by type attribute
    ];
    
    let checkboxElement = null;
    let selectorUsed = '';
    
    // Search at row level first
    for (const selector of checkboxSelectors) {
      const el = row.locator(selector).first();
      if (await el.count() > 0) {
        checkboxElement = el;
        selectorUsed = selector;
        logger.info(`handleCheckboxCell: found checkbox at row level using "${selector}"`);
        break;
      }
    }
    
    // If not found at row level, try cell level
    if (!checkboxElement) {
      for (const selector of checkboxSelectors) {
        const el = cell.locator(selector).first();
        if (await el.count() > 0) {
          checkboxElement = el;
          selectorUsed = selector;
          logger.info(`handleCheckboxCell: found checkbox at cell level using "${selector}"`);
          break;
        }
      }
    }
    
    if (checkboxElement) {
      // Get current state - for span elements, find the associated input
      let isChecked = false;
      try {
        if (selectorUsed.includes('input')) {
          isChecked = await checkboxElement.isChecked().catch(() => false);
        } else {
          // For span elements, find the associated input in the same row/cell
          const associatedInput = row.locator('input[type="checkbox"]').first();
          if (await associatedInput.count() > 0) {
            isChecked = await associatedInput.isChecked().catch(() => false);
          }
        }
      } catch (e) {
        // Can't check state, proceed anyway
        logger.warn(`handleCheckboxCell: could not check checkbox state: ${e}`);
      }
      
      logger.info(`handleCheckboxCell: checkbox state=${isChecked}, want=${value}`);
      
      // Only click if state doesn't match desired state
      if ((wantChecked && !isChecked) || (wantUnchecked && isChecked)) {
        try {
          logger.info(`handleCheckboxCell: clicking checkbox via ${selectorUsed}`);
          await checkboxElement.evaluate((el) => el.click());
          await this.page.waitForTimeout(300);
          return;
        } catch (e) {
          logger.warn(`handleCheckboxCell: checkbox click failed: ${e}`);
          // Try force click
          try {
            await checkboxElement.evaluate((el) => {
              if (el.type === 'checkbox') {
                el.checked = !el.checked;
              }
              el.dispatchEvent(new Event('change', { bubbles: true }));
              el.dispatchEvent(new Event('click', { bubbles: true }));
            });
            return;
          } catch (e2) {
            logger.warn(`handleCheckboxCell: force checkbox click also failed: ${e2}`);
          }
        }
      } else {
        logger.info(`handleCheckboxCell: checkbox already in desired state, skipping click`);
      }
      return;
    }
    
    // Fallback: try clicking the cell directly
    logger.warn(`handleCheckboxCell: no checkbox element found, trying direct cell click`);
    try {
      await cell.click({ timeout: 2000 });
      await this.page.waitForTimeout(500);
    } catch (e) {
      logger.warn(`handleCheckboxCell: direct cell click failed: ${e}`);
    }
  }

  /**
   * Edit existing rows inline. The first DataTable column's value is used to
   * locate the row (its header is ignored as an edit target); remaining
   * columns are the values to set on that row.
   * Mirrors Java FlexTable.editFlexTableRowsInlineForLWC().
   */
  async editFlexTableRowsInline(
    tableId,
    editButtonName,
    rawRows
  ) {
    const resolvedId = this.resolveTableId(tableId);
    const tableLocator = `//c-lwc-flex-table[@data-flextablename='${resolvedId}']`;
    const headers = rawRows[0];
    const identifierHeader = headers[0];

    await this.waitHelper.waitForFlexTablesToLoad();

    let columnMap = null;

    for (let r = 1; r < rawRows.length; r++) {
      const rowData = rawRows[r];
      const identifierValue = this.resolve(rowData[0]);
      logger.info(`Inline edit row identified by "${identifierHeader}"="${identifierValue}" in table "${resolvedId}"`);

      const currentRow = this.page.locator(
        `xpath=${tableLocator}//td//*[text()='${identifierValue}']/ancestor::tr[1]`
      ).first();
      await currentRow.waitFor({ state: 'visible', timeout: 8000 });

      // Build column mapping from currentRow (like Selenium) - only once
      if (columnMap === null) {
        const editHeaders = headers.slice(1); // Skip identifier column
        columnMap = await this.constructColumnMapping(currentRow, editHeaders);
        logger.info(`editFlexTableRowsInline: column mapping = ${JSON.stringify(columnMap)}`);
      }

      // Open the row for editing via its action dropdown
      await this.clickTableActionIconById(tableId, editButtonName, identifierValue);
      await this.page.waitForTimeout(500);

      // Re-locate the row after clicking edit — the DOM re-renders into edit mode.
      // Multiple rows may have 'inputRows' class, but only the actively-edited row
      // will contain editable inputs (lightning-input, input, textarea) at the target
      // column positions. Find that row.
      const allInputRows = this.page.locator(`xpath=${tableLocator}//tr[contains(@class,'inputRows')]`);
      const inputRowCount = await allInputRows.count();

      // Determine the first target column position for probing editable inputs
      const firstEditCol = headers[1];
      const probeColPos = columnMap[firstEditCol];

      let editedRow = allInputRows.first(); // default fallback
      for (let i = 0; i < inputRowCount; i++) {
        const candidateRow = allInputRows.nth(i);
        const probeCell = candidateRow.locator(`td:nth-child(${probeColPos})`).first();
        const hasEditable = await probeCell.locator("lightning-input, input:not([type='hidden']), textarea").count().catch(() => 0);
        if (hasEditable > 0) {
          editedRow = candidateRow;
          logger.info(`editFlexTableRowsInline: found editable row at inputRow index ${i} for "${identifierValue}"`);
          break;
        }
      }

      await editedRow.waitFor({ state: 'visible', timeout: 8000 }).catch(() => {});

      // Fill each column using XPath with ng-hide filter (like Selenium)
      // This is critical: .//td[not(contains(@class,'ng-hide'))][position]
      // filters hidden columns FIRST, then selects the Nth visible one
      for (let c = 1; c < headers.length; c++) {
        const column = headers[c];
        const value = this.resolve(rowData[c]);
        const colPos = columnMap[column];
        if (!colPos) {
          logger.warn(`editFlexTableRowsInline: column "${column}" not found in table headers`);
          continue;
        }
        logger.info(`editFlexTableRowsInline: filling column "${column}" (pos ${colPos}) with value "${value}"`);
        
        // Use XPath like Selenium: .//td[not(contains(@class,'ng-hide'))][position]
        const cell = editedRow.locator(`xpath=.//td[not(contains(@class,'ng-hide'))][${colPos}]`).first();
        await this.fillTableCell(cell, value);
      }
    }

    // Save changes - use parent table Save button XPath (for nested tables like Budget)
    const parentSaveXpath = 
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//ancestor::c-lwc-flex-table[2]//button[text()='Save'] | ` +
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//ancestor::c-lwc-flex-table[1]//button[text()='Save']`;
    
    const parentSave = this.page.locator(`xpath=${parentSaveXpath}`).first();
    if (await parentSave.isVisible({ timeout: 3000 }).catch(() => false)) {
      logger.info(`Using parent table Save button for table "${resolvedId}"`);
      await this.clickHelper.jsClick(parentSave);
    } else {
      // Fallback to top-right button
      const saveTopRight = this.topRightButtonLocator(tableId, 'Save');
      if (await saveTopRight.isVisible({ timeout: 3000 }).catch(() => false)) {
        await this.clickTopRightButton(tableId, 'Save');
      } else {
        const fallbackSave = this.page.locator(
          `xpath=//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[@title='Save' or text()='Save']`
        ).first();
        await this.clickHelper.jsClick(fallbackSave);
      }
    }
    await this.waitHelper.waitForSpinnerDisappear();

    // Wait for edit mode to fully close (inputRows should disappear after save)
    await this.page.locator(`xpath=${tableLocator}//tr[contains(@class,'inputRows')]`)
      .first()
      .waitFor({ state: 'hidden', timeout: 5000 })
      .catch(() => {});
  }

  /**
   * Perform modal-specific quick search for LWC flex table.
   * Mirrors Selenium: QuickSearch.performModalSpecificQuickSearchForLWC()
   */
  async performModalSpecificQuickSearchForLWC(tableId, searchTerm) {
    const resolvedId = this.resolveTableId(tableId);
    const resolvedSearch = this.resolve(searchTerm);
    logger.info(`Quick search in table "${resolvedId}" for "${resolvedSearch}"`);
    
    const searchInputBox = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//input[@placeholder='Search...' and @type='search']`
    ).first();
    
    try {
      await searchInputBox.waitFor({ state: 'visible', timeout: 10000 });
      await searchInputBox.clear();
      await searchInputBox.fill(resolvedSearch);
      await searchInputBox.press('Enter');
    } catch (e) {
      // Fallback with JavaScript (mirrors Selenium: textInput().withJavaScript)
      logger.warn(`  First search attempt failed, trying JavaScript: ${e}`);
      await searchInputBox.clear();
      await searchInputBox.evaluate((el, val) => {
        el.value = val;
        el.dispatchEvent(new Event('input', { bubbles: true }));
      }, resolvedSearch);
      await searchInputBox.press('Enter');
    }
  }

  /**
   * Select checkboxes in flex table.
   * Mirrors Selenium: FlexTable.selectCheckBoxes()
   */
  async selectCheckBoxes(flexTableId, ...uniqueColumnTexts) {
    const resolvedId = this.resolveTableId(flexTableId);
    
    // If no strings, check "select all" box
    if (uniqueColumnTexts.length === 0) {
      const checkAllSelector = this.page.locator(
        `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//th[contains(@id,'allselect')]//span[@class='slds-checkbox_faux']`
      ).first();
      await checkAllSelector.evaluate((el) => el.click());
      logger.info(`  Selected all checkboxes in table "${resolvedId}"`);
      return;
    }
    
    // Select specific rows
    for (const uniqueColumn of uniqueColumnTexts) {
      const resolvedColumn = this.resolve(uniqueColumn);
      const rowCheckboxSelector = this.page.locator(
        `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//div//*[text()='${resolvedColumn}']//ancestor::tr[@class='inputRows']//span[@class='slds-checkbox_faux']`
      ).first();
      await rowCheckboxSelector.evaluate((el) => el.click());
      logger.info(`  Selected checkbox for "${resolvedColumn}"`);
    }
  }

  /**
   * Select records in table and click top-right button.
   * Mirrors Selenium: ProjectManager.chooseRecordForAssociation()
   */
  async chooseRecordForAssociation(buttonName, flexTableId, ...recordUniqueValues) {
    const resolvedId = this.resolveTableId(flexTableId);
    logger.info(`Choose record for association in table "${resolvedId}" and click button "${buttonName}"`);
    
    for (const recordUniqueValue of recordUniqueValues) {
      const resolvedValue = this.resolve(recordUniqueValue);
      // Perform modal-specific quick search
      await this.performModalSpecificQuickSearchForLWC(flexTableId, resolvedValue);
      // Wait for search to complete (mirrors Selenium: makeThreadSleep(1000))
      await this.page.waitForTimeout(1000);
      // Select checkbox for the record
      await this.selectCheckBoxes(flexTableId, resolvedValue);
    }
    
    // Click the top-right button
    await this.clickTopRightButton(flexTableId, buttonName);
  }

  /**
   * Click right panel button in flex table.
   * Mirrors Selenium: PhasePanel.clickAnyRightPannelButton()
   */
  async clickAnyRightPannelButton(idOfPanelButton, buttonName) {
    const resolvedId = this.resolveTableId(idOfPanelButton);
    const resolvedButton = this.resolve(buttonName);
    logger.info(`Click right panel button "${resolvedButton}" in table "${resolvedId}"`);
    
    const rightPanelButton = this.page.locator(
      `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//*[@title='${resolvedButton}' or text()='${resolvedButton}']`
    ).first();
    await rightPanelButton.evaluate((el) => el.click());
  }

  /**
   * Select value from "Show entries" dropdown in flex table.
   * Mirrors Selenium: FlexTable.flexTableShowEntriesDropDownForLWC()
   */
  async flexTableShowEntriesDropDownForLWC(flexTableId, numberOfEntries) {
    const resolvedId = this.resolveTableId(flexTableId);
    const resolvedEntries = this.resolve(numberOfEntries);
    logger.info(`Select "${resolvedEntries}" from show entries dropdown in table "${resolvedId}"`);
    
    // Find the entries dropdown input
    const entriesDropDown = this.page.locator(
      `//*[@data-flextablename='${resolvedId}']//div//input[@placeholder='Select an Option']`
    ).first();
    
    // Find the dropdown option
    const elementDropDown = this.page.locator(
      `//span[text()='Show']/parent::div/following-sibling::div//li[@data-id='${resolvedEntries}'] | //span[normalize-space()='${resolvedEntries}']`
    ).first();
    
    try {
      await entriesDropDown.scrollIntoViewIfNeeded();
      await entriesDropDown.click();
      await elementDropDown.scrollIntoViewIfNeeded();
      await elementDropDown.click();
      logger.info(`Selected "${resolvedEntries}" from dropdown using normal click`);
    } catch (e) {
      logger.warn(`Normal click failed, trying JavaScript fallback: ${e}`);
      await entriesDropDown.evaluate((el) => el.click());
      await elementDropDown.evaluate((el) => el.click());
      logger.info(`Selected "${resolvedEntries}" from dropdown using JavaScript click`);
    }
  }
}

/**
 * Static map of property key → actual Salesforce DOM data-flextablename value.
 * Populated from home.properties and equivalent files.
 * This replaces the Java Properties file lookups at runtime.
 */
export const TABLE_ID_MAP = {
  // ── Organization (home.properties) ────────────────────────────────────────
  organizationId: 'Organizations',
  internalOrganizationId: 'InternalOrganizationHierarchyEnhanced',
  dunsTableId: 'GrantoeRelatedDUNS',
  relatedContactsTableId: 'GrantorRelatedContacts',
  additionalAddressTableId: 'GrantorAdditionalAddressInternal',
  subrecipientActiveAccountId: 'ActiveAccount',
  SubrecipientOrganizationPending: 'UserRegistration',
  subrecipientContactTableId: 'SubrecipientContacts',
  subrecipientcontactTableId: 'flexTableRandomID',
  indActiveAccountId: 'ActiveAccountIndApplicant',
  indirectRateFlextableId: 'GrantorIndirectRateGrid',
  orgnizationIndirectRateTable: 'OrganizationIndirectRateGrid',
  SubmittedApplicationTableId: 'RecipientAppReviewList',
  RelatedLogGrantsTableId: 'ActiveGrantsByOrganization',
  focusAreaFilesTableId: 'GrantorFocusAreaFilesiframeContentId',

  // ── Contacts (home.properties) ────────────────────────────────────────────
  reviewersTableId: 'Reviewers',
  internalContactTableId: 'InternalContacts',
  indContactTableId: 'AdditionalUser',
  userContactsTableId: 'AdditionalUser',
  PotentialReviewerContactTableId: 'Reviewers',
  termsAndConditionsTableId: 'MasterTermConditions',

  // ── Tasks (home.properties / program.properties) ──────────────────────────
  externalPendingTasktableId: 'PendingTasks',
  completedAssignedToMe: 'HomePhaseCompletedTasks',
  completedAssignedByMe: 'HomePhaseCompletedTasksBy',
  internalHomePendingTaskTableId: 'HomePendingTasks',
  planningPendingTaskTableId: 'PhasePendingTasks',
  homePendingTableId: 'HomePendingTasks',
  pendingTaskTableId: 'PhasePendingTasks',
  PendingTaskAssignedToMeTableId: 'HomePendingTasks',
  PendingTaskAssignedByMeTableId: 'HomePendingTasksBy',
  CompletedTaskAssignedToMeTableId: 'HomePhaseCompletedTasks',
  CompletedTaskAssignedByMeTableId: 'HomePhaseCompletedTasksBy',
  completedTaskTableId: 'PhaseCompletedTasks',
  grantorTaskReassignTableId: 'TaskReassignment',

  // ── Programs (program.properties) ─────────────────────────────────────────
  programsTableId: 'Programs',
  checklistTableId: 'ProgramChecklists',
  contactsTableId: 'DataTableEnhanceProgramContacts',
  associateContactsTableId: 'AssociateProgramContacts',
  extapproverTableId: 'ProgramRolesAndResponsibilities',
  approverTableId: 'ProgramRolesAndResponsibilitiesInternalProg',
  focusAreaTableId: 'GrantorServiceAreasProgram',
  associateFocusAreaTableId: 'SelectProgramServiceArea',
  objectivesTableId: 'RelatedProgramGoalsandObjectives',
  associateObjectivesTableId: 'SelectGoals',
  kpiTableId: 'ProgramKeyOutcomes',
  associateKPITableId: 'SelectProgramKPIs',
  peerReviewTableId: 'ProgramReviewerEnhancedGrid',
  reviewStepTableId: 'ProgramReviewStepTemplates',
  reviewFormTableId: 'ProgramReviewStepPanelTemplatesmodalDiv',
  programReviewPanel: 'ProgramReviewPanelCategories',
  programReviewPanelQuestionsTableId: 'ProgramRelatedReviewPanelQuestions',
  ProgramBusinessFormTableId: 'ProramPackagesGrantor',
  reviewFormPanelId: 'ProgramReviewStepPanelTemplates',
  GrantorInternalProgramFilesTableId: 'GrantorInternalProgramFiles',
  ProgramFundingAccountTableId: 'FundingAccountsEnhancedGrid',
  AnnouncementTableId: 'RelatedAnnouncements',
  businessFormTableId: 'ProramPackagesGrantor',
  previewPackageTableId: 'PreviewPackageForms',
  packagesTableId: 'FormsandPackages',
  programOwnerTableId: 'ProgramOwnerResponsibilities',
  addReviewersTableId: 'ProgramRelatedReviewStepUsers',
  internalProgramNotesTableId: 'InternalProgramContentNotes',
  historyTableId: 'History',
  snapshotHistoryTableId: 'SnapshotFiles',
  grantorSnapshothistoryTable: 'SnapshotFiles',
  externalProgramNotesTableId: 'ExternalProgramContentNotes',
  ReviewFormsTableID: 'ProgramReviewStepPanelTemplates',
  ReviewCategoriesTableId: 'ProgramReviewPanelCategories',
  ReviewQuestionsTableId: 'ProgramRelatedReviewPanelQuestions',

  // ── Focus Areas (focusarea.properties) ────────────────────────────────────
  'focusarea:focusAreaTableId': 'GrantorServiceAreas',
  relatedProgramsTableId: 'RelatedPrograms',
  FocusAreaFilesTableId: 'GrantorFocusAreaFiles',
  ActiveGrantsTableIdFocusArea: 'RelatedGrants',

  // ── KPI (keyperformanceindicator.properties) ───────────────────────────────
  'keyperformanceindicator:kpiTableId': 'GrantorMasterKPIs',
  GrantorKPIFilesTableId: 'GrantorKPIFiles',
  ObjectiveTableId: 'Goals',

  // ── Strategic Plan (strategicplan.properties) ──────────────────────────────
  StrategicPlansTableId: 'StrategicPlansGrantor',
  'strategicplan:strategicGoalObjectivesTableId': 'GrantorStrategicGoalObjectives',
  strategicGoalObjectivesTableId: 'GrantorStrategicGoalObjectives',
  'strategicplan:strategicGoalRelatedObjectivesTableId': 'RelatedObjectivesGrantor',
  strategicGoalRelatedObjectivesTableId: 'RelatedObjectivesGrantor',
  ObjectivesKPITableId: 'KPIGoalsandObjectivesGrid',
  ListOfActiveKPITableId: 'SelectKPIs',

  // ── Module-qualified overrides (same key, different module) ───────────────
  'program:focusAreaTableId': 'GrantorServiceAreasProgram',
  'program:associateFocusAreaTableId': 'SelectProgramServiceArea',
  'program:kpiTableId': 'ProgramKeyOutcomes',
  'program:associateKPITableId': 'SelectProgramKPIs',
  'program:objectivesTableId': 'RelatedProgramGoalsandObjectives',
  'program:associateObjectivesTableId': 'SelectGoals',
  'announcement:objectivesTableId': 'AnnouncementGranteeStrategicGoalsObjectives',
  'announcement:approversTableId': 'AnnouncementRolesandResponsibility',
  'announcement:fundingAccountsTableId': 'AnnouncementFundingAccountGrantor',
  'subAwardStandAlone:focusAreaTableId': 'EnhancedGrantorAwardServiceAreas',
  'subAwardStandAlone:fundingAccountsTableId': 'AwardFundingAccounts',
  'subAwardStandAlone:objectivesTableId': 'GrantorAwardGoalsObjectives',
  'subAwardStandAlone:kpiTableId': 'GrantorAwardKeyOutcomes',
  'subAwardFromFDM:focusAreaTableId': 'EnhancedGrantorAwardServiceAreas',
  'subAwardFromFDM:fundingAccountsTableId': 'AwardFundingAccounts',
  'subAwardFromFDM:kpiTableId': 'GrantorAwardKeyOutcomes',

  // ── Announcements (announcement.properties) ────────────────────────────────
  contactTableId: 'AnnouncementContacts',
  fundingAccountsTableId: 'AnnouncementFundingAccountGrantor',
  annoucementTableId: 'ActiveFundingOpportunities',
  competitiveAnnouncementTableId: 'ActiveFundingOpportunitiesCompitive',
  formulaAnnouncementTableId: 'ActiveFundingOpportunitiesFormula',
  fundingAccTableId: 'SelectAnnFundingAccounts',
  budgetPeriodTableId: 'AnnouncementBudgetPeriod',
  annoucementContactTableId: 'AssociateAnnouncementContacts',
  goalsTableId: 'SelectAnnGoals',
  approversTableId: 'AnnouncementRolesandResponsibility',
  reviewPanelTableId: 'ReviewPanelCategories',
  reviewPanelQuestionsTableId: 'RelatedReviewPanelQuestions',
  annChecklist: 'AnnouncementChecklists',
  ActiveFundingOpportunitiesAllTableId: 'ActiveFundingOpportunitiesAll',
  competitiveTableId: 'ActiveFundingOpportunitiesCompitive',

  // ── SubAward Standalone (subAwardStandAlone.properties) ───────────────────
  activeGrantsTableId: 'GrantorActiveGrants',
  subawardsTableId: 'SubawardsGridGrantor',
  keyContactsTableId: 'AssociateSubawardContacts',
  'fundingAccountsTableId-award': 'AwardFundingAccounts',
  awardFundingAccountsTableId: 'SelectAwardFundingAccounts',
  'focusAreaTableId-award': 'EnhancedGrantorAwardServiceAreas',
  subAwardBudgetTableId: 'SubAwardBudgetCategoryFlexGrid',
  'objectivesTableId-award': 'GrantorAwardGoalsObjectives',
  'kpiTableId-award': 'GrantorAwardKeyOutcomes',
  associatedContactsTableId: 'SubawardGrantorContacts',
  awardApproversTableId: 'GrantorAwardRolesAndResponsibilities',
  termsndConditionsTableId: 'AwardTermsAndConditions',
  paymentRequestSchedulesTableId: 'TnCSchedulesgrid',
  progressReportScheduleTableId: 'TnCSchedulesgrid',
  PaymentRequestModalIframeId: 'PaymentRequestSchedulesiframeContentId',
  ProgressReportModalIframeId: 'ProgressReportSchedulesiframeContentId',
  riskAssessmentApproverTableId: 'GrantorRiskAssessmentRolesandResponsibilities',
  AssociateFocusArea: 'SelectGATforAward',
  previewPackageTableId2: 'PreviewPackageForms',
  GrantsAllTableId: 'GrantorActiveGrants',

  // ── Payment Request (paymentRequest.properties) ────────────────────────────
  paymentRequestTableId: 'PaymentRequestsFlexGrid',
  paymentRequestBudgetTableId: 'PaymentRequestBudgetCategory',
  paymentLineItemsTableId: 'PaymentLineItems',
  fundingAccountTableId: 'PaymentRequestFundingAccounts',
  ReimbursmentApproverTableId: 'PaymentRequestRolesandResponsibilities',
  paymentrequestReimbursementTableId: 'PaymentRequestsReimbursement',
  paymentrequestAdvancesTableId: 'PaymentRequestsAdvances',
  fundingAccountsAdvTableId: 'PaymentRequestFundingAccounts',
  recipientGrantTableId: 'GranteeActiveAwardsgrid',
  recipientAwardTableId: 'GranteeActiveSubawardsgrid',
  recipientAdvanceSupportiveDocumentChecklistTableId: 'PaymentRequestSupportDocChecklists',

  // ── Applications / Grantee ────────────────────────────────────────────────
  applicationsTableId: 'RecipientApplications',
  reviewsTableId: 'ApplicationIntakeList',
  activeOpportunitiesTableId: 'nyqae',
  flexGridAppContactTableId: 'ApplicationContacts',
  allFormsTableId: 'ApplicationForms',
  budgetTableId: 'ApplicationBudgetPeriods',
  kpiTableId2: 'ApplicationKPIGoals',
  preAppContactTableId: 'PreApplicationContacts',
  preApplicationAttachmentId: 'EnhancePreApplicationBudgetCategories',
  preAppFormTableId: 'PreApplicationForms',
};
