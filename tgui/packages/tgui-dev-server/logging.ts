/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

type Fn = (...args: any[]) => void;

const inception = Date.now();

<<<<<<< HEAD:tgui/packages/tgui-dev-server/logging.js
// Runtime detection
const isNode = process && process.release && process.release.name === 'node';
=======
// Runtime detection. Yes, even in bun!
const isNode = process?.release?.name === 'node';
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/logging.ts
let isChrome = false;
try {
  isChrome = window.navigator.userAgent.toLowerCase().includes('chrome');
} catch {}

// Timestamping function
<<<<<<< HEAD:tgui/packages/tgui-dev-server/logging.js
const getTimestamp = () => {
  const timestamp = String(Date.now() - inception)
    .padStart(4, '0')
    .padStart(7, ' ');
  const seconds = timestamp.substr(0, timestamp.length - 3);
  const millis = timestamp.substr(-3);
=======
function getTimestamp(): string {
  const timestamp = String(Date.now() - inception)
    .padStart(4, '0')
    .padStart(7, ' ');
  const seconds = timestamp.slice(0, timestamp.length - 3);
  const millis = timestamp.slice(-3);

>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/logging.ts
  return `${seconds}.${millis}`;
};

const getPrefix = (() => {
  if (isNode) {
    // Escape sequences
    const ESC = {
      dimmed: '\x1b[38;5;240m',
      bright: '\x1b[37;1m',
      reset: '\x1b[0m',
    };
    return (ns: string) => [
      `${ESC.dimmed}${getTimestamp()} ${ESC.bright}${ns}${ESC.reset}`,
    ];
  }
  if (isChrome) {
    // Styles
    const styles = {
      dimmed: 'color: #888',
      bright: 'font-weight: bold',
    };
    return (ns: string) => [
      `%c${getTimestamp()}%c ${ns}`,
      styles.dimmed,
      styles.bright,
    ];
  }
<<<<<<< HEAD:tgui/packages/tgui-dev-server/logging.js
  // prettier-ignore
  return ns => [
    `${getTimestamp()} ${ns}`,
  ];
})();

/**
 * Creates a logger object.
 */
export const createLogger = (ns) => ({
  log: (...args) => console.log(...getPrefix(ns), ...args),
  trace: (...args) => console.trace(...getPrefix(ns), ...args),
  debug: (...args) => console.debug(...getPrefix(ns), ...args),
  info: (...args) => console.info(...getPrefix(ns), ...args),
  warn: (...args) => console.warn(...getPrefix(ns), ...args),
  error: (...args) => console.error(...getPrefix(ns), ...args),
});

/**
 * Explicitly log with chosen namespace.
 */
export const directLog = (ns, ...args) =>
=======

  return (ns: string) => [`${getTimestamp()} ${ns}`];
})();

/** Creates a logger object. */
export function createLogger(ns: string): Record<string, Fn> {
  return {
    log: (...args) => console.log(...getPrefix(ns), ...args),
    trace: (...args) => console.trace(...getPrefix(ns), ...args),
    debug: (...args) => console.debug(...getPrefix(ns), ...args),
    info: (...args) => console.info(...getPrefix(ns), ...args),
    warn: (...args) => console.warn(...getPrefix(ns), ...args),
    error: (...args) => console.error(...getPrefix(ns), ...args),
  };
}

/** Explicitly log with chosen namespace. */
export function directLog(ns: string, ...args: any[]): void {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129)):tgui/packages/tgui-dev-server/logging.ts
  console.log(...getPrefix(ns), ...args);
