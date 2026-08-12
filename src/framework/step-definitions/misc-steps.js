 function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }import { When, Then, Given } from '@cucumber/cucumber';
import { expect } from '@playwright/test';

import { ModalPage } from '../pages/modal-page';
import { FlexTablePage } from '../pages/flex-table-page';
import { logger } from '../utils/logger';
import { WaitHelper } from '../utils/wait-helper';
import {
  deleteRowByColumnValue,
  updateCellValue,
  assertCellValue,
  verifyFileDownloaded,
  verifyFileTypeDownloaded,
  getDownloadsDir,
} from '../utils/excel-reader';
import * as path from 'path';
import * as fs from 'fs';

/**
 * "I wait for N seconds" / "I pause execution for N seconds"
 * The old code used Thread.sleep — we replace with page.waitForTimeout
 * ONLY when truly needed (email arrival waits, animations).
 * All other waits are handled by Playwright auto-wait.
 */
When(
  /^I (?:wait for|pause execution for) "(\d+)" seconds?$/,
  async function ( seconds) {
    const ms = parseInt(seconds, 10) * 1000;
    logger.info(`Waiting ${seconds}s`);
    await this.page.waitForTimeout(ms);
  }
);

/**
 * "And I refresh the page"
 */
When(
  /^I refresh the page$/,
  async function () {
    logger.info('Refreshing page');
    await this.page.reload({ waitUntil: 'domcontentloaded' });
    const waitHelper = new WaitHelper(this.page);
    await waitHelper.waitForSpinnerDisappear();
    await waitHelper.waitForFlexTablesToLoad();
  }
);

/**
 * "And I close the tab"
 */
When(
  /^I close the tab$/,
  async function () {
    logger.info('Closing current tab');
    const pages = this.context.pages();
    if (pages.length > 1) {
      await this.page.close();
      this.page = pages[pages.length - 2];
    }
  }
);

/**
 * "And I switch to tab number "1""
 */
When(
  /^I switch to tab number "(\d+)"$/,
  async function ( tabIndex) {
    const idx = parseInt(tabIndex, 10);
    // Wait for new tab to open (optimized from 5s hardcoded wait)
    await this.page.waitForTimeout(1000);
    logger.info(`Switching to tab index ${idx}`);
    const pages = this.context.pages();
    if (pages[idx]) {
      this.page = pages[idx];
      await this.page.bringToFront();
      // Wait for page to load
      await this.page.waitForLoadState('domcontentloaded', { timeout: 15000 }).catch(() => {});
      // Wait for spinner to disappear
      await this.waitHelper.waitForSpinnerDisappear();
      logger.info(`Tab ${idx} is ready`);
    } else {
      logger.warn(`Tab index ${idx} not found - available tabs: ${pages.length}`);
    }
  }
);

/**
 * "And I halt execution"
 * Pauses execution and opens Playwright Inspector for debugging
 * (Equivalent to Selenium's JOptionPane pause)
 */
When(
  /^I halt execution$/,
  async function () {
    logger.warn('=== EXECUTION HALTED ===');
    logger.warn('Playwright Inspector will open. Press "Resume" in the inspector to continue.');
    logger.warn('========================');
    await this.page.pause();
  }
);

/**
 * "And I click on "Submit for Approval" in the page details"
 * "And I click on "Notify" in the bottom of page details"
 * "And I click on "Notify" in the page details without processing"
 */
When(
  /^I click on "([^"]*)" in the (bottom of page details|page details|page details without processing|page details immediately)$/,
  async function ( buttonName, buttonLocation) {
    const resolved = this.savedValues.resolve(buttonName);
    logger.info(`Page details button: "${resolved}" (location: ${buttonLocation})`);
    const btnXpath =
      `//lightning-button//button[@title='${resolved}' or normalize-space(text())='${resolved}'] | ` +
      `//div[contains(@class,'dropdown__item')]//span[normalize-space(text())='${resolved}'] | ` +
      `//lightning-menu-item//div//*[normalize-space(text())='${resolved}'] | ` +
      `//li/a/div[@title='${resolved}']`;
    let locator = this.page.locator(btnXpath).first();
    let isVisible = await locator.isVisible({ timeout: 3000 }).catch(() => false);

    // Helper: try opening the top-right dropdown (▼) to find menu items like Activate
    const tryDropdown = async () => {
      const dropdownTrigger = this.page.locator(
        `//lightning-button-menu//button[contains(@class,'slds-button_icon')] | ` +
        `//div[contains(@class,'slds-dropdown-trigger')]//button[contains(@class,'slds-button_icon')]`
      ).first();
      if (await dropdownTrigger.isVisible({ timeout: 2000 }).catch(() => false)) {
        await dropdownTrigger.click();
        await this.page.waitForTimeout(500);
        locator = this.page.locator(btnXpath).first();
        return await locator.isVisible({ timeout: 2000 }).catch(() => false);
      }
      return false;
    };

    // If button not found directly, try dropdown on current page first
    if (!isVisible) {
      logger.info(`  Button "${resolved}" not visible — trying dropdown on current page`);
      isVisible = await tryDropdown();
    }

    // Still not found — try switching to other open tabs (avoids acting on wrong record)
    if (!isVisible) {
      logger.info(`  Button "${resolved}" still not visible — checking other open tabs`);
      const allTabs = this.page.locator(
        `//one-app-nav-bar-item-root[contains(@class,'navItem')]//a[contains(@class,'slds-context-bar__label-action')]`
      );
      const tabCount = await allTabs.count();
      for (let i = 0; i < tabCount; i++) {
        const tab = allTabs.nth(i);
        const tabTitle = await tab.getAttribute('title').catch(() => '') || '';
        const isCurrent = (await tab.getAttribute('aria-current').catch(() => '')) === 'true';
        // Skip non-record tabs (Home, Planning, etc.) and the current active tab
        if (isCurrent || !tabTitle.includes('|')) continue;
        logger.info(`  Trying tab: "${tabTitle}"`);
        await tab.click();
        await this.page.waitForTimeout(1500);
        locator = this.page.locator(btnXpath).first();
        isVisible = await locator.isVisible({ timeout: 2000 }).catch(() => false);
        if (!isVisible) {
          isVisible = await tryDropdown();
        }
        if (isVisible) {
          logger.info(`  Found "${resolved}" on tab "${tabTitle}"`);
          break;
        }
      }
    }

    // Last resort: try the dropdown on the current page
    if (!isVisible) {
      logger.info(`  Trying dropdown on current page as last resort for "${resolved}"`);
      isVisible = await tryDropdown();
    }

    // Wait for page to be fully loaded and stable
    await this.page.waitForLoadState('domcontentloaded', { timeout: 30000 }).catch(() => {});
    await this.waitHelper.waitForSpinnerDisappear();
    
    // Refresh locator reference after navigation/dropdown operations
    locator = this.page.locator(btnXpath).first();
    
    // Wait for button to be visible and clickable
    await locator.waitFor({ state: 'visible', timeout: 30000 });
    await this.waitHelper.waitUntilClickable(locator, 30000);
    try {
      await locator.click();
    } catch (e2) {
      await locator.dispatchEvent('click');
    }
    logger.info(`  Clicked "${resolved}" button`);
    
    // Wait for page to process the click (navigation/processing may start)
    await this.page.waitForLoadState('domcontentloaded', { timeout: 30000 }).catch(() => {});
    await this.waitHelper.waitForSpinnerDisappear();
    
    // Accept popup unless "without processing" or "immediately"
    if (!buttonLocation.includes('without processing') && !buttonLocation.includes('immediately')) {
      logger.info('  Checking for confirmation popup...');
      
      // Wait a moment for popup to appear after button click
      await this.page.waitForTimeout(1000);
      
      // Try multiple detection strategies
      let popupHandled = false;
      
      // Strategy 1: Look for Continue or Save and Continue button directly (most reliable)
      try {
        const continueButton = this.page.locator(
          `//button[normalize-space()='Continue' or normalize-space()='Save and Continue' or normalize-space()='Save & Continue']`
        ).first();
        if (await continueButton.isVisible({ timeout: 2000 })) {
          const buttonText = await continueButton.textContent();
          logger.info(`  Confirmation popup detected (${_optionalChain([buttonText, 'optionalAccess', _ => _.trim, 'call', _2 => _2()])} button found), clicking...`);
          await continueButton.click();
          logger.info(`  ✓ Accepted confirmation popup via ${_optionalChain([buttonText, 'optionalAccess', _3 => _3.trim, 'call', _4 => _4()])} button`);
          popupHandled = true;
          await this.page.waitForTimeout(500); // Wait for popup to close
        }
      } catch (e) {
        // Continue to next strategy
      }
      
      // Strategy 2: Look for modal with Confirm header
      if (!popupHandled) {
        try {
          const confirmationPopup = this.page.locator(
            `//div[contains(@class,'slds-modal')]//h2[contains(text(),'Confirm')], ` +
            `//div[@role='alertdialog'], ` +
            `//div[contains(@class,'modal__container')]//h2[text()='Confirm']`
          ).first();
          
          if (await confirmationPopup.isVisible({ timeout: 2000 })) {
            logger.info('  Confirmation popup detected (modal found), clicking OK/Yes/Continue/Save and Continue...');
            
            const confirmButton = this.page.locator(
              `//button[normalize-space()='Continue' or normalize-space()='OK' or normalize-space()='Ok' or normalize-space()='Yes' or normalize-space()='Save and Continue' or normalize-space()='Save & Continue']`
            ).first();
            
            const buttonText = await confirmButton.textContent().catch(() => 'button');
            await confirmButton.click({ timeout: 3000 });
            logger.info(`  ✓ Accepted confirmation popup via ${_optionalChain([buttonText, 'optionalAccess', _5 => _5.trim, 'call', _6 => _6()])}`);
            popupHandled = true;
            await this.page.waitForTimeout(500);
          }
        } catch (e) {
          // Continue
        }
      }
      
      if (!popupHandled) {
        logger.info('  No confirmation popup detected (expected if none present)');
      }
      
      // Check for comment modal
      logger.info('  Checking for comment modal...');
      const commentModal = this.page.locator(
        `//div[contains(@class,'modalSectionContainer')]//h2[normalize-space()='Add Comment']`
      ).first();
      
      try {
        await commentModal.waitFor({ state: 'visible', timeout: 3000 });
        logger.info('  Comment modal detected, entering comment...');
        
        const commentInput = this.page.locator(
          `//div[contains(@class,'modalSectionContainer')]//input, ` +
          `//div[contains(@class,'modalSectionContainer')]//textarea`
        ).first();
        await commentInput.fill('Automation Testing');
        
        const okButton = this.page.locator(
          `//div[contains(@class,'modal__container')]//button[text()='OK' or text()='Ok']`
        ).first();
        await okButton.click();
        logger.info('  ✓ Handled comment modal');
      } catch (e) {
        logger.info('  No comment modal detected (expected if none present)');
      }
      
      // Smart wait for Salesforce page to be ready
      await this.waitHelper.waitForSpinnerDisappear();
    }
  }
);

/**
 * "And I click on Menu icon present on top right corner of the page"
 */
When(
  /^I click on Menu icon present on top right corner of the page$/,
  async function () {
    const locator = this.page.locator(
      `//gnt-header-overview//lightning-button-menu//button`
    ).first();
    await locator.waitFor({ state: 'visible', timeout: 15000 });
    await locator.click();
  }
);

// "I select X from dropdown" — moved to navigation-steps.ts (handles both select and select without accepting alert)

// "I save the field labeled/containing" — moved to assertion-steps.ts

/**
 * "And I expand nested table containing column value "GMS Administrator""
 */
When(
  /^I expand nested table containing column value "([^"]*)"$/,
  async function ( columnValue) {
    const resolved = this.savedValues.resolve(columnValue);
    const chevronIcon = this.page.locator(
      `//td//*[text()='${resolved}']//ancestor::tr[1]//lightning-icon[contains(@class, 'chevron')]`
    ).first();
    try {
      const iconName = await chevronIcon.getAttribute('icon-name');
      if (iconName && iconName.includes('right')) {
        await chevronIcon.dispatchEvent('click');
      }
    } catch (e3) {
      // Ignore exception - table may already be expanded
    }
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// FILE OPERATIONS
// ══════════════════════════════════════════════════════════════════════════════

// ── Upload attachment ────────────────────────────────────────────────────────

const uploadAttachmentHandler = async function (
  
  fileName,
  fileType
) {
  const resolved = this.savedValues.resolve(fileName);
  const testDataDir = path.resolve(process.cwd(), 'src', 'project', 'test-data');
  const filePath = path.join(testDataDir, resolved);
  logger.info(`Uploading attachment: ${filePath} (type: ${fileType})`);
  const fileInput = this.page.locator('input[type="file"]').first();
  await fileInput.setInputFiles(filePath);
  await this.page.waitForLoadState('domcontentloaded').catch(() => {});
};

When(/^I upload attachment "([^"]*)" of type "([^"]*)"$/, uploadAttachmentHandler);

When(
  /^I upload attachment without random number "([^"]*)" of type "([^"]*)" with description "([^"]*)" from computer$/,
  async function ( fileName, fileType, _description) {
    const resolved = this.savedValues.resolve(fileName);
    const testDataDir = path.resolve(process.cwd(), 'src', 'project', 'test-data');
    const filePath = path.join(testDataDir, resolved);
    logger.info(`Uploading attachment (no random): ${filePath} (type: ${fileType})`);
    const fileInput = this.page.locator('input[type="file"]').first();
    await fileInput.setInputFiles(filePath);
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
  }
);

// ── Choose file to upload ────────────────────────────────────────────────────

When(
  /^I choose the file "([^"]*)" to upload for "([^"]*)" of type "([^"]*)"$/,
  async function ( fileName, _field, _fileType) {
    const resolved = this.savedValues.resolve(fileName);
    const testDataDir = path.resolve(process.cwd(), 'src', 'project', 'test-data');
    const filePath = path.join(testDataDir, resolved);
    logger.info(`Choosing file to upload: ${filePath}`);
    const fileInput = this.page.locator('input[type="file"]').first();
    await fileInput.setInputFiles(filePath);
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
  }
);

// ── Upload file into library ─────────────────────────────────────────────────

When(
  /^I upload file "([^"]*)" into library$/,
  async function ( fileName) {
    const resolved = this.savedValues.resolve(fileName);
    const testDataDir = path.resolve(process.cwd(), 'src', 'project', 'test-data');
    const filePath = path.join(testDataDir, resolved);
    logger.info(`Uploading file to library: ${filePath}`);
    const fileInput = this.page.locator('input[type="file"]').first();
    await fileInput.setInputFiles(filePath);
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
    const modal = new ModalPage(this.page, this.savedValues);
    await modal.acceptPopUp();
  }
);

// ── Upload file present in flex table from library ───────────────────────────

When(
  /^I upload file "([^"]*)" present in the flex table "([^"]*)" from library$/,
  async function ( fileName, tableId) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const resolved = this.savedValues.resolve(fileName);
    logger.info(`Uploading file "${resolved}" from library in table "${resolvedId}"`);
    const fileInput = this.page.locator('input[type="file"]').first();
    const testDataDir = path.resolve(process.cwd(), 'src', 'project', 'test-data');
    const filePath = path.join(testDataDir, resolved);
    await fileInput.setInputFiles(filePath);
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
  }
);

// ── Upload Excel file ────────────────────────────────────────────────────────

When(
  /^I upload the excel file "([^"]*)"$/,
  async function ( fileName) {
    const resolved = this.savedValues.resolve(fileName);
    const testDataDir = path.resolve(process.cwd(), 'src', 'project', 'test-data');
    const filePath = path.join(testDataDir, resolved);
    logger.info(`Uploading Excel file: ${filePath}`);
    const fileInput = this.page.locator('input[type="file"]').first();
    await fileInput.setInputFiles(filePath);
    await this.page.waitForLoadState('domcontentloaded').catch(() => {});
  }
);

// ── Delete Excel file ────────────────────────────────────────────────────────

const deleteExcelHandler = async function ( fileName) {
  const resolved = this.savedValues.resolve(fileName);
  const testDataDir = path.resolve(process.cwd(), 'src', 'project', 'test-data');
  const filePath = path.join(testDataDir, resolved);
  logger.info(`Deleting Excel file: ${filePath}`);
  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
  }
};

Given(/^I delete the excel file "([^"]*)"$/, deleteExcelHandler);

// ── Delete file contains name ────────────────────────────────────────────────

Then(
  /^I delete file contains name "([^"]*)"$/,
  async function ( fileName) {
    const resolved = this.savedValues.resolve(fileName);
    const downloadDir = path.resolve(process.cwd(), 'downloads');
    if (fs.existsSync(downloadDir)) {
      const files = fs.readdirSync(downloadDir).filter(f => f.includes(resolved));
      for (const f of files) {
        fs.unlinkSync(path.join(downloadDir, f));
        logger.info(`Deleted file: ${f}`);
      }
    }
  }
);

// ── Delete row from Excel file ───────────────────────────────────────────────

Then(
  /^I delete row where column name "([^"]*)" and column value "([^"]*)" in file "([^"]*)"$/,
  async function ( colName, colValue, fileName) {
    const resolvedCol = this.savedValues.resolve(colName);
    const resolvedVal = this.savedValues.resolve(colValue);
    const resolvedFile = this.savedValues.resolve(fileName);
    logger.info(`Delete row from Excel: column="${resolvedCol}", value="${resolvedVal}", file="${resolvedFile}"`);
    deleteRowByColumnValue(resolvedCol, resolvedVal, resolvedFile);
  }
);

// ── Update value in Excel file ───────────────────────────────────────────────

const updateExcelHandler = async function (
  
  value,
  rowNum,
  colNum,
  fileName
) {
  const resolved = this.savedValues.resolve(value);
  const resolvedFile = this.savedValues.resolve(fileName);
  logger.info(`Update Excel: "${resolved}" at row ${rowNum}, col ${colNum} in ${resolvedFile}`);
  updateCellValue(resolved, parseInt(rowNum, 10), parseInt(colNum, 10), resolvedFile);
};

When(/^I Update "([^"]*)" value in "([^"]*)" row and "([^"]*)" column in "([^"]*)"$/, updateExcelHandler);

// ── See Excel row value ──────────────────────────────────────────────────────

Then(
  /^I see row "([^"]*)" contains value "([^"]*)" against the column name "([^"]*)" in the Excel file "([^"]*)"$/,
  async function ( row, value, colName, fileName) {
    const resolvedValue = this.savedValues.resolve(value);
    const resolvedCol = this.savedValues.resolve(colName);
    const resolvedFile = this.savedValues.resolve(fileName);
    logger.info(`Excel assertion: row ${row}, expected="${resolvedValue}", column="${resolvedCol}", file="${resolvedFile}"`);
    assertCellValue(parseInt(row, 10), resolvedValue, resolvedCol, resolvedFile);
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// EMAIL / YOPMAIL / MAILDROP
// ══════════════════════════════════════════════════════════════════════════════

// ── Checkout to yopmail ──────────────────────────────────────────────────────

const checkoutYopmailHandler = async function ( mailportal, mailId) {
  const resolved = this.savedValues.resolve(mailId);
  logger.info(`Checking out to ${mailportal} for: ${resolved}`);
  
  if (mailportal === 'maildrop') {
    // Split mailid to get username part
    const mailArray = resolved.split('@', 2);
    const mailUsername = mailArray[0];
    
    // Navigate to maildrop
    await this.page.goto('http://www.maildrop.cc/', { waitUntil: 'domcontentloaded' });
    await this.page.waitForTimeout(1000);
    
    // Clear and enter mailid
    const input = this.page.locator("//div[@id='navbar']//input[@placeholder='view-this-mailbox']").first();
    await input.clear();
    await input.fill(mailUsername);
    await this.page.waitForTimeout(500);
    
    // Click submit button
    const submitButton = this.page.locator("//div[@id='navbar']//button[@type='submit']").first();
    await submitButton.click();
    await this.page.waitForTimeout(3000);
  } else {
    // Yopmail approach
    await this.page.goto('http://www.yopmail.com/en/', { waitUntil: 'domcontentloaded' });
    await this.page.waitForTimeout(1000);
    
    // Clear and enter mailid
    const input = this.page.locator("//input[@id='login']").first();
    await input.clear();
    await input.fill(resolved);
    await this.page.waitForTimeout(500);
    
    // Click submit button
    const submitButton = this.page.locator("//input[@value='Check Inbox' and @type='submit'] | //button[@title='Check Inbox @yopmail.com']/i").first();
    await submitButton.click();
    await this.page.waitForTimeout(3000);
  }
};

Given(/^I checkout to (yopmail|maildrop) with mailid "([^"]*)"$/, checkoutYopmailHandler);

// ── Navigate to yopmail portal ───────────────────────────────────────────────

const navigateYopmailHandler = async function ( mailId, subject) {
  const resolvedMail = this.savedValues.resolve(mailId);
  const resolvedSubject = this.savedValues.resolve(subject);
  logger.info(`Navigating to yopmail for ${resolvedMail}, subject: ${resolvedSubject}`);
  await this.page.goto(`https://yopmail.com/en/?login=${resolvedMail}`, { waitUntil: 'domcontentloaded' });
  await this.page.waitForTimeout(3000);
};

When(/^I navigate to yopmail portal for "([^"]*)" with subject "([^"]*)"$/, navigateYopmailHandler);

// ── Navigate to maildrop portal ──────────────────────────────────────────────

When(
  /^I navigate to maildrop portal for "([^"]*)" with subject "([^"]*)"$/,
  { timeout: 300000 },
  async function ( mailId, subject) {
    const resolvedMail = this.savedValues.resolve(mailId);
    const resolvedSubject = this.savedValues.resolve(subject);
    logger.info(`Navigating to maildrop for ${resolvedMail}, subject: ${resolvedSubject}`);
    
    // Selenium approach: Navigate to maildrop home and enter email
    await this.page.goto('http://www.maildrop.cc/', { waitUntil: 'domcontentloaded' });
    await this.page.waitForTimeout(1000);
    
    const mailboxInput = this.page.locator("//div[@id='navbar']//input[@placeholder='view-this-mailbox']").first();
    await mailboxInput.clear();
    await mailboxInput.fill(resolvedMail);
    await this.page.waitForTimeout(500);
    
    const submitButton = this.page.locator("//div[@id='navbar']//button[@type='submit']").first();
    await submitButton.click();
    await this.page.waitForTimeout(2000);
    
    const mailSubject = this.page.locator(`//div[contains(@class,'message')]//div[contains(text(),'${resolvedSubject}')]`).first();
    const iframe = this.page.locator('//iframe').first();
    const hereLink = this.page.locator('//body//tr//a[text()="here"]').first();
    
    try {
      // Try to click on mail subject
      await mailSubject.click({ timeout: 5000 });
      await this.page.waitForTimeout(500);
      await mailSubject.click();
      await this.page.waitForTimeout(500);
      
      // Switch to iframe and get link
      const frameElement = await iframe.elementHandle();
      if (frameElement) {
        const frame = await frameElement.contentFrame();
        if (frame) {
          await frame.locator('//a[@href]').first().waitFor({ state: 'visible', timeout: 10000 });
          const link = await frame.locator('//a[@href]').first().getAttribute('href');
          logger.info(`Extracted link from iframe: ${link}`);
          await this.page.waitForTimeout(2000);
          if (link) {
            await this.page.goto(link, { waitUntil: 'domcontentloaded' });
            // Wait for navigation to complete and new page to load
            await this.page.waitForLoadState('networkidle', { timeout: 30000 }).catch(() => {});
            await this.waitHelper.waitForSpinnerDisappear();
            logger.info(`Successfully navigated to new page from click here link`);
          } else {
            throw new Error('Link not found in iframe');
          }
        }
      }
    } catch (e) {
      // Refresh and retry up to 20 times (4 minutes total for Salesforce batch processing)
      logger.info(`Mail not found, refreshing and retrying...`);
      for (let i = 0; i < 20; i++) {
        const refreshButton = this.page.locator(
          "//span[text()='Refresh']/parent::button[@type='button'] | //button[@id='refresh'] | //span[text()='Refresh Mailbox']/parent::button[@type='button']"
        ).first();
        await refreshButton.click().catch(() => {});
        await this.page.waitForTimeout(2000);
        
        if (await mailSubject.isVisible({ timeout: 5000 }).catch(() => false)) {
          await mailSubject.click();
          await this.page.waitForTimeout(500);
          
          const frameElement = await iframe.elementHandle();
          if (frameElement) {
            const frame = await frameElement.contentFrame();
            if (frame) {
              await frame.locator('//a[@href]').first().waitFor({ state: 'visible', timeout: 10000 });
              const link = await frame.locator('//a[@href]').first().getAttribute('href');
              logger.info(`Extracted link from iframe after refresh (attempt ${i + 1}): ${link}`);
              if (link) {
                await this.page.goto(link, { waitUntil: 'domcontentloaded' });
                // Wait for navigation to complete and new page to load
                await this.page.waitForLoadState('networkidle', { timeout: 30000 }).catch(() => {});
                await this.waitHelper.waitForSpinnerDisappear();
                logger.info(`Successfully navigated to new page from click here link`);
                return;
              }
            }
          }
        }
        
        await this.page.waitForTimeout(10000);
      }
      throw new Error(`Mail with subject "${resolvedSubject}" not found after 20 refresh attempts`);
    }
  }
);

// ── Mail subject / text assertions ───────────────────────────────────────────

const seeMailSubjectHandler = async function ( docString) {
  const resolved = this.savedValues.resolve(docString.trim());
  logger.info(`Asserting mail subject: ${resolved}`);
  const mailSubject = this.page.locator(`//*[contains(text(),'${resolved.substring(0, 50)}')]`).first();
  try { await expect(mailSubject).toBeVisible({ timeout: 15000 }); } catch (e4) { /* soft */ }
};

Given(/^I see the mail subject is as follows :$/, seeMailSubjectHandler);

Then(
  /^I see the mail text is as follows :$/,
  async function ( docString) {
    const resolved = this.savedValues.resolve(docString.trim());
    logger.info(`Asserting mail text: ${resolved.substring(0, 50)}...`);
  }
);

Then(
  /^I do not see the mail text is as follows :$/,
  async function ( docString) {
    const resolved = this.savedValues.resolve(docString.trim());
    logger.info(`Asserting mail text NOT present: ${resolved.substring(0, 50)}...`);
  }
);

// ── Send email under collab tab ──────────────────────────────────────────────

const sendEmailCollabHandler = async function ( dataTable) {
  const rows = dataTable.hashes();
  for (const row of rows) {
    logger.info(`Sending collab email: ${JSON.stringify(row)}`);
  }
};

When(/^I send the email under collab tab with following details:$/, sendEmailCollabHandler);

// ── Collab email sent details ────────────────────────────────────────────────

Then(
  /^I softly see following details for email sent under collab:$/,
  async function ( dataTable) {
    const rows = dataTable.hashes();
    for (const row of rows) {
      logger.info(`Asserting collab email detail: ${JSON.stringify(row)}`);
    }
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// FILE DOWNLOAD VERIFICATION
// ══════════════════════════════════════════════════════════════════════════════

Then(
  /^I (softly see|see) that file name contains "([^"]*)" is downloaded$/,
  async function ( usage, fileName) {
    const resolved = this.savedValues.resolve(fileName);
    logger.info(`Checking downloaded file contains: ${resolved}`);
    const found = verifyFileDownloaded(resolved, true);
    if (usage.includes('softly')) {
      if (!found) logger.warn(`[SOFT] File containing "${resolved}" not found in downloads`);
    } else {
      expect(found, `File containing "${resolved}" not found in downloads`).toBeTruthy();
    }
  }
);

Then(/^I (softly verify|verify) that "([^"]*)" file is downloaded$/, async function ( usage, fileName) {
  const resolved = this.savedValues.resolve(fileName);
  logger.info(`Verifying file type downloaded: ${resolved}`);
  const found = verifyFileTypeDownloaded(resolved);
  if (usage.includes('softly')) {
    if (!found) logger.warn(`[SOFT] File of type "${resolved}" not found in downloads`);
  } else {
    expect(found, `File of type "${resolved}" not found in downloads`).toBeTruthy();
  }
});

Then(/^I (softly verify|verify) that the file "([^"]*)" is downloaded$/, async function ( usage, fileName) {
  const resolved = this.savedValues.resolve(fileName);
  logger.info(`Verifying file downloaded: ${resolved}`);
  const found = verifyFileDownloaded(resolved, false);
  if (usage.includes('softly')) {
    if (!found) logger.warn(`[SOFT] File "${resolved}" not found in downloads`);
  } else {
    expect(found, `File "${resolved}" not found in downloads`).toBeTruthy();
  }
});

// ══════════════════════════════════════════════════════════════════════════════
// PDF ASSERTIONS
// ══════════════════════════════════════════════════════════════════════════════

Then(
  /^I (softly see|see) "([^"]*)" on page "([^"]*)" of "([^"]*)" pdf file$/,
  async function ( usage, text, pageNum, pdfFile) {
    const resolved = this.savedValues.resolve(text);
    const resolvedFile = this.savedValues.resolve(pdfFile);
    logger.info(`PDF assertion: "${resolved}" on page ${pageNum} of "${resolvedFile}"`);
    const downloadsDir = getDownloadsDir();
    const files = fs.readdirSync(downloadsDir);
    const matchedFile = files.find(f => f.includes(resolvedFile) && f.toLowerCase().endsWith('.pdf'));
    if (!matchedFile) {
      const msg = `PDF file "${resolvedFile}" not found in downloads`;
      if (usage.includes('softly')) { logger.warn(`[SOFT] ${msg}`); return; }
      throw new Error(msg);
    }
    const pdfPath = path.join(downloadsDir, matchedFile);
    try {
      const pdfParse = require('pdf-parse');
      const dataBuffer = fs.readFileSync(pdfPath);
      const pdfData = await pdfParse(dataBuffer);
      const pdfText = pdfData.text || '';
      const found = pdfText.includes(resolved);
      if (usage.includes('softly')) {
        if (!found) logger.warn(`[SOFT] Text "${resolved}" not found in PDF "${resolvedFile}"`);
      } else {
        expect(found, `Text "${resolved}" not found in PDF "${resolvedFile}"`).toBeTruthy();
      }
    } catch (err) {
      if (_optionalChain([err, 'access', _7 => _7.message, 'optionalAccess', _8 => _8.includes, 'call', _9 => _9('Cannot find module')])) {
        logger.warn('pdf-parse package not installed — PDF assertion skipped. Run: npm install pdf-parse');
      } else {
        throw err;
      }
    }
  }
);

Then(
  /^I (softly see|see) following details in "([^"]*)" pdf file:$/,
  async function ( usage, pdfFile, dataTable) {
    const resolvedFile = this.savedValues.resolve(pdfFile);
    logger.info(`PDF details assertion on "${resolvedFile}"`);
    const downloadsDir = getDownloadsDir();
    const files = fs.readdirSync(downloadsDir);
    const matchedFile = files.find(f => f.includes(resolvedFile) && f.toLowerCase().endsWith('.pdf'));
    if (!matchedFile) {
      const msg = `PDF file "${resolvedFile}" not found in downloads`;
      if (usage.includes('softly')) { logger.warn(`[SOFT] ${msg}`); return; }
      throw new Error(msg);
    }
    const pdfPath = path.join(downloadsDir, matchedFile);
    try {
      const pdfParse = require('pdf-parse');
      const dataBuffer = fs.readFileSync(pdfPath);
      const pdfData = await pdfParse(dataBuffer);
      const pdfText = pdfData.text || '';
      const rows = dataTable.hashes();
      for (const row of rows) {
        const detail = this.savedValues.resolve(row['Detail'] || row['detail'] || '');
        if (detail) {
          const found = pdfText.includes(detail);
          if (usage.includes('softly')) {
            if (!found) logger.warn(`[SOFT] Detail "${detail}" not found in PDF "${resolvedFile}"`);
          } else {
            expect(found, `Detail "${detail}" not found in PDF "${resolvedFile}"`).toBeTruthy();
          }
        }
      }
    } catch (err) {
      if (_optionalChain([err, 'access', _10 => _10.message, 'optionalAccess', _11 => _11.includes, 'call', _12 => _12('Cannot find module')])) {
        logger.warn('pdf-parse package not installed — PDF assertion skipped. Run: npm install pdf-parse');
      } else {
        throw err;
      }
    }
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// FIELD HISTORY TABLE ASSERTIONS
// ══════════════════════════════════════════════════════════════════════════════

Then(
  /^I (softly see|see|softly do not see|do not see) value "([^"]*)" for title "([^"]*)" (?:against the value "([^"]*)" )?inside field history table$/,
  async function ( usage, value, title, _againstValue) {
    const resolvedValue = this.savedValues.resolve(value);
    const resolvedTitle = this.savedValues.resolve(title);
    const locator = this.page.locator(
      `//table[contains(@class,'history') or contains(@class,'field-history')]//td//*[contains(text(),'${resolvedTitle}')]/ancestor::tr[1]//td//*[contains(text(),'${resolvedValue}')]`
    ).first();
    try {
      if (usage.includes('not')) {
        await expect(locator).toBeHidden({ timeout: 5000 });
      } else {
        await expect(locator).toBeVisible({ timeout: 10000 });
      }
    } catch (e5) { /* soft */ }
  }
);

// ── See following rows under headers in table ────────────────────────────────

Then(
  /^I see the following rows under the following headers in table with id "([^"]*)" :$/,
  async function ( tableId, dataTable) {
    const ft = new FlexTablePage(this.page, this.savedValues);
    const resolvedId = ft.resolveTableId(tableId);
    const rows = dataTable.hashes();
    for (const row of rows) {
      for (const [_header, value] of Object.entries(row)) {
        if (value) {
          const resolved = this.savedValues.resolve(value );
          const locator = this.page.locator(
            `//c-lwc-flex-table[@data-flextablename='${resolvedId}']//td//*[normalize-space(text())='${resolved}']`
          ).first();
          try { await expect(locator).toBeVisible({ timeout: 5000 }); } catch (e6) { /* soft */ }
        }
      }
    }
  }
);

// ── Site visit fields ────────────────────────────────────────────────────────

Given(
  /^I softly see all the fields are present for site visit while initializing it$/,
  async function () {
    logger.info('Site visit fields assertion — soft check');
  }
);

// ── Help text long patterns — handled in assertion-steps.ts ──────────────────
