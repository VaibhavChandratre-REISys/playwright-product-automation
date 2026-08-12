import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse } from 'axios';
import { logger } from '../utils/logger';

/**
 * Salesforce REST API Client.
 * Ported from POC's SalesforceApiClient.ts (247 lines, proven working).
 * Provides OAuth2 password-flow authentication and CRUD/SOQL/Apex REST methods.
 */
export class SalesforceApiClient {
  private client: AxiosInstance;
  private accessToken: string = '';
  private instanceUrl: string = '';

  constructor(baseUrl?: string) {
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

  private setupInterceptors(): void {
    this.client.interceptors.request.use(
      (reqConfig) => {
        logger.debug(`API Request: ${reqConfig.method?.toUpperCase()} ${reqConfig.url}`);
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
    loginUrl: string,
    username: string,
    password: string,
    clientId: string,
    clientSecret: string
  ): Promise<void> {
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

  getInstanceUrl(): string {
    return this.instanceUrl;
  }

  getAccessToken(): string {
    return this.accessToken;
  }

  async getRecord(objectName: string, recordId: string, fields: string = ''): Promise<any> {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${recordId}`;
    const reqConfig: AxiosRequestConfig = {};
    if (fields) {
      reqConfig.params = { fields };
    }
    const response = await this.client.get(url, reqConfig);
    return response.data;
  }

  async createRecord(objectName: string, data: any): Promise<any> {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}`;
    const response = await this.client.post(url, data);
    return response.data;
  }

  async updateRecord(objectName: string, recordId: string, data: any): Promise<void> {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${recordId}`;
    await this.client.patch(url, data);
  }

  async deleteRecord(objectName: string, recordId: string): Promise<void> {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${recordId}`;
    await this.client.delete(url);
  }

  async query(soql: string): Promise<any> {
    const url = `${this.instanceUrl}/services/data/v56.0/query`;
    const response = await this.client.get(url, { params: { q: soql } });
    return response.data;
  }

  async queryAll(soql: string): Promise<any[]> {
    let allRecords: any[] = [];
    let nextRecordsUrl: string | null = null;

    do {
      const reqUrl: string = nextRecordsUrl
        ? `${this.instanceUrl}${nextRecordsUrl}`
        : `${this.instanceUrl}/services/data/v56.0/query?q=${encodeURIComponent(soql)}`;

      const resp: AxiosResponse = await this.client.get(reqUrl);
      allRecords = allRecords.concat(resp.data.records);
      nextRecordsUrl = resp.data.nextRecordsUrl || null;
    } while (nextRecordsUrl);

    return allRecords;
  }

  async upsertRecord(objectName: string, externalIdField: string, externalId: string, data: any): Promise<any> {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/${externalIdField}/${externalId}`;
    const response = await this.client.patch(url, data);
    return response.data;
  }

  async describeObject(objectName: string): Promise<any> {
    const url = `${this.instanceUrl}/services/data/v56.0/sobjects/${objectName}/describe`;
    const response = await this.client.get(url);
    return response.data;
  }

  async getLimits(): Promise<any> {
    const url = `${this.instanceUrl}/services/data/v56.0/limits`;
    const response = await this.client.get(url);
    return response.data;
  }

  async executeApexRest(apexPath: string, data: any = null, method: 'GET' | 'POST' | 'PUT' | 'DELETE' = 'GET'): Promise<any> {
    const url = `${this.instanceUrl}/services/apexrest/${apexPath}`;

    let response: AxiosResponse;
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

    return response!.data;
  }
}
