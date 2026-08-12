import { Given } from '@cucumber/cucumber';

import { GrantorApiService } from '../api/grantor-api-service';
import { logger } from '../utils/logger';

Given(
  /^I activated standalone subaward "([^"]*)" with properties "([^"]*)" of type "([^"]*)"$/,
  async function ( grantName, filter, type) {
    const resolvedGrantName = this.savedValues.resolve(grantName);
    const randomNumber = Math.floor(Math.random() * 900000000) + 100000000;
    const newGrantName = `${resolvedGrantName}${randomNumber}`;
    
    logger.info(`[API] Activating standalone subaward: ${newGrantName} (filter: ${filter}, type: ${type})`);
    
    this.savedValues.set(grantName, newGrantName);
    
    const apiService = new GrantorApiService(this.savedValues);
    await apiService.authenticate();
    await apiService.activateSubaward(newGrantName, filter, type);
    
    logger.info(`[API] Subaward activated successfully: ${newGrantName}`);
  }
);
