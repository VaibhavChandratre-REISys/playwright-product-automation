 function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }import { Before, After, BeforeStep, Status } from '@cucumber/cucumber';
import { execSync } from 'child_process';
import * as fs from 'fs';
import * as path from 'path';

import { GrantorApiService } from '../api/grantor-api-service';
import { logger } from '../utils/logger';
import { getProject } from '../utils/get-project';

/**
 * Before each scenario: launch browser + clear log buffer.
 */
Before(async function () {
  logger.clearScenarioLogs();
  await this.openBrowser();
});

/**
 * Before each step: track the current step name for diagnostics.
 */
BeforeStep(async function ( { pickleStep }) {
  this.currentStep = pickleStep.text;
  logger.debug(`▸ Step: ${pickleStep.text}`);
});

/**
 * After each scenario: on failure, capture full diagnostic bundle.
 *   - Full-page screenshot (PNG) → attached to Cucumber report
 *   - DOM snapshot (HTML) → saved to disk + attached as text
 *   - Browser console logs → saved to disk + attached as text
 *   - Framework execution logs → saved to disk + attached as text
 *   - UI state snapshot (spinner/modal/toast/nav bar) → in summary
 *   - Failure summary report → saved to disk + attached as text
 *
 * All artifacts saved under reports/diagnostics/<scenarioName>_<timestamp>/
 * This is the "self-healing" feature — AI reads the bundle to identify the
 * breaking point and suggest fixes within seconds.
 */
After(async function ( scenario) {
  if (_optionalChain([scenario, 'access', _ => _.result, 'optionalAccess', _2 => _2.status]) === Status.FAILED) {
    try {
      if (this.page && this.diagnostics) {
        const errorMsg = _optionalChain([scenario, 'access', _3 => _3.result, 'optionalAccess', _4 => _4.message]) || 'Unknown error';
        const bundle = await this.diagnostics.captureDiagnostics(
          scenario.pickle.name,
          logger.getScenarioLogs(),
          this.currentStep,
          typeof errorMsg === 'string' ? errorMsg.substring(0, 500) : String(errorMsg).substring(0, 500)
        );

        // Attach screenshot to Cucumber HTML report
        if (bundle.screenshot) {
          this.attach(bundle.screenshot, 'image/png');
        }

        // Attach failure summary as text (visible in report)
        const summaryLines = [
          `FAILED STEP: ${bundle.failedStep || 'unknown'}`,
          `URL: ${bundle.url}`,
          `Lightning NavBar: ${bundle.uiState.lightningNavBarVisible}`,
          `Spinner Active: ${bundle.uiState.hasSpinner}`,
          `Modal Open: ${bundle.uiState.hasModal}${bundle.uiState.visibleModals.length ? ' (' + bundle.uiState.visibleModals.join(', ') + ')' : ''}`,
          `Toast: ${bundle.uiState.hasToast}${bundle.uiState.toastMessage ? ' — ' + bundle.uiState.toastMessage : ''}`,
          `Page State: ${bundle.uiState.pageLoadState}`,
          `Active Element: ${bundle.uiState.activeElement}`,
          `Console Errors: ${bundle.consoleLogs.filter(l => l.includes('[ERROR]')).length}`,
          `Diagnostics Dir: ${bundle.outputDir}`,
        ];
        this.attach(summaryLines.join('\n'), 'text/plain');

        // Attach locator analysis (the fastest way AI identifies the fix)
        if (bundle.locatorAnalysis) {
          this.attach(bundle.locatorAnalysis, 'text/plain');
        }

        // Attach smart DOM (focused regions — nav, sidebar, modal, tables)
        if (bundle.smartDom && bundle.smartDom.length < 50000) {
          this.attach(bundle.smartDom, 'text/plain');
        }

        // Attach last 20 framework log lines
        const lastLogs = bundle.frameworkLogs.slice(-20).join('\n');
        if (lastLogs) {
          this.attach(`--- LAST 20 FRAMEWORK LOG ENTRIES ---\n${lastLogs}`, 'text/plain');
        }

        logger.error(`═══ SCENARIO FAILED: ${scenario.pickle.name} ═══`);
        logger.error(`  Diagnostics saved: ${bundle.outputDir}`);
        logger.error(`  Failed step: ${bundle.failedStep}`);
        logger.error(`  URL: ${bundle.url}`);
      }
    } catch (e) {
      logger.warn(`Diagnostics capture failed: ${e}`);
      // Fallback: try basic screenshot
      try {
        const screenshot = await _optionalChain([this, 'access', _5 => _5.page, 'optionalAccess', _6 => _6.screenshot, 'call', _7 => _7({ fullPage: true })]);
        if (screenshot) this.attach(screenshot, 'image/png');
      } catch (e2) { /* page may be closed */ }
    }
  }

  // Cleanup test data created during the scenario (mirrors Java deleteRecordInHooks)
  try {
    const api = new GrantorApiService(this.savedValues);
    await api.cleanupTestData();
  } catch (e) {
    logger.warn(`[CLEANUP] Test data cleanup error: ${e.message}`);
  }

  await this.closeBrowser();
  this.savedValues.clear();
  logger.clearScenarioLogs();
});

/**
 * Auto-generate HTML report after process exits.
 * process.on('beforeExit') fires AFTER all Cucumber formatters have flushed to disk,
 * so the JSON file is guaranteed to be complete.
 */
let reportGenerated = false;
process.on('beforeExit', () => {
  if (reportGenerated) return;
  reportGenerated = true;
  const project = getProject();
  const jsonPath = path.resolve(process.cwd(), 'reports', project, 'cucumber-report.json');
  if (!fs.existsSync(jsonPath)) return;
  try {
    const raw = fs.readFileSync(jsonPath, 'utf-8').trim();
    JSON.parse(raw); // validate it's complete
    const scriptPath = path.resolve(process.cwd(), 'scripts', 'generate-report.js');
    execSync(`"${process.execPath}" "${scriptPath}"`, { stdio: 'inherit' });
  } catch (e) {
    console.error('[REPORT] Failed to generate HTML report:', e.message || e);
  }
});
