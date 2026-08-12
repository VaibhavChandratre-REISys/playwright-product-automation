import { z } from 'zod';

export const configSchema = z.object({
  PROJECT: z.string().default('nysed'),
  ENV: z.enum(['qa', 'auto', 'ny', 'uat', 'prodcopy', 'merge-grantor']).default('auto'),
  BROWSER: z.enum(['chromium', 'firefox', 'webkit']).default('chromium'),
  HEADLESS: z
    .string()
    .transform((v) => v === 'true')
    .default('false'),
  SLOW_MO: z
    .string()
    .transform((v) => Number(v))
    .default('0'),

  GRANTOR_BASE_URL: z.string().url(),
  GRANTOR_INTERNAL_URL: z.string().url(),
  GRANTEE_PORTAL_URL: z.string().url(),
  GRANTEE_BASE_URL: z.string().url().optional(),
  GRANTEE_INTERNAL_URL: z.string().url().optional(),

  ADMIN_USERNAME: z.string(),
  ADMIN_PASSWORD: z.string(),
  ADMIN1_USERNAME: z.string().optional(),
  ADMIN1_PASSWORD: z.string().optional(),
  PM_USERNAME: z.string(),
  PM_PASSWORD: z.string(),
  PM1_USERNAME: z.string().optional(),
  PM1_PASSWORD: z.string().optional(),
  EXE_USERNAME: z.string(),
  EXE_PASSWORD: z.string(),
  EXE1_USERNAME: z.string().optional(),
  EXE1_PASSWORD: z.string().optional(),
  FO_USERNAME: z.string(),
  FO_PASSWORD: z.string(),
  FO1_USERNAME: z.string().optional(),
  FO1_PASSWORD: z.string().optional(),
  PO_USERNAME: z.string().optional(),
  PO_PASSWORD: z.string().optional(),
  FD_USERNAME: z.string().optional(),
  FD_PASSWORD: z.string().optional(),
  FD1_USERNAME: z.string().optional(),
  FD1_PASSWORD: z.string().optional(),
  GRANTEE_SC_USERNAME: z.string().optional(),
  GRANTEE_SC_PASSWORD: z.string().optional(),
  GRANTEE_LEA_USERNAME: z.string().optional(),
  GRANTEE_LEA_PASSWORD: z.string().optional(),
  GRANTEE_CE_USERNAME: z.string().optional(),
  GRANTEE_CE_PASSWORD: z.string().optional(),
  GRANTEE_VO_USERNAME: z.string().optional(),
  GRANTEE_VO_PASSWORD: z.string().optional(),

  // Product-specific grantee roles (optional — only needed when PROJECT=product)
  GRANTEE_ADMIN_USERNAME: z.string().optional(),
  GRANTEE_ADMIN_PASSWORD: z.string().optional(),
  GRANTEE_ADMIN1_USERNAME: z.string().optional(),
  GRANTEE_ADMIN1_PASSWORD: z.string().optional(),
  GRANTEE_ADMIN2_USERNAME: z.string().optional(),
  GRANTEE_ADMIN2_PASSWORD: z.string().optional(),
  GRANTEE_PM_USERNAME: z.string().optional(),
  GRANTEE_PM_PASSWORD: z.string().optional(),
  GRANTEE_EXE_USERNAME: z.string().optional(),
  GRANTEE_EXE_PASSWORD: z.string().optional(),
  GRANTEE_EXE1_USERNAME: z.string().optional(),
  GRANTEE_EXE1_PASSWORD: z.string().optional(),
  GRANTEE_FO_USERNAME: z.string().optional(),
  GRANTEE_FO_PASSWORD: z.string().optional(),
  GRANTEE_FD_USERNAME: z.string().optional(),
  GRANTEE_FD_PASSWORD: z.string().optional(),
  GRANTEE_PO_USERNAME: z.string().optional(),
  GRANTEE_PO_PASSWORD: z.string().optional(),
  GRANTEE_AUDITOR_USERNAME: z.string().optional(),
  GRANTEE_AUDITOR_PASSWORD: z.string().optional(),
  SARAH_PM_USERNAME: z.string().optional(),
  SARAH_PM_PASSWORD: z.string().optional(),

  // KSDE-specific roles (optional — only needed when PROJECT=ksde)
  SPI3_USERNAME: z.string().optional(),
  SPI3_PASSWORD: z.string().optional(),
  SPA_USERNAME: z.string().optional(),
  SPA_PASSWORD: z.string().optional(),
  SA_USERNAME: z.string().optional(),
  SA_PASSWORD: z.string().optional(),
  AUDITOR_USERNAME: z.string().optional(),
  AUDITOR_PASSWORD: z.string().optional(),
  SME_USERNAME: z.string().optional(),
  SME_PASSWORD: z.string().optional(),
  SPI4_USERNAME: z.string().optional(),
  SPI4_PASSWORD: z.string().optional(),
  IND_USERNAME: z.string().optional(),
  IND_PASSWORD: z.string().optional(),

  DEFAULT_TIMEOUT_MS: z
    .string()
    .transform((v) => Number(v))
    .default('30000'),

  // Salesforce API OAuth credentials (Phase 2 — optional until API layer is wired)
  SF_LOGIN_URL: z.string().default('https://test.salesforce.com'),
  SF_CLIENT_ID: z.string().optional(),
  SF_CLIENT_SECRET: z.string().optional(),
  SF_API_USERNAME: z.string().optional(),
  SF_API_PASSWORD: z.string().optional(),

  // JWT Authentication (MFA-proof login via OAuth 2.0 JWT Bearer flow)
  SF_AUTH_MODE: z.enum(['jwt', 'password']).default('jwt'),
  SF_CONSUMER_KEY: z.string().optional(),
  SF_PRIVATE_KEY_PATH: z.string().optional(),
});

export type AppConfig = z.infer<typeof configSchema>;
