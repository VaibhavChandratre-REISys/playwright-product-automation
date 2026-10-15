import axios, { AxiosInstance } from 'axios';
import { getConfig } from '../config/config-loader';
import { getProperty } from '../config/properties-loader';
import { mintSession } from '../auth/salesforce-jwt';
import { SavedValues } from '../utils/saved-values';
import { logger } from '../utils/logger';

const CATEGORY_OBJECTS: Record<string, string> = {
  'page block config': 'GNT__PageBlockDetailConfig__c',
  'page block': 'GNT__PageBlockConfig__c',
  'page layout': 'GNT__PageLayoutConfig__c',
  'page layout action': 'GNT__PageLayoutActionConfig__c',
  'page layout action sobject': 'GNT__SobjectActionConfig__c',
  'page tabs config': 'GNT__TabConfig__c',
  'page message config': 'GNT__MessageConfig__c',
};

const FIELD_APIS: Record<string, string> = {
  'is active': 'GNT__IsActive__c',
  'is hidden field': 'GNT__IsHiddenField__c',
  'required behavior': 'GNT__RequiredBehavior__c',
  'hide expression json': 'GNT__HideExpressionJSON__c',
  'read only expression json': 'GNT__ReadOnlyExpressionJSON__c',
  'read only': 'GNT__ReadOnly__c',
  'sort order': 'GNT__SortOrder__c',
  'field label override': 'GNT__FieldLabelOverride__c',
  'field label override (rich text)': 'GNT__FieldLabelOverrideRichText__c',
  'hide label': 'GNT__HideLabel__c',
  'help text': 'GNT__HelpText__c',
  'help text long': 'GNT__HelpTextLong__c',
  'static text': 'GNT__StaticText__c',
  'total fields per row': 'GNT__BodyColumns__c',
  'page block title': 'GNT__PageBlockTitle__c',
  'header instruction text': 'GNT__HeaderInstructionText__c',
  'enable collapse by default': 'GNT__EnableCollapseByDefault__c',
  'header': 'GNT__Title__c',
  'page instruction text': 'GNT__HeaderDescription__c',
  'hide pdf download': 'GNT__HidePDFDownload__c',
  'close modal on save': 'GNT__CloseModalOnSave__c',
  'cancel button label': 'GNT__CancelButtonLabel__c',
  'save button label': 'GNT__SaveButtonLabel__c',
  'action name': 'Name',
  'standard action': 'GNT__StandardAction__c',
  'submit warning message': 'GNT__SubmitWarningMessage__c',
  'submit warning message long': 'GNT__SubmitWarningMessageLong__c',
  'submit warning message rich': 'GNT__SubmitWarningMessageRich__c',
  'refreshbehaviour': 'GNT__RefreshBehaviour__c',
  'button help text': 'GNT__ButtonHelpText__c',
  'is overview': 'GNT__isOverview__c',
  'tab title': 'GNT__TabName__c',
  'tab icon': 'GNT__TabIcon__c',
};

export interface ConfigurationRow {
  configurationCategory: string;
  fieldName: string;
  fieldNewValue?: string;
  fieldOrignalValue?: string;
  coreComponentField?: string;
  coreCOmponentSubFieldName?: string;
  coreComponentSubFieldValue?: string;
  filterId?: string;
}

export class FrameworkConfigurationApi {
  private readonly client: AxiosInstance;
  private readonly savedValues: SavedValues;
  private token = '';
  private instanceUrl = '';
  private ids: string[] = [];

  constructor(savedValues: SavedValues) {
    this.savedValues = savedValues;
    this.client = axios.create({ timeout: 60000, headers: { 'Content-Type': 'application/json' } });
  }

  async authenticate(): Promise<void> {
    if (this.token) return;
    const config = getConfig();
    if (!config.SF_API_USERNAME) throw new Error('SF_API_USERNAME is required for framework configuration APIs');
    const session = await mintSession(config.SF_API_USERNAME, config);
    this.token = session.accessToken;
    this.instanceUrl = session.instanceUrl;
  }

  async deleteRecord(recordName: string, objectName: string, fieldApiName: string): Promise<void> {
    await this.authenticate();
    await this.client.delete(`${this.instanceUrl}/services/apexrest/GNT/AutomationAPI/Delete`, {
      headers: { Authorization: `Bearer ${this.token}` },
      data: { objectName, criteria: `${fieldApiName}='${recordName.replace(/'/g, "\\'")}'` },
    });
  }

  async apply(row: ConfigurationRow): Promise<void> {
    await this.authenticate();
    const id = await this.resolveRecordId(row);
    const objectApi = this.objectApi(row.configurationCategory);
    const fieldApi = this.fieldApi(row.fieldName);
    const value = this.resolveValue(row.fieldNewValue ?? row.fieldOrignalValue ?? '');
    const fieldMap = { Id: id, [fieldApi]: this.typedValue(value) };
    await this.client.post(`${this.instanceUrl}/services/apexrest/frameworkAPIUpdate`, {
      sObjectAPIName: objectApi,
      fieldMapStr: JSON.stringify(fieldMap),
    }, { headers: { Authorization: `Bearer ${this.token}` } });
  }

  private async resolveRecordId(row: ConfigurationRow): Promise<string> {
    if (row.filterId?.startsWith('ApiGeneratedId:')) {
      const id = this.ids[Number(row.filterId.split(':')[1])];
      if (!id) throw new Error(`Configuration API ID not available for ${row.filterId}`);
      return id;
    }
    const objectApi = this.objectApi(row.configurationCategory);
    const filterClause = this.filterClause(row);
    const response = await this.client.post(`${this.instanceUrl}/services/apexrest/frameworkAPIRetrieve`, {
      sObjectAPIName: objectApi,
      fields: 'Id',
      filterClause,
    }, { headers: { Authorization: `Bearer ${this.token}` } });
    const text = typeof response.data === 'string' ? response.data : JSON.stringify(response.data);
    const id = text.match(/\b[a-zA-Z0-9]{18}\b/)?.[0] || text.match(/\b[a-zA-Z0-9]{15}\b/)?.[0];
    if (!id) throw new Error(`No configuration record found for ${row.configurationCategory}; filter: ${filterClause}`);
    this.ids.push(id);
    return id;
  }

  private filterClause(row: ConfigurationRow): string {
    const category = row.configurationCategory.toLowerCase();
    const component = this.resolveValue(row.coreComponentField ?? '');
    const subField = row.coreCOmponentSubFieldName || 'Name';
    const subValue = this.resolveValue(row.coreComponentSubFieldValue ?? '');
    if (category === 'page block config:page block rule detail') {
      return `GNT__PageBlockConfig__r.GNT__TabLayoutConfig__r.GNT__PageLayoutConfig__r.Name='${component}' and Name='${subValue}'`;
    }
    if (category.startsWith('page block:')) {
      return `GNT__TabLayoutConfig__r.GNT__PageLayoutConfig__r.Name='${component}' and ${subField}='${subValue}'`;
    }
    if (category.startsWith('page layout action')) {
      return `${subField}='${subValue}' and GNT__PageLayoutConfig__r.Name='${component}'`;
    }
    if (category.startsWith('page tabs config')) {
      return `GNT__PageLayoutConfig__r.Name='${component}' and ${subField}='${subValue}'`;
    }
    return `${subField}='${subValue || component}'`;
  }

  private objectApi(category: string): string {
    const key = category.split(':')[0].trim().toLowerCase();
    const objectApi = CATEGORY_OBJECTS[key];
    if (!objectApi) throw new Error(`Unsupported framework configuration category: ${category}`);
    return objectApi;
  }

  private fieldApi(fieldName: string): string {
    const normalized = fieldName.trim().toLowerCase();
    return FIELD_APIS[normalized] || `GNT__${fieldName.replace(/[^a-zA-Z0-9]/g, '')}__c`;
  }

  private resolveValue(value: string): string {
    const resolved = this.savedValues.resolve(value);
    if (resolved.toLowerCase().startsWith('govgrants_config:')) {
      const key = resolved.substring(resolved.indexOf(':') + 1).trim();
      const propertyValue = getProperty('govgrants_Config', key);
      if (!propertyValue) {
        throw new Error(`Property "${key}" not found in govgrants_Config.properties`);
      }
      logger.info(`Resolved govgrants_config:${key} from govgrants_Config.properties`);
      return propertyValue;
    }
    return resolved;
  }

  private typedValue(value: string): string | number | boolean | null {
    if (value === '') return null;
    if (value.toLowerCase() === 'true') return true;
    if (value.toLowerCase() === 'false') return false;
    if (/^-?\d+(\.\d+)?$/.test(value)) return Number(value);
    return value;
  }
}
