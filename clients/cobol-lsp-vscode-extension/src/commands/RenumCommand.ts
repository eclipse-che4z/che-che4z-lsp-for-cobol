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
const validReg = /^[0-9 ]*$/;

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

export type RenumEditor = {
  document: {
    lineCount: number;
    lineAt: (n: number) => {
      text: string;
    };
  };
  revealRange: (range: vscode.Range) => void;
  selection: vscode.Selection;
};

/**
 * Renumber 1-7 or 73-80 columns in active editor.
 *
 * @param editor RenumEditor
 * @param edit  vscode.TextEditorEdit
 * @param params  RenumberParameters
 */
export function renumberLines(
  editor: RenumEditor,
  edit: vscode.TextEditorEdit,
  params: RenumberParameters,
) {
  const lineCount = editor.document.lineCount;
  if (lineCount > maxLines) {
    vscode.window.showErrorMessage(
      "Renumber sequential numbers is not possible above 999999 lines",
    );
    return;
  }

  if (!checkAlien(editor, params)) return;

  for (let i = 0; i < lineCount; i++) {
    const line = editor.document.lineAt(i);
    const text = line.text;
    const pad = calculatePadding(params.digits, lineCount);
    let value = getSequentialNumber(i, params.digits, pad);
    const range = new vscode.Range(
      new vscode.Position(i, Math.min(text.length, params.start)),
      new vscode.Position(i, params.end),
    );
    if (text.length <= params.start) {
      const padLength = params.start - text.length;
      value = " ".repeat(padLength).concat(value);
    }
    edit.replace(range, value);
  }
}
/**
 * Remove sequential numbers at 1-7 or 73-80 columns in active editor.
 *
 * @param editor RenumEditor
 * @param edit  vscode.TextEditorEdit
 * @param params  RenumberParameters
 */
export function unNumberLines(
  editor: RenumEditor,
  edit: vscode.TextEditorEdit,
  params: RenumberParameters,
) {
  if (!checkAlien(editor, params)) return;

  for (let i = 0; i < editor.document.lineCount; i++) {
    const text = editor.document.lineAt(i).text;
    if (text.substring(params.start, params.end).trim() !== "") {
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

export function calculatePadding(digits: number, lineCount: number) {
  let shift = 3;
  if (digits === 6) {
    shift = 2;
    if (lineCount > 9999) shift = 1;
    if (lineCount > 99999) shift = 0;
  }
  return digits - shift;
}

export function checkAlien(
  editor: RenumEditor,
  params: RenumberParameters,
): boolean {
  for (let i = 0; i < editor.document.lineCount; i++) {
    const text = editor.document.lineAt(i).text;
    const res = validReg.test(text.substring(params.start, params.end));
    if (!res) {
      vscode.window
        .showErrorMessage(
          "Renumber/unnumber sequential numbers is not possible on non numeric lines",
          "Go to line",
        )
        .then((selection) => {
          if (selection === "Go to line") {
            const pos = new vscode.Position(i, params.start);
            editor.selection = new vscode.Selection(pos, pos);
            editor.revealRange(new vscode.Range(pos, pos));
          }
        });
      return false;
    }
  }
  return true;
}
