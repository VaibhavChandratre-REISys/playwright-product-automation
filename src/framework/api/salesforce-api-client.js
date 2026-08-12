 function _optionalChain(ops) { let lastAccessLHS = undefined; let value = ops[0]; let i = 1; while (i < ops.length) { const op = ops[i]; const fn = ops[i + 1]; i += 2; if ((op === 'optionalAccess' || op === 'optionalCall') && value == null) { return undefined; } if (op === 'access' || op === 'optionalAccess') { lastAccessLHS = value; value = fn(value); } else if (op === 'call' || op === 'optionalCall') { value = fn((...args) => value.call(lastAccessLHS, ...args)); lastAccessLHS = undefined; } } return value; }import axios, { } from 'axios';
import { logger } from '../utils/logger';

/**
 * Salesforce REST API Client.
 * Ported from POC's SalesforceApiClient.ts (247 lines, proven working).
 * Provides OAuth2 password-flow authentication and CRUD/SOQL/Apex REST methods.
 */
export class SalesforceApiClient {
  
   __init() {this.accessToken = ''}
   __init2() {this.instanceUrl = ''}

  constructor(baseUrl) {;SalesforceApiClient.prototype.__init.call(this);SalesforceApiClient.prototype.__init2.call(this);
    this.client = axios.create({
      baseURL: baseUrl || '',
      timeout: 30000,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    });

    this.setupInterceptors();
  }

   setupInterceptors() {
    this.client.interceptors.request.use(
      (reqConfig) => {
        logger.debug(`API Request: ${_optionalChain([reqConfig, 'access', _ => _.method, 'optionalAccess', _2 => _2.toUpperCase, 'call', _3 => _3()])} ${reqConfig.url}`);
        if (this.accessToken) {
          reqConfig.headers['Authorization'] = `Bearer ${this.accessToken}`;
        }
        return reqConfig;
      },
      (error) => {
        logger.error(`API Request Error: ${error.message}`);
        return Promise.reject(error);
      }
    );

    this.client.interceptors.response.use(
      (response) => {
        logger.debug(`API Response: ${response.status} ${response.config.url}`);
        return response;
      },
      (error) => {
        logger.error(`API Response Error: ${error.message}`);
        return Promise.reject(error);
      }
    );
  }

  /**
   * Authenticate with Salesforce using username/password OAuth flow.
   */
  async authenticate(
    loginUrl,
    username,
    password,
    clientId,
    clientSecret
  ) {
    logger.info('Authenticating with Salesforce API');

    const tokenUrl = `${loginUrl}/services/oauth2/token`;
    const params = new URLSearchParams();
    params.append('grant_type', 'password');
    params.append('client_id', clientId);
    params.append('client_secret', clientSecret);
    params.append('username', username);
    params.append('password', password);

    try {
      const response = await axios.post(tokenUrl, params, {
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      });

      this.accessToken = response.data.access_token;
      this.instanceUrl = response.data.instance_url;
      this.client.defaults.baseURL = this.instanceUrl;

      logger.info(`Salesforce authentication successful — instance: ${this.instanceUrl}`);
    } catch (error) {
      logger.error('Salesforce authentication failed');
      throw error;
    }
  }

  getInstanceUrl() {
    return this.instanceUrl;
  }

  getAccessToken() {
    return this.accessToken;
  }

  async getRecord(objectName, recordId, fields = '') {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${recordId}`;
    const reqConfig = {};
    if (fields) {
      reqConfig.params = { fields };
    }
    const response = await this.client.get(url, reqConfig);
    return response.data;
  }

  async createRecord(objectName, data) {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}`;
    const response = await this.client.post(url, data);
    return response.data;
  }

  async updateRecord(objectName, recordId, data) {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${recordId}`;
    await this.client.patch(url, data);
  }

  async deleteRecord(objectName, recordId) {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${recordId}`;
    await this.client.delete(url);
  }

  async query(soql) {
    const url = `${this.instanceUrl}/services/data/v56.0/query`;
    const response = await this.client.get(url, { params: { q: soql } });
    return response.data;
  }

  async queryAll(soql) {
    let allRecords = [];
    let nextRecordsUrl = null;

    do {
      const reqUrl = nextRecordsUrl
        ? `${this.instanceUrl}${nextRecordsUrl}`
        : `${this.instanceUrl}/services/data/v56.0/query?q=${encodeURIComponent(soql)}`;

      const resp = await this.client.get(reqUrl);
      allRecords = allRecords.concat(resp.data.records);
      nextRecordsUrl = resp.data.nextRecordsUrl || null;
    } while (nextRecordsUrl);

    return allRecords;
  }

  async upsertRecord(objectName, externalIdField, externalId, data) {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${externalIdField}/${externalId}`;
    const response = await this.client.patch(url, data);
    return response.data;
  }

  async describeObject(objectName) {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/describe`;
    const response = await this.client.get(url);
    return response.data;
  }

  async getLimits() {
    const url = `${this.instanceUrl}/services/data/v56.0/limits`;
    const response = await this.client.get(url);
    return response.data;
  }

  async executeApexRest(apexPath, data = null, method = 'GET') {
    const url = `${this.instanceUrl}/services/apexrest/${apexPath}`;

    let response;
    switch (method) {
      case 'GET':
        response = await this.client.get(url, data ? { params: data } : undefined);
        break;
      case 'POST':
        response = await this.client.post(url, data);
        break;
      case 'PUT':
        response = await this.client.put(url, data);
        break;
      case 'DELETE':
        response = await this.client.delete(url);
        break;
    }

    return response.data;
  }
}
