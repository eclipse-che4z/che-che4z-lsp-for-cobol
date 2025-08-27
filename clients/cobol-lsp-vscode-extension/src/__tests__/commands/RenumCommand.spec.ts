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
import {
  RenumberAction,
  renumberLines,
  unNumberLines,
} from "../../commands/RenumCommand";

const mockDocument: vscode.TextDocument = {
  uri: vscode.Uri.file("/test/file.cbl"),
  fileName: "/test/file.cbl",
  isUntitled: false,
  languageId: "COBOL",
  version: 1,
  isDirty: false,
  isClosed: false,
  save: jest.fn().mockResolvedValue(true),
  eol: 1,
  lineCount: 1,
  lineAt: jest.fn().mockReturnValue({
    lineNumber: 0,
    text: "lineText",
    range: new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(0, 11),
    ),
    rangeIncludingLineBreak: new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(0, 12),
    ),
    firstNonWhitespaceCharacterIndex: 0,
    isEmptyOrWhitespace: false,
  }),
  offsetAt: jest.fn().mockReturnValue(0),
  positionAt: jest.fn().mockReturnValue(new vscode.Position(0, 0)),
  getText: jest.fn().mockReturnValue("Content Text"),
  getWordRangeAtPosition: jest
    .fn()
    .mockReturnValue(
      new vscode.Range(new vscode.Position(0, 0), new vscode.Position(0, 5)),
    ),
  validateRange: jest.fn((range) => range),
  validatePosition: jest.fn((pos) => pos),
};
const replaceMock = jest.fn();

const mockEditor: vscode.TextEditor = {
  document: mockDocument,
  selection: new vscode.Selection(
    new vscode.Position(0, 0),
    new vscode.Position(0, 0),
  ),
  selections: [],
  visibleRanges: [],
  options: {},
  viewColumn: 1,
  edit: jest
    .fn()
    .mockImplementation(
      (callback: (editBuilder: vscode.TextEditorEdit) => void) => {
        const builder: vscode.TextEditorEdit = {
          replace: replaceMock,
          insert: jest.fn(),
          delete: jest.fn(),
          setEndOfLine: jest.fn(),
        };
        callback(builder);
        return true;
      },
    ),
  insertSnippet: jest.fn(),
  setDecorations: jest.fn(),
  revealRange: jest.fn(),
  show: jest.fn(),
  hide: jest.fn(),
};

beforeEach(() => {
  jest.clearAllMocks();
});

describe("Tests renumber/unnumber commmands", () => {
  it("Left action changes 6 digist at 0 to 6 columns", async () => {
    await renumberLines(RenumberAction.LEFT, mockEditor);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
      "000100",
    );
  });
  it("Right action changes 8 digits at 72 to 80 columns", async () => {
    await renumberLines(RenumberAction.RIGHT, mockEditor);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 80, line: 0 }, start: { character: 72, line: 0 } },
      "00001000",
    );
  });
  it("Unnumber Lines removes sequential numbers at 0 to 6 colums", async () => {
    await unNumberLines(RenumberAction.LEFT, mockEditor);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
      "      ",
    );
  });
  it("Unnumber Lines removes sequential numbers at 72 to 80 colums", async () => {
    await unNumberLines(RenumberAction.RIGHT, mockEditor);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 80, line: 0 }, start: { character: 72, line: 0 } },
      "      ",
    );
  });
  it("Each available line has been changed", async () => {
    Object.defineProperty(mockEditor.document, "lineCount", {
      value: 100,
      configurable: true,
    });
    await renumberLines(RenumberAction.LEFT, mockEditor);
    expect(replaceMock).toHaveBeenCalledTimes(100);
  });
  it("no changes if document consists more than 999999 lines", async () => {
    Object.defineProperty(mockEditor.document, "lineCount", {
      value: 1000000,
      configurable: true,
    });
    await renumberLines(RenumberAction.LEFT, mockEditor);
    expect(replaceMock).toHaveBeenCalledTimes(0);
  });
  it("no changes if line starts with * char", async () => {
    Object.defineProperty(mockEditor.document, "lineCount", {
      value: 1,
      configurable: true,
    });
    mockEditor.document.lineAt = jest.fn().mockReturnValue({
      lineNumber: 0,
      text: "*DaCo",
      range: new vscode.Range(
        new vscode.Position(0, 0),
        new vscode.Position(0, 11),
      ),
      rangeIncludingLineBreak: new vscode.Range(
        new vscode.Position(0, 0),
        new vscode.Position(0, 12),
      ),
      firstNonWhitespaceCharacterIndex: 0,
      isEmptyOrWhitespace: false,
    });
    await renumberLines(RenumberAction.LEFT, mockEditor);
    expect(replaceMock).toHaveBeenCalledTimes(0);
  });
});
