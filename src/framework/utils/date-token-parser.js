/**
 * Ports Java TypeRegistryConfiguration.parseDate() to TypeScript.
 * Resolves {Date:<JavaDateTimeFormatterPattern>::<modifiers>} tokens used
 * throughout feature files, e.g. {Date:M/d/yyyy::d+50} or {Date:M/d/uuuu}.
 *
 * Modifiers are a semicolon-separated list of "<char><action><integer>",
 * applied left-to-right against the current date/time.
 *   Chars:   n=nanosecond(ignored, ms granularity), s=second, m=minute,
 *            H/h=hour, D/d=day, M/L=month, Y/y/u=year
 *   Actions: + add, - subtract, = set absolute value
 */



const UNIT_MS = {
  n: 1e-6, // nanoseconds -> ms (best effort; JS Date has ms resolution)
  s: 1000,
  m: 60000,
  H: 3600000,
  h: 3600000,
};

function applyModifier(date, modifier) {
  const trimmed = modifier.replace(/\s+/g, '');
  const char = trimmed.substring(0, 1) ;
  const action = trimmed.substring(1, 2);
  const amount = parseInt(trimmed.substring(2), 10);

  if (Number.isNaN(amount)) {
    throw new Error(`Date modifier "${modifier}" is not formatted correctly. Expected "<char><+/-/=><integer>".`);
  }

  const result = new Date(date.getTime());

  switch (char) {
    case 'D':
    case 'd':
      if (action === '=') result.setDate(amount);
      else if (action === '+') result.setDate(result.getDate() + amount);
      else if (action === '-') result.setDate(result.getDate() - amount);
      break;
    case 'M':
    case 'L':
      if (action === '=') result.setMonth(amount - 1);
      else if (action === '+') result.setMonth(result.getMonth() + amount);
      else if (action === '-') result.setMonth(result.getMonth() - amount);
      break;
    case 'Y':
    case 'y':
    case 'u':
      if (action === '=') result.setFullYear(amount);
      else if (action === '+') result.setFullYear(result.getFullYear() + amount);
      else if (action === '-') result.setFullYear(result.getFullYear() - amount);
      break;
    case 'H':
    case 'h':
      if (action === '=') result.setHours(amount);
      else if (action === '+') result.setHours(result.getHours() + amount);
      else if (action === '-') result.setHours(result.getHours() - amount);
      break;
    case 'm':
      if (action === '=') result.setMinutes(amount);
      else if (action === '+') result.setMinutes(result.getMinutes() + amount);
      else if (action === '-') result.setMinutes(result.getMinutes() - amount);
      break;
    case 's':
      if (action === '=') result.setSeconds(amount);
      else if (action === '+') result.setSeconds(result.getSeconds() + amount);
      else if (action === '-') result.setSeconds(result.getSeconds() - amount);
      break;
    case 'n':
      // Nanosecond-level modification is not meaningfully supported at JS ms resolution — no-op.
      break;
    default:
      throw new Error(`"${char}" is not a valid date format specifier.`);
  }

  if (action !== '+' && action !== '-' && action !== '=') {
    throw new Error(`"${modifier}" is not formatted correctly. Second character must be '=', '-', or '+'.`);
  }

  return result;
}

const MONTH_NAMES_SHORT = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const MONTH_NAMES_LONG = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];
const DAY_NAMES_SHORT = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
const DAY_NAMES_LONG = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

function pad(num, len) {
  return String(num).padStart(len, '0');
}

/**
 * Formats a Date using a (subset of) Java DateTimeFormatter pattern syntax.
 * Supports: yyyy/uuuu/yy, M/MM/MMM/MMMM/L, d/dd, E/EEE/EEEE, H/HH, h/hh, m/mm, s/ss, a.
 * Any literal characters (e.g. "/", ",", " ", ":") pass through unchanged.
 */
function formatJavaPattern(date, pattern) {
  let result = '';
  let i = 0;
  while (i < pattern.length) {
    const ch = pattern[i];
    // Count run-length of repeated pattern letter
    let run = 1;
    while (pattern[i + run] === ch) run++;
    const token = ch.repeat(run);

    switch (ch) {
      case 'y':
      case 'u': {
        const year = date.getFullYear();
        result += run <= 2 ? pad(year % 100, 2) : pad(year, run);
        break;
      }
      case 'M':
      case 'L': {
        const month = date.getMonth();
        if (run >= 4) result += MONTH_NAMES_LONG[month];
        else if (run === 3) result += MONTH_NAMES_SHORT[month];
        else result += pad(month + 1, run);
        break;
      }
      case 'd':
        result += pad(date.getDate(), run);
        break;
      case 'E': {
        const day = date.getDay();
        result += run >= 4 ? DAY_NAMES_LONG[day] : DAY_NAMES_SHORT[day];
        break;
      }
      case 'H':
        result += pad(date.getHours(), run);
        break;
      case 'h': {
        const h12 = date.getHours() % 12 || 12;
        result += pad(h12, run);
        break;
      }
      case 'm':
        result += pad(date.getMinutes(), run);
        break;
      case 's':
        result += pad(date.getSeconds(), run);
        break;
      case 'a':
        result += date.getHours() < 12 ? 'AM' : 'PM';
        break;
      case "'": {
        // Literal text escape, e.g. 'T' — consume until closing quote
        let j = i + 1;
        let literal = '';
        while (j < pattern.length && pattern[j] !== "'") {
          literal += pattern[j];
          j++;
        }
        result += literal || "'";
        i = j + 1;
        continue;
      }
      default:
        // Any other character (including punctuation) is literal
        result += token;
    }
    i += run;
  }
  return result;
}

/**
 * Parses "<pattern>::<modifiers>" (modifiers optional) and returns the
 * formatted, offset date string. Mirrors Java parseDate().
 */
export function parseDateToken(dateFormatter) {
  const parts = dateFormatter.split('::');
  const pattern = parts[0];
  let date = new Date();

  if (parts.length > 1 && parts[1].length > 0) {
    for (const modifier of parts[1].split(';')) {
      if (modifier.trim().length === 0) continue;
      date = applyModifier(date, modifier);
    }
  }

  return formatJavaPattern(date, pattern);
}
