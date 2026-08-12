import { setDefaultTimeout } from '@cucumber/cucumber';

/** Salesforce pages are slow — give each step 120 seconds before Cucumber times it out.
 *  JWT login alone can take 30-40s (token mint + frontdoor + identity bypass),
 *  plus post-login EGMS header wait (up to 30s), exceeding 60s easily. */
setDefaultTimeout(120 * 1000);
