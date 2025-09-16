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
  calculatePadding,
  getSequentialNumber,
  RENUM_LEFT,
  RENUM_RIGHT,
  renumberLines,
  RenumEditor,
  unNumberLines,
} from "../../commands/RenumCommand";

const mockLines: string[] = [
  "0".repeat(6) + "Lorem ipsum dolor sit amet, consectetur adipiscing elit ",
  "1".repeat(6) + "Lorem ipsum dolor sit amet, consectetur adipiscing elit ",
  "2".repeat(6) + "Lorem ipsum dolor sit amet, consectetur adipiscing elit ",
  "3".repeat(6) + "Lorem ipsum dolor sit amet, consectetur adipiscing elit ",
];
const mockNumberedLines: string[] = [
  "000200 IDENTIFICATION DIVISION.                                         00000000",
  "000300 PROGRAM-ID.    RENUM.                                            00000000",
];
const mockAlienLines: string[] = [
  "00*200 IDENTIFICATION DIVISION.                                         00000e00",
  "00e300 PROGRAM-ID.    RENUM.                                            00000a00",
];
const pos = new vscode.Position(0, 0);

const mockEditor: RenumEditor = {
  document: {
    get lineCount() {
      return mockLines.length;
    },
    lineAt(i) {
      return { text: mockLines[i] };
    },
  },
  revealRange: jest.fn(),
  selection: new vscode.Selection(pos, pos),
};
const replaceMock = jest.fn();

const editMock: vscode.TextEditorEdit = {
  replace: replaceMock,
  insert: jest.fn(),
  delete: jest.fn(),
  setEndOfLine: jest.fn(),
};
const mockNumberedEditor = {
  document: {
    get lineCount() {
      return mockNumberedLines.length;
    },
    lineAt: (i: number) => {
      return { text: mockNumberedLines[i] };
    },
  },
  revealRange: jest.fn(),
  selection: new vscode.Selection(pos, pos),
};
const mockAlienEditor = {
  document: {
    get lineCount() {
      return mockAlienLines.length;
    },
    lineAt: (i: number) => {
      return { text: mockAlienLines[i] };
    },
  },
  revealRange: jest.fn(),
  selection: new vscode.Selection(pos, pos),
};
beforeEach(() => {
  jest.clearAllMocks();
});

describe("Tests renumber/unnumber commmands", () => {
  it("Left action changes 6 digist at 0 to 6 columns", () => {
    renumberLines(mockEditor, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
      "000100",
    );
  });
  it("Right action changes 8 digits at 72 to 80 columns & padding applied when text length is less than column start", () => {
    renumberLines(mockEditor, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenNthCalledWith(
      1,
      {
        end: { character: 80, line: 0 },
        start: { character: 62, line: 0 },
      },
      " ".repeat(10).concat("00001000"),
    );
  });
  it("Unnumber Lines removes sequential numbers at 0 to 6 colums", () => {
    unNumberLines(mockEditor, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
      " ".repeat(6),
    );
  });
  it("Unnumber Lines removes sequential numbers at 72 to 80 colums", () => {
    unNumberLines(mockNumberedEditor, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 80, line: 1 }, start: { character: 72, line: 1 } },
      " ".repeat(8),
    );
  });
  it("no changes if document consists more than 999999 lines", () => {
    const bigMock = {
      document: {
        lineCount: 1000000,
        lineAt: (_num: number) => ({ text: "" }),
      },
      revealRange: jest.fn(),
      selection: new vscode.Selection(pos, pos),
    };
    renumberLines(bigMock, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledTimes(0);
    expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
      "Renumber sequential numbers is not possible above 999999 lines",
    );
  });
  it("no changes if line starts with * char", () => {
    renumberLines(mockEditor, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledTimes(4);
  });
  it("Unnumber Lines does not modify the text when there is no text at 72 to 80 colums", () => {
    unNumberLines(mockEditor, editMock, RENUM_RIGHT);
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
  it(
    "check unNumberLines against digit 6 removes numbering at all lines in 1-6 columns & " +
      "lines commented out doesn't modified",
    () => {
      unNumberLines(mockEditor, editMock, RENUM_LEFT);
      expect(replaceMock).toHaveBeenCalledTimes(4);
      expect(replaceMock).toHaveBeenNthCalledWith(
        1,
        { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
        " ".repeat(6),
      );
      expect(replaceMock).toHaveBeenNthCalledWith(
        2,
        { end: { character: 6, line: 1 }, start: { character: 0, line: 1 } },
        " ".repeat(6),
      );
      expect(replaceMock).toHaveBeenNthCalledWith(
        3,
        { end: { character: 6, line: 2 }, start: { character: 0, line: 2 } },
        " ".repeat(6),
      );
      expect(replaceMock).toHaveBeenNthCalledWith(
        4,
        { end: { character: 6, line: 3 }, start: { character: 0, line: 3 } },
        " ".repeat(6),
      );
    },
  );
  it("check unNumberLines against digit 8 removes numbering at all lines in 73-80 columns & ", () => {
    unNumberLines(mockNumberedEditor, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenCalledTimes(2);
    expect(replaceMock).toHaveBeenNthCalledWith(
      1,
      { end: { character: 80, line: 0 }, start: { character: 72, line: 0 } },
      " ".repeat(8),
    );
    expect(replaceMock).toHaveBeenNthCalledWith(
      2,
      { end: { character: 80, line: 1 }, start: { character: 72, line: 1 } },
      " ".repeat(8),
    );
  });
  it("check calculatePadding against digit 6 & totalLine is 10", () => {
    expect(calculatePadding(6, 10)).toEqual(4);
  });
  it("check calculatePadding against digit 6 & totalLine is above 9999", () => {
    expect(calculatePadding(6, 10000)).toEqual(5);
  });
  it("check calculatePadding against digit 6 & totalLine is above 99999", () => {
    expect(calculatePadding(6, 100000)).toEqual(6);
  });
  it("check calculatePadding against digit 8 returns 5 always", () => {
    expect(calculatePadding(8, 1)).toEqual(5);
    expect(calculatePadding(8, 10000)).toEqual(5);
    expect(calculatePadding(8, 100000)).toEqual(5);
  });
  it("check renumber & unnumber cancels command when there is non digit or non empty char present in the columns", () => {
    unNumberLines(mockAlienEditor, editMock, RENUM_LEFT);
    renumberLines(mockAlienEditor, editMock, RENUM_LEFT);
    unNumberLines(mockAlienEditor, editMock, RENUM_RIGHT);
    renumberLines(mockAlienEditor, editMock, RENUM_RIGHT);

    expect(replaceMock).toHaveBeenCalledTimes(0);
    expect(vscode.window.showErrorMessage).toHaveBeenCalledWith(
      "Renumber/unnumber sequential numbers is not possible on non numeric lines",
      "Go to line",
    );
  });
});
