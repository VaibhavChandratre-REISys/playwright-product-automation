
import { logger } from '../utils/logger';

import { jwtLogin } from './jwt-login.strategy';
import { passwordLogin } from './password-login.strategy';

/**
 * Dispatches login to the appropriate strategy based on:
 *   1. SF_AUTH_MODE (jwt | password)
 *   2. Grantor vs Grantee — grantee logins ALWAYS use password
 *
 * Grantor/Grantee detection: grantee URLs contain '.site.com' or 'recipient'.
 * This matches the resolveBaseUrl() logic in login-steps.ts.
 */
export async function dispatchLogin(
  page,
  baseUrl,
  username,
  password,
  config
) {
  const isGrantee =
    baseUrl.includes('.site.com') || baseUrl.includes('recipient');

  const useJwt = config.SF_AUTH_MODE === 'jwt' && !isGrantee;

  if (useJwt) {
    if (!config.SF_CONSUMER_KEY || !config.SF_PRIVATE_KEY_PATH) {
      throw new Error(
        'SF_AUTH_MODE=jwt but SF_CONSUMER_KEY or SF_PRIVATE_KEY_PATH missing in .env file.\n' +
        'Set SF_AUTH_MODE=password to use legacy login, or provide JWT config.'
      );
    }
    logger.info(`[AUTH] Mode: JWT | User: ${username}`);
    await jwtLogin(page, username, config);
  } else {
    const reason = isGrantee ? 'grantee/portal login' : 'SF_AUTH_MODE=password';
    logger.info(`[AUTH] Mode: PASSWORD (${reason}) | User: ${username}`);
    await passwordLogin(page, baseUrl, username, password);
  }
}
