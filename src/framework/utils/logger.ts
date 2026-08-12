type Level = 'info' | 'warn' | 'error' | 'debug';

const COLORS: Record<Level, string> = {
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
class ScenarioLogBuffer {
  private entries: string[] = [];
  private maxEntries = 500;

  push(level: Level, message: string): void {
    const ts = new Date().toISOString();
    this.entries.push(`[${level.toUpperCase()}] ${ts} ${message}`);
    if (this.entries.length > this.maxEntries) {
      this.entries.shift();
    }
  }

  getAll(): string[] {
    return [...this.entries];
  }

  clear(): void {
    this.entries = [];
  }
}

const scenarioBuffer = new ScenarioLogBuffer();

function log(level: Level, message: string): void {
  const prefix = `[${level.toUpperCase()}]`;
  process.stdout.write(`${COLORS[level]}${prefix}${RESET} ${message}\n`);
  scenarioBuffer.push(level, message);
}

export const logger = {
  info: (msg: string) => log('info', msg),
  warn: (msg: string) => log('warn', msg),
  error: (msg: string) => log('error', msg),
  debug: (msg: string) => log('debug', msg),
  /** Get all buffered log entries for the current scenario */
  getScenarioLogs: (): string[] => scenarioBuffer.getAll(),
  /** Clear the buffer (call at scenario start) */
  clearScenarioLogs: () => scenarioBuffer.clear(),
};
