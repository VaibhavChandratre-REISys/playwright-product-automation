/**
 * Interface for project-specific API configuration.
 * Each project provides its own implementation with org names,
 * custom field names, and default payload overrides.
 *
 * Generic CRUD, authentication, and filter logic stays in GrantorApiService.
 * Only the project-specific "seed data" is injected via this config.
 */
export interface ProjectApiConfig {
  /** Default org name for invited applicants (e.g. 'Automation Permanent Nysed School Org') */
  defaultOrgName: string;

  /** IND org name for individual applicant scenarios */
  indOrgName: string;

  /**
   * Extra fields to merge into the default program activation payload.
   * These are project-specific Salesforce custom fields (e.g. NYSED_UGG, NYSEDDeputy_Area).
   */
  programFields: Record<string, any>;

  /**
   * Extra fields to merge into the default announcement BudgetPeriod payload.
   * E.g. NYSED_AmendmentDeadline.
   * Values can be strings or functions: (dateWithOffset: (days: number) => string) => any
   */
  budgetPeriodFields: (dateWithOffset: (days: number) => string) => Record<string, any>;

  /**
   * Extra fields to merge into the default award-from-FDM payload.
   * E.g. NYSED_FS10DueDate.
   */
  awardFromFDMFields: (dateWithOffset: (days: number) => string) => Record<string, any>;

  /**
   * Direct grant field setter — called when setDirectGrant() is invoked in filters.
   * Returns fields to set on the announcement (e.g. NYSED_GrantAbbreviation).
   */
  directGrantFields: Record<string, any>;

  /**
   * Fields to set when amendment deadline is in the past (filter override).
   * E.g. { NYSED_AmendmentDeadline: dateWithOffset(-10) }
   */
  amendmentDeadlinePastFields: (dateWithOffset: (days: number) => string) => Record<string, any>;
}
