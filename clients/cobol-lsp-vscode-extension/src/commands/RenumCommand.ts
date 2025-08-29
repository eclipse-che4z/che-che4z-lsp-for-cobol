/*
 * Copyright (c) 2025 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
import * as vscode from "vscode";

export interface RenumberParameters {
  start: number;
  end: number;
  digits: number;
}

const maxLines = 999999;

export const RENUM_LEFT: RenumberParameters = {
  start: 0,
  end: 6,
  digits: 6,
};
export const RENUM_RIGHT: RenumberParameters = {
  start: 72,
  end: 80,
  digits: 8,
};

/**
 * Renumber 1-7 or 73-80 columns in active editor.
 *
 * @param document vscode.TextDocument
 * @param edit  vscode.TextEditorEdit
 * @param params  RenumberParameters
 */
export function renumberLines(
  document: vscode.TextDocument,
  edit: vscode.TextEditorEdit,
  params: RenumberParameters,
) {
  const lineCount = document.lineCount;
  if (lineCount > maxLines) return;
  let shift = 3;
  if (params.digits === 6) {
    shift = 2;
    if (lineCount > 9999) shift = 1;
    if (lineCount > 99999) shift = 0;
  }
  const pad = params.digits - shift;
  for (let i = 0; i < lineCount; i++) {
    const line = document.lineAt(i);
    const text = line.text;

    const value = getSequentialNumber(i, params.digits, pad);
    const range = new vscode.Range(
      new vscode.Position(i, params.start),
      new vscode.Position(i, params.end),
    );
    if (text.length <= params.start) {
      const padLength = params.start - text.length;
      const placeholderRange = new vscode.Position(i, text.length);
      edit.replace(placeholderRange, " ".repeat(padLength));
    }
    if (document.lineAt(i).text.charAt(params.start) != "*") {
      edit.replace(range, value);
    }
  }
}
/**
 * Remove sequential numbers at 1-7 or 73-80 columns in active editor.
 *
 * @param activeEditor vscode.TextDocument
 * @param edit  vscode.TextEditorEdit
 * @param params  RenumberParameters
 */
export function unNumberLines(
  document: vscode.TextDocument,
  edit: vscode.TextEditorEdit,
  params: RenumberParameters,
) {
  for (let i = 0; i < document.lineCount; i++) {
    const text = document.lineAt(i).text;
    if (
      text.charAt(params.start) != "*" &&
      text.substring(params.start, params.end).trim() !== ""
    ) {
      const range = new vscode.Range(
        new vscode.Position(i, params.start),
        new vscode.Position(i, params.end),
      );
      edit.replace(range, " ".repeat(params.end - params.start));
    }
  }
}

export function getSequentialNumber(
  line: number,
  digits: number,
  pad: number,
): string {
  return (line + 1).toString().padStart(pad, "0").padEnd(digits, "0");
}
