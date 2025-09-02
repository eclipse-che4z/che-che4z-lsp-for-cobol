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
  RenumDocument,
  unNumberLines,
} from "../../commands/RenumCommand";

const mockLines: string[] = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique tinci",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique tinci",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique tinci",
  "*DaCo:",
];

const mockDocument: RenumDocument = {
  get lineCount() {
    return mockLines.length;
  },
  lineAt(i) {
    return { text: mockLines[i] };
  },
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
  it("Right action changes 8 digits at 72 to 80 columns & padding applied when text length is less than column start", () => {
    renumberLines(mockDocument, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenNthCalledWith(
      1,
      {
        end: { character: 80, line: 0 },
        start: { character: 64, line: 0 },
      },
      " ".repeat(8).concat("00001000"),
    );
  });
  it("Unnumber Lines removes sequential numbers at 0 to 6 colums", () => {
    unNumberLines(mockDocument, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 6, line: 0 }, start: { character: 0, line: 0 } },
      " ".repeat(6),
    );
  });
  it("Unnumber Lines removes sequential numbers at 72 to 80 colums", () => {
    unNumberLines(mockDocument, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenCalledWith(
      { end: { character: 80, line: 1 }, start: { character: 72, line: 1 } },
      " ".repeat(8),
    );
  });
  it("no changes if document consists more than 999999 lines", () => {
    const bigMock = {
      lineCount: 1000000,
      lineAt: (_num: number) => ({ text: "" }),
    };
    renumberLines(bigMock, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledTimes(0);
  });
  it("no changes if line starts with * char", () => {
    renumberLines(mockDocument, editMock, RENUM_LEFT);
    expect(replaceMock).toHaveBeenCalledTimes(4);
  });
  it("Unnumber Lines does not modify the text when there is no text at 72 to 80 colums", () => {
    unNumberLines(mockDocument, editMock, RENUM_RIGHT);
    expect(replaceMock).toHaveBeenCalledTimes(3);
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
      unNumberLines(mockDocument, editMock, RENUM_LEFT);
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
  it(
    "check unNumberLines against digit 8 removes numbering at all lines in 73-80 columns & " +
      "lines commented out doesn't modified",
    () => {
      unNumberLines(mockDocument, editMock, RENUM_RIGHT);
      expect(replaceMock).toHaveBeenCalledTimes(3);
      expect(replaceMock).toHaveBeenNthCalledWith(
        1,
        { end: { character: 80, line: 1 }, start: { character: 72, line: 1 } },
        " ".repeat(8),
      );
      expect(replaceMock).toHaveBeenNthCalledWith(
        2,
        { end: { character: 80, line: 2 }, start: { character: 72, line: 2 } },
        " ".repeat(8),
      );
      expect(replaceMock).toHaveBeenNthCalledWith(
        3,
        { end: { character: 80, line: 3 }, start: { character: 72, line: 3 } },
        " ".repeat(8),
      );
    },
  );
});
