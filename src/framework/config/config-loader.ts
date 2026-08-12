import * as path from 'path';
import * as dotenv from 'dotenv';
import { configSchema, AppConfig } from './config-schema';
import { getProject } from '../utils/get-project';

let _config: AppConfig | null = null;

/**
 * Loads and validates the environment config once, caches it.
 * Reads from .env.<ENV> file, where ENV is set via the ENV environment variable.
 */
export function getConfig(): AppConfig {
  if (_config) return _config;

  const project = getProject();
  const env = (process.env['ENV'] ?? 'auto').toLowerCase();

  const envFile = path.resolve(__dirname, `../../../envs/${project}/.env.${env}`);
  dotenv.config({ path: envFile });

  const result = configSchema.safeParse(process.env);
  if (!result.success) {
    const issues = result.error.issues
      .map((i) => `  [${i.path.join('.')}] ${i.message}`)
      .join('\n');
    throw new Error(`Config validation failed for env "${env}":\n${issues}`);
  }

  _config = result.data;
  return _config;
}
