/*
 * Copyright (c) 2026 Broadcom.
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

import {
  BLANK_STATEMENT,
  BLANK_VALUE,
  SPACE_VALUE,
  ParseError,
} from "../../../engine/model";
import * as vscode from "vscode";

describe("model constants", () => {
  it("should expose the expected blank statement value", () => {
    expect(BLANK_STATEMENT).toBe("CONTINUE");
  });

  it("should expose the expected blank value", () => {
    expect(BLANK_VALUE).toBe("ZERO");
  });

  it("should expose the expected space value", () => {
    expect(SPACE_VALUE).toBe(" ");
  });

  it("should allow constructing a ParseError object", () => {
    const range = new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(0, 1),
    );
    const error: ParseError = {
      line: 1,
      column: 2,
      message: "some error",
      range,
    };

    expect(error.line).toBe(1);
    expect(error.column).toBe(2);
    expect(error.message).toBe("some error");
    expect(error.range).toBe(range);
  });
});
