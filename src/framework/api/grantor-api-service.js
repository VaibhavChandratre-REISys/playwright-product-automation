 function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }import axios, { } from 'axios';
import { getConfig } from '../config/config-loader';
import { getProperty } from '../config/properties-loader';

import { logger } from '../utils/logger';
import { mintSession } from '../auth/salesforce-jwt';
import { getProjectApiConfig } from './api-config-loader';
import { AnnouncementPublisher } from './announcement-publisher';

/**
 * Grantor Web Services — Salesforce Apex REST API Client.
 * Ported from POC's GrantorApiService.ts (640 lines, proven working).
 * Mirrors Selenium GrantorWebServices.java and ProjectWebServices.java.
 *
 * Handles:
 * - OAuth authentication (per-environment credentials)
 * - Record ID lookups via getRecordIds/v1
 * - Program activation via ProgramActivationAPI
 * - Announcement publishing via PublishAnnouncementCopy
 * - Standalone grant creation via GrantFromAnnouncement
 * - Standalone subaward activation via UpdateGrantAward
 */
export class GrantorApiService {
  
   __init() {this.accessToken = ''}
   __init2() {this.instanceUrl = ''}
  

  constructor(savedValues) {;GrantorApiService.prototype.__init.call(this);GrantorApiService.prototype.__init2.call(this);
    this.savedValues = savedValues;
    const appConfig = getConfig();
    this.instanceUrl = appConfig.GRANTOR_BASE_URL || '';
    this.client = axios.create({
      timeout: 60000,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    });
  }

  /**
   * Get the environment-specific properties file name.
   * Matches POC's Config.getEnvironmentPropertiesFile().
   */
   getEnvPropertiesFile() {
    const env = getConfig().ENV.toUpperCase();
    switch (env) {
      case 'AUTO': return 'AUTOEnvData';
      case 'QA': return 'QAEnvData';
      case 'NY': return 'ProLWCEnvData';
      case 'UAT': return 'UATRelatedTableID';
      default: return 'AUTOEnvData';
    }
  }

  /**
   * Authenticate with Salesforce via JWT Bearer flow.
   * Uses the same JWT mechanism as browser login (MFA-proof).
   * Falls back to password flow if JWT config is missing.
   */
  async authenticate() {
    const appConfig = getConfig();
    const apiUsername = appConfig.SF_API_USERNAME;

    if (!apiUsername) {
      throw new Error('SF_API_USERNAME missing in .env file.');
    }

    // Use JWT auth (same mechanism as browser login)
    if (appConfig.SF_CONSUMER_KEY && appConfig.SF_PRIVATE_KEY_PATH) {
      logger.info(`[API] Authenticating via JWT for ${apiUsername}`);
      const session = await mintSession(apiUsername, appConfig);
      this.accessToken = session.accessToken;
      this.instanceUrl = session.instanceUrl;
      logger.info(`[API] JWT auth successful — instance: ${this.instanceUrl}`);
      return;
    }

    // Fallback: password flow (may fail with MFA)
    const clientId = appConfig.SF_CLIENT_ID;
    const clientSecret = appConfig.SF_CLIENT_SECRET;
    const apiPassword = appConfig.SF_API_PASSWORD;

    if (!clientId || !clientSecret || !apiPassword) {
      throw new Error(
        'Salesforce API credentials missing in .env file. ' +
        'Required: SF_CONSUMER_KEY + SF_PRIVATE_KEY_PATH (JWT) or SF_CLIENT_ID + SF_CLIENT_SECRET + SF_API_PASSWORD (password)'
      );
    }

    const tokenBaseUrl = 'https://test.salesforce.com';
    const tokenUrl = `${tokenBaseUrl}/services/oauth2/token`;
    const params = new URLSearchParams();
    params.append('grant_type', 'password');
    params.append('client_id', clientId);
    params.append('client_secret', clientSecret);
    params.append('username', apiUsername);
    params.append('password', apiPassword);

    logger.info(`[API] Authenticating via password flow for ${apiUsername}`);
    logger.info(`[API] Token URL: ${tokenUrl}`);
    try {
      const response = await axios.post(tokenUrl, params, {
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      });

      this.accessToken = response.data.access_token;
      if (response.data.instance_url) {
        this.instanceUrl = response.data.instance_url;
      }
      logger.info('[API] Password flow auth successful');
    } catch (error) {
      logger.error(`Authentication failed: ${error.message}`);
      if (error.response) {
        logger.error(`Auth error status: ${error.response.status}`);
        logger.error(`Auth error data: ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

   authHeaders() {
    return { Authorization: `Bearer ${this.accessToken}` };
  }

  /**
   * Get record ID by object name and record name.
   * POST /services/apexrest/getRecordIds/v1
   */
  async getIdOf(objectName, recordName) {
    const url = `${this.instanceUrl}/services/apexrest/getRecordIds/v1`;
    const payload = { [objectName]: [recordName] };
    const response = await this.client.post(url, payload, { headers: this.authHeaders() });
    return response.data[recordName];
  }

  /**
   * Poll getIdOf() until the record is queryable (id found) or maxWaitMs elapses.
   * Used in place of blind fixed sleeps after fire-and-forget batch/creation APIs
   * that need a moment for Salesforce to process before the record can be queried.
   */
  async pollForId(objectName, recordName, maxWaitMs, intervalMs) {
    const startTime = Date.now();
    let id;
    while ((Date.now() - startTime) < maxWaitMs) {
      id = await this.getIdOf(objectName, recordName).catch(() => undefined);
      if (id) return id;
      await this.sleep(intervalMs);
    }
    // Final attempt after the loop in case the last sleep window was skipped
    id = await this.getIdOf(objectName, recordName).catch(() => undefined);
    if (!id) {
      throw new Error(`pollForId: "${recordName}" (${objectName}) not found after waiting ${maxWaitMs}ms`);
    }
    return id;
  }

  /**
   * Get record type ID.
   * POST /services/apexrest/getRecordTypeIds/v1
   */
  async getRecordTypeId(objectName, recordTypeName) {
    const url = `${this.instanceUrl}/services/apexrest/getRecordTypeIds/v1`;
    const payload = { [objectName]: recordTypeName };
    const response = await this.client.post(url, payload, { headers: this.authHeaders() });
    return response.data[objectName];
  }

  /**
   * Get multiple record IDs in one call.
   */
  async getMultipleIds(payload) {
    const url = `${this.instanceUrl}/services/apexrest/getRecordIds/v1`;
    const response = await this.client.post(url, payload, { headers: this.authHeaders() });
    return response.data;
  }

  /**
   * Get a field value from a Salesforce record by querying the custom REST API.
   * Mirrors Java GrantorProjectManager.getFieldValueFromAPI().
   * GET /services/apexrest/productAutomationGetFieldValue?objectType=X&fieldValue=Y&fieldName=Z&outputFieldName=W
   */
  async getFieldValueFromAPI(
    recordName,
    fieldName,
    objectType,
    outputFieldName
  ) {
    if (!this.accessToken) {
      await this.authenticate();
    }
    const url =
      `${this.instanceUrl}/services/apexrest/productAutomationGetFieldValue` +
      `?objectType=${encodeURIComponent(objectType)}` +
      `&fieldValue=${encodeURIComponent(recordName)}` +
      `&fieldName=${encodeURIComponent(fieldName)}` +
      `&outputFieldName=${encodeURIComponent(outputFieldName)}`;
    const response = await this.client.get(url, { headers: this.authHeaders() });
    return String(response.data).replace(/"/g, '');
  }

   getRandomNumber() {
    return Math.floor(Math.random() * 900000000) + 100000000;
  }

   dateWithOffset(offsetDays) {
    const date = new Date();
    date.setDate(date.getDate() + offsetDays);
    return date.toISOString().split('T')[0];
  }

  /**
   * Build default program activation payload.
   * Mirrors Selenium GrantorPayloads.defaultPayloadActivatedProgram().
   */
   async buildProgramPayload(programName) {
    const uniqueFundCode = Math.floor(1000 + Math.random() * 9000);

    const pmUserId = await this.getIdOf('User', 'Automation PM');
    const pmContactId = await this.getIdOf('Contact', 'Automation PM');
    const exeContactId = await this.getIdOf('Contact', 'Automation EXE');

    const projectConfig = getProjectApiConfig();

    return {
      Program: [{
        Objectives: 'Automation Test',
        ProgramName: programName,
        WebsiteAddress: 'www.govgrant.com',
        Fund_Code: uniqueFundCode,
        Law_Statutory_Authority: 'LWS',
        Regulation: '8 NYCRR Part 100',
        Comm_Reg: 'CR 100.5',
        Approp_Cit: 'approx',
        First_Payment: 12.60,
        ...projectConfig.programFields,
      }],
      RolesAndResponsibilities: [{
        NameId: pmUserId,
        ApprovedRole: 'Step1',
      }],
      KeyContact: [
        { ProjectRole: 'Program Contact', ProgramContactId: pmContactId, IsKeyContact: true },
        { ProjectRole: 'Fiscal Contact', FiscalContactId: exeContactId, IsKeyContact: true },
      ],
      Checklist: [
        { Description: 'Upload signed application form', AttachmentLocation: 'Application', Required: 'Optional' },
        { Description: 'Attach budget narrative', AttachmentLocation: 'Award', Required: 'Optional' },
        { Description: 'Include reimbursement receipts', AttachmentLocation: 'Reimbursement Request', Required: 'Optional' },
      ],
    };
  }

  /**
   * Activate an internal program via API.
   * POST /services/apexrest/ProgramActivationAPI
   * @returns The unique program name that was created
   */
  async activateProgram(programNameKey, filter = 'default') {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const uniqueName = programNameKey + this.getRandomNumber();
    this.savedValues.set(programNameKey, uniqueName);

    logger.info(`Activating internal program: ${uniqueName}`);

    const maxRetries = 10;
    let lastError = null;

    for (let attempt = 0; attempt < maxRetries; attempt++) {
      const payload = await this.buildProgramPayload(uniqueName);
      const url = `${this.instanceUrl}/services/apexrest/ProgramActivationAPI`;
      await this.sleep(5000);
      logger.info(`Program activation attempt ${attempt + 1}/${maxRetries} with Fund Code: ${payload.Program[0].Fund_Code}`);

      try {
        const response = await this.client.post(url, payload, { headers: this.authHeaders() });
        logger.info(`Program activation response status: ${response.status}`);
        logger.info(`Program activation response: ${JSON.stringify(response.data)}`);

        if (response.status < 200 || response.status >= 300) {
          throw new Error(`Program activation failed with status ${response.status}`);
        }

        // Extract program Salesforce ID from response
        const responseText = typeof response.data === 'string' ? response.data : JSON.stringify(response.data);
        const idMatch = responseText.match(/Id:\s*(\w+)/);
        if (idMatch && idMatch[1]) {
          this.savedValues.set('ProgramRecordId', idMatch[1]);
          logger.info(`Saved Program Record Id: ${idMatch[1]}`);
        }

        return uniqueName;
      } catch (error) {
        lastError = error;
        if (error.response && error.response.status === 500) {
          const errorBody = error.response.data;
          if (Array.isArray(errorBody) && _optionalChain([errorBody, 'access', _ => _[0], 'optionalAccess', _2 => _2.message, 'optionalAccess', _3 => _3.includes, 'call', _4 => _4('Fund Code')])) {
            logger.warn(`Fund Code collision detected, retrying...`);
            await this.sleep(2000);
            continue;
          }
        }
        if (error.response) {
          logger.error(`Program activation error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
        }
        throw error;
      }
    }

    throw lastError || new Error('Program activation failed after retries');
  }

  /**
   * Publish an announcement via API.
   * POST /services/apexrest/PublishAnnouncementCopy
   * @returns The unique announcement name that was created
   */
  async publishAnnouncement(annType, annNameKey, filter = 'default') {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const programName = 'Automation Permanent Internal Program';
    const uniqueAnnName = annNameKey + this.getRandomNumber();
    this.savedValues.set(annNameKey, uniqueAnnName);

    logger.info(`Publishing ${annType} announcement: ${uniqueAnnName} with filter: ${filter}`);

    // Use AnnouncementPublisher
    const publisher = new AnnouncementPublisher(
      this.getIdOf.bind(this),
      this.getRecordTypeId.bind(this),
      this.dateWithOffset.bind(this),
      this.getEnvPropertiesFile.bind(this)
    );

    const payload = await publisher.buildDefaultPayload(annType, uniqueAnnName, programName);
    await publisher.applyFilter(payload, filter);

    const url = `${this.instanceUrl}/services/apexrest/PublishAnnouncementCopy`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`Announcement publish response: ${response.status} — ${JSON.stringify(response.data)}`);

      if (response.status < 200 || response.status >= 300) {
        throw new Error(`Announcement publishing failed with status ${response.status}`);
      }

      // Fetch and save the announcement ID for use in subsequent API calls
      const announcementId = await this.getIdOf('Announcement__c', uniqueAnnName);
      this.savedValues.set(`${uniqueAnnName} ID`, announcementId);
      logger.info(`Saved announcement ID: ${announcementId} for ${uniqueAnnName}`);
    } catch (error) {
      if (error.response) {
        logger.error(`Announcement publish error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }

    return uniqueAnnName;
  }

  /**
   * Create standalone grant from approved announcement.
   * POST /services/apexrest/GrantFromAnnouncement
   */
  async createStandaloneGrant(announcementNameKey, filter = 'default') {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const announcementName = this.savedValues.resolve(announcementNameKey);
    const uniqueAwardName = 'Award' + this.getRandomNumber();
    this.savedValues.set('awardName', uniqueAwardName);

    logger.info(`Creating standalone grant: ${uniqueAwardName} from announcement: ${announcementName}`);

    const announcementId = await this.getIdOf('Announcement__c', announcementName);
    const envFile = this.getEnvPropertiesFile();
    const subrecipientOrgName = getProperty(envFile, 'SubrecipientOrg');
    this.savedValues.set('SubrecipientOrg', subrecipientOrgName);
    const subrecipientOrgId = await this.getIdOf('Account', subrecipientOrgName);
    const newFAName = getProperty(envFile, 'NewFundingAccountAbleToPayYes');
    if (newFAName) {
      this.savedValues.set('NewFundingAccountAbleToPayYes', newFAName);
    }

    const payload = {
      Grant: [{
        announcementId,
        accountId: subrecipientOrgId,
        internalOrganizationId: subrecipientOrgId,
        grantDescription: 'Test Direct Grant',
        ownerId: await this.getIdOf('User', 'Automation PO'),
        contractual: 'No',
      }],
    };

    const url = `${this.instanceUrl}/services/apexrest/GrantFromAnnouncement`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`Standalone grant response: ${response.status} — ${JSON.stringify(response.data)}`);

      if (response.status < 200 || response.status >= 300) {
        throw new Error(`Standalone grant creation failed with status ${response.status}`);
      }

      // Save all response fields (matches Selenium behavior)
      const responseData = typeof response.data === 'string' ? JSON.parse(response.data) : response.data;
      for (const key of Object.keys(responseData)) {
        if (key !== 'attributes' && responseData[key] != null) {
          this.savedValues.set(key, String(responseData[key]));
          logger.info(`Saved from grant response: ${key} = ${responseData[key]}`);
        }
      }
    } catch (error) {
      if (error.response) {
        logger.error(`Standalone grant error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }

    return uniqueAwardName;
  }

  /**
   * Activate standalone subaward from approved announcement.
   * POST /services/apexrest/UpdateGrantAward?AwardId=...
   */
  async activateStandaloneSubaward(announcementNameKey, filter = 'default') {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const announcementName = this.savedValues.resolve(announcementNameKey);
    logger.info(`Activating standalone subaward from announcement: ${announcementName} with filter: ${filter}`);

    const awardId = await this.getIdOf('Award__c', announcementName);
    logger.info(`Found Award__c ID: ${awardId}`);

    const payload = {
      Award: [{
        projectID: Math.floor(1000000000 + Math.random() * 9000000000),
        awardStatus: 'Activated',
        newObligation: 1000,
        totalCommitment: 1500,
        budgetPeriodEndDate: this.dateWithOffset(150),
        GATStartDate: this.dateWithOffset(50),
        GATEndDate: this.dateWithOffset(150),
        fs10DueDate: this.dateWithOffset(150),
        awardedBudget: 1000,
        actualEncumbrance: 1000,
        grantAwardDescription: 'Award Description',
      }],
      BudgetCategory: [{
        BudgetCategory: 'Professional Staff Salaries',
        AwardedBudget: 1000,
        OtherLeverageOptional: 100,
      }],
    };

    await this.applySubawardFilter(payload, filter);

    await this.sleep(5000);
    const url = `${this.instanceUrl}/services/apexrest/UpdateGrantAward?AwardId=${awardId}`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`Standalone subaward response: ${response.status} — ${JSON.stringify(response.data)}`);

      if (response.status < 200 || response.status >= 300) {
        throw new Error(`Standalone subaward activation failed with status ${response.status}`);
      }
    } catch (error) {
      if (error.response) {
        logger.error(`Standalone subaward error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }

    return announcementName;
  }

  // ══════════════════════════════════════════════════════════════════════════════
  // PHASE 1 — NEW API METHODS (ported from Java GrantorWebServices)
  // ══════════════════════════════════════════════════════════════════════════════

  /**
   * Approve FDM on an application.
   * POST /services/apexrest/CreateFDM/v2?AppId={appId}
   * Mirrors Java GrantorWebServices.approveDFM()
   */
  async approveFDM(applicationName, filter = 'default') {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const appId = await this.getIdOf('Application__c', applicationName);
    logger.info(`[API] Approving FDM for application "${applicationName}" (ID: ${appId}), filter: ${filter}`);

    // Fetch reviewer user IDs (Selenium: getIdsOfUsers(EXE, FO, PM))
    const userIds = await this.getMultipleIds({
      User: ['Automation EXE', 'Automation FO', 'Automation PM'],
    });

    // Payload mirrors Selenium defaultRequestPayroleForApprovedDFM() exactly.
    const payload = {
      ReviewSteps: [
        { Reviewer: userIds['Automation EXE'], FormName: 'Compliance Review', DueInDays: 7 },
        { Reviewer: userIds['Automation PM'], FormName: 'Program Review', DueInDays: 7 },
        { Reviewer: userIds['Automation FO'], FormName: 'Fiscal Review', DueInDays: 7 },
        { Reviewer: userIds['Automation FO'], FormName: 'Management Review', DueInDays: 7 },
        { Reviewer: userIds['Automation FO'], FormName: 'Pre-Screen', DueInDays: 7 },
      ],
      FDM: [{
        SubawardAbbreviation: 'AWD',
        RecommendedForAward: 'Yes',
        RecommendedAmount: 1000,
        TotalCommitmentAmount: 1000,
      }],
    };

    await this.applyFDMFilter(payload, filter);

    const url = `${this.instanceUrl}/services/apexrest/CreateFDM/v2?AppId=${appId}`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`[API] FDM approval response: ${response.status}`);
    } catch (error) {
      if (error.response) {
        logger.error(`FDM approval error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

  /**
   * Create award from approved FDM.
   * POST /services/apexrest/activateAwardFromFDM/v1.1
   * Mirrors Java GrantorWebServices.createAwardFromFDM()
   */
  async createAwardFromFDM(announcementName, properties = 'default') {
    if (!this.accessToken) {
      await this.authenticate();
    }

    logger.info(`[API] Creating award from FDM for announcement "${announcementName}", props: "${properties}"`);

    // Resolve all record IDs in one call (Selenium: getIdsForCreateAwardFromFDM)
    const ids = await this.getMultipleIds({
      ReviewStep__c: [announcementName],
      User: ['Automation PM'],
      ServiceArea__c: ['Automation Permanent Focus Area'],
      StrategicPlan__c: ['Automation Permanent Strategic Plan'],
      MasterKPI__c: ['Automation Permanent KPI'],
      Contact: ['Automation SPI3'],
    });

    const grantRecordTypeId = await this.getRecordTypeId('Grant__c', 'Grantor');
    const pmId = await this.getIdOf('User', 'Automation PM');
    const foId = await this.getIdOf('User', 'Automation FO');
    const exeId = await this.getIdOf('User', 'Automation EXE');

    // Payload mirrors Selenium defaultPayloadCreateAwardFromFDM() exactly.
    const payload = {
      Grant: [{
        FDM: ids[announcementName],
        RecordTypeId: grantRecordTypeId,
        OwnerId: ids['Automation PM'],
      }],
      Award: [{
        GrantAwardDescription: 'Award Created From Automation API',
        BudgetPeriodEndDate: this.dateWithOffset(150),
        BudgetRedirectionThreshhold: 10,
        PM: pmId,
        FO: foId,
        EXE: exeId,
      }],
      AwardFundingAccount: [{
        PreEncumbranceAmount: '1000',
      }],
      AwardServiceArea: [{
        ServiceArea: ids['Automation Permanent Focus Area'],
        GATStartDate: this.dateWithOffset(50),
        GATEndDate: this.dateWithOffset(150),
      }],
      KPIGoalsObjectives: [{
        StrategicPlan: ids['Automation Permanent Strategic Plan'],
      }],
      KeyOutcome: [{
        MasterKPI: ids['Automation Permanent KPI'],
        Target: '10',
      }],
      KeyContacts: [{
        ProjectRole: 'Project Director/Manager',
        Contact: ids['Automation SPI3'],
        IsKeyContact: true,
      }],
    };

    // Properties/user override (Selenium: updateAwardOwner) — when the
    // property text is like "Automation EXE user", set the grant record owner.
    if (properties && properties.toLowerCase().includes('user') && properties.includes('Automation')) {
      const user = properties.split(/user/i)[0].trim();
      const ownerId = await this.getIdOf('User', user);
      payload.Grant[0].OwnerId = ownerId;
      logger.info(`[API] Overriding award owner to "${user}" (ID: ${ownerId})`);
    }

    await this.sleep(5000);
    const url = `${this.instanceUrl}/services/apexrest/activateAwardFromFDM/v1.1`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`[API] Create award from FDM response: ${response.status}`);

      const responseData = typeof response.data === 'string' ? JSON.parse(response.data) : response.data;
      for (const key of Object.keys(responseData)) {
        if (key !== 'attributes' && responseData[key] != null) {
          this.savedValues.set(key, String(responseData[key]));
          logger.info(`Saved from award response: ${key} = ${responseData[key]}`);
        }
      }
    } catch (error) {
      if (error.response) {
        logger.error(`Create award from FDM error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

  /**
   * Activate award from FDM.
   * POST /services/apexrest/activateAwardFromFDM/v2?GrantId={grantId}
   * Mirrors Java GrantorWebServices.activateFMD()
   */
  async activateAwardFromFDM(applicationName) {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const grantId = await this.getIdOf('Grant__c', applicationName);
    logger.info(`[API] Activating award from FDM for application "${applicationName}" (Grant ID: ${grantId})`);

    const payload = {
      TermConditionSchedule: [
        {
          SubmissionTitle: 'Payment Request Schedule',
          CalReportingStartDate: this.dateWithOffset(50),
          CalReportingEndDate: this.dateWithOffset(150),
          Frequency: 'Bi-Monthly',
          ScheduleBase: 'Reporting Period',
          SubmissionType: 'Payment Request',
        },
        {
          SubmissionTitle: 'Progress Report Schedule',
          CalReportingStartDate: this.dateWithOffset(50),
          CalReportingEndDate: this.dateWithOffset(150),
          Frequency: 'Bi-Monthly',
          ScheduleBase: 'Reporting Period',
          SubmissionType: 'Progress Report',
        },
      ],
    };

    const url = `${this.instanceUrl}/services/apexrest/activateAwardFromFDM/v2?GrantId=${grantId}`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`[API] Activate award from FDM response: ${response.status}`);
    } catch (error) {
      if (error.response) {
        logger.error(`Activate award from FDM error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

  /**
   * Initiate application review on announcement.
   * POST /services/apexrest/CreateFDMCopy/v1
   * Mirrors Java GrantorWebServices.initateApplicationReviewOnAnnouncement()
   */
  async initiateApplicationReview(
    applicationTitle,
    announcementName,
    filter = 'default'
  ) {
    if (!this.accessToken) {
      await this.authenticate();
    }

    logger.info(`[API] Initiating application review "${applicationTitle}" on announcement "${announcementName}", filter: ${filter}`);

    // Pre-fetch all required IDs
    const ownerName = 'Automation SPI3';
    const contactName = 'Automation SPI3';
    const kpiName = 'Automation Permanent KPI';
    const kpiNamePlumbing = 'Automation Runtime KPI';

    // Get User and Contact IDs separately since they have the same name
    const announcementId = await this.getIdOf('Announcement__c', announcementName);
    const ownerId = await this.getIdOf('User', ownerName);
    const contactId = await this.getIdOf('Contact', contactName);
    const kpiId = await this.getIdOf('MasterKPI__c', kpiName);
    const kpiIdPlumbing = await this.getIdOf('MasterKPI__c', kpiNamePlumbing);
    const recordTypeId = await this.getRecordTypeId('Application__c', 'Grantor');

    const ids = {
      [announcementName]: announcementId,
      [`User:${ownerName}`]: ownerId,
      [`Contact:${contactName}`]: contactId,
      [kpiName]: kpiId,
      [kpiNamePlumbing]: kpiIdPlumbing,
    };

    logger.info(`[API] Retrieved IDs: ${JSON.stringify(ids, null, 2)}`);

    const payload = this.applicationReview(applicationTitle, announcementName, filter, ids, recordTypeId);

    logger.info(`[API] Application review payload: ${JSON.stringify(payload, null, 2)}`);

    const url = `${this.instanceUrl}/services/apexrest/CreateFDMCopy/v1`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`[API] Application review response: ${response.status}`);
      
      // Save the application title for use in subsequent steps
      // The application title is the same as the announcement name in the current implementation
      this.savedValues.set('applicationReview', applicationTitle);
      logger.info(`[API] Saved application title: ${applicationTitle}`);
    } catch (error) {
      if (error.response) {
        logger.error(`Application review error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

  /**
   * Build application review payload based on filter.
   * Mirrors Java GrantorWebServices.applicationReview()
   */
   applicationReview(
    applicationName,
    announcementName,
    filter,
    ids,
    recordTypeId
  ) {
    const defaultJson = this.defaultPayloadApplicationReview(applicationName, announcementName, ids, recordTypeId);

    let user = '';

    if (filter.toLowerCase().includes('user')) {
      user = filter.split('-')[1].split('user')[0].trim();
      this.updateAppOwnerAndContact(defaultJson, user, ids);
      filter = filter.split('-')[0];
    } else {
      filter = filter.toUpperCase();
    }

    switch (filter) {
      case 'APPLICATION':
        break;
      case 'BUDGETCATEGORY':
        break;
      case 'BUDGETCATEGORY_NO_FOCUSAREA':
        return this.updateBudgetCategoryNoFocusAreas(defaultJson);
      case 'SECOND_BUDGET_CATEGORY':
        return this.updateBudgetCategoryForTwoFocusAreas(defaultJson);
      case 'FIRST_BUDGET_CATEGORY':
        return this.updateBudgetCategoryForFirstFocusAreas(defaultJson);
      case 'FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA':
        return this.updateBudgetCategoryForFirstFocusAreasNoFocusArea(defaultJson);
      case 'TWO_BUD_CAT_FIFTEEN_HUNDRED_AMT':
        return this.updateBudgetCategoryForTwoFocusAreasFifteenHundredAmt(defaultJson);
      case 'SECOND_BUDGET_CAT_DETAILS_BUD_YES':
        return this.updateBudgetCategoryForTwoFocusAreasDetailsBudgetYes(defaultJson);
      case 'BUDGET_CAT_DETAILS_BUD_YES':
        return this.updateBudgetCategoryForOneFocusAreasDetailsBudgetYes(defaultJson);
      case 'KYECONTACTS':
        break;
      case 'KEYOUTCOME':
        break;
      case 'PLUMBING_CASE':
        return this.updatePlumbingCase(defaultJson, announcementName, applicationName, ids, recordTypeId);
      default:
        return defaultJson;
    }
    return defaultJson;
  }

  /**
   * Build default payload for application review.
   * Mirrors Java GrantorWebServices.defaultPayloadApplicationReview()
   */
   defaultPayloadApplicationReview(applicationName, announcementName, ids, recordTypeId) {
    const ownerName = 'Automation SPI3';
    const contactName = 'Automation SPI3';
    const kpiName = 'Automation Permanent KPI';

    const parent = {};

    const application = {
      Title: applicationName,
      AddressLine1: '3 Capitol Hill Blvd',
      City: 'Montana',
      County: 'RI',
      State: 'UT',
      ZipCode: '02908',
      ProjectAbstract: 'Test',
      Justification: 'this is Justification',
      Announcement: ids[announcementName],
      PreApplication: null,
      RecordTypeId: recordTypeId,
      OwnerId: ids[`User:${ownerName}`],
      ApproachMethodology: 'Approch methodology test',
      Capacity: 'Capacity test',
      Qualifications: 'Qualifications test',
    };
    parent.Application = [application];

    const budgetCategory = {
      BudgetCategory: 'Construction',
      BudgetRequest: 1000,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area',
    };
    parent.BudgetCategory = [budgetCategory];

    const keyContacts = {
      ProjectRole: 'Project Director/Manager',
      Contact: ids[`Contact:${contactName}`],
      IsKeyContact: true,
    };
    parent.KeyContact = [keyContacts];

    const keyOutcome = {
      MasterKPI: ids[kpiName],
      Target: '10',
    };
    parent.KeyOutcome = [keyOutcome];

    return parent;
  }

  /**
   * Update payload for plumbing case.
   * Mirrors Java GrantorWebServices.updatePlumbingCase()
   */
   updatePlumbingCase(defaultJson, announcementName, applicationName, ids, recordTypeId) {
    const ownerName = 'Automation SPI3';
    const contactName = 'Automation SPI3';
    const kpiName = 'Automation Runtime KPI';

    const parent = {};

    const application = {
      Title: applicationName,
      AddressLine1: '3 Capitol Hill Blvd',
      City: 'Montana',
      County: 'RI',
      State: 'UT',
      ZipCode: '02908',
      ProjectAbstract: 'Test',
      Justification: 'this is Justification',
      Announcement: ids[announcementName],
      PreApplication: null,
      RecordTypeId: recordTypeId,
      OwnerId: ids[`User:${ownerName}`],
      ApproachMethodology: 'Approch methodology test',
      Capacity: 'Capacity test',
      Qualifications: 'Qualifications test',
    };
    parent.Application = [application];

    const budgetCategory = {
      BudgetCategory: 'Construction',
      BudgetRequest: 2000,
      CashMatch: 200,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area',
    };
    parent.BudgetCategory = [budgetCategory];

    const keyContacts = {
      ProjectRole: 'Project Director/Manager',
      Contact: ids[`Contact:${contactName}`],
      IsKeyContact: true,
    };
    parent.KeyContact = [keyContacts];

    const keyOutcome = {
      MasterKPI: ids[kpiName],
      Target: '10',
    };
    parent.KeyOutcome = [keyOutcome];

    return parent;
  }

  /**
   * Update budget category for one focus area with details budget yes.
   * Mirrors Java GrantorWebServices.updateBudgetCategoryForOneFocusAreasDetailsBudgetYes()
   */
   updateBudgetCategoryForOneFocusAreasDetailsBudgetYes(defaultJson) {
    const budgetCategoryArray = [];
    const budgetCategory1 = {
      Title: 'Construction',
      Narrative: 'Construction',
      BudgetRequest: 1000,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area',
    };
    budgetCategoryArray.push(budgetCategory1);
    defaultJson.BuildUpItems = budgetCategoryArray;
    return defaultJson;
  }

  /**
   * Update budget category for two focus areas with details budget yes.
   * Mirrors Java GrantorWebServices.updateBudgetCategoryForTwoFocusAreasDetailsBudgetYes()
   */
   updateBudgetCategoryForTwoFocusAreasDetailsBudgetYes(defaultJson) {
    const budgetCategoryArray = [];

    const budgetCategory1 = {
      Title: 'Construction',
      Narrative: 'Construction',
      BudgetRequest: 500,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area',
    };
    budgetCategoryArray.push(budgetCategory1);

    const budgetCategory2 = {
      Title: 'Construction',
      Narrative: 'Construction',
      BudgetRequest: 500,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area2',
    };
    budgetCategoryArray.push(budgetCategory2);
    defaultJson.BuildUpItems = budgetCategoryArray;
    return defaultJson;
  }

  /**
   * Update budget category for first focus area no focus area.
   * Mirrors Java GrantorWebServices.updateBudgetCategoryForFirstFocusAreasNoFocusArea()
   */
   updateBudgetCategoryForFirstFocusAreasNoFocusArea(defaultJson) {
    const budgetCategoryArray = [];

    const budgetCategory1 = {
      BudgetCategory: 'Construction',
      BudgetRequest: 1000,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Standard Focus Area',
    };
    budgetCategoryArray.push(budgetCategory1);
    defaultJson.BudgetCategory = budgetCategoryArray;
    return defaultJson;
  }

  /**
   * Update budget category for two focus areas with fifteen hundred amount.
   * Mirrors Java GrantorWebServices.updateBudgetCategoryForTwoFocusAreasFifteenHundredAmt()
   */
   updateBudgetCategoryForTwoFocusAreasFifteenHundredAmt(json) {
    const budgetCategoryArray = [];

    const budgetCategory1 = {
      BudgetCategory: 'Construction',
      BudgetRequest: 1500,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area',
    };
    budgetCategoryArray.push(budgetCategory1);

    const budgetCategory2 = {
      BudgetCategory: 'Construction',
      BudgetRequest: 1500,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area2',
    };
    budgetCategoryArray.push(budgetCategory2);
    json.BudgetCategory = budgetCategoryArray;
    return json;
  }

  /**
   * Update budget category no focus areas.
   * Mirrors Java GrantorWebServices.updateBudgetCategorNoFocusAreas()
   */
   updateBudgetCategoryNoFocusAreas(json) {
    const budgetCategoryArray = [];

    const budgetCategory1 = {
      BudgetCategory: 'Construction',
      BudgetRequest: 1000,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Standard Focus Area',
    };
    budgetCategoryArray.push(budgetCategory1);
    json.BudgetCategory = budgetCategoryArray;
    return json;
  }

  /**
   * Update budget category for first focus areas.
   * Mirrors Java GrantorWebServices.updateBudgetCategoryForFirstFocusAreas()
   */
   updateBudgetCategoryForFirstFocusAreas(defaultJson) {
    const budgetCategoryArray = [];

    const budgetCategory1 = {
      BudgetCategory: 'Construction',
      BudgetRequest: 500,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area',
    };
    budgetCategoryArray.push(budgetCategory1);
    defaultJson.BudgetCategory = budgetCategoryArray;
    return defaultJson;
  }

  /**
   * Update budget category for two focus areas.
   * Mirrors Java GrantorWebServices.updateBudgetCategoryForTwoFocusAreas()
   */
   updateBudgetCategoryForTwoFocusAreas(json) {
    const budgetCategoryArray = [];

    const budgetCategory1 = {
      BudgetCategory: 'Construction',
      BudgetRequest: 500,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area',
    };
    budgetCategoryArray.push(budgetCategory1);

    const budgetCategory2 = {
      BudgetCategory: 'Construction',
      BudgetRequest: 500,
      CashMatch: 100,
      NonCashMatch: null,
      OtherLeverageOptional: null,
      ServiceAreaTitle: 'Automation Permanent Focus Area2',
    };
    budgetCategoryArray.push(budgetCategory2);
    json.BudgetCategory = budgetCategoryArray;
    return json;
  }

  /**
   * Update app owner and contact.
   * Mirrors Java GrantorWebServices.updateAppOwnerAndContact()
   */
   updateAppOwnerAndContact(json, user, ids) {
    const jsonObject = json.Application[0];
    jsonObject.OwnerId = ids[`User:${user}`];
    json.Application = [jsonObject];

    const jsonObject1 = json.KeyContact[0];
    jsonObject1.Contact = ids[`Contact:${user}`];
    json.KeyContact = [jsonObject1];
  }

  /**
   * Complete a review step (ProgramOfficeReview or ProgramAndGrantFinanceReview).
   * POST /services/apexrest/ProgramFiscalReview/v1?AppId={appId}
   * Mirrors Java GrantorWebServices.completeReviewStep()
   */
  async completeReviewStep(module, applicationName) {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const appId = await this.getIdOf('Application__c', applicationName);
    logger.info(`[API] Completing review step "${module}" for application "${applicationName}" (ID: ${appId})`);

    const userIds = await this.getMultipleIds({
      User: [
        'Automation EXE', 'Automation EXE1', 'Automation FO', 'Automation FO1',
        'Automation PO', 'Automation PO1', 'Automation PM', 'Automation PM1',
        'Automation FD', 'Automation FD1',
      ],
    });

    let payload;

    if (module.toLowerCase() === 'programofficereview') {
      payload = {
        ReviewSteps: [{
          Reviewer: userIds['Automation FD'],
          FormName: ['Group 1', 'Group 2'],
          DueInDays: 7,
        }],
      };
    } else {
      payload = {
        ReviewSteps: [
          {
            Reviewer: userIds['Automation FD'],
            FormName: ['Group 1', 'Group 2'],
            DueInDays: 7,
          },
          {
            Reviewer: userIds['Automation PM'],
            FormName: ['Grant Finance Review Form'],
            DueInDays: 7,
          },
        ],
      };
    }

    await this.sleep(5000);
    const url = `${this.instanceUrl}/services/apexrest/ProgramFiscalReview/v1?AppId=${appId}`;
    try {
      const response = await this.client.post(url, payload, { headers: this.authHeaders() });
      logger.info(`[API] Complete review step response: ${response.status}`);
    } catch (error) {
      if (error.response) {
        logger.error(`Complete review step error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

  /**
   * Create a post-award record via batch job API.
   * GET /services/apexrest/productAutomationRunBatchJob → poll status → GET field value
   * Mirrors Java GrantorWebServices.automationBatchExecuteApi()
   */
  async createPostAwardRecord(objectType, recordName, objectApiName) {
    if (!this.accessToken) {
      await this.authenticate();
    }

    logger.info(`[API] Creating post-award record: type="${objectType}", record="${recordName}", api="${objectApiName}"`);

    const runUrl = `${this.instanceUrl}/services/apexrest/productAutomationRunBatchJob?type=${encodeURIComponent(objectType)}&recordName=${encodeURIComponent(recordName)}`;
    const runResponse = await this.client.get(runUrl, { headers: this.authHeaders() });
    const jobId = String(runResponse.data).replace(/"/g, '');
    logger.info(`[API] Batch job started: ${jobId}`);

    // Give the job a brief moment to register before the first status check (polling
    // too early can 404/throw before the batch job record exists), then poll frequently
    // so we exit as soon as it completes instead of always burning a fixed 20s upfront.
    await this.sleep(5000);

    const statusUrl = `${this.instanceUrl}/services/apexrest/productAutomationGetBatchJobStatus?batchId=${jobId}`;
    const maxWait = 120;
    const startTime = Date.now();
    let status = '';

    while ((Date.now() - startTime) / 1000 < maxWait) {
      const statusResponse = await this.client.get(statusUrl, { headers: this.authHeaders() });
      status = String(statusResponse.data).replace(/"/g, '');
      logger.info(`[API] Batch job status: ${status}`);

      if (status.toLowerCase() === 'completed' || status.toLowerCase() === 'aborted') {
        break;
      }
      await this.sleep(3000);
    }

    if (status.toLowerCase() === 'completed' && objectApiName.toLowerCase() !== 'closeout') {
      const fieldUrl = `${this.instanceUrl}/services/apexrest/productAutomationGetFieldValue?objectType=${encodeURIComponent(objectApiName)}&fieldValue=${encodeURIComponent(recordName)}&fieldName=Title__c`;
      const fieldResponse = await this.client.get(fieldUrl, { headers: this.authHeaders() });
      const recordId = String(fieldResponse.data).replace(/"/g, '');
      logger.info(`[API] Post-award record ID: ${recordId}`);
      this.savedValues.set('Record Id', recordId);
      return recordId;
    }

    logger.info(`[API] Batch job finished with status: ${status}`);
    return status;
  }

  /**
   * Create risk assessment for an organization.
   * GET /services/apexrest/productAutomationRiskAssessmentApi?recordName={org}
   * Mirrors Java GrantorWebServices.riskAssessmentApi()
   */
  async createRiskAssessment(organizationName) {
    if (!this.accessToken) {
      await this.authenticate();
    }

    logger.info(`[API] Creating risk assessment for organization "${organizationName}"`);
    const url = `${this.instanceUrl}/services/apexrest/productAutomationRiskAssessmentApi?recordName=${encodeURIComponent(organizationName)}`;
    const response = await this.client.get(url, { headers: this.authHeaders() });
    logger.info(`[API] Risk assessment response: ${response.status} — ${JSON.stringify(response.data)}`);
  }

  /**
   * Delete a record via the deletion API.
   * DELETE /services/apexrest/productAutomationDeletionApi?objectType={type}&recordName={name}
   * Mirrors Java ProjectWebServices.deletionApi()
   */
  async deleteRecord(recordName, objectType) {
    if (!this.accessToken) {
      await this.authenticate();
    }

    const url = `${this.instanceUrl}/services/apexrest/productAutomationDeletionApi?objectType=${encodeURIComponent(objectType)}&recordName=${encodeURIComponent(recordName)}`;
    try {
      const response = await this.client.delete(url, { headers: this.authHeaders() });
      logger.info(`[API] Deleted ${objectType}: ${recordName}`);
    } catch (error) {
      if (error.response) {
        logger.error(`[API] Deletion failed for ${objectType} "${recordName}": ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

  /**
   * Cleanup test data created during a scenario.
   * Mirrors Java GrantorWebServices.deleteRecordInHooks().
   * Scans savedValues for keys starting with "AUTOMATION RUNTIME" and
   * deletes corresponding records via the deletion API.
   */
  async cleanupTestData() {
    if (!this.accessToken) {
      try { 
        await this.authenticate(); 
      } catch (e) { 
        logger.warn(`[CLEANUP] Authentication failed: ${e.message}`);
        return; 
      }
    }

    const runtimeKeys = this.savedValues.getAllKeysStartingWith('AUTOMATION RUNTIME');
    
    if (runtimeKeys.length === 0) {
      return;
    }
    
    logger.info(`[CLEANUP] Cleaning up ${runtimeKeys.length} runtime record(s)`);

    const safeDelete = async (recordName, objectType) => {
      try {
        await this.deleteRecord(recordName, objectType);
      } catch (e) {
        logger.warn(`[CLEANUP] Failed to delete "${recordName}" (${objectType}): ${e.message}`);
      }
    };

    const keyLower = (k) => k.toLowerCase();
    // Get the actual saved value, not resolve it as a token
    const valueOf = (k) => {
      try {
        return this.savedValues.get(k);
      } catch (e2) {
        // If key not found, try resolving as token (fallback for old behavior)
        return this.savedValues.resolve(`{${k}}`);
      }
    };

    // Phase 1: Simple record types
    for (const key of runtimeKeys) {
      const kl = keyLower(key);
      const val = valueOf(key);
      if (kl.includes('focus area')) await safeDelete(val, 'Focus Area');
      if (kl.includes('funding source')) await safeDelete(val, 'Funding Source');
      if (kl.includes('kpi')) await safeDelete(val, 'KPI');
      if (kl.includes('package')) await safeDelete(val, 'Package');
      if (kl.includes('strategic plan')) await safeDelete(val, 'Strategic Plan');
      if (kl.includes('site visit')) await safeDelete(val, 'Site Visit');
      if (kl.includes('desk')) await safeDelete(val, 'Desk Review');
      if (kl.includes('amendment')) await safeDelete(val, 'Amendment Request');
      if (kl.includes('payment')) await safeDelete(val, 'Payment Request');
      if (kl.includes('risk')) await safeDelete(val, 'ORGANIZATION RISKASSESSMENT');
      if (kl.includes('contact')) {
        await safeDelete(val, 'Contact');
        await safeDelete(val, 'DUNS');
      }
      if (kl.includes('organization')) await safeDelete(val, 'USER REGISTRATION');
    }

    // Phase 2: Closeout (also deletes Payment Request)
    for (const key of runtimeKeys) {
      if (keyLower(key).includes('closeout')) {
        const val = valueOf(key);
        await safeDelete(val, 'Closeout');
        await safeDelete(val, 'Payment Request');
      }
    }

    // Phase 3: Application (child records first)
    for (const key of runtimeKeys) {
      if (keyLower(key).includes('application')) {
        const val = valueOf(key);
        await safeDelete(val, 'APPLICATION REVIEWS');
        await safeDelete(val, 'PreApplication');
        await safeDelete(val, 'Application');
      }
    }

    // Phase 4: Awards (child → parent order)
    for (const key of runtimeKeys) {
      if (keyLower(key).includes('award')) {
        const val = valueOf(key);
        await safeDelete(val, 'Progress Report');
        await safeDelete(val, 'Amendment Request');
        await safeDelete(val, 'Award');
        await safeDelete(val, 'Grant');
      }
    }

    // Phase 5: Announcements
    for (const key of runtimeKeys) {
      if (keyLower(key).includes('announcement')) {
        const val = valueOf(key);
        await safeDelete(val, 'Amendment Request');
        await safeDelete(val, 'Payment Request');
        await safeDelete(val, 'Award');
        await safeDelete(val, 'Grant');
        await safeDelete(val, 'APPLICATION REVIEWS');
        await safeDelete(val, 'Application');
        await safeDelete(val, 'Announcement');
      }
    }

    // Phase 6: Programs (parent — deleted last)
    for (const key of runtimeKeys) {
      if (keyLower(key).includes('program')) {
        await safeDelete(valueOf(key), 'Program');
      }
    }

    logger.info('[CLEANUP] Test data cleanup complete');
  }

  /**
   * Build the default UpdateGrantAward payload.
   * Mirrors Java GrantorPayloads.defaultPayloadUpdateGrantAward()
   */
   buildUpdateGrantAwardPayload() {
    const uniqueProjectId = Math.floor(1000000000 + Math.random() * 9000000000);
    return {
      Award: [{
        projectID: uniqueProjectId,
        awardStatus: 'Activated',
        newObligation: 1000,
        totalCommitment: 1500,
        budgetPeriodEndDate: this.dateWithOffset(150),
        GATStartDate: this.dateWithOffset(50),
        GATEndDate: this.dateWithOffset(150),
        fs10DueDate: this.dateWithOffset(150),
        awardedBudget: 1000,
        actualEncumbrance: 1000,
        grantAwardDescription: 'Award Description',
      }],
      BudgetCategory: [{
        BudgetCategory: 'Professional Staff Salaries',
        AwardedBudget: 1000,
        OtherLeverageOptional: 100,
      }],
    };
  }

  /**
   * Apply FDM-specific filter overrides.
   */
   async applyFDMFilter(payload, filter) {
    const normalizedFilter = filter.toUpperCase();
    switch (normalizedFilter) {
      case 'FDM_GRANT_CONTRACTUAL_YES':
        payload.FDM[0].Contractual = 'Yes';
        break;
      case 'LUMP SUM':
      case 'LUMPSUM':
      case 'DEFAULT':
        break;
      default:
        if (normalizedFilter !== 'DEFAULT' && filter !== '') {
          logger.warn(`Unknown FDM filter: ${filter} — using default payload`);
        }
        break;
    }
  }

  /**
   * Apply application review filter overrides.
   * Mirrors Java GrantorPayloads.applicationReview() switch cases.
   */
   async applyApplicationReviewFilter(payload, filter) {
    const normalizedFilter = filter.toUpperCase();
    switch (normalizedFilter) {
      case 'LUMPSUM_BUDGETCATEGORY':
        payload.BudgetCategory = [{
          BudgetCategory: 'Lump Sum',
          BudgetRequest: 1000,
          ServiceAreaTitle: payload.Application[0].Title,
        }];
        break;
      case 'CHILDORGANIZATION_CREATEAPPLICATIONMODAL': {
        const childOrgId = await this.getIdOf('Account', 'Automation Permanent Child Organization1');
        payload.Application[0].CreatingFor = 'On behalf of';
        payload.Application[0].ChildOrganization = childOrgId;
        break;
      }
      case 'FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY':
        payload.BudgetCategory = [{
          BudgetCategory: 'Professional Staff Salaries',
          BudgetRequest: 1000,
          ServiceAreaTitle: payload.Application[0].Title,
        }];
        break;
      case 'FIRST_BUDGET_CATEGORY':
        payload.BudgetCategory = [
          { BudgetCategory: 'Construction', BudgetRequest: 1000, OtherLeverageOptional: null, ServiceAreaTitle: 'Standard Focus Area' },
          payload.BudgetCategory[0],
        ];
        break;
      case 'FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA':
        payload.BudgetCategory = [{
          BudgetCategory: 'Construction',
          BudgetRequest: 1000,
          OtherLeverageOptional: null,
          ServiceAreaTitle: 'Standard Focus Area',
        }];
        break;
      case 'DEFAULT':
        break;
      default:
        if (filter.toLowerCase().includes('user')) {
          const user = filter.split('-')[1].split('user')[0].trim();
          const userId = await this.getIdOf('User', user);
          payload.Application[0].OwnerId = userId;
        } else {
          logger.warn(`Unknown application review filter: ${filter} — using default payload`);
        }
        break;
    }
  }

  /**
   * Apply filter-specific overrides to the subaward payload.
   * Mirrors Selenium GrantorPayloads.actiavteDirectGrantPayload() switch/case
   * and payloadForCreateStandaloneAward() switch/case.
   */
   async applySubawardFilter(payload, filter) {
    const envFile = this.getEnvPropertiesFile();
    const normalizedFilter = filter.toUpperCase();

    // Handle user-based filter
    if (filter.toLowerCase().includes('user')) {
      const user = filter.replace(/user/gi, '').replace(/-/g, '').trim();
      if (user && _optionalChain([payload, 'access', _5 => _5.Award, 'optionalAccess', _6 => _6[0]])) {
        payload.Award[0].OwnerId = await this.getIdOf('User', user);
      }
      return;
    }

    switch (normalizedFilter) {
      // ── Activate Direct Grant (subaward) payload filters ────────────────
      case 'PROJECTSTOP_NULL':
      case 'CONTRACTSTOP_NULL':
        if (_optionalChain([payload, 'access', _7 => _7.Award, 'optionalAccess', _8 => _8[0]])) payload.Award[0].projectStop = null;
        break;
      case 'PROJECTSTOP_PRESENT':
      case 'CONTRACTSTOP_PRESENT':
        if (_optionalChain([payload, 'access', _9 => _9.Award, 'optionalAccess', _10 => _10[0]])) payload.Award[0].projectStop = this.dateWithOffset(150);
        break;
      case 'CONTRACTUAL_YES':
        if (_optionalChain([payload, 'access', _11 => _11.Award, 'optionalAccess', _12 => _12[0]])) payload.Award[0].contractual = 'Yes';
        break;

      // ── Standalone Grant Award filters ──────────────────────────────────
      case 'NO_RISK_ASSESSMENT':
        if (_optionalChain([payload, 'access', _13 => _13.Grant, 'optionalAccess', _14 => _14[0]])) payload.Grant[0].RiskAssessment_Required = 'No';
        break;
      case 'YES_RISK_ASSESSMENT':
        if (_optionalChain([payload, 'access', _15 => _15.Grant, 'optionalAccess', _16 => _16[0]])) payload.Grant[0].RiskAssessment_Required = 'Yes';
        break;
      case 'NO_ADVANCE_PERMISSION':
        if (_optionalChain([payload, 'access', _17 => _17.Grant, 'optionalAccess', _18 => _18[0]])) payload.Grant[0].IsAdvancePermitted = 'No';
        break;
      case 'IS_BUILDUP_FUNCTIONALITY_YES':
        if (_optionalChain([payload, 'access', _19 => _19.Grant, 'optionalAccess', _20 => _20[0]])) payload.Grant[0].IsBuildUpFunctionality = 'Yes';
        break;
      case 'NO_PROGRAM_INCOME_ANTICIPATE':
        if (_optionalChain([payload, 'access', _21 => _21.Grant, 'optionalAccess', _22 => _22[0]])) payload.Grant[0].IsProgramIncomeAnticipated = 'No';
        break;
      case 'NO_BUDGETREDIRECTIONTHRESHHOLD':
        if (_optionalChain([payload, 'access', _23 => _23.Grant, 'optionalAccess', _24 => _24[0]])) payload.Grant[0].BudgetRedirectionThreshold = null;
        break;
      case 'AMENDMENT_REQUEST':
        if (_optionalChain([payload, 'access', _25 => _25.Grant, 'optionalAccess', _26 => _26[0]])) payload.Grant[0].AmendmentRequest = 'Yes';
        break;
      case 'AMENDMENT_REQUEST_BUILDUP_MATCH_YES':
        if (_optionalChain([payload, 'access', _27 => _27.Grant, 'optionalAccess', _28 => _28[0]])) {
          payload.Grant[0].AmendmentRequest = 'Yes';
          payload.Grant[0].IsBuildUpFunctionality = 'Yes';
          payload.Grant[0].IsMatchRequired = 'Yes';
        }
        break;
      case 'AMENDMENT_REQUEST_RISK_ASSESMENT_YES':
        if (_optionalChain([payload, 'access', _29 => _29.Grant, 'optionalAccess', _30 => _30[0]])) {
          payload.Grant[0].AmendmentRequest = 'Yes';
          payload.Grant[0].RiskAssessment_Required = 'No';
        }
        break;
      case 'PROGRESS_REPORT_NOT_APPLICABLE':
        if (payload.TermConditionSchedule) {
          payload.TermConditionSchedule = payload.TermConditionSchedule.filter(
            (tc) => tc.SubmissionType !== 'Progress Report'
          );
        }
        break;
      case 'PROGRESS_REPORT_MONTHLY':
      case 'PROGRESS_REPORT_QUARTERLY':
      case 'PROGRESS_REPORT_SEMI_ANNUALLY': {
        const freqMap = {
          PROGRESS_REPORT_MONTHLY: 'Monthly',
          PROGRESS_REPORT_QUARTERLY: 'Quarterly',
          PROGRESS_REPORT_SEMI_ANNUALLY: 'Semi-Annually',
        };
        if (payload.TermConditionSchedule) {
          for (const tc of payload.TermConditionSchedule) {
            if (tc.SubmissionType === 'Progress Report') {
              tc.Frequency = freqMap[normalizedFilter];
            }
          }
        }
        break;
      }
      case 'NO_OBJECTIVE':
        if (_optionalChain([payload, 'access', _31 => _31.Grant, 'optionalAccess', _32 => _32[0]])) payload.Grant[0].IsGoalsRequired = 'No';
        break;
      case 'ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO':
        if (_optionalChain([payload, 'access', _33 => _33.Grant, 'optionalAccess', _34 => _34[0]])) {
          payload.Grant[0].FocusAreaRequired = 'No';
          payload.Grant[0].IsAdvancePermitted = 'Yes';
        }
        payload.BuildUpItems = [{
          BudgetCategory: 'Construction', Title: 'Construction', Narrative: 'Test Build-up',
          AwardedBudget: 1000, CashMatch: 100, NonCashMatch: 100, OtherLeverageOptional: null,
          ServiceAreaName: 'Standard Focus Area',
        }];
        break;
      case 'ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO_BUILDUP_YES_PROJECT_END_DATE':
        if (_optionalChain([payload, 'access', _35 => _35.Grant, 'optionalAccess', _36 => _36[0]])) {
          payload.Grant[0].IsAdvancePermitted = 'Yes';
          payload.Grant[0].FocusAreaRequired = 'No';
          payload.Grant[0].IsBuildUpFunctionality = 'Yes';
          payload.Grant[0].ProjectPeriodEndDate = this.dateWithOffset(365);
        }
        break;
      case 'ADVANCE_YES_FOCUS_NO_PROGRAM_ANTICIPATED_NO':
        if (_optionalChain([payload, 'access', _37 => _37.Grant, 'optionalAccess', _38 => _38[0]])) {
          payload.Grant[0].IsAdvancePermitted = 'Yes';
          payload.Grant[0].FocusAreaRequired = 'No';
          payload.Grant[0].IsProgramIncomeAnticipated = 'No';
        }
        break;
      case 'ADVANCE_PERMIS_YES_FOCUS_AREA_NO_BUILDUP_YES':
        if (_optionalChain([payload, 'access', _39 => _39.Grant, 'optionalAccess', _40 => _40[0]])) {
          payload.Grant[0].IsAdvancePermitted = 'Yes';
          payload.Grant[0].FocusAreaRequired = 'No';
          payload.Grant[0].IsBuildUpFunctionality = 'Yes';
        }
        payload.BuildUpItems = [{
          BudgetCategory: 'Construction', Title: 'Construction', Narrative: 'Test Build-up',
          AwardedBudget: 1000, OtherLeverageOptional: null, ServiceAreaName: 'Standard Focus Area',
        }];
        break;
      case 'SUBRECIPIENT_ORG_IND_USER':
      case 'ADVANCE_PERMIS_YES_FOCUS_AREA_NO_SUB_ORG_IND': {
        if (_optionalChain([payload, 'access', _41 => _41.Grant, 'optionalAccess', _42 => _42[0]])) {
          payload.Grant[0].InternalOrganization = await this.getIdOf('Account', 'Automation IND');
          if (normalizedFilter.includes('ADVANCE')) {
            payload.Grant[0].IsAdvancePermitted = 'Yes';
            payload.Grant[0].FocusAreaRequired = 'No';
          }
        }
        break;
      }
      case 'SUBRECIPIENT_ORG_SPI_USER': {
        if (_optionalChain([payload, 'access', _43 => _43.Grant, 'optionalAccess', _44 => _44[0]])) {
          payload.Grant[0].InternalOrganization = await this.getIdOf('Account', 'SAN DIEGO ELECTRICAL TRAINING TRUST');
        }
        break;
      }
      case 'AWARD_NO_SUPPORTINGDOC_PROGRAM':
        if (_optionalChain([payload, 'access', _45 => _45.Grant, 'optionalAccess', _46 => _46[0]])) {
          payload.Grant[0].Program = await this.getIdOf('Program__c', 'Automation Permanent No Supporting Doc Program');
        }
        break;
      case 'SECOND_FUNDING_ACCOUNT': {
        const fa1 = await this.getIdOf('FundingAccount__c', getProperty(envFile, 'fundingAccount'));
        const fa2 = await this.getIdOf('FundingAccount__c', getProperty(envFile, 'fundingAccount2'));
        payload.AwardFundingAccount = [
          { FundingAccount: fa1, PreEncumbranceAmount: '10000' },
          { FundingAccount: fa2, PreEncumbranceAmount: '10000' },
        ];
        break;
      }
      case 'SECOND_FOCUS_AREA':
      case 'SECOND_FOCUS_AREA_BUDGET_CATEGORY': {
        const fa2 = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const fa1 = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area');
        payload.AwardServiceArea = [
          { ServiceArea: fa1, GATStartDate: this.dateWithOffset(0), GATEndDate: this.dateWithOffset(3650) },
          { ServiceArea: fa2, GATStartDate: this.dateWithOffset(0), GATEndDate: this.dateWithOffset(3650) },
        ];
        if (normalizedFilter === 'SECOND_FOCUS_AREA_BUDGET_CATEGORY') {
          payload.BudgetCategory = [
            { BudgetCategory: 'Professional Staff Salaries', AwardedBudget: 500, OtherLeverageOptional: 100 },
            { BudgetCategory: 'Construction', AwardedBudget: 500, OtherLeverageOptional: 100 },
          ];
        }
        break;
      }
      case 'DEFAULT':
        break;
      default:
        logger.warn(`Unknown subaward filter: ${filter} — using default payload`);
        break;
    }
  }

   sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  /**
   * Activate standalone subaward (create award from scratch).
   * Mirrors Java GrantorWebServices.activateSubaward() and activateSubawardGetCall().
   * Step 1: POST /services/apexrest/activateAwardFromGrantCopy/v1
   * Step 2: GET /services/apexrest/activateAwardFromGrant/v2?AwardId={awardId}
   */
  async activateSubaward(grantName, filter, type = 'Competitive') {
    if (!this.accessToken) {
      await this.authenticate();
    }

    logger.info(`[API] Creating standalone subaward: ${grantName}, filter: ${filter}, type: ${type}`);

    // Build the default payload
    const payload = await this.buildDefaultStandaloneAwardPayload(grantName, type);

    // Apply filter-specific modifications
    await this.applySubawardFilter(payload, filter);

    // Step 1: Create the award
    const createUrl = `${this.instanceUrl}/services/apexrest/activateAwardFromGrantCopy/v1`;
    try {
      const createResponse = await this.client.post(createUrl, payload, { headers: this.authHeaders() });
      logger.info(`[API] Award creation response: ${createResponse.status} — ${JSON.stringify(createResponse.data)}`);

      if (createResponse.status < 200 || createResponse.status >= 300) {
        throw new Error(`Award creation failed with status ${createResponse.status}`);
      }

      // Poll for the newly-created award to become queryable instead of blindly
      // sleeping 60s. Exits as soon as the ID is found, falling back to the same
      // 60s ceiling as a safety net if Salesforce is genuinely slow to process it.
      const awardId = await this.pollForId('Award__c', grantName, 60000, 3000);
      logger.info(`[API] Retrieved Award ID: ${awardId}`);

      const activateUrl = `${this.instanceUrl}/services/apexrest/activateAwardFromGrant/v2?AwardId=${awardId}`;
      const activateResponse = await this.client.get(activateUrl, { headers: this.authHeaders() });
      logger.info(`[API] Award activation response: ${activateResponse.status} — ${JSON.stringify(activateResponse.data)}`);

      if (activateResponse.status < 200 || activateResponse.status >= 300) {
        throw new Error(`Award activation failed with status ${activateResponse.status}`);
      }

      // Save the grant name for later use
      this.savedValues.set('Award Name', grantName);
      logger.info(`[API] Saved Award Name: ${grantName}`);
    } catch (error) {
      if (error.response) {
        logger.error(`Standalone subaward error: ${error.response.status} — ${JSON.stringify(error.response.data)}`);
      }
      throw error;
    }
  }

  /**
   * Build default payload for standalone award creation.
   * Mirrors Java ProjectApis.defaultPayloadCreateStandaloneAward().
   */
   async buildDefaultStandaloneAwardPayload(grantName, type = 'Competitive') {
    const envFile = this.getEnvPropertiesFile();

    // Get all required IDs
    const externalOrgId = await this.getIdOf('Account', 'Test Automation Organization');
    const internalOrgId = await this.getIdOf('Account', 'SAN DIEGO ELECTRICAL TRAINING TRUST');
    const programId = await this.getIdOf('Program__c', 'Automation Permanent Internal Program');
    const pmUserId = await this.getIdOf('User', 'Automation PM');
    const foUserId = await this.getIdOf('User', 'Automation FO');
    const exeUserId = await this.getIdOf('User', 'Automation EXE');
    const fundingAccountId = await this.getIdOf('FundingAccount__c', getProperty(envFile, 'fundingAccount'));
    const serviceAreaId = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area');
    const strategicPlanId = await this.getIdOf('StrategicPlan__c', 'Automation Permanent Strategic Plan');
    const masterKPIId = await this.getIdOf('MasterKPI__c', 'Automation Permanent KPI');
    const contactId = await this.getIdOf('Contact', 'Automation SPI3');
    const recordTypeId = await this.getRecordTypeId('Grant__c', 'Grantor');

    // Determine grant type and allocation level
    let grantType = 'Competitive';
    let allocationLevel = 'N/A';

    if (type.includes('Formula')) {
      grantType = 'Formula';
      if (type === 'Formula_By_Applicant') {
        allocationLevel = 'By Applicant';
      } else if (type === 'Formula_By_Applicant_Focus_Area') {
        allocationLevel = 'By Applicant and Focus Area';
      } else if (type === 'Formula_By_Applicant_Focus_Area_No') {
        allocationLevel = 'By Applicant';
      }
    } else if (type.includes('Directed')) {
      grantType = 'Directed';
      allocationLevel = 'N/A';
    }

    return {
      Grant: [{
        ProjectTitle: grantName,
        GrantAbbreviation: '1234',
        GrantNumber: '31231232',
        ProjectPeriodStartDate: this.dateWithOffset(0),
        ProjectPeriodEndDate: this.dateWithOffset(3650),
        BudgetCategoryPackage: 'Construction',
        GrantDescription: 'API Testing For Award Activation From Direct Grant',
        ExternalOrganization: externalOrgId,
        InternalOrganization: internalOrgId,
        Program: programId,
        DoesGrantAllowIndirect: 'Yes',
        MaintenanceOfEffort: 'Yes',
        LaverageAllowed: 'Yes',
        IsProgramIncomeAnticipated: 'Yes',
        IsAdvancePermitted: 'No',
        FocusAreaRequired: 'Yes',
        IsGoalsRequired: 'Yes',
        KPIsRequired: 'Yes',
        RiskAssessment_Required: 'No',
        WBSRequired: 'No',
        IsBuildUpFunctionality: 'No',
        AreExpensesBuildIUpLevel: 'Yes',
        IsMatchRequired: 'Yes',
        GranteeMatch: 10,
        BudgetCloseoutrequestRequired: 'Yes',
        CostSharing: 'Cash Match',
        GrantType: grantType,
        AllocationLevel: allocationLevel,
        RecordTypeId: recordTypeId,
        OwnerId: pmUserId,
      }],
      Award: [{
        BudgetRedirectionThreshhold: 10,
        GrantAwardDescription: 'Award Created From Automation API',
        BudgetPeriodEndDate: this.dateWithOffset(3650),
        PM: pmUserId,
        FO: foUserId,
        EXE: exeUserId,
        NewObligation: '1000',
        TotalCommitment: '1000',
      }],
      AwardFundingAccount: [{
        FundingAccount: fundingAccountId,
        PreEncumbranceAmount: '1000',
      }],
      BuildUpItems: [{
        BudgetCategory: 'Construction',
        Title: 'Construction',
        Narrative: 'Test Build-up',
        AwardedBudget: 1000,
        CashMatch: 100,
        NonCashMatch: 100,
        OtherLeverageOptional: null,
        ServiceAreaName: 'Automation Permanent Focus Area',
      }],
      PaymentRequestSchedule: [
        {
          SubmissionTitle: 'Grant API Test',
          CalReportingStartDate: this.dateWithOffset(0),
          CalReportingEndDate: this.dateWithOffset(3650),
          Frequency: 'Annually',
          ScheduleBase: 'Calendar',
          SubmissionType: 'Payment Request',
        },
        {
          SubmissionTitle: grantName,
          CalReportingStartDate: this.dateWithOffset(0),
          CalReportingEndDate: this.dateWithOffset(3650),
          Frequency: 'Annually',
          ScheduleBase: 'Calendar',
          SubmissionType: 'Progress Report',
        },
      ],
      AwardServiceArea: [{
        ServiceArea: serviceAreaId,
        GATStartDate: this.dateWithOffset(0),
        GATEndDate: this.dateWithOffset(3650),
        ...(type === 'Formula_By_Applicant_Focus_Area' ? { NewObligationPay: '1000' } : {}),
      }],
      KPIGoalsObjectives: [{
        StrategicPlan: strategicPlanId,
      }],
      KeyOutcome: [{
        MasterKPI: masterKPIId,
        Target: '10',
      }],
      KeyContacts: [{
        ProjectRole: 'Project Director/Manager',
        Contact: contactId,
        IsKeyContact: true,
      }],
    };
  }
}
