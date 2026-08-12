/**
 * generate-report.js
 *
 * Builds a clean, focused HTML report for single test case runs.
 * Reads reports/cucumber-report.json → generates reports/html/<run_folder>/index.html
 *
 * Features:
 *   - Test case ID, scenario name, tags shown prominently
 *   - Step-by-step results with pass/fail/skipped badges and duration
 *   - Embedded failure screenshot (full-size, clickable)
 *   - Error message + locator analysis on failure
 *   - Run metadata (timestamp, duration, platform)
 *   - No dashboard/charts clutter — just the test case details
 *
 * Usage:
 *   node scripts/generate-report.js                 — defaults to reports/cucumber-report.json
 *   node scripts/generate-report.js path/to.json    — custom input file
 */

const path = require('path');
const fs = require('fs');
const os = require('os');

// ── resolve input JSON ───────────────────────────────────────────────
const projectName = (process.env.PROJECT || 'nysed').toLowerCase();
const projectLabel = projectName.toUpperCase();

const inputFile = process.argv[2]
  ? path.resolve(process.argv[2])
  : path.resolve(__dirname, '..', 'reports', projectName, 'cucumber-report.json');

if (!fs.existsSync(inputFile)) {
  console.error(`[ERROR] Cucumber JSON not found: ${inputFile}`);
  console.error('   Run your tests first:  npm test  (or  npm run test:tag)');
  process.exit(1);
}

let jsonData;
try {
  const raw = fs.readFileSync(inputFile, 'utf-8').trim();
  jsonData = JSON.parse(raw);
  if (!Array.isArray(jsonData) || jsonData.length === 0) {
    throw new Error('JSON is not a non-empty array');
  }
} catch (e) {
  console.error(`[ERROR] Invalid Cucumber JSON: ${e.message}`);
  process.exit(1);
}

// ── parse all scenarios ──────────────────────────────────────────────
const now = new Date();
const timestamp = now.toISOString().replace(/T/, '_').replace(/[:.]/g, '-').substring(0, 19);
let totalScenarios = 0, passedScenarios = 0, failedScenarios = 0, skippedScenarios = 0;
let totalDurationMs = 0;
const failedNames = [];
const scenarios = [];

jsonData.forEach((feature) => {
  (feature.elements || []).forEach((el) => {
    if (el.type !== 'scenario') return;
    totalScenarios++;

    const steps = (el.steps || []).filter((s) => !s.hidden);
    const hiddenSteps = (el.steps || []).filter((s) => s.hidden);
    const hasFailed = steps.some((s) => s.result && s.result.status === 'failed');
    const allSkipped = steps.every((s) => !s.result || s.result.status === 'skipped' || s.result.status === 'undefined');

    let scenarioStatus = 'passed';
    if (hasFailed) { failedScenarios++; scenarioStatus = 'failed'; failedNames.push(el.name); }
    else if (allSkipped) { skippedScenarios++; scenarioStatus = 'skipped'; }
    else { passedScenarios++; }

    let scenarioDurationMs = 0;
    (el.steps || []).forEach((s) => {
      if (s.result && s.result.duration) {
        scenarioDurationMs += s.result.duration / 1_000_000;
        totalDurationMs += s.result.duration / 1_000_000;
      }
    });

    // Collect tags
    const tags = (el.tags || []).map((t) => t.name);
    const idTags = tags.filter((t) => /^@\d+$/.test(t));

    // Collect embeddings from hidden After hook
    const embeddings = [];
    hiddenSteps.forEach((s) => {
      if (s.embeddings) {
        s.embeddings.forEach((emb) => embeddings.push(emb));
      }
    });

    scenarios.push({
      name: el.name,
      keyword: el.keyword,
      line: el.line,
      tags,
      idTags,
      status: scenarioStatus,
      durationMs: scenarioDurationMs,
      steps: steps.map((s) => ({
        keyword: s.keyword,
        name: s.name,
        status: s.result ? s.result.status : 'undefined',
        durationMs: s.result && s.result.duration ? s.result.duration / 1_000_000 : 0,
        errorMessage: s.result ? s.result.error_message : null,
      })),
      embeddings,
      featureName: feature.name,
      featureUri: feature.uri,
      featureTags: (feature.tags || []).map((t) => t.name),
    });
  });
});

// ── build folder name ────────────────────────────────────────────────
const htmlRoot = path.resolve(__dirname, '..', 'reports', projectName, 'html');
let tagLabel = '';
const tagsEnv = process.env.TAGS || '';
if (tagsEnv) {
  const envIds = [...tagsEnv.matchAll(/@(\d+)/g)].map((m) => m[1]);
  tagLabel = envIds.join('_');
}
if (!tagLabel) {
  const allIds = new Set();
  scenarios.forEach((s) => s.idTags.forEach((t) => allIds.add(t.replace('@', ''))));
  tagLabel = [...allIds].join('_');
}
if (tagLabel.length > 80) tagLabel = tagLabel.substring(0, 80);
const folderName = tagLabel ? `run_${tagLabel}_${timestamp}` : `run_${timestamp}`;
const runDir = path.join(htmlRoot, folderName);
const latestDir = path.join(htmlRoot, 'latest');

// Clean stale root-level files
['assets', 'features', 'index.html'].forEach((stale) => {
  const p = path.join(htmlRoot, stale);
  if (fs.existsSync(p)) fs.rmSync(p, { recursive: true, force: true });
});

fs.mkdirSync(runDir, { recursive: true });
fs.copyFileSync(inputFile, path.join(runDir, 'cucumber-report.json'));

// ── generate HTML ────────────────────────────────────────────────────
const passRate = totalScenarios > 0 ? ((passedScenarios / totalScenarios) * 100).toFixed(1) : '0.0';
const overallStatus = failedScenarios > 0 ? 'FAILED' : 'PASSED';
const durationStr = fmtDur(totalDurationMs);

const html = buildHtml();
fs.writeFileSync(path.join(runDir, 'index.html'), html, 'utf-8');

// ── copy to latest ──────────────────────────────────────────────────
if (fs.existsSync(latestDir)) fs.rmSync(latestDir, { recursive: true, force: true });
copyDirSync(runDir, latestDir);

// ── console ─────────────────────────────────────────────────────────
console.log('');
console.log('================================================================');
console.log(`  GovGrants ${projectLabel} - Test Report                   ` + overallStatus);
console.log('================================================================');
console.log(`  Run       : ${timestamp}`);
console.log(`  Duration  : ${durationStr}`);
console.log(`  Total     : ${totalScenarios}`);
console.log(`  Passed    : ${passedScenarios} (${passRate}%)`);
console.log(`  Failed    : ${failedScenarios}`);
console.log(`  Skipped   : ${skippedScenarios}`);
if (failedNames.length > 0) {
  console.log('  Failed:');
  failedNames.forEach((n) => console.log(`    - ${n}`));
}
console.log('----------------------------------------------------------------');
console.log(`  Latest : reports/html/latest/index.html`);
console.log(`  Run    : reports/html/${folderName}/index.html`);
console.log('================================================================');
console.log('');

// ══════════════════════════════════════════════════════════════════════
//  HTML BUILDER
// ══════════════════════════════════════════════════════════════════════

function buildHtml() {
  const scenarioCards = scenarios.map((sc, idx) => buildScenarioCard(sc, idx)).join('\n');

  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Test Report - ${tagLabel || 'Run'} | GovGrants ${projectLabel}</title>
<style>
  :root {
    --green: #16a34a; --red: #dc2626; --amber: #d97706; --grey: #64748b;
    --bg: #f8fafc; --card: #ffffff; --border: #e2e8f0; --text: #1e293b; --muted: #64748b;
    --blue: #2563eb; --blue-dark: #1e3a5f;
  }
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body { font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif; background: var(--bg); color: var(--text); line-height: 1.5; }

  /* Header */
  .header { background: linear-gradient(135deg, var(--blue-dark), var(--blue)); color: #fff; padding: 20px 32px; }
  .header h1 { font-size: 1.3em; font-weight: 600; }
  .header .subtitle { font-size: 0.85em; opacity: 0.8; margin-top: 2px; }

  /* Summary bar */
  .summary { display: flex; gap: 16px; flex-wrap: wrap; padding: 16px 32px; background: var(--card); border-bottom: 1px solid var(--border); }
  .summary-item { display: flex; flex-direction: column; min-width: 120px; }
  .summary-label { font-size: 0.75em; text-transform: uppercase; letter-spacing: 0.05em; color: var(--muted); font-weight: 600; }
  .summary-value { font-size: 1.1em; font-weight: 600; }
  .summary-value.pass { color: var(--green); }
  .summary-value.fail { color: var(--red); }

  /* Overall badge */
  .overall { display: inline-block; padding: 3px 14px; border-radius: 4px; font-weight: 700; font-size: 0.85em; color: #fff; margin-left: auto; align-self: center; }
  .overall.passed { background: var(--green); }
  .overall.failed { background: var(--red); }

  /* Container */
  .container { max-width: 1200px; margin: 0 auto; padding: 24px 16px; }

  /* Scenario card */
  .scenario-card { background: var(--card); border: 1px solid var(--border); border-radius: 8px; margin-bottom: 24px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.04); }
  .scenario-header { padding: 16px 20px; border-bottom: 1px solid var(--border); display: flex; align-items: flex-start; gap: 12px; }
  .scenario-header.passed { border-left: 4px solid var(--green); }
  .scenario-header.failed { border-left: 4px solid var(--red); }
  .scenario-header.skipped { border-left: 4px solid var(--amber); }
  .scenario-info { flex: 1; }
  .scenario-name { font-size: 1em; font-weight: 600; }
  .scenario-meta { font-size: 0.8em; color: var(--muted); margin-top: 4px; }
  .scenario-badge { padding: 3px 12px; border-radius: 4px; font-weight: 700; font-size: 0.75em; text-transform: uppercase; color: #fff; white-space: nowrap; }
  .scenario-badge.passed { background: var(--green); }
  .scenario-badge.failed { background: var(--red); }
  .scenario-badge.skipped { background: var(--amber); }

  /* Tags */
  .tags { display: flex; flex-wrap: wrap; gap: 4px; margin-top: 6px; }
  .tag { font-size: 0.7em; padding: 2px 8px; border-radius: 3px; background: #e0e7ff; color: #3730a3; font-weight: 500; }
  .tag.id-tag { background: #dbeafe; color: var(--blue); font-weight: 700; font-size: 0.8em; }

  /* Steps table */
  .steps-table { width: 100%; border-collapse: collapse; }
  .steps-table th { background: #f1f5f9; color: var(--muted); font-size: 0.75em; text-transform: uppercase; letter-spacing: 0.04em; padding: 8px 16px; text-align: left; font-weight: 600; }
  .steps-table td { padding: 8px 16px; border-top: 1px solid var(--border); font-size: 0.9em; vertical-align: top; }
  .steps-table tr:hover { background: #f8fafc; }
  .step-num { color: var(--muted); font-size: 0.8em; width: 32px; text-align: center; }
  .step-keyword { color: var(--blue); font-weight: 600; white-space: nowrap; width: 60px; }
  .step-name { font-family: 'Cascadia Code', 'Fira Code', Consolas, monospace; font-size: 0.85em; word-break: break-word; }
  .step-duration { color: var(--muted); font-size: 0.8em; white-space: nowrap; text-align: right; width: 80px; }
  .step-status { width: 70px; text-align: center; }
  .step-badge { display: inline-block; padding: 2px 8px; border-radius: 3px; font-size: 0.7em; font-weight: 700; text-transform: uppercase; color: #fff; }
  .step-badge.passed { background: var(--green); }
  .step-badge.failed { background: var(--red); }
  .step-badge.skipped { background: var(--grey); }
  .step-badge.undefined { background: var(--amber); }

  /* Error block */
  .error-block { margin: 0; padding: 12px 20px; background: #fef2f2; border-top: 1px solid #fecaca; }
  .error-title { font-size: 0.8em; font-weight: 700; color: var(--red); margin-bottom: 6px; text-transform: uppercase; }
  .error-msg { font-family: Consolas, monospace; font-size: 0.8em; color: #991b1b; white-space: pre-wrap; word-break: break-word; max-height: 300px; overflow-y: auto; }

  /* Attachments */
  .attachments { padding: 16px 20px; border-top: 1px solid var(--border); }
  .attach-title { font-size: 0.8em; font-weight: 700; color: var(--muted); text-transform: uppercase; margin-bottom: 8px; }
  .screenshot { max-width: 100%; border: 2px solid var(--border); border-radius: 6px; cursor: pointer; transition: transform 0.2s; }
  .screenshot:hover { transform: scale(1.01); box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
  .text-attach { background: #f8fafc; border: 1px solid var(--border); border-radius: 4px; padding: 10px 14px; font-family: Consolas, monospace; font-size: 0.78em; white-space: pre-wrap; word-break: break-word; margin-top: 8px; max-height: 250px; overflow-y: auto; color: var(--text); }
  .attach-toggle { background: none; border: 1px solid var(--border); border-radius: 4px; padding: 4px 12px; font-size: 0.78em; cursor: pointer; color: var(--blue); margin-top: 8px; }
  .attach-toggle:hover { background: #f0f9ff; }
  .hidden { display: none; }

  /* Footer */
  .footer { text-align: center; padding: 16px; font-size: 0.75em; color: var(--muted); border-top: 1px solid var(--border); margin-top: 32px; }
</style>
</head>
<body>

<div class="header">
  <h1>GovGrants ${projectLabel} - Automation Report</h1>
  <div class="subtitle">${now.toLocaleString()} | ${os.hostname()} | Node ${process.version}</div>
</div>

<div class="summary">
  <div class="summary-item">
    <span class="summary-label">Scenarios</span>
    <span class="summary-value">${totalScenarios}</span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Passed</span>
    <span class="summary-value pass">${passedScenarios}</span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Failed</span>
    <span class="summary-value fail">${failedScenarios}</span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Skipped</span>
    <span class="summary-value">${skippedScenarios}</span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Duration</span>
    <span class="summary-value">${durationStr}</span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Pass Rate</span>
    <span class="summary-value ${failedScenarios > 0 ? 'fail' : 'pass'}">${passRate}%</span>
  </div>
  <span class="overall ${overallStatus.toLowerCase()}">${overallStatus}</span>
</div>

<div class="container">
${scenarioCards}
</div>

<div class="footer">GovGrants ${projectLabel} Playwright Automation | ${now.toLocaleString()}</div>

<script>
function toggleAttach(id) {
  var el = document.getElementById(id);
  el.classList.toggle('hidden');
}
</script>
</body>
</html>`;
}

function buildScenarioCard(sc, idx) {
  // Steps rows
  const stepRows = sc.steps.map((st, i) => {
    const dur = st.durationMs > 0 ? fmtDur(st.durationMs) : '-';
    return `<tr>
      <td class="step-num">${i + 1}</td>
      <td class="step-keyword">${esc(st.keyword.trim())}</td>
      <td class="step-name">${esc(st.name)}</td>
      <td class="step-duration">${dur}</td>
      <td class="step-status"><span class="step-badge ${st.status}">${st.status}</span></td>
    </tr>`;
  }).join('\n');

  // Error messages
  const errors = sc.steps.filter((s) => s.errorMessage).map((s) => {
    // Strip ANSI codes
    const clean = s.errorMessage.replace(/\u001b\[\d+m/g, '');
    return `<div class="error-block">
      <div class="error-title">Error at: ${esc(s.keyword.trim())} ${esc(s.name)}</div>
      <div class="error-msg">${esc(clean)}</div>
    </div>`;
  }).join('\n');

  // Embeddings (screenshot + text)
  let attachHtml = '';
  const screenshots = sc.embeddings.filter((e) => e.mime_type === 'image/png');
  const textAttach = sc.embeddings.filter((e) => e.mime_type === 'text/plain');

  if (screenshots.length > 0 || textAttach.length > 0) {
    let inner = '';
    screenshots.forEach((img) => {
      inner += `<div style="margin-bottom:12px">
        <div class="attach-title">Failure Screenshot</div>
        <a href="data:image/png;base64,${img.data}" target="_blank">
          <img class="screenshot" src="data:image/png;base64,${img.data}" alt="Failure screenshot">
        </a>
      </div>`;
    });

    textAttach.forEach((txt, ti) => {
      const decoded = Buffer.from(txt.data, 'base64').toString('utf-8');
      // Determine label from content
      let label = 'Attachment';
      if (decoded.includes('FAILED STEP:')) label = 'UI State Summary';
      else if (decoded.includes('LOCATOR ANALYSIS')) label = 'Locator Analysis';
      else if (decoded.includes('LIGHTNING NAV BAR')) label = 'Smart DOM';
      else if (decoded.includes('FRAMEWORK LOG')) label = 'Framework Logs';
      const attachId = `attach_${idx}_${ti}`;
      inner += `<button class="attach-toggle" onclick="toggleAttach('${attachId}')">${label}</button>
        <div id="${attachId}" class="text-attach hidden">${esc(decoded)}</div>`;
    });

    attachHtml = `<div class="attachments">${inner}</div>`;
  }

  // Tags
  const tagsHtml = sc.tags.map((t) => {
    const isId = /^@\d+$/.test(t);
    return `<span class="tag ${isId ? 'id-tag' : ''}">${esc(t)}</span>`;
  }).join('');

  return `<div class="scenario-card">
  <div class="scenario-header ${sc.status}">
    <div class="scenario-info">
      <div class="scenario-name">${esc(sc.name)}</div>
      <div class="scenario-meta">${esc(sc.keyword)} | Line ${sc.line} | ${fmtDur(sc.durationMs)} | ${esc(sc.featureUri || '')}</div>
      <div class="tags">${tagsHtml}</div>
    </div>
    <span class="scenario-badge ${sc.status}">${sc.status}</span>
  </div>
  <table class="steps-table">
    <thead><tr><th>#</th><th>Keyword</th><th>Step</th><th>Duration</th><th>Status</th></tr></thead>
    <tbody>${stepRows}</tbody>
  </table>
  ${errors}
  ${attachHtml}
</div>`;
}

// ── helpers ──────────────────────────────────────────────────────────

function fmtDur(ms) {
  if (ms < 1000) return `${Math.round(ms)}ms`;
  const sec = Math.floor(ms / 1000);
  if (sec < 60) return `${sec}s`;
  const min = Math.floor(sec / 60);
  const remSec = sec % 60;
  if (min < 60) return `${min}m ${remSec}s`;
  const hr = Math.floor(min / 60);
  const remMin = min % 60;
  return `${hr}h ${remMin}m ${remSec}s`;
}

function esc(str) {
  if (!str) return '';
  return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function copyDirSync(src, dest) {
  fs.mkdirSync(dest, { recursive: true });
  for (const entry of fs.readdirSync(src, { withFileTypes: true })) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);
    if (entry.isDirectory()) copyDirSync(srcPath, destPath);
    else fs.copyFileSync(srcPath, destPath);
  }
}
