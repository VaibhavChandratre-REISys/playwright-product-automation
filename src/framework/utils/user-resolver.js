 function _nullishCoalesce(lhs, rhsFn) { if (lhs != null) { return lhs; } else { return rhsFn(); } }







/**
 * Maps the step-level user label (e.g. "Admin", "PM", "EXE") to
 * the credentials loaded from the typed config.
 * Replaces the old UsersAndURL.java getUserName / getPassword switch logic.
 */
export function resolveUser(role, config) {
  const key = role.toUpperCase().replace(/\s+/g, '_');

  const map = {
    ADMIN: () => ({
      username: config.ADMIN_USERNAME,
      password: config.ADMIN_PASSWORD,
      displayName: 'Automation ADMIN',
    }),
    ADMIN1: () => ({
      username: _nullishCoalesce(config.ADMIN1_USERNAME, () => ( config.ADMIN_USERNAME)),
      password: _nullishCoalesce(config.ADMIN1_PASSWORD, () => ( config.ADMIN_PASSWORD)),
      displayName: 'Automation ADMIN1',
    }),
    PM: () => ({
      username: config.PM_USERNAME,
      password: config.PM_PASSWORD,
      displayName: 'Automation PM',
    }),
    PM1: () => ({
      username: _nullishCoalesce(config.PM1_USERNAME, () => ( config.PM_USERNAME)),
      password: _nullishCoalesce(config.PM1_PASSWORD, () => ( config.PM_PASSWORD)),
      displayName: 'Automation PM1',
    }),
    EXE: () => ({
      username: config.EXE_USERNAME,
      password: config.EXE_PASSWORD,
      displayName: 'Automation EXE',
    }),
    EXE1: () => ({
      username: _nullishCoalesce(config.EXE1_USERNAME, () => ( config.EXE_USERNAME)),
      password: _nullishCoalesce(config.EXE1_PASSWORD, () => ( config.EXE_PASSWORD)),
      displayName: 'Automation EXE1',
    }),
    FO: () => ({
      username: config.FO_USERNAME,
      password: config.FO_PASSWORD,
      displayName: 'Automation FO',
    }),
    FO1: () => ({
      username: _nullishCoalesce(config.FO1_USERNAME, () => ( config.FO_USERNAME)),
      password: _nullishCoalesce(config.FO1_PASSWORD, () => ( config.FO_PASSWORD)),
      displayName: 'Automation FO1',
    }),
    PO: () => ({
      username: _nullishCoalesce(config.PO_USERNAME, () => ( config.ADMIN_USERNAME)),
      password: _nullishCoalesce(config.PO_PASSWORD, () => ( config.ADMIN_PASSWORD)),
      displayName: 'Automation PO',
    }),
    FD: () => ({
      username: _nullishCoalesce(config.FD_USERNAME, () => ( config.ADMIN_USERNAME)),
      password: _nullishCoalesce(config.FD_PASSWORD, () => ( config.ADMIN_PASSWORD)),
      displayName: 'Automation FD',
    }),
    FD1: () => ({
      username: _nullishCoalesce(config.FD1_USERNAME, () => ( config.ADMIN_USERNAME)),
      password: _nullishCoalesce(config.FD1_PASSWORD, () => ( config.ADMIN_PASSWORD)),
      displayName: 'Automation FD1',
    }),
    GRANTEE_SC: () => ({
      username: _nullishCoalesce(config.GRANTEE_SC_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.GRANTEE_SC_PASSWORD, () => ( '')),
      displayName: 'Automation Grantee_SubmitCertify',
    }),
    GRANTEE_LEA: () => ({
      username: _nullishCoalesce(config.GRANTEE_LEA_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.GRANTEE_LEA_PASSWORD, () => ( '')),
      displayName: 'Automation Grantee_LeaAdmin',
    }),
    GRANTEE_CE: () => ({
      username: _nullishCoalesce(config.GRANTEE_CE_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.GRANTEE_CE_PASSWORD, () => ( '')),
      displayName: 'Automation Grantee_CreateEdit',
    }),
    GRANTEE_VO: () => ({
      username: _nullishCoalesce(config.GRANTEE_VO_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.GRANTEE_VO_PASSWORD, () => ( '')),
      displayName: 'Automation Grantee_ViewOnly',
    }),
    IND: () => ({
      username: _nullishCoalesce(_nullishCoalesce(config.IND_USERNAME, () => ( config.GRANTEE_SC_USERNAME)), () => ( '')),
      password: _nullishCoalesce(_nullishCoalesce(config.IND_PASSWORD, () => ( config.GRANTEE_SC_PASSWORD)), () => ( '')),
      displayName: 'Automation IND',
    }),
    SPI3: () => ({
      username: _nullishCoalesce(config.SPI3_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.SPI3_PASSWORD, () => ( '')),
      displayName: 'Automation SPI3',
    }),
    SPI4: () => ({
      username: _nullishCoalesce(_nullishCoalesce(config.SPI4_USERNAME, () => ( config.SPI3_USERNAME)), () => ( '')),
      password: _nullishCoalesce(_nullishCoalesce(config.SPI4_PASSWORD, () => ( config.SPI3_PASSWORD)), () => ( '')),
      displayName: 'Automation SPI4',
    }),
    SPA: () => ({
      username: _nullishCoalesce(config.SPA_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.SPA_PASSWORD, () => ( '')),
      displayName: 'Automation SPA',
    }),
    SA: () => ({
      username: _nullishCoalesce(config.SA_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.SA_PASSWORD, () => ( '')),
      displayName: 'Automation SA',
    }),
    AUDITOR: () => ({
      username: _nullishCoalesce(config.AUDITOR_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.AUDITOR_PASSWORD, () => ( '')),
      displayName: 'Automation AUDITOR',
    }),
    SME: () => ({
      username: _nullishCoalesce(config.SME_USERNAME, () => ( '')),
      password: _nullishCoalesce(config.SME_PASSWORD, () => ( '')),
      displayName: 'Automation SME',
    }),
    SARAH_PM: () => ({
      username: config.PM_USERNAME,
      password: config.PM_PASSWORD,
      displayName: 'Sarah PM',
    }),
    DYNAMICUSER: () => resolveUser(_nullishCoalesce(process.env['USER_TYPE'], () => ( 'PM')), config),
  };

  const factory = map[key];
  if (!factory) {
    throw new Error(`resolveUser: unknown role "${role}". Known roles: [${Object.keys(map).join(', ')}]`);
  }
  return factory();
}
