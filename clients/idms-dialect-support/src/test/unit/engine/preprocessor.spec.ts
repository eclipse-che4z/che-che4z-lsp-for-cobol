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
    insert: jest.fn(),
    addDiagnostic: jest.fn(),
    getDocumentUri: jest.fn().mockReturnValue(vscode.Uri.parse(uri)),
  } as unknown as IDocumentProcessingContext & {
    resolveCopybook: jest.Mock;
    replace: jest.Mock;
    insert: jest.Mock;
    addDiagnostic: jest.Mock;
  };
}

function expectRange(
  startLine: number,
  startCharacter: number,
  endLine: number,
  endCharacter: number,
) {
  return expect.objectContaining({
    start: expect.objectContaining({
      line: startLine,
      character: startCharacter,
    }),
    end: expect.objectContaining({
      line: endLine,
      character: endCharacter,
    }),
  });
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
      expectRange(0, 7, 0, 29),
      expectRange(0, 20, 0, 28),
    );
    expect(copybookContext.replace).toHaveBeenCalledTimes(2);
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      1,
      expectRange(0, 7, 0, 9),
      "03",
    );
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      2,
      expectRange(1, 7, 1, 9),
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

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "MYCOPY",
      expectRange(0, 7, 0, 24),
      expectRange(0, 17, 0, 23),
    );
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
        range: expectRange(1, 7, 1, 9),
      }),
    );
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      1,
      expectRange(0, 7, 0, 9),
      "03",
    );
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      2,
      expectRange(1, 7, 1, 9),
      "48",
    );
    expect(copybookContext.replace).toHaveBeenNthCalledWith(
      3,
      expectRange(2, 7, 2, 9),
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
        range: expectRange(0, 17, 0, 24),
      }),
    );
    expect(context.replace).toHaveBeenCalledWith(expectRange(0, 7, 0, 25), "");
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

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "OUTER",
      expectRange(0, 7, 0, 26),
      expectRange(0, 20, 0, 25),
    );
    expect(outerContext.resolveCopybook).toHaveBeenCalledWith(
      "INNER",
      expectRange(1, 7, 1, 26),
      expectRange(1, 20, 1, 25),
    );
    expect(outerContext.replace).toHaveBeenCalledWith(
      expectRange(0, 7, 0, 9),
      "05",
    );
    expect(innerContext.replace).toHaveBeenNthCalledWith(
      1,
      expectRange(0, 7, 0, 9),
      "07",
    );
    expect(innerContext.replace).toHaveBeenNthCalledWith(
      2,
      expectRange(1, 7, 1, 9),
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

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "LOOP",
      expectRange(0, 7, 0, 22),
      expectRange(0, 17, 0, 21),
    );
    expect(copybookContext.resolveCopybook).not.toHaveBeenCalled();
    expect(copybookContext.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        message: "LOOP: Copybook has circular dependency",
        range: expectRange(0, 20, 0, 24),
      }),
    );
    expect(copybookContext.replace).toHaveBeenCalledWith(
      expectRange(0, 7, 0, 25),
      "",
    );
  });

  it("inserts the predefined subschema copybook after a multiline working-storage header", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///SUBSCHEMA-DESCRIPTION.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///SUBSCHEMA-DESCRIPTION.cpy"),
      text: "       01 SUBSCHEMA-FIELD PIC X.",
    });
    const text = [
      "       IDMS-CONTROL SECTION.",
      "       PROTOCOL.",
      "       IDMS-RECORDS WITHIN WORKING-STORAGE SECTION.",
      "       DATA DIVISION.",
      "       SCHEMA SECTION.",
      "       DB EMPSS01 WITHIN EMPSCHM.",
      "       WORKING-STORAGE",
      "       SECTION.",
      "       01 USER-FIELD PIC X.",
    ].join("\n");

    await preprocessor.execute(context, text);

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "SUBSCHEMA-DESCRIPTION",
      expectRange(8, 0, 8, 0),
      expectRange(6, 7, 7, 14),
    );
    expect(copybookContext.insert).not.toHaveBeenCalled();
  });

  it("inserts the predefined maps copybook into working-storage", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///MAPS.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///MAPS.cpy"),
      text: "       01 MAP-FIELD PIC X.",
    });
    const text = [
      "       DATA DIVISION.",
      "       MAP SECTION.",
      "       MAP TEST-MAP.",
      "       WORKING-STORAGE SECTION.",
      "       01 USER-FIELD PIC X.",
    ].join("\n");

    await preprocessor.execute(context, text);

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "MAPS",
      expectRange(4, 0, 4, 0),
      expectRange(3, 7, 3, 30),
    );
    expect(copybookContext.insert).not.toHaveBeenCalled();
  });

  it("uses linkage placement for a predefined copybook", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///SUBSCHEMA-DESCRIPTION.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///SUBSCHEMA-DESCRIPTION.cpy"),
      text: "       01 SUBSCHEMA-FIELD PIC X.",
    });
    const text = [
      "       IDMS-CONTROL SECTION.",
      "       PROTOCOL.",
      "       IDMS-RECORDS WITHIN LINKAGE.",
      "       DATA DIVISION.",
      "       SCHEMA SECTION.",
      "       DB EMPSS01 WITHIN EMPSCHM.",
      "       LINKAGE SECTION.",
      "       01 LINKAGE-FIELD PIC X.",
    ].join("\n");

    await preprocessor.execute(context, text);

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "SUBSCHEMA-DESCRIPTION",
      expectRange(7, 0, 7, 0),
      expectRange(6, 7, 6, 22),
    );
  });

  it("does not insert predefined copybooks for manual records", async () => {
    const context = createContext("file:///program.cbl");
    const text = [
      "       IDMS-CONTROL SECTION.",
      "       PROTOCOL.",
      "       IDMS-RECORDS MANUAL.",
      "       DATA DIVISION.",
      "       SCHEMA SECTION.",
      "       DB EMPSS01 WITHIN EMPSCHM.",
      "       WORKING-STORAGE SECTION.",
    ].join("\n");

    await preprocessor.execute(context, text);

    expect(context.resolveCopybook).not.toHaveBeenCalled();
    expect(context.replace).toHaveBeenNthCalledWith(
      1,
      expectRange(0, 7, 2, 27),
      " ",
    );
  });

  it("replaces IDMS sections with a space", async () => {
    const context = createContext("file:///program.cbl");
    const text = [
      "       DATA DIVISION.",
      "       SCHEMA SECTION.",
      "       DB EMPSS01 WITHIN EMPSCHM.",
    ].join("\n");

    await preprocessor.execute(context, text);

    expect(context.replace).toHaveBeenCalledWith(expectRange(1, 7, 2, 33), " ");
  });

  it("replaces a simple IDMS statement with CONTINUE", async () => {
    const context = createContext("file:///program.cbl");

    await preprocessor.execute(context, "       READY.");

    expect(context.replace).toHaveBeenCalledWith(
      expectRange(0, 7, 0, 12),
      "CONTINUE",
    );
  });

  it("leaves statements with an imperative call for special processing", async () => {
    const context = createContext("file:///program.cbl");

    await preprocessor.execute(
      context,
      "       READY\n       ON ANY-STATUS GOBACK.",
    );

    expect(context.replace).not.toHaveBeenCalled();
  });
});
