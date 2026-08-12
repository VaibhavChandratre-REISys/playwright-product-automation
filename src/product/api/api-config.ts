import { ProjectApiConfig } from '../../framework/api/project-api-config';

/**
 * TODO: Replace 'template' with your project name.
 * The export must be named `<project>ApiConfig` (e.g. ksdeApiConfig).
 */
export const templateApiConfig: ProjectApiConfig = {
  defaultOrgName: '',       // e.g. 'Automation Permanent Org'
  indOrgName: '',           // e.g. 'Automation IND'

  programFields: {
    // Add project-specific program custom fields here
  },

  budgetPeriodFields: (_dateWithOffset) => ({
    // e.g. MyProject_AmendmentDeadline: dateWithOffset(140),
  }),

  awardFromFDMFields: (_dateWithOffset) => ({
    // e.g. MyProject_FS10DueDate: dateWithOffset(100),
  }),

  directGrantFields: {
    // e.g. MyProject_GrantAbbreviation: 'SW',
  },

  amendmentDeadlinePastFields: (_dateWithOffset) => ({
    // e.g. MyProject_AmendmentDeadline: dateWithOffset(-10),
  }),
};
