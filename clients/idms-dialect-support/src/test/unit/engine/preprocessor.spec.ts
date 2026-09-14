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
import { IDocumentProcessingContext } from "@code4z/cobol-dialect-api";
import { IdmsPreprocessor } from "../../../engine/preprocessor";
import { MessageService } from "../../../engine/services/MessageService";

jest.mock("vscode");

const messages = {
  "IdmsCopybookVisitor.errorCircularDependency":
    "{0}: Copybook has circular dependency",
  "IdmsDialect.maxAdjustmentExceed":
    "IDMS level not adjusted. {0} ({1} + {2}) exceeds maximum level adjustment of 49",
  "copybook.not_found": "{0}: Copybook not found",
};

function createContext(uri: string) {
  return {
    resolveCopybook: jest.fn(),
    replace: jest.fn(),
    addDiagnostic: jest.fn(),
    getDocumentUri: jest.fn().mockReturnValue(vscode.Uri.parse(uri)),
  } as unknown as IDocumentProcessingContext & {
    resolveCopybook: jest.Mock;
    replace: jest.Mock;
    addDiagnostic: jest.Mock;
  };
}

describe("IdmsPreprocessor", () => {
  const outputChannel = {
    appendLine: jest.fn(),
  } as unknown as vscode.OutputChannel;
  const messageService = new MessageService(messages);
  let preprocessor: IdmsPreprocessor;

  beforeEach(() => {
    jest.clearAllMocks();
    preprocessor = new IdmsPreprocessor(outputChannel, messageService);
  });

  it("resolves an explicit COPY IDMS and adjusts its levels", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///MYCOPY.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///MYCOPY.cpy"),
      text: "       01 ROOT.\n       04 FIELD PIC X.",
    });

    await preprocessor.execute(context, "       03 COPY IDMS 'MYCOPY'.");

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "MYCOPY",
      expect.any(vscode.Range),
      expect.any(vscode.Range),
    );
    expect(copybookContext.replace).toHaveBeenCalledTimes(2);
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      1,
      expect.objectContaining({
        start: expect.objectContaining({ line: 0, character: 7 }),
        end: expect.objectContaining({ line: 0, character: 9 }),
      }),
      "03",
    );
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      2,
      expect.any(vscode.Range),
      "06",
    );
  });

  it("does not adjust levels when COPY IDMS has no parent level", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///MYCOPY.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///MYCOPY.cpy"),
      text: "       01 ROOT.\n       03 FIELD PIC X.",
    });

    await preprocessor.execute(context, "       COPY IDMS MYCOPY.");

    expect(context.resolveCopybook).toHaveBeenCalledTimes(1);
    expect(copybookContext.replace).not.toHaveBeenCalled();
  });

  it("warns and keeps a regular level when adjustment exceeds 49", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///MYCOPY.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///MYCOPY.cpy"),
      text: "       01 ROOT.\n       48 FIELD PIC X.\n       77 FLAG PIC X.",
    });

    await preprocessor.execute(context, "       03 COPY IDMS MYCOPY.");

    expect(copybookContext.addDiagnostic).toHaveBeenCalledTimes(1);
    expect(copybookContext.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        message:
          "IDMS level not adjusted. 50 (2 + 48) exceeds maximum level adjustment of 49",
        severity: vscode.DiagnosticSeverity.Warning,
      }),
    );
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      2,
      expect.any(vscode.Range),
      "48",
    );
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      3,
      expect.any(vscode.Range),
      "77",
    );
  });

  it("removes an unresolved COPY IDMS and reports it", async () => {
    const context = createContext("file:///program.cbl");
    context.resolveCopybook.mockResolvedValue(undefined);

    await preprocessor.execute(context, "       COPY IDMS MISSING.");

    expect(context.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        message: "MISSING: Copybook not found",
        severity: vscode.DiagnosticSeverity.Error,
      }),
    );
    expect(context.replace).toHaveBeenCalledWith(expect.any(vscode.Range), "");
  });

  it("propagates an outer level adjustment into a nested copybook", async () => {
    const context = createContext("file:///program.cbl");
    const outerContext = createContext("file:///OUTER.cpy");
    const innerContext = createContext("file:///INNER.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: outerContext,
      uri: vscode.Uri.parse("file:///OUTER.cpy"),
      text: "       01 OUTER-ROOT.\n       03 COPY IDMS INNER.",
    });
    outerContext.resolveCopybook.mockResolvedValue({
      context: innerContext,
      uri: vscode.Uri.parse("file:///INNER.cpy"),
      text: "       01 INNER-ROOT.\n       03 INNER-FIELD PIC X.",
    });

    await preprocessor.execute(context, "       05 COPY IDMS OUTER.");

    expect(outerContext.resolveCopybook).toHaveBeenCalledWith(
      "INNER",
      expect.any(vscode.Range),
      expect.any(vscode.Range),
    );
    expect(outerContext.replace).toHaveBeenCalledWith(
      expect.any(vscode.Range),
      "05",
    );
    expect(innerContext.replace).toHaveBeenNthCalledWith(
      1,
      expect.any(vscode.Range),
      "07",
    );
    expect(innerContext.replace).toHaveBeenNthCalledWith(
      2,
      expect.any(vscode.Range),
      "09",
    );
  });

  it("stops a circular nested COPY IDMS", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///LOOP.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///LOOP.cpy"),
      text: "       01 COPY IDMS LOOP.",
    });

    await preprocessor.execute(context, "       COPY IDMS LOOP.");

    expect(copybookContext.resolveCopybook).not.toHaveBeenCalled();
    expect(copybookContext.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        message: "LOOP: Copybook has circular dependency",
      }),
    );
    expect(copybookContext.replace).toHaveBeenCalledWith(
      expect.any(vscode.Range),
      "",
    );
  });
});
