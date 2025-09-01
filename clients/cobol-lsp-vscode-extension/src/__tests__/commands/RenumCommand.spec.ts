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
  getSequentialNumber,
  RENUM_LEFT,
  RENUM_RIGHT,
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
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique tinci",
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

const editMock: vscode.TextEditorEdit = {
  replace: replaceMock,
  insert: jest.fn(),
  delete: jest.fn(),
  setEndOfLine: jest.fn(),
};

beforeEach(() => {
  jest.clearAllMocks();
});

describe("Tests renumber/unnumber commmands", () => {
  it("Left action changes 6 digist at 0 to 6 columns", () => {
    renumberLines(mockDocument, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
      "000100",
    );
  });
  it("Right action changes 8 digits at 72 to 80 columns", () => {
    renumberLines(mockDocument, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 80, line: 0 }, start: { character: 72, line: 0 } },
      "00001000",
    );
  });
  it("Unnumber Lines removes sequential numbers at 0 to 6 colums", () => {
    unNumberLines(mockDocument, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
      "      ",
    );
  });
  it("Unnumber Lines removes sequential numbers at 72 to 80 colums", () => {
    unNumberLines(mockDocument, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 80, line: 0 }, start: { character: 72, line: 0 } },
      "        ",
    );
  });
  it("Each available line has been changed", () => {
    Object.defineProperty(mockDocument, "lineCount", {
      value: 100,
      configurable: true,
    });
    renumberLines(mockDocument, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledTimes(100);
  });
  it("no changes if document consists more than 999999 lines", () => {
    Object.defineProperty(mockDocument, "lineCount", {
      value: 1000000,
      configurable: true,
    });
    renumberLines(mockDocument, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledTimes(0);
  });
  it("no changes if line starts with * char", () => {
    Object.defineProperty(mockDocument, "lineCount", {
      value: 1,
      configurable: true,
    });
    mockDocument.lineAt = jest.fn().mockReturnValue({
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
    renumberLines(mockDocument, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledTimes(0);
  });
  it("Unnumber Lines does not modify the text when there is no text at 72 to 80 colums", () => {
    mockDocument.lineAt = jest.fn().mockReturnValue({
      lineNumber: 0,
      text: "000100",
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
    unNumberLines(mockDocument, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenCalledTimes(0);
  });
  it("check getSequentialNumber against pad 4", () => {
    expect(getSequentialNumber(0, 6, 4)).toEqual("000100");
  });
  it("check getSequentialNumber against line & pad 5", () => {
    expect(getSequentialNumber(4, 8, 5)).toEqual("00005000");
  });
  it("check getSequentialNumber against line 1250 & digit 8", () => {
    expect(getSequentialNumber(1249, 8, 5)).toEqual("01250000");
  });
  it("cheks getSequentialNumber returns properiate value when multiplication exceeds line number", () => {
    expect(getSequentialNumber(999998, 6, 0)).toEqual("999999");
  });
  it("check getSequentialNumber against digit 6 & totalLine is more than 9999", () => {
    expect(getSequentialNumber(0, 6, 5)).toEqual("000010");
  });
});
