import { logger } from '../utils/logger';
import { getProperty } from '../config/properties-loader';

/**
 * Announcement Publisher - Handles building and filtering announcement payloads
 * Mirrors Selenium GrantorPayloads.publishAnnPayload() and getDefaultPayloadPublishAnn()
 */
export class AnnouncementPublisher {
  constructor(
    private getIdOf: (objectType: string, name: string) => Promise<string>,
    private getRecordTypeId: (objectType: string, recordTypeName: string) => Promise<string>,
    private dateWithOffset: (days: number) => string,
    private getEnvPropertiesFile: () => string
  ) {}

  /**
   * Build default announcement payload
   */
  async buildDefaultPayload(annType: string, annName: string, programName: string): Promise<any> {
    const programId = await this.getIdOf('Program__c', programName);
    const envFile = this.getEnvPropertiesFile();
    const fundingAccountName = getProperty(envFile, 'fundingAccount');
    const fundingAccountId = await this.getIdOf('FundingAccount__c', fundingAccountName);
    const pmUserId = await this.getIdOf('User', 'Automation PM');
    const recordTypeId = await this.getRecordTypeId('Announcement__c', 'Grantor');
    const orgId = await this.getIdOf('Account', 'SAN DIEGO ELECTRICAL TRAINING TRUST');

    return {
      Announcement: [{
        name: annName,
        AnnouncementType: annType,
        Program: programId,
        BudgetType: 'Construction',
        MaxApplicationsAllowed: 500,
        IsMatchRequired: 'Yes',
        GranteeMatch: 10,
        IsProgramIncomeAnticipated: 'Yes',
        LaverageAllowed: 'Yes',
        PreApplicationNeeded: 'No',
        PreApplicationDueDate: this.dateWithOffset(10),
        ApplicationDueDate: this.dateWithOffset(10),
        FocusAreaRequired: 'Yes',
        IsGoalsRequired: 'Yes',
        Allocationlevel: 'N/A',
        KPIsRequired: 'Yes',
        WBSRequired: 'No',
        RiskAssessment_Required: 'Yes',
        AreExpensesBuildIUpLevel: 'No',
        IsAdvancePermitted: 'No',
        IsNegotiationsAllowed: 'Yes',
        EligibleApplicantTypes: '04;05',
        DetailedBudgetingRequired: 'No',
        AwardFloor: 1000,
        AwardCeiling: 10000,
        EstimatedFundingAmount: 10000,
        OwnerId: pmUserId,
        RecordTypeId: recordTypeId,
      }],
      AnnouncementServiceArea: [{
        ServiceArea: null,
      }],
      AwardFundingAccount: [{
        FundingAccount: fundingAccountId,
        PreEncumbranceAmount: '1000',
      }],
      KPIGoalsObjectives: [{
        StrategicPlan: null,
      }],
      KeyOutcome: [{
        MasterKPI: null,
      }],
      BudgetPeriod: [{
        BudgetStartDate: this.dateWithOffset(50),
        BudgetEndDate: this.dateWithOffset(150),
      }],
      InvitedApplicant: [{
        Organization: orgId,
        AllocatedAmount: 1000,
      }],
    };
  }

  /**
   * Apply filter to announcement payload
   */
  async applyFilter(payload: any, filter: string): Promise<void> {
    const ann = payload.Announcement[0];
    let normalizedFilter = filter;

    // Handle user-based filter prefix
    if (filter.toLowerCase().includes('user')) {
      const user = filter.split('-')[1]?.split('user')[0]?.trim();
      if (user) {
        ann.OwnerId = await this.getIdOf('User', user);
      }
      normalizedFilter = filter.split('-')[0];
    }
    normalizedFilter = normalizedFilter.toUpperCase();

    switch (normalizedFilter) {
      case 'PRE_APPLICATION_NEGOTIATION_YES':
        ann.PreApplicationNeeded = 'Yes';
        ann.IsNegotiationsAllowed = 'Yes';
        break;

      case 'PRE_APPLICATION_YES':
        ann.PreApplicationNeeded = 'Yes';
        break;

      case 'PRE_APPLICATION_YES_WITH_IND_ORG': {
        ann.PreApplicationNeeded = 'Yes';
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        break;
      }

      case 'PRE_APP_YES_NEGO_YES_FOCUS_AREA_NO':
        ann.PreApplicationNeeded = 'Yes';
        ann.IsNegotiationsAllowed = 'Yes';
        ann.FocusAreaRequired = 'No';
        break;

      case 'FOCUS_AREA_NO':
        ann.FocusAreaRequired = 'No';
        break;

      case 'NEGOTIATION':
        ann.IsNegotiationsAllowed = 'Yes';
        break;

      case 'NEGOTIATION_YES_FOCUS_NO':
        ann.IsNegotiationsAllowed = 'Yes';
        ann.FocusAreaRequired = 'No';
        break;

      case 'NEGOTIATION_NO':
        ann.IsNegotiationsAllowed = 'No';
        break;

      case 'PRE_APP_YES_FOCUS_AREA_NO':
        ann.PreApplicationNeeded = 'Yes';
        ann.FocusAreaRequired = 'No';
        break;

      case 'BY_APPLICANT':
        ann.Allocationlevel = 'By Applicant';
        break;

      case 'BY_APPLICANT_FOCUS_AREA':
        ann.Allocationlevel = 'By Applicant and Focus Area';
        break;

      case 'BY_APPLICANT_FOCUS_AREA_NO':
        ann.Allocationlevel = 'By Applicant';
        ann.FocusAreaRequired = 'No';
        break;

      case 'GOALS_YES':
        ann.IsGoalsRequired = 'Yes';
        break;

      case 'PRE_APP_GOALS_YES':
        ann.PreApplicationNeeded = 'Yes';
        ann.IsGoalsRequired = 'Yes';
        break;

      case 'PRE_APP_YES_PROGRAM_INCOME_NO':
        ann.PreApplicationNeeded = 'Yes';
        ann.IsProgramIncomeAnticipated = 'No';
        break;

      case 'TODAY_APP_DUE_DATE':
        ann.PreApplicationDueDate = this.dateWithOffset(0);
        ann.ApplicationDueDate = this.dateWithOffset(0);
        break;

      case 'APPLICATION_PAST_DUE_DATE':
        ann.PreApplicationDueDate = this.dateWithOffset(-1);
        ann.ApplicationDueDate = this.dateWithOffset(-1);
        break;

      case 'TODAY_PREAPP_DUE_DATE':
        ann.PreApplicationNeeded = 'Yes';
        ann.PreApplicationDueDate = this.dateWithOffset(0);
        ann.ApplicationDueDate = this.dateWithOffset(0);
        break;

      case 'PRE_APPLICATION_YES_AND_NO_MATCH':
        ann.PreApplicationNeeded = 'Yes';
        ann.IsMatchRequired = 'No';
        break;

      case 'SUB_MATCH_YES_RISK_YES_EXPENSE_YES_ADVANCE_NO':
        ann.GranteeMatch = 10;
        ann.RiskAssessment_Required = 'Yes';
        ann.AreExpensesBuildIUpLevel = 'Yes';
        ann.IsAdvancePermitted = 'No';
        break;

      case 'BY_APPLICANT_NEGOTIATION_NO':
        ann.Allocationlevel = 'By Applicant';
        ann.IsNegotiationsAllowed = 'No';
        break;

      case 'BY_APPLICANT_FOCUS_NO_NEGOTIATION_NO':
      case 'BY_APPLICANT_FOCUS_AREA_NO_NEGOTIATION_NO':
        ann.Allocationlevel = 'By Applicant';
        ann.FocusAreaRequired = 'No';
        ann.IsNegotiationsAllowed = 'No';
        break;

      case 'BY_APPLICANT_FOCUS_AREA_NO_NEGOTIATION_YES':
        ann.Allocationlevel = 'By Applicant';
        ann.FocusAreaRequired = 'No';
        ann.IsNegotiationsAllowed = 'Yes';
        break;

      case 'BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO':
        ann.Allocationlevel = 'By Applicant and Focus Area';
        ann.IsNegotiationsAllowed = 'No';
        break;

      case 'BY_APPLICANT_FOCUS_AREA_NEGOTIATION_YES':
        ann.Allocationlevel = 'By Applicant and Focus Area';
        ann.IsNegotiationsAllowed = 'Yes';
        break;

      case 'BY_APPLICANT_RISK_ASSESSMENT_NO':
        ann.Allocationlevel = 'By Applicant';
        ann.RiskAssessment_Required = 'No';
        break;

      case 'BY_APPLICANT_FOCUS_AREA_NO_RISKASSESSMENT_NO':
        ann.Allocationlevel = 'By Applicant';
        ann.FocusAreaRequired = 'No';
        ann.RiskAssessment_Required = 'No';
        break;

      case 'NO_RISK_ASSESSMENT':
        ann.RiskAssessment_Required = 'No';
        break;

      case 'NO_RISK_ASSESSMENT_FOCUS_AREA_NO':
        ann.FocusAreaRequired = 'No';
        ann.RiskAssessment_Required = 'No';
        break;

      case 'DETAILE_BUDGET_YES':
        ann.DetailedBudgetingRequired = 'Yes';
        break;

      case 'BY_APPLICANT_DETAILS_BUDGET_YES_RISK_NO':
        ann.Allocationlevel = 'By Applicant';
        ann.IsNegotiationsAllowed = 'Yes';
        ann.RiskAssessment_Required = 'No';
        ann.DetailedBudgetingRequired = 'Yes';
        break;

      case 'BUDGETPERIODDATES':
        if (payload.BudgetPeriod?.[0]) {
          payload.BudgetPeriod[0].BudgetStartDate = this.dateWithOffset(11);
        }
        break;

      // Invited Applicant filters with IND org
      case 'INVITED_APPLICANT_IND_ORG': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.Allocationlevel = 'N/A';
        break;
      }

      case 'INVITED_APPLICANT_IND_ORG_SPI_ORG': {
        const spiOrgId = await this.getIdOf('Account', 'SAN DIEGO ELECTRICAL TRAINING TRUST');
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [
          { Organization: spiOrgId, AllocatedAmount: 1000 },
          { Organization: indOrgId, AllocatedAmount: 1000 },
        ];
        ann.Allocationlevel = 'N/A';
        break;
      }

      case 'INVITED_APPLICANT_IND_ORG_FOCUS_AREA_NO': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.FocusAreaRequired = 'No';
        break;
      }

      case 'INVITED_APPLICANT_IND_ORG_BY_APPLICANT': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.Allocationlevel = 'By Applicant';
        break;
      }

      case 'INVITED_APPLICANT_IND_ORG_BY_APPLICANT_RISK_NO': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.Allocationlevel = 'By Applicant';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA_NO': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.Allocationlevel = 'By Applicant';
        ann.FocusAreaRequired = 'No';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.Allocationlevel = 'By Applicant and Focus Area';
        break;
      }

      case 'INVITED_APP_IND_ORG_BY_APP_FOCUS_AREA_RISK_NO': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.Allocationlevel = 'By Applicant and Focus Area';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'INVITED_APPLICANT_IND_ORGPRE_PRE_APPLICATION_NEGOTIATION': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        ann.PreApplicationNeeded = 'Yes';
        ann.IsNegotiationsAllowed = 'Yes';
        break;
      }

      // Second Focus Area filters
      case 'SECOND_FOCUS_AREA': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        break;
      }

      case 'SECOND_FOCUS_AREA_RISK_ASS_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const spiOrgId = await this.getIdOf('Account', 'SAN DIEGO ELECTRICAL TRAINING TRUST');
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        payload.InvitedApplicant = [{ Organization: spiOrgId, AllocatedAmount: 1000 }];
        ann.Allocationlevel = 'By Applicant';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'SECOND_FOCUS_AREA_BY_APPL_NEGO_NO_RISK_ASS_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        ann.Allocationlevel = 'By Applicant';
        ann.RiskAssessment_Required = 'No';
        ann.IsNegotiationsAllowed = 'No';
        break;
      }

      case 'THREE_FOCUS_AREA_BY_APPL_RISK_ASS_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const focusArea3Id = await this.getIdOf('ServiceArea__c', 'Test Focus Area1');
        payload.AnnouncementServiceArea = [
          { ServiceArea: focusArea2Id },
          { ServiceArea: focusArea3Id },
        ];
        ann.Allocationlevel = 'By Applicant';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'SECOND_FOCUS_AREA_BY_APPLICANT_FOCUS_AREA_RISK_ASS_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const spiOrgId = await this.getIdOf('Account', 'SAN DIEGO ELECTRICAL TRAINING TRUST');
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        payload.InvitedApplicant = [{ Organization: spiOrgId, AllocatedAmount: 500 }];
        ann.Allocationlevel = 'By Applicant and Focus Area';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'SECOND_FOCUS_AREA_BY_APPLICANT_DET_YES_FOCUS_AREA_RISK_ASS_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const spiOrgId = await this.getIdOf('Account', 'SAN DIEGO ELECTRICAL TRAINING TRUST');
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        payload.InvitedApplicant = [{ Organization: spiOrgId, AllocatedAmount: 500 }];
        ann.Allocationlevel = 'By Applicant and Focus Area';
        ann.RiskAssessment_Required = 'No';
        ann.DetailedBudgetingRequired = 'Yes';
        break;
      }

      case 'THREE_FOCUS_BY_APP_FOCUS_AREA_RISK_NO_PROGRAM_INCOME_NO_SUB_MATCH_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const focusArea3Id = await this.getIdOf('ServiceArea__c', 'Test Focus Area1');
        payload.AnnouncementServiceArea = [
          { ServiceArea: focusArea2Id },
          { ServiceArea: focusArea3Id },
        ];
        ann.Allocationlevel = 'By Applicant and Focus Area';
        ann.RiskAssessment_Required = 'No';
        ann.IsProgramIncomeAnticipated = 'No';
        ann.IsMatchRequired = 'No';
        break;
      }

      case 'SECOND_FOCUS_AREA_DETAILS_BUDGET_YES_RISK_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        ann.RiskAssessment_Required = 'No';
        ann.DetailedBudgetingRequired = 'Yes';
        break;
      }

      case 'THREE_FOCUS_BY_APP_DETAILS_BUDGET_YES_RISK_NO': {
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const focusArea3Id = await this.getIdOf('ServiceArea__c', 'Test Focus Area1');
        payload.AnnouncementServiceArea = [
          { ServiceArea: focusArea2Id },
          { ServiceArea: focusArea3Id },
        ];
        ann.Allocationlevel = 'By Applicant';
        ann.RiskAssessment_Required = 'No';
        ann.DetailedBudgetingRequired = 'Yes';
        break;
      }

      case 'SECOND_FOCUS_AREA_APPLICANT_IND_ORG_PRE_APPLICATION': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        ann.PreApplicationNeeded = 'Yes';
        ann.FocusAreaRequired = 'Yes';
        break;
      }

      case 'INVITED_APP_IND_ORG_BY_AP_TWO_FOCUS_AREA_RISK_NO': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 1000 }];
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        ann.Allocationlevel = 'By Applicant';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'INVITED_APP_IND_ORG_BY_APP_TWO_FOCUS_AREA_RISK_NO': {
        const indOrgId = await this.getIdOf('Account', 'Automation IND');
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        payload.InvitedApplicant = [{ Organization: indOrgId, AllocatedAmount: 500 }];
        payload.AnnouncementServiceArea = [{ ServiceArea: focusArea2Id }];
        ann.Allocationlevel = 'By Applicant and Focus Area';
        ann.RiskAssessment_Required = 'No';
        break;
      }

      case 'PROGRAM_FOR_PREAPP_SUPP_DOC_YES': {
        const programId = await this.getIdOf('Program__c', 'Automation Permanent PreApp Supp Doc Yes');
        ann.Program = programId;
        ann.PreApplicationNeeded = 'Yes';
        break;
      }

      case 'PROGRAM_FOR_APP_SUPP_DOC_YES': {
        const programId = await this.getIdOf('Program__c', 'Automation Permanent App Supp Doc Yes');
        ann.Program = programId;
        break;
      }

      case 'PLUMBING_CASE': {
        const envFile = this.getEnvPropertiesFile();
        const fundingAccountId = await this.getIdOf('FundingAccount__c', getProperty(envFile, 'fundingAccountId'));
        const sarahPMId = await this.getIdOf('User', 'Sarah PM');
        ann.AwardFloor = 2000;
        ann.OwnerId = sarahPMId;
        payload.AwardFundingAccount = [{ FundingAccount: fundingAccountId, PreEncumbranceAmount: '2000' }];
        break;
      }

      case 'PRE_APPLICATION_NEGOTIATION_YES_MULTIPLE_FOCUS_AREA': {
        const focusArea1Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area');
        const focusArea2Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area2');
        const focusArea3Id = await this.getIdOf('ServiceArea__c', 'Automation Permanent Focus Area3');
        payload.AnnouncementServiceArea = [
          { ServiceArea: focusArea1Id },
          { ServiceArea: focusArea2Id },
          { ServiceArea: focusArea3Id },
        ];
        ann.PreApplicationNeeded = 'Yes';
        ann.Allocationlevel = 'N/A';
        ann.RiskAssessment_Required = 'No';
        ann.IsNegotiationsAllowed = 'Yes';
        break;
      }

      case 'DEFAULT':
        break;

      default:
        logger.warn(`Unknown announcement filter: ${filter} — using default payload`);
        break;
    }
  }
}
