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
 *   Broadcom - initial API and implementation
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

export type RenumDocument = {
  lineCount: number;
  lineAt: (n: number) => {
    text: string;
  };
};
export type RenumEditor = {
  revealRange: (range: vscode.Range) => void;
  selection: vscode.Selection;
};
/**
 * Renumber 1-7 or 73-80 columns in active editor.
 *
 * @param editor RenumDocument
 * @param edit  vscode.TextEditorEdit
 * @param params  RenumberParameters
 */
export function renumberLines(
  document: RenumDocument,
  edit: vscode.TextEditorEdit,
  params: RenumberParameters,
) {
  const lineCount = document.lineCount;
  if (lineCount > maxLines) {
    vscode.window.showErrorMessage(
      "Renumber sequential numbers is not possible above 999999 lines",
    );
    return;
  }

  const pad = calculatePadding(params.digits, lineCount);
  for (let i = 0; i < lineCount; i++) {
    const line = document.lineAt(i);
    const text = line.text;
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
 * @param document RenumDocument
 * @param edit  vscode.TextEditorEdit
 * @param params  RenumberParameters
 */
export function unNumberLines(
  document: RenumDocument,
  edit: vscode.TextEditorEdit,
  params: RenumberParameters,
) {
  for (let i = 0; i < document.lineCount; i++) {
    const text = document.lineAt(i).text;
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

export function findIncompatibleLine(
  document: RenumDocument,
  params: RenumberParameters,
): vscode.Position | undefined {
  for (let i = 0; i < document.lineCount; i++) {
    const text = document.lineAt(i).text;
    const res = validReg.test(text.substring(params.start, params.end));
    if (!res) return new vscode.Position(i, params.start);
  }
}

export function RenumHandler(
  editor: vscode.TextEditor,
  edit: vscode.TextEditorEdit,
  renum: boolean,
  param: RenumberParameters,
) {
  if (!renum) {
    unNumberLines(editor.document, edit, param);
    vscode.window.showInformationMessage(
      `Unnumber successful for columns ${param.start}-${param.end}`,
    );
    return;
  }

  const incompatible = findIncompatibleLine(editor.document, param);
  if (incompatible) {
    reportIncompatibleLine(editor, incompatible);
  } else {
    renumberLines(editor.document, edit, param);
    vscode.window.showInformationMessage(
      `Renumber successful for columns ${param.start}-${param.end}`,
    );
  }
}

export function reportIncompatibleLine(
  editor: RenumEditor,
  position: vscode.Position,
) {
  vscode.window
    .showErrorMessage(
      "Renumbering sequential numbers is not possible on non-numeric lines",
      "Go to line",
    )
    .then((selection) => {
      if (selection === "Go to line") {
        editor.selection = new vscode.Selection(position, position);
        const range = new vscode.Range(position, position);
        editor.revealRange(range);
      }
    });
}
