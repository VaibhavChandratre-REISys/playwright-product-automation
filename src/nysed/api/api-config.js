

/**
 * NYSED-specific API configuration.
 * Contains all NYSED custom field names, org names, and default payload overrides
 * that were previously hardcoded in grantor-api-service.ts.
 */
export const nysedApiConfig = {
  defaultOrgName: 'Automation Permanent Nysed School Org',
  indOrgName: 'Automation IND',

  programFields: {
    NYSEDDeputy_Area: 'OHE',
    NYSED_UGG: 'ucg',
    NYSED_EDGAR: 'test',
    NYSED_IsAdvancePermitted: 'Yes',
    NYSED_IsNegotiationsAllowed: 'No',
    NYSED_CarryOver: 'Yes',
    NYSED_CarryOverLimit: 'Yes',
    NYSED_CarryOverLimitPercent: 11.00,
    NYSED_ShortDescription: 'Automation Test',
  },

  budgetPeriodFields: (dateWithOffset) => ({
    NYSED_AmendmentDeadline: dateWithOffset(140),
  }),

  awardFromFDMFields: (dateWithOffset) => ({
    NYSED_FS10DueDate: dateWithOffset(100),
  }),

  directGrantFields: {
    NYSED_GrantAbbreviation: 'SW',
  },

  amendmentDeadlinePastFields: (dateWithOffset) => ({
    NYSED_AmendmentDeadline: dateWithOffset(-10),
  }),
};
