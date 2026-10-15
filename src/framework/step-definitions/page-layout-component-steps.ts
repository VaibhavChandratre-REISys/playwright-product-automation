import * as fs from 'fs';
import * as path from 'path';
import { Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { CustomWorld } from '../world/custom-world';
import { FrameworkConfigurationApi } from '../api/framework-configuration-api';
import { PageLayoutComponentPage } from '../pages/page-layout-component-page';
import { getDownloadsDir } from '../utils/excel-reader';

function pageLayout(world: CustomWorld): PageLayoutComponentPage {
  return new PageLayoutComponentPage(world.page);
}

Then(/^I (see|do not see|softly see|softly do not see) "([^"]*)" shown as page instruction text$/, async function (this: CustomWorld, usage: string, text: string) {
  await pageLayout(this).assertPageInstruction(this.savedValues.resolve(text), usage);
});

Then(/^I (see|do not see) "([^"]*)" option is displayed$/, async function (this: CustomWorld, usage: string, option: string) {
  await pageLayout(this).assertText(this.savedValues.resolve(option), usage);
});

Then(/^I (softly see|softly do not see|see|do not see) confirmation box with message "([^"]*)" is displayed$/, async function (this: CustomWorld, usage: string, message: string) {
  await pageLayout(this).assertConfirmation(this.savedValues.resolve(message), usage);
});

Then(/^I (see|do not see) complete header overview tab is displayed at view detail page$/, async function (this: CustomWorld, usage: string) {
  await pageLayout(this).assertHeaderOverview(usage);
});

Then(/^I (see|do not see|softly see|softly do not see) "([^"]*)" Tab title displays on pagelayout$/, async function (this: CustomWorld, usage: string, tab: string) {
  await pageLayout(this).assertTab(this.savedValues.resolve(tab), usage);
});

Then(/^I (see|do not see) "([^"]*)" subtab is present with icon "([^"]*)" in page details$/, async function (this: CustomWorld, usage: string, subtab: string, icon: string) {
  await pageLayout(this).assertSubtabWithIcon(this.savedValues.resolve(subtab), icon, usage);
});

Then(/^I see "([^"]*)" shown as header instruction text$/, async function (this: CustomWorld, text: string) {
  await pageLayout(this).assertText(this.savedValues.resolve(text));
});

Then(/^I (softly see|softly do not see|see|do not see) "([^"]*)" button is displayed$/, async function (this: CustomWorld, usage: string, button: string) {
  await pageLayout(this).assertButton(this.savedValues.resolve(button), usage);
});

Then(/^I (softly see|see|do not see|softly do not see) "([^"]*)" button is displayed on confirmation box$/, async function (this: CustomWorld, usage: string, button: string) {
  const dialogButton = this.page.getByRole('dialog').getByRole('button', { name: this.savedValues.resolve(button), exact: true });
  await pageLayout(this).assertVisibility(dialogButton, usage);
});

Then(/^I (softly see|see|do not see|softly do not see) asterisk mark at "([^"]*)" field in LWC$/, async function (this: CustomWorld, usage: string, field: string) {
  await pageLayout(this).assertAsterisk(this.savedValues.resolve(field), usage);
});

Then(/^I (softly see|see|do not see|softly do not see) required for submit symbol at "([^"]*)" field$/, async function (this: CustomWorld, usage: string, field: string) {
  await pageLayout(this).assertRequiredForSubmit(this.savedValues.resolve(field), usage);
});

Then(/^I click on "([^"]*)" in page detail$/, async function (this: CustomWorld, action: string) {
  await pageLayout(this).clickPageDetailAction(action);
});

Then('I see entire page is refreshing', async function (this: CustomWorld) {
  await this.page.waitForLoadState('domcontentloaded');
  await this.waitHelper.waitForSpinnerDisappear();
});

Then(/^I (softly see|softly do not see|see|do not see) Help Text Post "([^"]*)" for the field "([^"]*)"$/, async function (this: CustomWorld, usage: string, helpText: string, field: string) {
  await pageLayout(this).assertHelpText(this.savedValues.resolve(field), this.savedValues.resolve(helpText), usage);
});

Then(/^I (see|do not see) "([^"]*)" subtab is present in page details$/, async function (this: CustomWorld, usage: string, subtab: string) {
  await pageLayout(this).assertUploadSubtab(this.savedValues.resolve(subtab), usage);
});

Then(/^I enter value "([^"]*)" inside "([^"]*)" in LWC modal$/, async function (this: CustomWorld, value: string, field: string) {
  await pageLayout(this).fillModalField(field, this.savedValues.resolve(value));
});

Then(/^I (cannot see|softly cannot see) "([^"]*)" on page "([^"]*)" of "([^"]*)" pdf file$/, async function (this: CustomWorld, usage: string, text: string, _pageNumber: string, pdfFile: string) {
  const resolvedText = this.savedValues.resolve(text);
  const resolvedFile = this.savedValues.resolve(pdfFile);
  const file = fs.readdirSync(getDownloadsDir()).find((name) => name.includes(resolvedFile) && name.toLowerCase().endsWith('.pdf'));
  if (!file) throw new Error(`PDF file "${resolvedFile}" not found in downloads`);
  const pdfParse = require('pdf-parse');
  const pdf = await pdfParse(fs.readFileSync(path.join(getDownloadsDir(), file)));
  const absent = !String(pdf.text || '').includes(resolvedText);
  if (usage.includes('softly')) expect.soft(absent).toBeTruthy();
  else expect(absent).toBeTruthy();
});

Then(/^I delete the record "([^"]*)" from the object "([^"]*)" with field "([^"]*)"$/, async function (this: CustomWorld, record: string, objectName: string, fieldName: string) {
  const api = new FrameworkConfigurationApi(this.savedValues);
  await api.deleteRecord(this.savedValues.resolve(record), objectName, fieldName);
});
