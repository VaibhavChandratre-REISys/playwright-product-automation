import { ProjectApiConfig } from './project-api-config';
import { getProject } from '../utils/get-project';
import { logger } from '../utils/logger';

let _cachedConfig: ProjectApiConfig | null = null;

/**
 * Dynamically loads the project-specific API config.
 * Looks for src/<project>/api/api-config.ts exporting a named config.
 *
 * Convention: the export must be named `<project>ApiConfig`
 * (e.g. nysedApiConfig, ksdeApiConfig).
 *
 * If no project config is found, returns a neutral default with empty overrides.
 */
export function getProjectApiConfig(): ProjectApiConfig {
  if (_cachedConfig) return _cachedConfig;

  const project = getProject();

  try {
    // Dynamic require — path resolved relative to project root at runtime
    const configModule = require(`../../${project}/api/api-config`);

    // Look for the named export: <project>ApiConfig
    const configKey = `${project}ApiConfig`;
    const config = configModule[configKey] || configModule.default;

    if (config) {
      logger.info(`Loaded API config for project: ${project}`);
      _cachedConfig = config;
      return config;
    }
  } catch {
    logger.info(`No project-specific API config found for "${project}" — using neutral defaults`);
  }

  // Neutral default — no project-specific fields
  _cachedConfig = {
    defaultOrgName: '',
    indOrgName: '',
    programFields: {},
    budgetPeriodFields: () => ({}),
    awardFromFDMFields: () => ({}),
    directGrantFields: {},
    amendmentDeadlinePastFields: () => ({}),
  };
  return _cachedConfig;
}

/** Reset cached config (useful for testing). */
export function resetProjectApiConfig(): void {
  _cachedConfig = null;
}
