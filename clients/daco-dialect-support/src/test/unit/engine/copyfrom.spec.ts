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
import {
  CopyFromVariableDescriptor,
  RedefinitionVariableDescriptor,
  RegularVariableDescriptor,
  VariableDescriptor,
} from "../../../engine/parsing";
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
    const variables = [
      {
        name: "NAME-XAA",
        level: 1,
        options: "",
        type: "DEFINITION",
      } as RegularVariableDescriptor,
      {
        name: "VAR-XCC",
        level: 3,
        options: "OPTIONS",
        type: "DEFINITION",
      } as RegularVariableDescriptor,
      {
        name: "VAR-XAA",
        type: "REDEFINITION",
      } as RedefinitionVariableDescriptor,
      {
        name: "NEXT-XCC",
        level: 1,
        type: "DEFINITION",
      } as RegularVariableDescriptor,
      {
        level: 1,
        copyFromRange: {},
        suffix: "AA",
        name: "NAME-XBB",
        type: "COPY-FROM",
      } as CopyFromVariableDescriptor,
    ];
    processCopyFrom(context, variables, createMessageService());

    expect(context.replace).toHaveBeenCalledWith(
      {},
      ".\n        03 VAR-XBB  REDEFINES VAR-XBB",
    );
    expect(context.addDiagnostic).not.toHaveBeenCalled();
  });
});
