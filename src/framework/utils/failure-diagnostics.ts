import { Page } from 'playwright';
import * as fs from 'fs';
import * as path from 'path';
import { logger } from './logger';
import { getProject } from './get-project';

/**
 * Failure Diagnostics — captures a full debug bundle on test failure:
 *   1. Full-page screenshot (PNG)
 *   2. DOM snapshot (full page HTML)
 *   3. Current URL + page title
 *   4. Browser console log buffer
 *   5. Active element info
 *   6. Visible Lightning spinners / modals / toasts state
 *
 * All artifacts are saved per-scenario under reports/diagnostics/<scenarioId>/
 * and also returned as attachable buffers for Cucumber HTML reports.
 *
 * This is the "self-healing" feature — AI or developer reads the diagnostic
 * bundle and can pinpoint the breaking element within seconds.
 */

export interface DiagnosticBundle {
  scenarioName: string;
  timestamp: string;
  url: string;
  title: string;
  screenshot: Buffer | null;
  domSnapshot: string;
  smartDom: string;
  locatorAnalysis: string;
  consoleLogs: string[];
  frameworkLogs: string[];
  uiState: UIStateSnapshot;
  failedStep?: string;
  errorMessage?: string;
  outputDir?: string;
}

export interface UIStateSnapshot {
  hasSpinner: boolean;
  hasModal: boolean;
  hasToast: boolean;
  toastMessage: string;
  activeElement: string;
  lightningNavBarVisible: boolean;
  sidebarVisible: boolean;
  visibleModals: string[];
  pageLoadState: string;
}

export class FailureDiagnostics {
  private consoleLogs: string[] = [];
  private static get DIAGNOSTICS_DIR(): string {
    const project = getProject();
    return `reports/${project}/diagnostics`;
  }

  constructor(private page: Page) {
    this.setupConsoleCapture();
  }

  /** Start capturing browser console messages */
  private setupConsoleCapture(): void {
    this.page.on('console', (msg) => {
      const type = msg.type();
      const text = msg.text();
      if (type === 'error' || type === 'warning' || type === 'log') {
        const entry = `[${type.toUpperCase()}] ${new Date().toISOString()} ${text}`;
        this.consoleLogs.push(entry);
        // Keep buffer bounded (last 200 messages)
        if (this.consoleLogs.length > 200) {
          this.consoleLogs.shift();
        }
      }
    });

    this.page.on('pageerror', (error) => {
      this.consoleLogs.push(`[PAGE_ERROR] ${new Date().toISOString()} ${error.message}`);
    });
  }

  /**
   * Capture a complete diagnostic bundle.
   * Call this from the After hook when a scenario fails.
   */
  async captureDiagnostics(
    scenarioName: string,
    frameworkLogs: string[],
    failedStep?: string,
    errorMessage?: string
  ): Promise<DiagnosticBundle> {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const safeScenarioName = scenarioName.replace(/[^a-zA-Z0-9_-]/g, '_').substring(0, 80);

    logger.info(`[DIAGNOSTICS] Capturing failure bundle for: ${scenarioName}`);

    // 1. Screenshot
    let screenshot: Buffer | null = null;
    try {
      screenshot = await this.page.screenshot({ fullPage: true, timeout: 15000 });
    } catch (e) {
      logger.warn(`[DIAGNOSTICS] Screenshot capture failed: ${e}`);
    }

    // 2. Current URL + title
    let url = 'unknown';
    let title = 'unknown';
    try {
      url = this.page.url();
      title = await this.page.title().catch(() => 'unknown');
    } catch { /* page may be closed */ }

    // 3. DOM snapshot
    let domSnapshot = '';
    try {
      domSnapshot = await this.page.content();
    } catch (e) {
      domSnapshot = `[DOM capture failed: ${e}]`;
    }

    // 4. UI state inspection
    const uiState = await this.captureUIState();

    // 5. Smart DOM extraction — focused regions AI can read quickly
    const smartDom = await this.extractSmartDom();

    // 6. Locator analysis — parse error for failing selector, find what actually exists
    const locatorAnalysis = await this.analyzeFailingLocator(errorMessage || '');

    // 7. Build bundle
    const bundle: DiagnosticBundle = {
      scenarioName,
      timestamp,
      url,
      title,
      screenshot,
      domSnapshot,
      smartDom,
      locatorAnalysis,
      consoleLogs: [...this.consoleLogs],
      frameworkLogs,
      uiState,
      failedStep,
      errorMessage,
    };

    // 6. Save to disk
    const outputDir = await this.saveToDisk(bundle, safeScenarioName, timestamp);
    bundle.outputDir = outputDir;

    logger.info(`[DIAGNOSTICS] Bundle saved to: ${outputDir}`);
    return bundle;
  }

  /** Inspect current UI state — spinners, modals, toasts, active element */
  private async captureUIState(): Promise<UIStateSnapshot> {
    const defaults: UIStateSnapshot = {
      hasSpinner: false,
      hasModal: false,
      hasToast: false,
      toastMessage: '',
      activeElement: 'unknown',
      lightningNavBarVisible: false,
      sidebarVisible: false,
      visibleModals: [],
      pageLoadState: 'unknown',
    };

    try {
      return await this.page.evaluate(() => {
        const state: any = {
          hasSpinner: false,
          hasModal: false,
          hasToast: false,
          toastMessage: '',
          activeElement: 'unknown',
          lightningNavBarVisible: false,
          sidebarVisible: false,
          visibleModals: [],
          pageLoadState: document.readyState,
        };

        // Check spinners
        const spinners = Array.from(document.querySelectorAll('.slds-spinner, .loadingSpinner, .loadingIndicator, .spinner'));
        for (let i = 0; i < spinners.length; i++) {
          const rect = spinners[i].getBoundingClientRect();
          if (rect.width > 0 && rect.height > 0) {
            state.hasSpinner = true;
            break;
          }
        }

        // Check modals
        const modals = Array.from(document.querySelectorAll('.slds-modal, [role="dialog"]:not(#auraError)'));
        for (let i = 0; i < modals.length; i++) {
          const rect = modals[i].getBoundingClientRect();
          if (rect.width > 0 && rect.height > 0) {
            state.hasModal = true;
            const header = modals[i].querySelector('h2, .modal-header, .slds-modal__header');
            if (header) {
              state.visibleModals.push(header.textContent?.trim() || 'Untitled Modal');
            }
          }
        }

        // Check toasts
        const toasts = Array.from(document.querySelectorAll('.slds-notify, .forceToastMessage, .toastMessage'));
        for (let i = 0; i < toasts.length; i++) {
          const rect = toasts[i].getBoundingClientRect();
          if (rect.width > 0 && rect.height > 0) {
            state.hasToast = true;
            state.toastMessage = toasts[i].textContent?.trim() || '';
            break;
          }
        }

        // Active element
        const active = document.activeElement;
        if (active) {
          const tag = active.tagName.toLowerCase();
          const id = active.id ? `#${active.id}` : '';
          const cls = active.className ? `.${String(active.className).split(' ').join('.')}` : '';
          state.activeElement = `${tag}${id}${cls}`;
        }

        // Lightning nav bar
        const navBar = document.querySelector('one-app-nav-bar, .slds-no-print.oneAppNavContainer');
        state.lightningNavBarVisible = navBar ? navBar.getBoundingClientRect().height > 0 : false;

        // Sidebar
        const sidebar = document.querySelector('gnt-side-bar-lwc');
        state.sidebarVisible = sidebar ? sidebar.getBoundingClientRect().height > 0 : false;

        return state;
      });
    } catch (e) {
      logger.warn(`[DIAGNOSTICS] UI state capture failed: ${e}`);
      return defaults;
    }
  }

  /** Save all diagnostic artifacts to disk */
  private async saveToDisk(
    bundle: DiagnosticBundle,
    safeScenarioName: string,
    timestamp: string
  ): Promise<string> {
    const outputDir = path.resolve(FailureDiagnostics.DIAGNOSTICS_DIR, `${safeScenarioName}_${timestamp}`);
    fs.mkdirSync(outputDir, { recursive: true });

    // Screenshot
    if (bundle.screenshot) {
      fs.writeFileSync(path.join(outputDir, 'screenshot.png'), bundle.screenshot);
    }

    // DOM snapshot (trimmed to 2MB max to avoid huge files)
    const domContent = bundle.domSnapshot.length > 2_000_000
      ? bundle.domSnapshot.substring(0, 2_000_000) + '\n<!-- TRUNCATED -->'
      : bundle.domSnapshot;
    fs.writeFileSync(path.join(outputDir, 'dom-snapshot.html'), domContent, 'utf-8');

    // Summary report (human + AI readable)
    const summary = this.buildSummaryReport(bundle);
    fs.writeFileSync(path.join(outputDir, 'failure-summary.txt'), summary, 'utf-8');

    // Console logs
    if (bundle.consoleLogs.length > 0) {
      fs.writeFileSync(
        path.join(outputDir, 'console-logs.txt'),
        bundle.consoleLogs.join('\n'),
        'utf-8'
      );
    }

    // Framework logs
    if (bundle.frameworkLogs.length > 0) {
      fs.writeFileSync(
        path.join(outputDir, 'framework-logs.txt'),
        bundle.frameworkLogs.join('\n'),
        'utf-8'
      );
    }

    // Smart DOM (focused regions for AI)
    if (bundle.smartDom) {
      fs.writeFileSync(path.join(outputDir, 'smart-dom.txt'), bundle.smartDom, 'utf-8');
    }

    // Locator analysis
    if (bundle.locatorAnalysis) {
      fs.writeFileSync(path.join(outputDir, 'locator-analysis.txt'), bundle.locatorAnalysis, 'utf-8');
    }

    return outputDir;
  }

  /** Build a human + AI readable summary report */
  private buildSummaryReport(bundle: DiagnosticBundle): string {
    const lines: string[] = [
      '═══════════════════════════════════════════════════════════════',
      '  FAILURE DIAGNOSTIC REPORT',
      '═══════════════════════════════════════════════════════════════',
      '',
      `  Scenario:     ${bundle.scenarioName}`,
      `  Timestamp:    ${bundle.timestamp}`,
      `  URL:          ${bundle.url}`,
      `  Page Title:   ${bundle.title}`,
      `  Page State:   ${bundle.uiState.pageLoadState}`,
      '',
    ];

    if (bundle.failedStep) {
      lines.push(`  Failed Step:  ${bundle.failedStep}`);
    }
    if (bundle.errorMessage) {
      lines.push(`  Error:        ${bundle.errorMessage}`);
    }

    lines.push('');
    lines.push('── UI STATE AT FAILURE ────────────────────────────────────────');
    lines.push(`  Lightning Nav Bar Visible: ${bundle.uiState.lightningNavBarVisible}`);
    lines.push(`  Sidebar Visible:          ${bundle.uiState.sidebarVisible}`);
    lines.push(`  Active Spinner:           ${bundle.uiState.hasSpinner}`);
    lines.push(`  Modal Open:               ${bundle.uiState.hasModal}`);
    if (bundle.uiState.visibleModals.length > 0) {
      lines.push(`  Modal Titles:             ${bundle.uiState.visibleModals.join(', ')}`);
    }
    lines.push(`  Toast Visible:            ${bundle.uiState.hasToast}`);
    if (bundle.uiState.toastMessage) {
      lines.push(`  Toast Message:            ${bundle.uiState.toastMessage}`);
    }
    lines.push(`  Active Element:           ${bundle.uiState.activeElement}`);

    lines.push('');
    lines.push('── BROWSER CONSOLE ERRORS ────────────────────────────────────');
    const errors = bundle.consoleLogs.filter(l => l.startsWith('[ERROR]') || l.startsWith('[PAGE_ERROR]'));
    if (errors.length > 0) {
      errors.slice(-20).forEach(e => lines.push(`  ${e}`));
    } else {
      lines.push('  (none)');
    }

    lines.push('');
    lines.push('── LAST 30 FRAMEWORK LOG ENTRIES ─────────────────────────────');
    const lastLogs = bundle.frameworkLogs.slice(-30);
    if (lastLogs.length > 0) {
      lastLogs.forEach(l => lines.push(`  ${l}`));
    } else {
      lines.push('  (none)');
    }

    lines.push('');
    lines.push('── FILES IN THIS BUNDLE ──────────────────────────────────────');
    lines.push('  screenshot.png         - Full page screenshot at failure');
    lines.push('  dom-snapshot.html      - Complete DOM at failure (open in browser)');
    lines.push('  smart-dom.txt          - Focused DOM regions (nav, sidebar, modal, content)');
    lines.push('  locator-analysis.txt   - Failed locator analysis + what actually exists');
    lines.push('  console-logs.txt       - Browser console log buffer');
    lines.push('  framework-logs.txt     - Framework execution logs');
    lines.push('  failure-summary.txt    - This file');
    lines.push('');
    lines.push('── AI DEBUGGING INSTRUCTIONS ─────────────────────────────────');
    lines.push('  FASTEST PATH: Read locator-analysis.txt first.');
    lines.push('    → It shows the failing locator and what similar elements exist.');
    lines.push('    → Copy the suggested fix directly.');
    lines.push('  THEN: Open smart-dom.txt for focused DOM regions.');
    lines.push('    → Nav bar, sidebar, modal, main content extracted separately.');
    lines.push('  VISUAL: Open screenshot.png to see the page state.');
    lines.push('  FULL DOM: Open dom-snapshot.html only if smart-dom is insufficient.');
    lines.push('═══════════════════════════════════════════════════════════════');

    return lines.join('\n');
  }

  /**
   * Extract focused DOM regions — compact version AI can read without
   * searching through a 2MB full DOM file.
   * Extracts: nav bar, sidebar, modal, main content area, toast area.
   */
  private async extractSmartDom(): Promise<string> {
    try {
      return await this.page.evaluate(() => {
        const sections: string[] = [];
        const getHtml = (selector: string, label: string, maxLen: number = 5000) => {
          const el = document.querySelector(selector);
          if (el) {
            let html = el.outerHTML;
            if (html.length > maxLen) html = html.substring(0, maxLen) + '\n<!-- TRUNCATED -->';
            sections.push(`\n══ ${label} ══\n${html}`);
          } else {
            sections.push(`\n══ ${label} ══\n(NOT FOUND in DOM)`);
          }
        };

        getHtml('one-app-nav-bar, .oneAppNavContainer', 'LIGHTNING NAV BAR (top tabs)', 8000);
        getHtml('gnt-side-bar-lwc', 'SIDEBAR (left nav)', 8000);
        getHtml('.slds-modal__container, [role="dialog"]:not(#auraError)', 'ACTIVE MODAL', 10000);
        getHtml('.forceToastManager, .slds-notify-container', 'TOAST NOTIFICATIONS', 3000);
        getHtml('.slds-spinner_container, .loadingSpinner', 'ACTIVE SPINNER', 2000);

        // Main content area — the most important region
        const mainContent = document.querySelector('.oneAuraContainer .main-content, .oneConsoleTab, .mainContentMark, .content');
        if (mainContent) {
          let html = mainContent.outerHTML;
          if (html.length > 15000) html = html.substring(0, 15000) + '\n<!-- TRUNCATED -->';
          sections.push(`\n══ MAIN CONTENT AREA ══\n${html}`);
        }

        // All flex tables on page (critical for table interactions)
        const flexTables = Array.from(document.querySelectorAll('c-lwc-flex-table'));
        if (flexTables.length > 0) {
          sections.push(`\n══ FLEX TABLES (${flexTables.length} found) ══`);
          for (let i = 0; i < Math.min(flexTables.length, 3); i++) {
            const tbl = flexTables[i];
            const name = tbl.getAttribute('data-flextablename') || 'unnamed';
            let html = tbl.outerHTML;
            if (html.length > 8000) html = html.substring(0, 8000) + '\n<!-- TRUNCATED -->';
            sections.push(`\n── TABLE: ${name} ──\n${html}`);
          }
        }

        return sections.join('\n');
      });
    } catch (e) {
      return `[Smart DOM extraction failed: ${e}]`;
    }
  }

  /**
   * Analyze the failing locator from the error message.
   * Parses XPaths and CSS selectors from the error, then searches the DOM
   * for what actually exists — showing AI the gap between expected and actual.
   */
  private async analyzeFailingLocator(errorMessage: string): Promise<string> {
    const lines: string[] = [
      '══ LOCATOR ANALYSIS ══',
      '',
    ];

    // Always include the raw error (truncated) for context
    lines.push('── RAW ERROR ──');
    lines.push(errorMessage.substring(0, 600));
    lines.push('');

    // 1. Extract full locator string from Playwright's locator('...') pattern
    const locatorMatch = errorMessage.match(/locator\('([\s\S]*?)'\)/);
    const fullLocator = locatorMatch ? locatorMatch[1].replace(/\\'/g, "'") : '';
    if (fullLocator) {
      lines.push(`── FULL FAILING LOCATOR ──`);
      lines.push(`  ${fullLocator}`);
      lines.push('');

      // Split pipe-separated XPaths and evaluate each
      const xpaths = fullLocator.split(' | ').map(s => s.trim()).filter(Boolean);
      for (const xpath of xpaths.slice(0, 8)) {
        lines.push(`── XPATH: ${xpath.substring(0, 200)} ──`);
        try {
          const loc = this.page.locator(`xpath=${xpath}`);
          const count = await loc.count();
          lines.push(`  DOM matches: ${count}`);
          if (count > 0) {
            const firstHtml = await loc.first()
              .evaluate((el: Element) => el.outerHTML.substring(0, 300))
              .catch(() => '(could not get HTML)');
            lines.push(`  First match: ${firstHtml}`);
            const isVis = await loc.first().isVisible().catch(() => false);
            lines.push(`  Visible: ${isVis}`);
          }
        } catch (e) {
          lines.push(`  (Evaluation error: ${String(e).substring(0, 100)})`);
        }
        lines.push('');
      }
    }

    // 2. Extract text values being searched (text()='X', @value='X', @title='X')
    const textValues = new Set<string>();
    // Handle both escaped (\') and unescaped (') quotes in Playwright error messages
    const unescapedError = errorMessage.replace(/\\'/g, "'");
    const valueRegex = /(?:text\(\)|@value|@title|@type|@data-value)='([^']+)'/g;
    let m;
    while ((m = valueRegex.exec(unescapedError)) !== null) {
      textValues.add(m[1]);
    }

    for (const searchText of Array.from(textValues).slice(0, 5)) {
      lines.push(`── SEARCHING FOR '${searchText}' IN DOM ──`);
      try {
        // Exact text match
        const exactCount = await this.page.locator(`//*[text()='${searchText}']`).count();
        lines.push(`  Exact text()='${searchText}': ${exactCount} match(es)`);
        // Contains match
        const containsCount = await this.page.locator(`//*[contains(text(),'${searchText}')]`).count();
        lines.push(`  Contains '${searchText}': ${containsCount} match(es)`);
        // Title attribute match
        const titleCount = await this.page.locator(`[title='${searchText}']`).count();
        lines.push(`  [title='${searchText}']: ${titleCount} match(es)`);
        // Show first few matches if found
        if (containsCount > 0 && containsCount <= 10) {
          for (let i = 0; i < Math.min(containsCount, 5); i++) {
            const info = await this.page.locator(`//*[contains(text(),'${searchText}')]`).nth(i).evaluate((el: Element) => {
              const tag = el.tagName.toLowerCase();
              const cls = el.className ? ` class="${String(el.className).substring(0, 60)}"` : '';
              const vis = el.getBoundingClientRect().height > 0 ? 'VISIBLE' : 'HIDDEN';
              return `    <${tag}${cls}>${(el.textContent || '').trim().substring(0, 80)}</${tag}> [${vis}]`;
            }).catch(() => '    (could not evaluate)');
            lines.push(info);
          }
        }
      } catch {
        lines.push(`  (Search failed)`);
      }
      lines.push('');
    }

    // 3. Extract data-flextablename if present, show what's inside that table
    const tableNameMatch = unescapedError.match(/data-flextablename='([^']+)'/);
    if (tableNameMatch) {
      const tableName = tableNameMatch[1];
      lines.push(`── TABLE '${tableName}' CONTENTS ──`);
      try {
        const tableExists = await this.page.locator(`c-lwc-flex-table[data-flextablename='${tableName}']`).count();
        lines.push(`  Table in DOM: ${tableExists > 0 ? 'YES' : 'NO'}`);
        if (tableExists > 0) {
          // List all buttons in the table
          const buttons = await this.page.evaluate((tn: string) => {
            const table = document.querySelector(`c-lwc-flex-table[data-flextablename='${tn}']`);
            if (!table) return ['  Table element not found'];
            const items: string[] = [];
            // Buttons
            table.querySelectorAll('button').forEach(btn => {
              const title = btn.getAttribute('title') || '';
              const text = (btn.textContent || '').trim().substring(0, 50);
              const vis = btn.getBoundingClientRect().height > 0 ? 'VISIBLE' : 'HIDDEN';
              items.push(`  <button title="${title}">${text}</button> [${vis}]`);
            });
            // Links
            table.querySelectorAll('a').forEach(a => {
              const text = (a.textContent || '').trim().substring(0, 50);
              if (text) {
                const vis = a.getBoundingClientRect().height > 0 ? 'VISIBLE' : 'HIDDEN';
                items.push(`  <a>${text}</a> [${vis}]`);
              }
            });
            // Menu items
            table.querySelectorAll('lightning-menu-item').forEach(mi => {
              const val = mi.getAttribute('data-value') || mi.getAttribute('value') || '';
              const text = (mi.textContent || '').trim().substring(0, 50);
              const vis = mi.getBoundingClientRect().height > 0 ? 'VISIBLE' : 'HIDDEN';
              items.push(`  <lightning-menu-item value="${val}">${text}</lightning-menu-item> [${vis}]`);
            });
            // Spans with text in header area
            const header = table.querySelector('.header, .headerTitle, .panel-heading');
            if (header) {
              items.push(`  --- Header area ---`);
              header.querySelectorAll('span, button, a').forEach(el => {
                const text = (el.textContent || '').trim().substring(0, 50);
                if (text && !items.some(i => i.includes(text))) {
                  const tag = el.tagName.toLowerCase();
                  const vis = el.getBoundingClientRect().height > 0 ? 'VISIBLE' : 'HIDDEN';
                  items.push(`  <${tag}>${text}</${tag}> [${vis}]`);
                }
              });
            }
            return items.length > 0 ? items : ['  (no buttons/links/menu-items found)'];
          }, tableName);
          buttons.forEach(b => lines.push(b));
        }
      } catch {
        lines.push(`  (Table analysis failed)`);
      }
      lines.push('');
    }

    return lines.join('\n');
  }

  /** Get the console logs buffer */
  getConsoleLogs(): string[] {
    return [...this.consoleLogs];
  }

  /** Clear the console log buffer (between scenarios) */
  clearConsoleLogs(): void {
    this.consoleLogs = [];
  }
}
