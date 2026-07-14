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

import * as vscode from "vscode";
import { processCopyFrom } from "../../../engine/copyfrom";
import { VariableDescriptor } from "../../../engine/model";
import { createMessageService } from "./utils";

describe("copy-from parsing test", () => {
  const context: any = {
    replace: jest.fn(),
    addDiagnostic: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should add diagnostic for when no source found", () => {
    const range = new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(1, 1),
    );
    const variables: VariableDescriptor[] = [
      {
        name: "NAME-XAA",
        nameRange: range,
        suffix: "BB",
        copyFromRange: range,
        type: "COPY-FROM",
        level: 1,
        levelRange: range,
      },
    ];
    processCopyFrom(context, variables, createMessageService());

    expect(context.replace).toHaveBeenCalledWith(range, " ");
    expect(context.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        message: "Source for NAME-XAA not found",
        range: range,
      }),
    );
  });

  it("should find descending variable", () => {
    const range = new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(1, 1),
    );
    const variables: VariableDescriptor[] = [
      {
        name: "VAR-XAA",
        nameRange: range,
        options: "OPTIONS",
        type: "DEFINITION",
        level: 1,
        levelRange: range,
      },
      {
        nameRange: range,
        copyFromRange: new vscode.Range(
          new vscode.Position(0, 0),
          new vscode.Position(1, 1),
        ),
        name: "VAR-XBB",
        suffix: "AA",
        type: "COPY-FROM",
        level: 1,
        levelRange: range,
      },
    ];
    processCopyFrom(context, variables, createMessageService());

    expect(context.replace).toHaveBeenCalledWith(range, "OPTIONS");
    expect(context.addDiagnostic).not.toHaveBeenCalled();
  });

  it("should process redefinitions", () => {
    const range = new vscode.Range(
      new vscode.Position(0, 0),
      new vscode.Position(1, 1),
    );
    const variables: VariableDescriptor[] = [
      {
        name: "NAME-XAA",
        nameRange: range,
        options: "",
        type: "DEFINITION",
        level: 1,
        levelRange: range,
      },
      {
        name: "VAR-XCC",
        nameRange: range,
        options: "OPTIONS",
        type: "DEFINITION",
        level: 3,
        levelRange: range,
      },
      {
        name: "VAR-XAA",
        nameRange: range,
        type: "REDEFINITION",
      },
      {
        name: "NEXT-XCC",
        nameRange: range,
        options: "",
        type: "DEFINITION",
        level: 1,
        levelRange: range,
      },
      {
        name: "NAME-XBB",
        nameRange: range,
        level: 1,
        levelRange: range,
        copyFromRange: range,
        suffix: "AA",
        type: "COPY-FROM",
      },
    ];
    processCopyFrom(context, variables, createMessageService());

    expect(context.replace).toHaveBeenCalledWith(
      range,
      ".\n        03 VAR-XBB  REDEFINES VAR-XBB",
    );
    expect(context.addDiagnostic).not.toHaveBeenCalled();
  });
});
