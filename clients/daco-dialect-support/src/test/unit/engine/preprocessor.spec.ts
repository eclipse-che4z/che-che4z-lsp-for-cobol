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

import { Uri, DiagnosticSeverity } from "vscode";
import { readFileSync } from "node:fs";
import { Item } from "@code4z/cobol-dialect-api";
import { DaCoPreprocessor } from "../../../engine/preprocessor";
import { createMessageService } from "./utils";
import { SettingsService } from "../../../engine/services/settings";

describe("DaCoPreprocessor test", () => {
  const HEADER_0 =
    "        IDENTIFICATION DIVISION.\n" +
    "          PROGRAM-ID. PARTEST.\n" +
    "        ENVIRONMENT DIVISION.\n" +
    "        IDMS-CONTROL SECTION.\n" +
    "            PROTOCOL. MODE ABC.\n" +
    "            IDMS-RECORDS MANUAL\n" +
    "          DATA DIVISION.\n" +
    "          WORKING-STORAGE SECTION.\n";

  const HEADER_1 =
    "        IDENTIFICATION DIVISION.\n" +
    "          PROGRAM-ID. PARTEST.\n" +
    "        PROCEDURE DIVISION.\n";

  const outputChannel: any = {
    appendLine: jest.fn(),
  };
  let preprocessor: DaCoPreprocessor;

  const copybookContext: any = {
    resolveCopybook: jest.fn(),
    addDiagnostic: jest.fn(),
    replace: jest.fn(),
    getDocumentUri: jest
      .fn()
      .mockReturnValue(Uri.parse("file:///copybook.cbl")),
  };
  const context: any = {
    resolveCopybook: jest.fn().mockResolvedValue({
      context: copybookContext,
      uri: Uri.parse("file:///copybook.cbl"),
      text: "         01 ABC PIC 9.",
    }),
    replace: jest.fn(),
    replaceWithMap: jest.fn(),
    insert: jest.fn(),
    insertWithMap: jest.fn(),
    addDiagnostic: jest.fn(),
    getDocumentUri: jest.fn().mockReturnValue(Uri.parse("file:///test.cbl")),
  };

  beforeEach(() => {
    jest.clearAllMocks();
    jest
      .spyOn(SettingsService, "getPredefinedSections")
      .mockImplementation(() => []);
    jest
      .spyOn(SettingsService, "getGenericCopybooks")
      .mockImplementation(() => []);

    preprocessor = new DaCoPreprocessor(outputChannel, createMessageService());
  });

  it("should report a diagnostic for mismatched layout identifier", async () => {
    await preprocessor.execute(
      context,
      HEADER_0 +
        "          01 COPY MAID TEST-AA12.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
    );

    expect(context.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        severity: DiagnosticSeverity.Error,
        message: "Invalid layout identifier",
        range: expect.objectContaining({
          start: expect.objectContaining({ line: 8, character: 23 }),
          end: expect.objectContaining({ line: 8, character: 32 }),
        }),
      }),
    );
  });

  it("should resolve copybook reference", async () => {
    await preprocessor.execute(
      context,
      HEADER_0 +
        "          01 COPY MAID NAME OTP.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
    );
    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "NAME_OTP",
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 10 }),
        end: expect.objectContaining({ line: 8, character: 32 }),
      }),
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 23 }),
        end: expect.objectContaining({ line: 8, character: 27 }),
      }),
    );
  });

  it("should resolve copybook reference with suffix", async () => {
    await preprocessor.execute(
      context,
      HEADER_0 +
        "          01 COPY MAID NAME-ABC KMK.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "NAME-ABC_KMK",
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 10 }),
        end: expect.objectContaining({ line: 8, character: 36 }),
      }),
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 23 }),
        end: expect.objectContaining({ line: 8, character: 31 }),
      }),
    );
  });

  it("should not adjust copybook equal variable levels", async () => {
    await preprocessor.execute(
      context,
      HEADER_0 +
        "          01 COPY MAID NAME OTP.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "NAME_OTP",
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 10 }),
        end: expect.objectContaining({ line: 8, character: 32 }),
      }),
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 23 }),
        end: expect.objectContaining({ line: 8, character: 27 }),
      }),
    );
    expect(copybookContext.replace).not.toHaveBeenCalled();
  });

  it("should report an error if copybook was not resolved", async () => {
    context.resolveCopybook = jest.fn().mockResolvedValue(undefined);

    await preprocessor.execute(
      context,
      HEADER_0 +
        "          01 COPY MAID NAME-ABC KMK.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
    );

    expect(context.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({ message: "NAME-ABC: Copybook not found" }),
    );
  });

  it("should skip another dialect's COPY statement in the data division", async () => {
    await preprocessor.execute(
      context,
      HEADER_0 +
        "          01  COPY IDMS SUBSCHEMA-NAMES.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
  });

  it("should process MAID in file and working-storage sections around foreign COPY", async () => {
    const sourceContext = {
      ...context,
      resolveCopybook: jest.fn().mockResolvedValue({
        context: copybookContext,
        uri: Uri.parse("file:///copybook.cbl"),
        text: "         01 ABC PIC 9.",
      }),
      addDiagnostic: jest.fn(),
    };

    await preprocessor.execute(
      sourceContext,
      [
        "        IDENTIFICATION DIVISION.",
        "          PROGRAM-ID. PARTEST.",
        "          DATA DIVISION.",
        "          FILE SECTION.",
        "          FD INPUT-FILE.",
        "          01 INPUT-RECORD PIC X(8).",
        "          03 COPY MAID FILELAY OTP.",
        "          SD SORT-FILE.",
        "          01 SORT-RECORD PIC X(8).",
        "          WORKING-STORAGE SECTION.",
        "          01 COPY IDMS SUBSCHEMA-NAMES.",
        "          01 COPY MAID NAME OTP.",
        "          PROCEDURE DIVISION.",
        "              DISPLAY ABC.",
      ].join("\n"),
    );

    expect(sourceContext.addDiagnostic).not.toHaveBeenCalled();
    expect(sourceContext.resolveCopybook).toHaveBeenCalledTimes(2);
    expect(sourceContext.resolveCopybook).toHaveBeenNthCalledWith(
      1,
      "FILELAY_OTP",
      expect.anything(),
      expect.anything(),
    );
    expect(sourceContext.resolveCopybook).toHaveBeenNthCalledWith(
      2,
      "NAME_OTP",
      expect.anything(),
      expect.anything(),
    );
  });

  it("should parse READ TRANSACTION", async () => {
    await preprocessor.execute(
      context,
      HEADER_1 + "          READ TRANSACTION\n" + "          GO TO FOO.\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.replace).toHaveBeenCalled();
  });

  it("should parse WRITE TRANSACTION with variable usage", async () => {
    await preprocessor.execute(
      context,
      HEADER_1 + "          WRITE TRANSACTION 3167 LENGTH TRANSACTION-SIZE.\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.replaceWithMap).toHaveBeenCalled();
  });

  it("should replace D-B with spaces", async () => {
    await preprocessor.execute(context, HEADER_1 + "       D-B\n");

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.replace).toHaveBeenCalled();
  });

  it("should replace COPY-FROM statement", async () => {
    await preprocessor.execute(
      context,
      HEADER_0 +
        "       01 AREA-XW4.\n" +
        "           03 TBLOPT-XW4.\n" +
        "               07 TBLCRI-XW4.\r\n" +
        "                 09 RUSCRI-BW4       PIC S9(2)   VALUE ZERO  COMP.\n" +
        "                 09 ROWCRI-XW4                   OCCURS 40.\n" +
        "       01 AREA-XW5.\n" +
        "           05 TBLCRI-XW6  COPY-FROM W4.\n",
    );
    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.replace).toHaveBeenCalled();
  });

  it("should map multiline COPY-FROM options one line at a time", async () => {
    const source = readFileSync("test_files/DaCo110.cbl", "utf8").replace(
      /^\d{6}/gm,
      "      ",
    );

    await preprocessor.execute(context, source);

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.insertWithMap).toHaveBeenCalledTimes(1);
    const [, , items, insertion] = context.insertWithMap.mock.calls[0];
    const tokens = (items as Item[]).flatMap((item) => item.tokens);
    const options = tokens.filter((token) =>
      token.name.startsWith("TokenOptions"),
    );

    expect(options).toHaveLength(3);
    expect(options[1].value).toBe("PIC S9(7)V9(2)");
    expect(options[2].value.trim()).toBe("VALUE ZERO  COMP");
    expect(insertion).toContain(`{${options[1].name}}\n{${options[2].name}}`);
    for (const token of tokens) {
      expect(token.location.range.start.line).toBe(
        token.location.range.end.line,
      );
      expect(token.value).not.toContain("\n");
    }
  });

  it("should report an error for COPY-FROM statement with invalid source suffix", async () => {
    await preprocessor.execute(
      context,
      HEADER_0 +
        "       01 AREA-XW4.\n" +
        "           03 TBLOPT-XW4.\n" +
        "               07 TBLCRI-XW4.\r\n" +
        "                 09 RUSCRI-BW4       PIC S9(2)   VALUE ZERO  COMP.\n" +
        "                 09 ROWCRI-XW4                   OCCURS 40.\n" +
        "       01 AREA-XW5.\n" +
        "           05 A COPY-FROM W4.\n",
    );
    expect(context.addDiagnostic).toHaveBeenCalled();
    expect(context.replace).toHaveBeenCalled();
  });
});
