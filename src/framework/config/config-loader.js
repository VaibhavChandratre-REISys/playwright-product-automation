 function _nullishCoalesce(lhs, rhsFn) { if (lhs != null) { return lhs; } else { return rhsFn(); } }import * as fs from 'fs';
import * as path from 'path';
import * as dotenv from 'dotenv';
import { configSchema, } from './config-schema';
import { getProject } from '../utils/get-project';

let _config = null;

export function resolveEnvironmentFile(project, environment) {
  const injectedFile = process.env['CONFIG_ENV_FILE'];
  if (injectedFile) {
    const resolvedFile = path.resolve(injectedFile);
    if (!fs.existsSync(resolvedFile)) {
      throw new Error(`CONFIG_ENV_FILE does not exist: ${resolvedFile}`);
    }
    return resolvedFile;
  }

  const envFileName = environment === 'afsauto-grantor' ? 'afs-grantor' : environment;
  const envRoot = path.resolve(__dirname, '../../../envs');
  const preferredFile = path.resolve(envRoot, project, `.env.${envFileName}`);
  if (fs.existsSync(preferredFile)) return preferredFile;

  const matches = fs.readdirSync(envRoot, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .map((entry) => path.resolve(envRoot, entry.name, `.env.${envFileName}`))
    .filter((file) => fs.existsSync(file));

  if (matches.length === 1) return matches[0];
  if (matches.length > 1) {
    throw new Error(`Multiple environment files found for "${environment}": ${matches.join(', ')}`);
  }
  return preferredFile;
}

/**
 * Loads and validates the environment config once, caches it.
 * Reads from .env.<ENV> file, where ENV is set via the ENV environment variable.
 */
export function getConfig() {
  if (_config) return _config;

  const project = getProject();
  const env = (_nullishCoalesce(process.env['ENV'], () => ( 'auto'))).toLowerCase();
  const envFile = resolveEnvironmentFile(project, env);
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
