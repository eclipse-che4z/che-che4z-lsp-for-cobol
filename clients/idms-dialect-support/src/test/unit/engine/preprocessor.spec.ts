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
    replaceWithMap: jest.fn(),
    insert: jest.fn(),
    addDiagnostic: jest.fn(),
    getDocumentUri: jest.fn().mockReturnValue(vscode.Uri.parse(uri)),
  } as unknown as IDocumentProcessingContext & {
    resolveCopybook: jest.Mock;
    replace: jest.Mock;
    replaceWithMap: jest.Mock;
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

  it("preserves variable usages from an IDMS statement", async () => {
    const documentUri = "file:///program.cbl";
    const context = createContext(documentUri);

    await preprocessor.execute(
      context,
      "       SEND MESSAGE TO USER ID WS-A FROM WS-B LENGTH 1.",
    );

    expect(context.replace).not.toHaveBeenCalled();
    expect(context.replaceWithMap).toHaveBeenCalledTimes(1);

    const [range, statementRange, items, filler] =
      context.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(0, 7, 0, 54));
    expect(statementRange).toEqual(expectRange(0, 7, 0, 54));
    expect(filler).toBe("CONTINUE");
    expect(items).toHaveLength(2);
    expect(items[0].type).toBe("VARIABLE");
    expect(items[0].tokens).toHaveLength(1);
    expect(items[0].tokens[0].name).toBe("VAR_0_USG_0");
    expect(items[0].tokens[0].location.uri.toString()).toBe(documentUri);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(0, 31, 0, 35),
    );
    expect(items[1].type).toBe("VARIABLE");
    expect(items[1].tokens).toHaveLength(1);
    expect(items[1].tokens[0].name).toBe("VAR_1_USG_0");
    expect(items[1].tokens[0].location.uri.toString()).toBe(documentUri);
    expect(items[1].tokens[0].location.range).toEqual(
      expectRange(0, 41, 0, 45),
    );
  });

  it("replaces an IDMS IF condition with a dialect condition", async () => {
    const documentUri = "file:///program.cbl";
    const context = createContext(documentUri);

    await preprocessor.execute(
      context,
      "       IF NOT IX-EMP MEMBER DISPLAY 'X' ELSE DISPLAY 'Y' END-IF.",
    );

    expect(context.replace).not.toHaveBeenCalled();
    expect(context.replaceWithMap).toHaveBeenCalledTimes(1);

    const [range, statementRange, items, filler] =
      context.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(0, 10, 0, 27));
    expect(statementRange).toEqual(expectRange(0, 10, 0, 27));
    expect(filler).toBe("TRUE");
    expect(items).toHaveLength(1);
    expect(items[0].type).toBe("VARIABLE");
    expect(items[0].tokens).toHaveLength(1);
    expect(items[0].tokens[0].name).toBe("VAR_0_USG_0");
    expect(items[0].tokens[0].location.uri.toString()).toBe(documentUri);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(0, 14, 0, 20),
    );
  });

  it("replaces INQUIRE MAP IF with a IF TRUE", async () => {
    const documentUri = "file:///program.cbl";
    const context = createContext(documentUri);

    await preprocessor.execute(
      context,
      "       INQUIRE MAP EMPMAP IF CURSOR AT DFLD MFLD2 OF MAP1 THEN DISPLAY 'CURSOR'.",
    );

    expect(context.replace).not.toHaveBeenCalled();
    expect(context.replaceWithMap).toHaveBeenCalledTimes(1);

    const [range, statementRange, items, filler] =
      context.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(0, 7, 0, 57));
    expect(statementRange).toEqual(expectRange(0, 7, 0, 57));
    expect(filler).toBe("IF TRUE ");
    expect(items).toHaveLength(2);
    expect(items[0].type).toBe("VARIABLE");
    expect(items[0].tokens).toHaveLength(1);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(0, 19, 0, 25),
    );
    expect(items[1].type).toBe("VARIABLE");
    expect(items[1].tokens).toHaveLength(2);
    expect(items[1].tokens[0].location.range).toEqual(
      expectRange(0, 44, 0, 49),
    );
    expect(items[1].tokens[1].location.range).toEqual(
      expectRange(0, 53, 0, 57),
    );
  });

  it("replaces an OBTAIN LR statement", async () => {
    const context = createContext("file:///program.cbl");

    await preprocessor.execute(
      context,
      "       OBTAIN NEXT EMP-JOB-LR\n" +
        "       WHERE DEPT-ID-410 EQ DEPT-ID-0410 OF LR.",
    );

    expect(context.replaceWithMap).not.toHaveBeenCalled();
    expect(context.replace).toHaveBeenCalledTimes(1);
    expect(context.replace).toHaveBeenCalledWith(
      expectRange(0, 7, 1, 46),
      "CONTINUE",
    );
  });

  it("preserves the INTO variable in an imperative OBTAIN LR statement", async () => {
    const documentUri = "file:///program.cbl";
    const context = createContext(documentUri);

    await preprocessor.execute(
      context,
      "       OBTAIN NEXT EMP-JOB-LR INTO WS-LR\n" +
        "       WHERE DATA EQ OTHER-DATA\n" +
        "       ON LR-NOT-FOUND MOVE 'Y' TO RESULT END-IF.",
    );

    expect(context.replaceWithMap).toHaveBeenCalledTimes(1);
    const [range, statementRange, items, filler] =
      context.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(0, 7, 2, 7));
    expect(statementRange).toEqual(expectRange(0, 7, 2, 7));
    expect(filler).toBe(" ");
    expect(items).toHaveLength(1);
    expect(items[0].type).toBe("VARIABLE");
    expect(items[0].tokens).toHaveLength(1);
    expect(items[0].tokens[0].location.uri.toString()).toBe(documentUri);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(0, 35, 0, 40),
    );

    expect(context.replace).toHaveBeenCalledTimes(1);
    expect(context.replace).toHaveBeenCalledWith(
      expectRange(2, 7, 2, 22),
      "IF 1 + 1 = 2",
    );
  });

  it.each(["ERASE", "MODIFY", "STORE"])(
    "does not map the logical record name in %s LR",
    async (statement) => {
      const context = createContext("file:///program.cbl");
      const source = `       ${statement} SOME-LR WHERE DATA EQ OTHER-DATA.`;

      await preprocessor.execute(context, source);

      expect(context.replaceWithMap).not.toHaveBeenCalled();
      expect(context.replace).toHaveBeenCalledTimes(1);
      expect(context.replace).toHaveBeenCalledWith(
        expectRange(0, 7, 0, source.indexOf(".")),
        "CONTINUE",
      );
    },
  );

  it("maps the FROM variable but not the logical record name", async () => {
    const documentUri = "file:///program.cbl";
    const context = createContext(documentUri);

    await preprocessor.execute(
      context,
      "       ERASE SOME-LR FROM WS-LR WHERE DATA EQ OTHER-DATA.",
    );

    expect(context.replace).not.toHaveBeenCalled();
    expect(context.replaceWithMap).toHaveBeenCalledTimes(1);
    const [range, statementRange, items, filler] =
      context.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(0, 7, 0, 56));
    expect(statementRange).toEqual(expectRange(0, 7, 0, 56));
    expect(filler).toBe("CONTINUE");
    expect(items).toHaveLength(1);
    expect(items[0].tokens).toHaveLength(1);
    expect(items[0].tokens[0].location.uri.toString()).toBe(documentUri);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(0, 26, 0, 31),
    );
  });

  it("replaces a multiline imperative statement with an always-true IF", async () => {
    const context = createContext("file:///program.cbl");

    await preprocessor.execute(
      context,
      "       READY\n       ON ANY-STATUS GOBACK END-IF.",
    );

    expect(context.replace).toHaveBeenCalledTimes(2);
    expect(context.replace).toHaveBeenNthCalledWith(
      1,
      expectRange(0, 7, 1, 7),
      " ",
    );
    expect(context.replace).toHaveBeenNthCalledWith(
      2,
      expectRange(1, 7, 1, 20),
      "IF 1 + 1 = 2",
    );
  });

  it("preserves NEXT SENTENCE after an imperative statement", async () => {
    const context = createContext("file:///program.cbl");

    await preprocessor.execute(
      context,
      "       ABEND CODE '1234' ON ANY-STATUS NEXT SENTENCE.",
    );

    expect(context.replace).toHaveBeenCalledTimes(2);
    expect(context.replace).toHaveBeenNthCalledWith(
      1,
      expectRange(0, 7, 0, 25),
      " ",
    );
    expect(context.replace).toHaveBeenNthCalledWith(
      2,
      expectRange(0, 25, 0, 38),
      "IF 1 + 1 = 2",
    );
  });

  it("processes an imperative call nested in STORE options", async () => {
    const documentUri = "file:///program.cbl";
    const context = createContext(documentUri);

    await preprocessor.execute(
      context,
      "       STORE SOME-LR\n       ON LR-NOT-FOUND CONTINUE END-IF.",
    );

    expect(context.replaceWithMap).toHaveBeenCalledTimes(1);
    const [range, statementRange, items, filler] =
      context.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(0, 7, 1, 7));
    expect(statementRange).toEqual(expectRange(0, 7, 1, 7));
    expect(filler).toBe(" ");
    expect(items).toHaveLength(1);
    expect(items[0].type).toBe("VARIABLE");
    expect(items[0].tokens).toHaveLength(1);
    expect(items[0].tokens[0].name).toBe("VAR_0_USG_0");
    expect(items[0].tokens[0].location.uri.toString()).toBe(documentUri);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(0, 13, 0, 20),
    );

    expect(context.replace).toHaveBeenCalledTimes(1);
    expect(context.replace).toHaveBeenCalledWith(
      expectRange(1, 7, 1, 22),
      "IF 1 + 1 = 2",
    );
  });

  it("processes OBTAIN LR with an IDMS LR copybook", async () => {
    const documentUri = "file:///program.cbl";
    const context = createContext(documentUri);
    const copybookContext = createContext("file:///MYCOPY.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///MYCOPY.cpy"),
      text: "       01 WS-LR PIC X.",
    });

    await preprocessor.execute(
      context,
      "       COPY IDMS LR MYCOPY.\n" +
        "       OBTAIN NEXT EMP-JOB-LR INTO WS-LR.",
    );

    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "MYCOPY",
      expectRange(0, 7, 0, 27),
      expectRange(0, 20, 0, 26),
    );
    expect(context.replaceWithMap).toHaveBeenCalledTimes(1);
    const [range, statementRange, items, filler] =
      context.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(1, 7, 1, 40));
    expect(statementRange).toEqual(expectRange(1, 7, 1, 40));
    expect(filler).toBe("CONTINUE");
    expect(items).toHaveLength(1);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(1, 35, 1, 40),
    );
  });

  it("does not treat ON inside an IDMS statement as an imperative call", async () => {
    const context = createContext("file:///program.cbl");

    await preprocessor.execute(
      context,
      "       SET ABEND EXIT ON PROGRAM 'PROG'.",
    );

    expect(context.replace).toHaveBeenCalledTimes(1);
    expect(context.replace).toHaveBeenCalledWith(
      expectRange(0, 7, 0, 39),
      "CONTINUE",
    );
  });

  it("replaces an IDMS statement found inside a resolved copybook", async () => {
    const context = createContext("file:///program.cbl");
    const copybookContext = createContext("file:///MYCOPY.cpy");
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse("file:///MYCOPY.cpy"),
      text: "       READY.",
    });

    await preprocessor.execute(context, "       COPY IDMS MYCOPY.");

    expect(copybookContext.replace).toHaveBeenCalledWith(
      expectRange(0, 7, 0, 12),
      "CONTINUE",
    );
  });

  it("replaces an IDMS condition found inside a resolved copybook", async () => {
    const context = createContext("file:///program.cbl");
    const copybookUri = "file:///MYCOPY.cpy";
    const copybookContext = createContext(copybookUri);
    context.resolveCopybook.mockResolvedValue({
      context: copybookContext,
      uri: vscode.Uri.parse(copybookUri),
      text: "       IF EMPLOYEE EMPTY DISPLAY 'EMPTY'.",
    });

    await preprocessor.execute(context, "       COPY IDMS MYCOPY.");

    expect(copybookContext.replace).not.toHaveBeenCalled();
    expect(copybookContext.replaceWithMap).toHaveBeenCalledTimes(1);
    const [range, statementRange, items, filler] =
      copybookContext.replaceWithMap.mock.calls[0];
    expect(range).toEqual(expectRange(0, 10, 0, 24));
    expect(statementRange).toEqual(expectRange(0, 10, 0, 24));
    expect(filler).toBe("TRUE");
    expect(items).toHaveLength(1);
    expect(items[0].tokens[0].location.uri.toString()).toBe(copybookUri);
    expect(items[0].tokens[0].location.range).toEqual(
      expectRange(0, 10, 0, 18),
    );
  });
});
