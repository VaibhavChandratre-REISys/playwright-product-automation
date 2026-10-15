import { expect, Page } from '@playwright/test';

export class PageLayoutComponentPage {
  constructor(private readonly page: Page) {}

  async assertVisibility(locator: ReturnType<Page['locator']>, usage: string): Promise<void> {
    const visible = !usage.includes('do not') && !usage.includes('cannot');
    const assertion = expect.soft(locator.first());
    if (visible) await assertion.toBeVisible({ timeout: 10000 });
    else await assertion.toBeHidden({ timeout: 5000 });
  }

  async assertText(text: string, usage = 'see'): Promise<void> {
    const escaped = text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    await this.assertVisibility(this.page.getByText(new RegExp(escaped, 'i'), { exact: false }), usage);
  }

  async assertPageInstruction(text: string, usage: string): Promise<void> {
    const locator = this.page.locator(
      'div.article div:visible, ' +
      'lightning-tab lightning-formatted-rich-text span:visible, ' +
      'div.header-Instruction-text p:visible, ' +
      'lightning-formatted-rich-text:visible, ' +
      'lightning-formatted-rich-text span:visible'
    ).filter({ hasText: text });
    await this.assertVisibility(locator, usage);
  }

  async assertConfirmation(message: string, usage: string): Promise<void> {
    const dialog = this.page.getByRole('dialog').filter({ hasText: message });
    await this.assertVisibility(dialog, usage);
  }

  async assertButton(buttonName: string, usage: string): Promise<void> {
    await this.assertVisibility(this.page.getByRole('button', { name: buttonName, exact: true }), usage);
  }

  async assertHeaderOverview(usage: string): Promise<void> {
    const overview = this.page.locator('c-page-layout-header, c-page-layout').getByText('Overview', { exact: true });
    await this.assertVisibility(overview, usage);
  }

  async assertTab(tabName: string, usage: string): Promise<void> {
    const tab = this.page.getByRole('tab', { name: tabName, exact: true }).or(
      this.page.locator(`[role="tab"][title="${tabName}"], button[title="${tabName}"]`)
    );
    await this.assertVisibility(tab, usage);
  }

  async assertSubtabWithIcon(subTab: string, icon: string, usage: string): Promise<void> {
    const subtab = this.page.locator('a, button, [role="tab"]').filter({ hasText: subTab }).filter({
      has: this.page.locator(`lightning-icon[icon-name*="${icon}"], lightning-primitive-icon[data-key="${icon}"], [data-key="${icon}"]`),
    });
    await this.assertVisibility(subtab, usage);
  }

  async clickPageDetailAction(action: string): Promise<void> {
    await this.page.getByRole('button', { name: action, exact: true }).click();
  }

  async assertAsterisk(field: string, usage: string): Promise<void> {
    const label = this.page.locator('label, .slds-form-element__label').filter({ hasText: field });
    const asterisk = label.locator('abbr.slds-required, abbr[title="required"], .slds-required');
    await this.assertVisibility(asterisk, usage);
  }

  async assertRequiredForSubmit(field: string, usage: string): Promise<void> {
    const container = this.page.locator('c-fieldlwc, .slds-form-element').filter({ hasText: field });
    const symbol = container.locator('[title*="Required for Submit"], [data-required-for-submit="true"], .requiredForSubmit, lightning-icon[icon-name*="required"]');
    await this.assertVisibility(symbol, usage);
  }

  async assertHelpText(field: string, helpText: string, usage: string): Promise<void> {
    const container = this.page.locator('c-fieldlwc, .slds-form-element').filter({ hasText: field });
    await this.assertVisibility(container.getByText(helpText, { exact: false }), usage);
  }

  async assertUploadSubtab(subTab: string, usage: string): Promise<void> {
    await this.assertVisibility(this.page.getByRole('tab', { name: subTab, exact: true }), usage);
  }

  async fillModalField(field: string, value: string): Promise<void> {
    const dialog = this.page.getByRole('dialog');
    const input = dialog.getByLabel(field, { exact: true }).or(dialog.locator(`input[name="${field}"], textarea[name="${field}"]`));
    await input.first().fill(value);
  }
}
