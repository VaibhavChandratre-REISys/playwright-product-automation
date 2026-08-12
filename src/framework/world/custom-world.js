 function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }import { World, setWorldConstructor } from '@cucumber/cucumber';
import { chromium, firefox, webkit } from 'playwright';

import { getConfig } from '../config/config-loader';
import { SavedValues } from '../utils/saved-values';
import { WaitHelper } from '../utils/wait-helper';
import { ClickHelper } from '../utils/click-helper';
import { FailureDiagnostics } from '../utils/failure-diagnostics';
import { getDownloadsDir } from '../utils/excel-reader';
import { logger } from '../utils/logger';
import { WindowHandler } from '../helpers/window-handler';

export class CustomWorld extends World {
  
  
  
  __init() {this.savedValues = new SavedValues()}
  
  
  
  
  __init2() {this.currentStep = ''}
  __init3() {this.downloadsPath = ''}

  constructor(options) {
    super(options);CustomWorld.prototype.__init.call(this);CustomWorld.prototype.__init2.call(this);CustomWorld.prototype.__init3.call(this);;
  }

  /** Launch browser and create a fresh context + page. Called in Before hook. */
  async openBrowser() {
    const config = getConfig();
    const browserType =
      config.BROWSER === 'firefox' ? firefox :
      config.BROWSER === 'webkit' ? webkit : chromium;

    this.browser = await browserType.launch({
      headless: config.HEADLESS,
      slowMo: config.SLOW_MO,
      args: ['--start-maximized', '--window-size=1920,1080'],
    });

    this.downloadsPath = getDownloadsDir();

    this.context = await this.browser.newContext({
      viewport: null,  // Use no-viewport to match window size
      ignoreHTTPSErrors: true,
      acceptDownloads: true,
    });

    this.page = await this.context.newPage();
    this.page.setDefaultTimeout(config.DEFAULT_TIMEOUT_MS);
    this.waitHelper = new WaitHelper(this.page);
    this.clickHelper = new ClickHelper(this.waitHelper);
    this.diagnostics = new FailureDiagnostics(this.page);
    this.windowHandler = new WindowHandler(this.page, this.context);
    
    logger.info(`Browser launched: ${config.BROWSER} | headless=${config.HEADLESS} | maximized with no-viewport`);
  }

  /** Close page, context, and browser. Called in After hook. */
  async closeBrowser() {
    try {
      await _optionalChain([this, 'access', _ => _.page, 'optionalAccess', _2 => _2.close, 'call', _3 => _3()]);
      await _optionalChain([this, 'access', _4 => _4.context, 'optionalAccess', _5 => _5.close, 'call', _6 => _6()]);
      await _optionalChain([this, 'access', _7 => _7.browser, 'optionalAccess', _8 => _8.close, 'call', _9 => _9()]);
    } catch (err) {
      logger.warn(`closeBrowser: ${(err ).message}`);
    }
  }
}

setWorldConstructor(CustomWorld);
