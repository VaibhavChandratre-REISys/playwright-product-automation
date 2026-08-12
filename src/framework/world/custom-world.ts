import { World, IWorldOptions, setWorldConstructor } from '@cucumber/cucumber';
import { Browser, BrowserContext, Page, chromium, firefox, webkit } from 'playwright';
import * as path from 'path';
import { getConfig } from '../config/config-loader';
import { SavedValues } from '../utils/saved-values';
import { WaitHelper } from '../utils/wait-helper';
import { ClickHelper } from '../utils/click-helper';
import { FailureDiagnostics } from '../utils/failure-diagnostics';
import { getDownloadsDir } from '../utils/excel-reader';
import { logger } from '../utils/logger';
import { WindowHandler } from '../helpers/window-handler';

export class CustomWorld extends World {
  browser!: Browser;
  context!: BrowserContext;
  page!: Page;
  savedValues: SavedValues = new SavedValues();
  waitHelper!: WaitHelper;
  clickHelper!: ClickHelper;
  diagnostics!: FailureDiagnostics;
  windowHandler!: WindowHandler;
  currentStep: string = '';
  downloadsPath: string = '';

  constructor(options: IWorldOptions) {
    super(options);
  }

  /** Launch browser and create a fresh context + page. Called in Before hook. */
  async openBrowser(): Promise<void> {
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
  async closeBrowser(): Promise<void> {
    try {
      await this.page?.close();
      await this.context?.close();
      await this.browser?.close();
    } catch (err) {
      logger.warn(`closeBrowser: ${(err as Error).message}`);
    }
  }
}

setWorldConstructor(CustomWorld);
