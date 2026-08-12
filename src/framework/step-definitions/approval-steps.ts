import { When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { CustomWorld } from '../world/custom-world';
import { ApprovalPage } from '../pages/approval-page';
import { logger } from '../utils/logger';

// ── Single action approval steps ─────────────────────────────────────────────

When(
  /^I select radio button "([^"]*)" in the approval decision$/,
  async function (this: CustomWorld, radioButtonName: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    await approval.selectRadioButton(radioButtonName);
  }
);

When(
  /^I select user "([^"]*)" in the approval decision$/,
  async function (this: CustomWorld, userName: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    await approval.selectUser(userName);
  }
);

When(
  /^I enter comment "([^"]*)" in the approval decision$/,
  async function (this: CustomWorld, comment: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    await approval.enterComment(comment);
  }
);

When(
  /^I submit the approval in the approval decision$/,
  async function (this: CustomWorld) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    await approval.submitApproval(true);
  }
);

When(
  /^I submit the approval in the approval decision without processing$/,
  async function (this: CustomWorld) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    await approval.submitApproval(false);
  }
);

// ── Combined approval steps ──────────────────────────────────────────────────

When(
  /^I "([^"]*)" in the approval decision$/,
  async function (this: CustomWorld, approvalType: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    
    // Wait for page to stabilize after clicking View/Start icon (matching Selenium flow)
    await this.waitHelper.waitForSpinnerDisappear();
    
    // IMPORTANT: Check and click toast action FIRST before checking for approval decision
    // The toast button reveals the approval decision component (matching Selenium: ifToastActionIsDisplayed)
    await approval.clickToastActionIfPresent();
    
    // Wait for approval decision component to be visible with retries
    logger.info('Waiting for approval decision component to be visible...');
    const isVisible = await approval.waitForApprovalVisible(20000);
    
    // Log page content for debugging
    const hasApprovalComponent = await this.page.locator('//c-approval-decision').count();
    logger.info(`Approval component count: ${hasApprovalComponent}`);
    
    // Select radio button
    await approval.selectRadioButton(approvalType);
    // Enter comment if visible
    if (await approval.isCommentBoxVisible()) {
      await approval.enterComment('Automation Testing');
    }
    // Submit with confirmation
    await approval.submitApproval(true);
    // Accept popup (mirrors Selenium: acceptPopUp)
    await approval.acceptPopUp();
  }
);

When(
  /^I "([^"]*)" in the approval decision without confirmation$/,
  async function (this: CustomWorld, approvalType: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    await approval.selectRadioButton(approvalType);
    if (await approval.isCommentBoxVisible()) {
      await approval.enterComment('Automation Testing');
    }
    const submitBtn = this.page.locator(
      `//c-approval-decision//button[@title='Submit' and text()='Submit']`
    ).first();
    await submitBtn.click();
  }
);

When(
  /^I "([^"]*)" to user "([^"]*)" in the approval decision$/,
  async function (this: CustomWorld, approvalType: string, user: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    await approval.selectRadioButton(approvalType);
    await approval.selectUser(user);
    if (await approval.isCommentBoxVisible()) {
      await approval.enterComment('Automation testing');
    }
    await approval.submitApproval(true);
  }
);

// ── Approval assertion steps ─────────────────────────────────────────────────

Then(
  /^I (can|cannot) see the approval decision$/,
  async function (this: CustomWorld, canOrCannot: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const isVisible = await approval.isVisible();
    expect(isVisible).toBe(canOrCannot === 'can');
  }
);

Then(
  /^I see (\d+) radio buttons in the approval decision$/,
  async function (this: CustomWorld, expectedNumber: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const options = await approval.getApprovalOptions();
    expect(options.length).toBe(parseInt(expectedNumber, 10));
  }
);

Then(
  /^I (can|cannot) see the radio button "([^"]*)" in the approval decision$/,
  async function (this: CustomWorld, canOrCannot: string, radioButton: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const isVisible = await approval.isRadioButtonVisible(radioButton);
    expect(isVisible).toBe(canOrCannot === 'can');
  }
);

Then(
  /^I see(?: only)? the following(?: ordered)? radio buttons in the approval decision :$/,
  async function (this: CustomWorld, dataTable: any) {
    const expected: string[] = dataTable.raw().flat().filter((s: string) => s.trim());
    const approval = new ApprovalPage(this.page, this.savedValues);
    const actual = await approval.getApprovalOptions();
    for (const exp of expected) {
      expect(actual).toContain(exp);
    }
  }
);

Then(
  /^I (can|cannot) see the user lookup in the approval decision$/,
  async function (this: CustomWorld, canOrCannot: string) {
    const lookup = this.page.locator(
      `//c-approval-decision//input[@type='text' or @placeholder='Search User...']`
    ).first();
    const isVisible = await lookup.isVisible({ timeout: 5000 }).catch(() => false);
    expect(isVisible).toBe(canOrCannot === 'can');
  }
);

Then(
  /^I (can|cannot) see user "([^"]*)" in the user lookup in the approval decision$/,
  async function (this: CustomWorld, canOrCannot: string, user: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const isPresent = await approval.isUserPresentInLookup(user);
    expect(isPresent).toBe(canOrCannot === 'can');
  }
);

Then(
  /^I see(?: only)? the following(?: ordered)? users in the user lookup in the approval decision :$/,
  async function (this: CustomWorld, dataTable: any) {
    const expected: string[] = dataTable.raw().flat().filter((s: string) => s.trim());
    for (const user of expected) {
      const approval = new ApprovalPage(this.page, this.savedValues);
      const isPresent = await approval.isUserPresentInLookup(user);
      expect(isPresent).toBe(true);
    }
  }
);

Then(
  /^I (can|cannot) see the comment box in the approval decision$/,
  async function (this: CustomWorld, canOrCannot: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const isVisible = await approval.isCommentBoxVisible();
    expect(isVisible).toBe(canOrCannot === 'can');
  }
);

Then(
  /^I (can|cannot) see the submit button in the approval decision$/,
  async function (this: CustomWorld, canOrCannot: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const isVisible = await approval.isSubmitButtonVisible();
    expect(isVisible).toBe(canOrCannot === 'can');
  }
);

Then(
  /^I see (\d+) messages in the approval decision$/,
  async function (this: CustomWorld, expectedNumber: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const messages = await approval.getApprovalMessages();
    expect(messages.length).toBe(parseInt(expectedNumber, 10));
  }
);

Then(
  /^I (can|cannot) see the message "([^"]*)" in the approval decision$/,
  async function (this: CustomWorld, canOrCannot: string, message: string) {
    const approval = new ApprovalPage(this.page, this.savedValues);
    const isVisible = await approval.isMessageVisible(message);
    expect(isVisible).toBe(canOrCannot === 'can');
  }
);

Then(
  /^I see(?: only)? the following(?: ordered)? messages in the approval decision :$/,
  async function (this: CustomWorld, dataTable: any) {
    const expected: string[] = dataTable.raw().flat().filter((s: string) => s.trim());
    const approval = new ApprovalPage(this.page, this.savedValues);
    const actual = await approval.getApprovalMessages();
    for (const msg of expected) {
      expect(actual.some(a => a.includes(msg))).toBe(true);
    }
  }
);
