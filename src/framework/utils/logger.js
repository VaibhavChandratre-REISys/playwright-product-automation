

const COLORS = {
  info: '\x1b[36m',
  warn: '\x1b[33m',
  error: '\x1b[31m',
  debug: '\x1b[90m',
};
const RESET = '\x1b[0m';

/**
 * Per-scenario log buffer.
 * Captures all framework log entries during a scenario run so they can
 * be included in the diagnostic bundle on failure.
 */
class ScenarioLogBuffer {constructor() { ScenarioLogBuffer.prototype.__init.call(this);ScenarioLogBuffer.prototype.__init2.call(this); }
   __init() {this.entries = []}
   __init2() {this.maxEntries = 500}

  push(level, message) {
    const ts = new Date().toISOString();
    this.entries.push(`[${level.toUpperCase()}] ${ts} ${message}`);
    if (this.entries.length > this.maxEntries) {
      this.entries.shift();
    }
  }

  getAll() {
    return [...this.entries];
  }

  clear() {
    this.entries = [];
  }
}

const scenarioBuffer = new ScenarioLogBuffer();

function log(level, message) {
  const prefix = `[${level.toUpperCase()}]`;
  process.stdout.write(`${COLORS[level]}${prefix}${RESET} ${message}\n`);
  scenarioBuffer.push(level, message);
}

export const logger = {
  info: (msg) => log('info', msg),
  warn: (msg) => log('warn', msg),
  error: (msg) => log('error', msg),
  debug: (msg) => log('debug', msg),
  /** Get all buffered log entries for the current scenario */
  getScenarioLogs: () => scenarioBuffer.getAll(),
  /** Clear the buffer (call at scenario start) */
  clearScenarioLogs: () => scenarioBuffer.clear(),
};
