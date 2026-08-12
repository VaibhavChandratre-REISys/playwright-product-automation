import * as fs from 'fs';
import * as path from 'path';
import { logger } from './logger';
import { getProject } from './get-project';

// eslint-disable-next-line @typescript-eslint/no-var-requires
const XLSX = require('xlsx');

const DOWNLOADS_DIR = path.resolve(process.cwd(), 'downloads');

/**
 * Reads an Excel file and returns the data as a 2D string array.
 * Each row is [SubTab, FieldApiName, FieldValue].
 * Requires xlsx package — install with: npm install xlsx
 */
export function readExcelFile(fileName: string, sheetName: string): string[][] {
  try {
    const project = getProject();
    const filePath = path.resolve(`src/${project}/data`, fileName);
    if (!fs.existsSync(filePath)) {
      throw new Error(`Excel file not found: ${filePath}`);
    }
    const workbook = XLSX.readFile(filePath);
    const sheet = workbook.Sheets[sheetName];
    if (!sheet) {
      throw new Error(`Sheet "${sheetName}" not found in ${fileName}`);
    }
    const data: string[][] = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: '' });
    // Skip header row
    return data.slice(1).filter((row: string[]) => row.some((cell: string) => cell && cell.trim()));
  } catch (err: any) {
    if (err.message?.includes('Cannot find module')) {
      throw new Error('xlsx package not installed. Run: npm install xlsx');
    }
    throw err;
  }
}

/**
 * Resolve full path for Excel file in the downloads directory.
 * Mirrors Java: System.getProperty("user.dir") + "/target/download/" + fileName
 */
function resolveDownloadPath(fileName: string): string {
  return path.join(DOWNLOADS_DIR, fileName);
}

/**
 * Delete a row from an Excel file where a column matches a value.
 * Mirrors Java CommonSteps.deleteRowByColumnValue().
 */
export function deleteRowByColumnValue(columnName: string, columnValue: string, fileName: string): void {
  const filePath = resolveDownloadPath(fileName);
  if (!fs.existsSync(filePath)) {
    throw new Error(`File not found: ${filePath}`);
  }
  const workbook = XLSX.readFile(filePath);
  const sheet = workbook.Sheets[workbook.SheetNames[0]];
  const data: any[][] = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: '' });

  if (data.length < 1) {
    throw new Error(`Excel file "${fileName}" is empty or has no header`);
  }

  const headerRow = data[0] as string[];
  const columnIndex = headerRow.findIndex(
    (h: string) => h.trim().toLowerCase() === columnName.trim().toLowerCase()
  );
  if (columnIndex === -1) {
    throw new Error(`Column "${columnName}" not found in Excel file: ${fileName}`);
  }

  let deletedIndex = -1;
  for (let i = 1; i < data.length; i++) {
    const cellVal = String(data[i][columnIndex] ?? '').trim();
    if (cellVal.toLowerCase() === columnValue.trim().toLowerCase()) {
      deletedIndex = i;
      break;
    }
  }

  if (deletedIndex === -1) {
    logger.warn(`No row found with "${columnName}" = "${columnValue}" in "${fileName}"`);
    return;
  }

  data.splice(deletedIndex, 1);

  const newSheet = XLSX.utils.aoa_to_sheet(data);
  workbook.Sheets[workbook.SheetNames[0]] = newSheet;
  XLSX.writeFile(workbook, filePath);
  logger.info(`Deleted row at index ${deletedIndex} from "${fileName}"`);
}

/**
 * Update (or append) a value at a specific row/column in an Excel file.
 * Mirrors Java CommonSteps.updateOrAppendValue().
 * Row and column are 1-indexed from BDD perspective; internally converted to 0-indexed.
 */
export function updateCellValue(value: string, row: number, column: number, fileName: string): void {
  const filePath = resolveDownloadPath(fileName);
  if (!fs.existsSync(filePath)) {
    throw new Error(`File not found: ${filePath}`);
  }
  const workbook = XLSX.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const data: any[][] = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: '' });

  const rowIdx = row - 1;
  const colIdx = column - 1;

  // Ensure the data array is large enough
  while (data.length <= rowIdx) {
    data.push([]);
  }
  const targetRow = data[rowIdx];
  while (targetRow.length <= colIdx) {
    targetRow.push('');
  }

  targetRow[colIdx] = value.trim() === '' ? '' : value;

  const newSheet = XLSX.utils.aoa_to_sheet(data);
  workbook.Sheets[sheetName] = newSheet;
  XLSX.writeFile(workbook, filePath);
  logger.info(`Updated cell [${row},${column}] to "${value}" in "${fileName}"`);
}

/**
 * Assert that a specific cell value matches the expected value.
 * Mirrors Java CommonSteps.validateExactCellValue().
 * Row is 1-indexed (row 1 = first data row after header).
 */
export function assertCellValue(
  rowNumber: number,
  expectedValue: string,
  columnName: string,
  fileName: string
): void {
  const filePath = resolveDownloadPath(fileName);
  if (!fs.existsSync(filePath)) {
    throw new Error(`File not found: ${filePath}`);
  }
  const workbook = XLSX.readFile(filePath);
  const sheet = workbook.Sheets[workbook.SheetNames[0]];
  const data: any[][] = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: '' });

  if (data.length < 1) {
    throw new Error(`Excel file "${fileName}" is empty`);
  }

  const headerRow = data[0] as string[];
  const columnIndex = headerRow.findIndex(
    (h: string) => h.trim().toLowerCase() === columnName.trim().toLowerCase()
  );
  if (columnIndex === -1) {
    throw new Error(`Column "${columnName}" not found in Excel file: ${fileName}`);
  }

  const excelRowIndex = rowNumber; // Row 1 in BDD = index 1 (skip header at 0)
  if (excelRowIndex >= data.length) {
    throw new Error(`Row ${rowNumber} not found in Excel file: ${fileName}`);
  }

  const actualValue = String(data[excelRowIndex][columnIndex] ?? '').trim();
  logger.info(`Excel assertion: Expected="${expectedValue}", Actual="${actualValue}"`);

  if (actualValue !== expectedValue) {
    throw new Error(
      `Expected: "${expectedValue}", but found: "${actualValue}" at row ${rowNumber}, column "${columnName}" in file: ${fileName}`
    );
  }

  logger.info(`Validation passed: Found "${expectedValue}" at row ${rowNumber}, column "${columnName}" in "${fileName}"`);
}

/**
 * Check if a file exists in the downloads directory.
 * Supports exact match or partial name match.
 */
export function verifyFileDownloaded(fileName: string, partialMatch: boolean = false): boolean {
  if (!fs.existsSync(DOWNLOADS_DIR)) {
    logger.warn(`Downloads directory not found: ${DOWNLOADS_DIR}`);
    return false;
  }
  const files = fs.readdirSync(DOWNLOADS_DIR);
  if (partialMatch) {
    return files.some(f => f.includes(fileName));
  }
  return files.some(f => f === fileName);
}

/**
 * Check if a file with a given extension exists in the downloads directory.
 */
export function verifyFileTypeDownloaded(fileType: string): boolean {
  if (!fs.existsSync(DOWNLOADS_DIR)) {
    return false;
  }
  const ext = fileType.startsWith('.') ? fileType : `.${fileType}`;
  const files = fs.readdirSync(DOWNLOADS_DIR);
  return files.some(f => f.toLowerCase().endsWith(ext.toLowerCase()));
}

/**
 * Returns the downloads directory path (creates it if not exists).
 */
export function getDownloadsDir(): string {
  if (!fs.existsSync(DOWNLOADS_DIR)) {
    fs.mkdirSync(DOWNLOADS_DIR, { recursive: true });
  }
  return DOWNLOADS_DIR;
}
