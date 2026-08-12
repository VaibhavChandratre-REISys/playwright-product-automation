import * as fs from 'fs';
import * as path from 'path';
import { logger } from '../utils/logger';
import { getProject } from '../utils/get-project';

/**
 * Java .properties file loader with caching.
 * Reads key=value files from src/{PROJECT}/config/properties/.
 * Adapted from POC's Config.loadProperties() and Java project's runtime behavior.
 */
const propertiesCache = new Map<string, Record<string, string>>();

/**
 * Resolve the project-specific properties directory.
 * PROJECT=nysed → src/nysed/config/properties
 * PROJECT=ksde  → src/ksde/config/properties
 */
function getProjectPropertiesDir(): string {
  const project = getProject();
  return path.resolve(process.cwd(), `src/${project}/config/properties`);
}


/**
 * Load and parse a Java .properties file.
 * @param fileName Name without .properties extension (e.g. "home", "AUTOEnvData")
 * @returns Parsed key-value pairs
 */
export function loadProperties(fileName: string): Record<string, string> {
  const cacheKey = fileName.toLowerCase();

  if (propertiesCache.has(cacheKey)) {
    return propertiesCache.get(cacheKey)!;
  }

  const projectDir = getProjectPropertiesDir();
  const propertiesPath = path.resolve(projectDir, `${fileName}.properties`);

  if (!fs.existsSync(propertiesPath)) {
    throw new Error(
      `Properties file not found: ${propertiesPath}. ` +
      `Ensure src/${getProject()}/config/properties/${fileName}.properties exists.`
    );
  }

  const properties: Record<string, string> = {};
  const content = fs.readFileSync(propertiesPath, 'utf-8');

  content.split('\n').forEach((line) => {
    const trimmedLine = line.trim();
    // Skip comments and empty lines
    if (trimmedLine && !trimmedLine.startsWith('#') && trimmedLine.includes('=')) {
      const eqIndex = trimmedLine.indexOf('=');
      const key = trimmedLine.substring(0, eqIndex).trim();
      const value = trimmedLine.substring(eqIndex + 1).trim();
      if (key) {
        properties[key] = value;
      }
    }
  });

  propertiesCache.set(cacheKey, properties);
  logger.info(`Loaded ${Object.keys(properties).length} properties from ${fileName}.properties`);
  return properties;
}

/**
 * Get a single property value from a named properties file.
 * @param fileName Properties file name (without .properties extension)
 * @param key Property key
 * @returns Property value or empty string if not found
 */
export function getProperty(fileName: string, key: string): string {
  const properties = loadProperties(fileName);
  return properties[key] ?? '';
}

/**
 * Get a property value with a default fallback.
 * @param fileName Properties file name (without .properties extension)
 * @param key Property key
 * @param defaultValue Fallback value if key not found
 * @returns Property value or defaultValue
 */
export function getPropertyWithDefault(fileName: string, key: string, defaultValue: string): string {
  const properties = loadProperties(fileName);
  return properties[key] ?? defaultValue;
}

/**
 * Clear the properties cache (useful for tests or config reload).
 */
export function clearPropertiesCache(): void {
  propertiesCache.clear();
}
