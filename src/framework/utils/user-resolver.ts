import { AppConfig } from '../config/config-schema';

export interface UserCredentials {
  username: string;
  password: string;
  displayName: string;
}

/**
 * Maps the step-level user label (e.g. "Admin", "PM", "EXE") to
 * the credentials loaded from the typed config.
 * Replaces the old UsersAndURL.java getUserName / getPassword switch logic.
 */
export function resolveUser(role: string, config: AppConfig): UserCredentials {
  const key = role.toUpperCase().replace(/\s+/g, '_');

  const map: Record<string, () => UserCredentials> = {
    ADMIN: () => ({
      username: config.ADMIN_USERNAME,
      password: config.ADMIN_PASSWORD,
      displayName: 'Automation ADMIN',
    }),
    ADMIN1: () => ({
      username: config.ADMIN1_USERNAME ?? config.ADMIN_USERNAME,
      password: config.ADMIN1_PASSWORD ?? config.ADMIN_PASSWORD,
      displayName: 'Automation ADMIN1',
    }),
    PM: () => ({
      username: config.PM_USERNAME,
      password: config.PM_PASSWORD,
      displayName: 'Automation PM',
    }),
    PM1: () => ({
      username: config.PM1_USERNAME ?? config.PM_USERNAME,
      password: config.PM1_PASSWORD ?? config.PM_PASSWORD,
      displayName: 'Automation PM1',
    }),
    EXE: () => ({
      username: config.EXE_USERNAME,
      password: config.EXE_PASSWORD,
      displayName: 'Automation EXE',
    }),
    EXE1: () => ({
      username: config.EXE1_USERNAME ?? config.EXE_USERNAME,
      password: config.EXE1_PASSWORD ?? config.EXE_PASSWORD,
      displayName: 'Automation EXE1',
    }),
    FO: () => ({
      username: config.FO_USERNAME,
      password: config.FO_PASSWORD,
      displayName: 'Automation FO',
    }),
    FO1: () => ({
      username: config.FO1_USERNAME ?? config.FO_USERNAME,
      password: config.FO1_PASSWORD ?? config.FO_PASSWORD,
      displayName: 'Automation FO1',
    }),
    PO: () => ({
      username: config.PO_USERNAME ?? config.ADMIN_USERNAME,
      password: config.PO_PASSWORD ?? config.ADMIN_PASSWORD,
      displayName: 'Automation PO',
    }),
    FD: () => ({
      username: config.FD_USERNAME ?? config.ADMIN_USERNAME,
      password: config.FD_PASSWORD ?? config.ADMIN_PASSWORD,
      displayName: 'Automation FD',
    }),
    FD1: () => ({
      username: config.FD1_USERNAME ?? config.ADMIN_USERNAME,
      password: config.FD1_PASSWORD ?? config.ADMIN_PASSWORD,
      displayName: 'Automation FD1',
    }),
    GRANTEE_SC: () => ({
      username: config.GRANTEE_SC_USERNAME ?? '',
      password: config.GRANTEE_SC_PASSWORD ?? '',
      displayName: 'Automation Grantee_SubmitCertify',
    }),
    GRANTEE_LEA: () => ({
      username: config.GRANTEE_LEA_USERNAME ?? '',
      password: config.GRANTEE_LEA_PASSWORD ?? '',
      displayName: 'Automation Grantee_LeaAdmin',
    }),
    GRANTEE_CE: () => ({
      username: config.GRANTEE_CE_USERNAME ?? '',
      password: config.GRANTEE_CE_PASSWORD ?? '',
      displayName: 'Automation Grantee_CreateEdit',
    }),
    GRANTEE_VO: () => ({
      username: config.GRANTEE_VO_USERNAME ?? '',
      password: config.GRANTEE_VO_PASSWORD ?? '',
      displayName: 'Automation Grantee_ViewOnly',
    }),
    IND: () => ({
      username: config.IND_USERNAME ?? config.GRANTEE_SC_USERNAME ?? '',
      password: config.IND_PASSWORD ?? config.GRANTEE_SC_PASSWORD ?? '',
      displayName: 'Automation IND',
    }),
    SPI3: () => ({
      username: config.SPI3_USERNAME ?? '',
      password: config.SPI3_PASSWORD ?? '',
      displayName: 'Automation SPI3',
    }),
    SPI4: () => ({
      username: config.SPI4_USERNAME ?? config.SPI3_USERNAME ?? '',
      password: config.SPI4_PASSWORD ?? config.SPI3_PASSWORD ?? '',
      displayName: 'Automation SPI4',
    }),
    SPA: () => ({
      username: config.SPA_USERNAME ?? '',
      password: config.SPA_PASSWORD ?? '',
      displayName: 'Automation SPA',
    }),
    SA: () => ({
      username: config.SA_USERNAME ?? '',
      password: config.SA_PASSWORD ?? '',
      displayName: 'Automation SA',
    }),
    AUDITOR: () => ({
      username: config.AUDITOR_USERNAME ?? '',
      password: config.AUDITOR_PASSWORD ?? '',
      displayName: 'Automation AUDITOR',
    }),
    SME: () => ({
      username: config.SME_USERNAME ?? '',
      password: config.SME_PASSWORD ?? '',
      displayName: 'Automation SME',
    }),
    SARAH_PM: () => ({
      username: config.PM_USERNAME,
      password: config.PM_PASSWORD,
      displayName: 'Sarah PM',
    }),
    DYNAMICUSER: () => resolveUser(process.env['USER_TYPE'] ?? 'PM', config),
  };

  const factory = map[key];
  if (!factory) {
    throw new Error(`resolveUser: unknown role "${role}". Known roles: [${Object.keys(map).join(', ')}]`);
  }
  return factory();
}
