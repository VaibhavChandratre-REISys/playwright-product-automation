/**
 * Centralized project name resolver.
 * Every file that needs the current project name should import this
 * instead of reading process.env['PROJECT'] directly.
 *
 * Throws if PROJECT is not set — no silent fallback to 'nysed'.
 */
export function getProject() {
  const project = process.env['PROJECT'];
  if (!project) {
    throw new Error(
      'Environment variable PROJECT is not set. ' +
      'Run with: cross-env PROJECT=<project> npx cucumber-js ...'
    );
  }
  return project.toLowerCase();
}
