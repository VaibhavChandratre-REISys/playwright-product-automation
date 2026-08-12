 function _nullishCoalesce(lhs, rhsFn) { if (lhs != null) { return lhs; } else { return rhsFn(); } }import { getProperty } from '../config/properties-loader';
import { logger } from './logger';
import { parseDateToken } from './date-token-parser';

/**
 * Scenario-scoped key-value store.
 * Replaces the old helperPackage propertiesFileOperationsTo().saveValue() pattern.
 * Each scenario gets a fresh instance via CustomWorld.
 */
export class SavedValues {constructor() { SavedValues.prototype.__init.call(this); }
   __init() {this.store = new Map()}

  /** Save a value under a key for later retrieval in the same scenario. */
  set(key, value) {
    this.store.set(key, value);
  }

  /** Retrieve a saved value. Throws if the key was never set. */
  get(key) {
    const value = this.store.get(key);
    if (value === undefined) {
      throw new Error(`SavedValues: key "${key}" not found. Available keys: [${[...this.store.keys()].join(', ')}]`);
    }
    return value;
  }

  /** Retrieve a saved value with case-insensitive fallback. */
  getCaseInsensitive(key) {
    // Try exact match first
    if (this.store.has(key)) {
      return this.store.get(key);
    }
    // Try case-insensitive match
    const lowerKey = key.toLowerCase();
    for (const [storeKey, value] of this.store.entries()) {
      if (storeKey.toLowerCase() === lowerKey) {
        logger.info(`SavedValues: case-insensitive match found: "${key}" → "${storeKey}"`);
        return value;
      }
    }
    return undefined;
  }

  /** Check if key exists with case-insensitive fallback. */
  hasCaseInsensitive(key) {
    if (this.store.has(key)) {
      return true;
    }
    const lowerKey = key.toLowerCase();
    for (const storeKey of this.store.keys()) {
      if (storeKey.toLowerCase() === lowerKey) {
        return true;
      }
    }
    return false;
  }

  /**
   * Resolve a step string that may contain any of these token formats:
   *   {SavedValue:KEY}          — runtime scenario value (falls back to env properties)
   *   ---module:-:key---        — Java .properties file lookup (95,880 occurrences in feature files)
   *   {---module:-:key---}      — same, with curly braces
   *   {grantor_tableId:KEY}     — grantor Salesforce flex table data-flextablename
   *   {grantee_tableId:KEY}     — grantee Salesforce flex table data-flextablename
   *   {grantor_sidebar:KEY}     — grantor sidebar link label text
   */
  resolve(input) {
    if (input === null || input === undefined) return '';
    let result = typeof input === 'string' ? input : String(input);

    // 1. {SavedValue:KEY} — try saved store first (case-insensitive), then env properties files, then process.env
    result = result.replace(/\{SavedValue:([^}]+)\}/g, (match, key) => {
      const trimmedKey = key.trim();
      // Try exact match first, then case-insensitive match
      if (this.store.has(trimmedKey)) {
        return this.store.get(trimmedKey);
      }
      const caseInsensitiveValue = this.getCaseInsensitive(trimmedKey);
      if (caseInsensitiveValue !== undefined) {
        return caseInsensitiveValue;
      }
      // Fallback: try environment-specific properties files (matches POC's resolveValue())
      const envFiles = ['AUTOEnvData', 'QAEnvData', 'ProLWCEnvData', 'UATRelatedTableID'];
      for (const file of envFiles) {
        const propValue = getProperty(file, trimmedKey);
        if (propValue) {
          logger.info(`Resolved {SavedValue:${trimmedKey}} from ${file}.properties`);
          return propValue;
        }
      }
      // Fallback: try process.env (for .env file variables)
      // Try with spaces first (as written in feature file), then with underscores (env var format)
      let envValue = process.env[trimmedKey];
      if (!envValue) {
        const underscoreKey = trimmedKey.replace(/ /g, '_');
        
        // If key ends with " Username", try _DisplayName suffix FIRST to avoid conflict with login usernames
        if (trimmedKey.toLowerCase().endsWith(' username')) {
          const baseKey = trimmedKey.substring(0, trimmedKey.length - 9); // Remove " Username"
          const displayNameKey = baseKey.replace(/ /g, '_') + '_DisplayName';
          envValue = process.env[displayNameKey];
          if (envValue) {
            logger.info(`Resolved {SavedValue:${trimmedKey}} from process.env[${displayNameKey}]`);
            return envValue;
          }
        }
        
        // Fall back to regular underscore version
        envValue = process.env[underscoreKey];
        if (envValue) {
          logger.info(`Resolved {SavedValue:${trimmedKey}} from process.env[${underscoreKey}]`);
          return envValue;
        }
      } else {
        logger.info(`Resolved {SavedValue:${trimmedKey}} from process.env`);
        return envValue;
      }
      logger.warn(`SavedValues: key "${trimmedKey}" not found in saved store or env properties`);
      return match;
    });

    // 2. {---module:-:key---} — properties file lookup (with braces)
    result = result.replace(/\{---([^:]+):-:([^}]+)---\}/g, (_match, fileName, key) => {
      const value = getProperty(fileName.trim(), key.trim());
      if (value) return value;
      logger.warn(`Properties: key "${key.trim()}" not found in ${fileName.trim()}.properties`);
      return _match;
    });

    // 3. ---module:-:key--- — properties file lookup (without braces, most common format)
    result = result.replace(/---([^:]+):-:([^-]+)---/g, (_match, fileName, key) => {
      const value = getProperty(fileName.trim(), key.trim());
      if (value) return value;
      logger.warn(`Properties: key "${key.trim()}" not found in ${fileName.trim()}.properties`);
      return _match;
    });

    // 4. {grantor_tableId:KEY} — static map (backward compat)
    result = result.replace(/\{grantor_tableId:([^}]+)\}/g, (_, key) => {
      return _nullishCoalesce(GRANTOR_TABLE_ID_MAP[key.trim()], () => ( key.trim()));
    });

    // 5. {grantee_tableId:KEY} — static map (backward compat)
    result = result.replace(/\{grantee_tableId:([^}]+)\}/g, (_, key) => {
      return _nullishCoalesce(GRANTEE_TABLE_ID_MAP[key.trim()], () => ( key.trim()));
    });

    // 6. {grantor_sidebar:KEY} — static map (backward compat)
    result = result.replace(/\{grantor_sidebar:([^}]+)\}/g, (_, key) => {
      return _nullishCoalesce(GRANTOR_SIDEBAR_MAP[key.trim()], () => ( key.trim()));
    });

    // 7. {fileName:key} — generic .properties file lookup (mirrors Java TypeRegistryConfiguration)
    //    Examples: {user:OldfullName} → reads user.properties → key OldfullName
    //    Must run after SavedValue/grantor_tableId/etc so those take priority
    result = result.replace(/\{([^:}]+):([^}]+)\}/g, (match, fileName, key) => {
      const trimmedFile = fileName.trim();
      const trimmedKey = key.trim();
      // Skip patterns already handled above
      const reserved = ['savedvalue', 'grantor_tableid', 'grantee_tableid', 'grantor_sidebar', 'date'];
      if (reserved.includes(trimmedFile.toLowerCase())) return match;
      const value = getProperty(trimmedFile, trimmedKey);
      if (value) {
        logger.info(`Resolved {${trimmedFile}:${trimmedKey}} from ${trimmedFile}.properties → "${value}"`);
        return value;
      }
      logger.warn(`Properties: key "${trimmedKey}" not found in ${trimmedFile}.properties`);
      return match;
    });

    // 8. {Date:<JavaDateTimeFormatterPattern>::<modifiers>} — mirrors Java
    //    TypeRegistryConfiguration.parseDate(). Must run last since patterns
    //    can contain characters like "/" that overlap with other tokens.
    result = result.replace(/\{Date:([^}]+)\}/g, (match, spec) => {
      try {
        return parseDateToken(spec.trim());
      } catch (e) {
        logger.warn(`Failed to resolve {Date:${spec}}: ${(e ).message}`);
        return match;
      }
    });

    return result;
  }

  has(key) {
    return this.store.has(key);
  }

  /** Return all keys that start with a given prefix (case-insensitive). */
  getAllKeysStartingWith(prefix) {
    const lower = prefix.toLowerCase();
    return [...this.store.keys()].filter(k => k.toLowerCase().startsWith(lower));
  }

  clear() {
    this.store.clear();
  }
}

/**
 * Maps {grantor_tableId:Key} tokens → actual Salesforce DOM data-flextablename values.
 * Source: GrantorProjectManager.java property keys.
 */
export const GRANTOR_TABLE_ID_MAP = {
  // Source: grantor_tableId.properties
  SubrecipientOrganization: 'UserRegistration',
  SubrecipientIndRegistration: 'UserRegistrationIndApp',
  InternalContactsTableId: 'InternalContacts',
  PotentialReviewerContactTableId: 'Reviewers',
  FDMTableId: 'FDMAnnouncementReviewSteps',
  FundingAccountTableId: 'FDMFundingAccountGrantor',
  RecommendedApplicationTableId: 'FundingDecisionMemoApplications',
  NonRecommendedApplicationTableId: 'FundingDecisionMemoNonRecommendApplication',
  FundingAccountInformationTableId: 'AwardFundingAccounts',
  SubAwardBudgetTableId: 'SubAwardBudgetCategoryFlexGrid',
  FederalProgramTavleTableId: 'RelatedFederalProgramForAward',
  SubAwardContactsTableId: 'SubawardContact',
  PendingTaskAssignedToMeTableId: 'HomePendingTasks',
  PendingTaskAssignedByMeTableId: 'HomePendingTasksBy',
  CompletedTaskAssignedToMeTableId: 'HomePhaseCompletedTasks',
};

/**
 * Maps {grantee_tableId:Key} tokens → actual Salesforce DOM data-flextablename values.
 */
export const GRANTEE_TABLE_ID_MAP = {
  // Source: grantee_tableId.properties
  ApplicationTableId: 'ManageApplications',
  Application: 'ManageApplications',
  PendingTask: 'PendingTasksAssignedtoMe',
  PhasePendingTask: 'PhasePendingTasks',
  HomePendingTask: 'HomePendingTasks',
  HomeCompletedTask: 'HomePhaseCompletedTasks',
  GrantsTable: 'GranteeGrants',
  AwardsTable: 'GranteeActiveAwardsgrid',
  ProgressReports: 'GranteeProgressReports',
  AmendmentRequestTableId: 'GranteeAmendmentRequest',
  CloseoutTableId: 'GranteePhaseCloseOutRequest',
};

/**
 * Maps {grantor_sidebar:Key} tokens → actual sidebar link label text.
 * Source: GrantorProjectManager.java sidebar property keys.
 */
export const GRANTOR_SIDEBAR_MAP = {
  // Source: grantor_sidebar.properties
  MyTasksLinkName: 'My Tasks',
  PendingTaskLink: 'Pending Tasks',
  CompletedTaskLink: 'Completed Tasks',
  ReassignLink: 'Reassign',
  ContactSubheaderName: 'Contacts',
  smeReviewer: 'SME Reviewers',
  SubrecipientsLink: 'Subrecipients',
  InternalLink: 'Internal',
  SMEReviewersLink: 'SME Reviewers',
  ActivitiesSubHeaderName: 'Organization',
  PendingSubrecipient: 'Pending Subrecipient Registrations',
};
