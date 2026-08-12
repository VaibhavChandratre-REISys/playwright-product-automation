import { Given, When, Then } from '@cucumber/cucumber';
import { CustomWorld } from '../world/custom-world';
import { GrantorApiService } from '../api/grantor-api-service';
import { logger } from '../utils/logger';

/**
 * Complex composite / API-driven steps.
 *
 * These steps correspond to Java methods in GovGrantsProductSteps.java
 * that perform multi-step setup via Salesforce API calls (creating programs,
 * announcements, applications, FDMs, awards, subawards, reviews, etc.).
 *
 * In the Playwright framework, these are stubbed with logging and will
 * be replaced with Salesforce REST API calls or UI orchestration when
 * the API utilities are fully integrated.
 */

// ══════════════════════════════════════════════════════════════════════════════
// PROGRAM / ANNOUNCEMENT SETUP
// ══════════════════════════════════════════════════════════════════════════════

Given(
  /^I activate the internal program "([^"]*)" with properties "([^"]*)"$/,
  async function (this: CustomWorld, programName: string, properties: string) {
    const resolvedProps = this.savedValues.resolve(properties);
    logger.info(`[COMPOSITE] Activate internal program: "${programName}" with props: "${resolvedProps}"`);
    const api = new GrantorApiService(this.savedValues);
    const uniqueName = await api.activateProgram(programName, resolvedProps);
    logger.info(`[COMPOSITE] Program activated: ${uniqueName}`);
  }
);

Given(
  /^I published "([^"]*)" type announcement having name "([^"]*)" and properties "([^"]*)"$/,
  async function (this: CustomWorld, type: string, name: string, props: string) {
    const resolvedProps = this.savedValues.resolve(props);
    logger.info(`[COMPOSITE] Publishing "${type}" announcement "${name}" with props: "${resolvedProps}"`);
    const api = new GrantorApiService(this.savedValues);
    const uniqueName = await api.publishAnnouncement(type, name, resolvedProps);
    logger.info(`[COMPOSITE] Announcement published: ${uniqueName}`);
  }
);

Given(
  /^I published "([^"]*)" type announcement having name "([^"]*)" for the activated program "([^"]*)" with properties "([^"]*)"$/,
  async function (this: CustomWorld, type: string, name: string, program: string, props: string) {
    const resolvedProps = this.savedValues.resolve(props);
    logger.info(`[COMPOSITE] Publishing "${type}" announcement "${name}" for program "${program}" with props: "${resolvedProps}"`);
    const api = new GrantorApiService(this.savedValues);
    const uniqueName = await api.publishAnnouncement(type, name, resolvedProps);
    logger.info(`[COMPOSITE] Announcement published: ${uniqueName}`);
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// REGISTRATION
// ══════════════════════════════════════════════════════════════════════════════

Given(
  /^I begin "([^"]*)" registration$/,
  async function (this: CustomWorld, registrationType: string) {
    const resolved = this.savedValues.resolve(registrationType);
    logger.info(`[COMPOSITE] Begin registration: "${resolved}"`);
    // TODO: Registration API not yet available — UI-only flow
  }
);

Given(
  /^I begin "([^"]*)" registration as "([^"]*)"$/,
  async function (this: CustomWorld, registrationType: string, role: string) {
    const resolvedType = this.savedValues.resolve(registrationType);
    const resolvedRole = this.savedValues.resolve(role);
    logger.info(`[COMPOSITE] Begin "${resolvedType}" registration as "${resolvedRole}"`);
    // TODO: Registration API not yet available — UI-only flow
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// FDM (Financial Disbursement Module)
// ══════════════════════════════════════════════════════════════════════════════

const createdApprovedFDMHandler = async function (
  this: CustomWorld,
  applicationName: string,
  properties?: string
) {
  const resolvedApp = this.savedValues.resolve(applicationName);
  const resolvedProps = properties ? this.savedValues.resolve(properties) : '';
  logger.info(`[COMPOSITE] Created approved FDM on application "${resolvedApp}" props: "${resolvedProps}"`);
  // Selenium adds a 40s sleep here: the CreateFDM API needs the Application
  // record to be fully committed before it can be processed.
  await new Promise((resolve) => setTimeout(resolve, 40000));
  const api = new GrantorApiService(this.savedValues);
  await api.approveFDM(resolvedApp, resolvedProps || 'default');
  logger.info(`[COMPOSITE] FDM approved for application: ${resolvedApp}`);
};

Given(/^I created approved FDM on application "([^"]*)"$/, async function (this: CustomWorld, app: string) {
  await createdApprovedFDMHandler.call(this, app);
});

Given(/^I created approved FDM on application "([^"]*)" with properties "([^"]*)"$/, async function (this: CustomWorld, app: string, props: string) {
  await createdApprovedFDMHandler.call(this, app, props);
});

Given(/^I created approved FDM on application "([^"]*)" for Lump Sum Type$/, async function (this: CustomWorld, app: string) {
  await createdApprovedFDMHandler.call(this, app, 'Lump Sum');
});

// ══════════════════════════════════════════════════════════════════════════════
// AWARD
// ══════════════════════════════════════════════════════════════════════════════

Given(
  /^I created award from approved FDM with announcement "([^"]*)"$/,
  async function (this: CustomWorld, announcement: string) {
    const resolved = this.savedValues.resolve(announcement);
    logger.info(`[COMPOSITE] Created award from approved FDM with announcement "${resolved}"`);
    const api = new GrantorApiService(this.savedValues);
    await api.createAwardFromFDM(resolved);
    logger.info(`[COMPOSITE] Award created from FDM: ${resolved}`);
  }
);

Given(
  /^I created award from approved FDM with announcement "([^"]*)" and properties "([^"]*)"$/,
  async function (this: CustomWorld, announcement: string, properties: string) {
    const resolvedAnn = this.savedValues.resolve(announcement);
    const resolvedProps = this.savedValues.resolve(properties);
    logger.info(`[COMPOSITE] Created award from FDM: announcement "${resolvedAnn}", props "${resolvedProps}"`);
    const api = new GrantorApiService(this.savedValues);
    await api.createAwardFromFDM(resolvedAnn, resolvedProps);
    logger.info(`[COMPOSITE] Award created from FDM: ${resolvedAnn}`);
  }
);

Given(
  /^I activate award from FDM having application name "([^"]*)"$/,
  async function (this: CustomWorld, applicationName: string) {
    const resolved = this.savedValues.resolve(applicationName);
    logger.info(`[COMPOSITE] Activate award from FDM, application: "${resolved}"`);
    const api = new GrantorApiService(this.savedValues);
    await api.activateAwardFromFDM(resolved);
    logger.info(`[COMPOSITE] Award activated from FDM: ${resolved}`);
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// SUBAWARD
// ══════════════════════════════════════════════════════════════════════════════

const activatedStandaloneSubawardHandler = async function (
  this: CustomWorld,
  subawardName: string,
  properties: string,
  type?: string
) {
  const resolvedName = this.savedValues.resolve(subawardName);
  const resolvedProps = this.savedValues.resolve(properties);
  const resolvedType = type ? this.savedValues.resolve(type) : undefined;
  logger.info(
    `[COMPOSITE] Activated standalone subaward "${resolvedName}"` +
    (resolvedType ? ` of type "${resolvedType}"` : '') +
    ` with props: "${resolvedProps}"`
  );
  const api = new GrantorApiService(this.savedValues);
  await api.activateSubaward(resolvedName, resolvedProps, resolvedType);
  logger.info(`[COMPOSITE] Standalone subaward activated: ${resolvedName}`);
};

Given(/^I activated standalone subaward "([^"]*)" with properties "([^"]*)"$/, async function (this: CustomWorld, name: string, props: string) {
  await activatedStandaloneSubawardHandler.call(this, name, props);
});

Given(
  /^I activated standalone subaward from approved announcement with announcement "([^"]*)" and properties "([^"]*)"$/,
  async function (this: CustomWorld, announcement: string, properties: string) {
    const resolvedProps = this.savedValues.resolve(properties);
    logger.info(`[COMPOSITE] Activating standalone subaward from announcement "${announcement}", props "${resolvedProps}"`);
    const api = new GrantorApiService(this.savedValues);
    const uniqueName = await api.activateStandaloneSubaward(announcement, resolvedProps);
    logger.info(`[COMPOSITE] Standalone subaward activated: ${uniqueName}`);
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// STANDALONE GRANT
// ══════════════════════════════════════════════════════════════════════════════

Given(
  /^I created standalone grant from approved announcement with announcement "([^"]*)" and properties "([^"]*)"$/,
  async function (this: CustomWorld, announcement: string, properties: string) {
    const resolvedProps = this.savedValues.resolve(properties);
    logger.info(`[COMPOSITE] Creating standalone grant from announcement "${announcement}", props "${resolvedProps}"`);
    const api = new GrantorApiService(this.savedValues);
    const uniqueName = await api.createStandaloneGrant(announcement, resolvedProps);
    logger.info(`[COMPOSITE] Standalone grant created: ${uniqueName}`);
  }
);

// ── Initiated application review ─────────────────────────────────────────────

Given(
  /^I initiated an application review for application "([^"]*)" on announcement "([^"]*)" with properties "([^"]*)"$/,
  async function (this: CustomWorld, application: string, announcement: string, properties: string) {
    const resolvedApp = this.savedValues.resolve(application);
    const resolvedAnn = this.savedValues.resolve(announcement);
    const resolvedProps = this.savedValues.resolve(properties);
    logger.info(`[COMPOSITE] Initiated application review for "${resolvedApp}" on announcement "${resolvedAnn}", props "${resolvedProps}"`);
    // Wait for Salesforce to be ready (optimized from 20s hardcoded wait)
    await this.waitHelper.waitForSpinnerDisappear();
    const api = new GrantorApiService(this.savedValues);
    await api.initiateApplicationReview(resolvedApp, resolvedAnn, resolvedProps);
    logger.info(`[COMPOSITE] Application review initiated: ${resolvedApp}`);
  }
);

// ── Completed review step ────────────────────────────────────────────────────

Given(
  /^I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "([^"]*)"$/,
  async function (this: CustomWorld, application: string) {
    const resolved = this.savedValues.resolve(application);
    logger.info(`[COMPOSITE] Completed ProgramAndGrantFinanceReview for application "${resolved}"`);
    const api = new GrantorApiService(this.savedValues);
    await api.completeReviewStep('ProgramAndGrantFinanceReview', resolved);
    logger.info(`[COMPOSITE] ProgramAndGrantFinanceReview completed: ${resolved}`);
  }
);

Given(
  /^I Completed review step ProgramOfficeReview from Initiated Application Review Application "([^"]*)"$/,
  async function (this: CustomWorld, application: string) {
    const resolved = this.savedValues.resolve(application);
    logger.info(`[COMPOSITE] Completed ProgramOfficeReview for application "${resolved}"`);
    const api = new GrantorApiService(this.savedValues);
    await api.completeReviewStep('ProgramOfficeReview', resolved);
    logger.info(`[COMPOSITE] ProgramOfficeReview completed: ${resolved}`);
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// POST AWARD / RISK ASSESSMENT
// ══════════════════════════════════════════════════════════════════════════════

When(
  /^I create a post award record "([^"]*)" for the Award "([^"]*)" having object api name as "([^"]*)"$/,
  async function (this: CustomWorld, recordName: string, awardName: string, apiName: string) {
    const resolvedRecord = this.savedValues.resolve(recordName);
    const resolvedAward = this.savedValues.resolve(awardName);
    const resolvedApi = this.savedValues.resolve(apiName);
    logger.info(`[COMPOSITE] Create post award record "${resolvedRecord}" for award "${resolvedAward}", API: "${resolvedApi}"`);
    const api = new GrantorApiService(this.savedValues);
    await api.createPostAwardRecord(resolvedRecord, resolvedAward, resolvedApi);
    logger.info(`[COMPOSITE] Post award record created: ${resolvedRecord}`);
  }
);

When(
  /^I create a risk assessment record for organization "([^"]*)"$/,
  async function (this: CustomWorld, organization: string) {
    const resolved = this.savedValues.resolve(organization);
    logger.info(`[COMPOSITE] Create risk assessment for organization "${resolved}"`);
    const api = new GrantorApiService(this.savedValues);
    await api.createRiskAssessment(resolved);
    logger.info(`[COMPOSITE] Risk assessment created for: ${resolved}`);
  }
);

// ══════════════════════════════════════════════════════════════════════════════
// DATA / RECORD MANAGEMENT (API)
// ══════════════════════════════════════════════════════════════════════════════

const deleteRecordHandler = async function (this: CustomWorld, recordName: string, objectName: string) {
  const resolvedRecord = this.savedValues.resolve(recordName);
  const resolvedObject = this.savedValues.resolve(objectName);
  logger.info(`[COMPOSITE] Delete record "${resolvedRecord}" from object "${resolvedObject}"`);
  const api = new GrantorApiService(this.savedValues);
  await api.deleteRecord(resolvedRecord, resolvedObject);
  logger.info(`[COMPOSITE] Record deleted: ${resolvedRecord}`);
};

Given(/^I delete the record "([^"]*)" from the object "([^"]*)"$/, deleteRecordHandler);

// ══════════════════════════════════════════════════════════════════════════════
// ENCUMBRANCE
// ══════════════════════════════════════════════════════════════════════════════

When(
  /^I enter Revised Encumbrance for award "([^"]*)"$/,
  async function (this: CustomWorld, award: string) {
    const resolved = this.savedValues.resolve(award);
    logger.info(`[COMPOSITE] Enter revised encumbrance for award "${resolved}"`);

    const api = new GrantorApiService(this.savedValues);
    const awardBudget = await api.getFieldValueFromAPI(
      resolved, 'GrantAwardName__c', 'Award__c', 'AmountAvailable__c'
    );
    const requestedChange = await api.getFieldValueFromAPI(
      resolved, 'GrantAwardName__c', 'AmendmentRequest__c', 'RequestedChangeInBudget__c'
    );

    const awardBudgetNum = parseFloat(awardBudget || '0');
    const requestedChangeNum = parseFloat(requestedChange || '0');
    const revisedEncumbrance = requestedChangeNum >= 0
      ? awardBudgetNum + requestedChangeNum
      : awardBudgetNum - requestedChangeNum;

    logger.info(`Revised encumbrance calculated: ${revisedEncumbrance} (award=${awardBudgetNum}, change=${requestedChangeNum})`);

    const inputLocator = this.page.locator(
      `//c-fieldlwc[@data-fieldapiname='ActualEncumbrance__c']//input`
    ).first();
    await inputLocator.waitFor({ state: 'visible', timeout: 15000 });
    await inputLocator.clear();
    await inputLocator.fill(revisedEncumbrance.toString());
  }
);

// Schedule date matching steps are in assertion-steps.ts (unified start+end regex)
