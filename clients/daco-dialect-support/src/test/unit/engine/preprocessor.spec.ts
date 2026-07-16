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
  const preprocessor = new DaCoPreprocessor(
    outputChannel,
    createMessageService(),
  );
  const copybookContext: any = {
    resolveCopybook: jest.fn(),
    addDiagnostic: jest.fn(),
    replace: jest.fn(),
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
    addDiagnostic: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
    jest
      .spyOn(SettingsService, "getPredefinedSections")
      .mockImplementation(() => []);
  });

  it("should report a diagnostic for mismatched layout identifier", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
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

  it("should report a diagnostic for mismatched layout usage", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER_0 + "          COPY MAID TEST-A12 SUFFIX.",
    );

    expect(context.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        severity: DiagnosticSeverity.Error,
        message: "Invalid layout usage",
        range: expect.objectContaining({
          start: expect.objectContaining({ line: 8, character: 29 }),
          end: expect.objectContaining({ line: 8, character: 35 }),
        }),
      }),
    );
  });

  it("should resolve copybook reference", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
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
      Uri.parse("file:///test.cbl"),
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
      Uri.parse("file:///test.cbl"),
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

  it("should parse READ TRANSACTION", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER_1 + "          READ TRANSACTION\n" + "          GO TO FOO.\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.replace).toHaveBeenCalled();
  });

  it("should parse WRITE TRANSACTION with variable usage", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER_1 + "          WRITE TRANSACTION 3167 LENGTH TRANSACTION-SIZE.\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.replaceWithMap).toHaveBeenCalled();
  });

  it("should replace D-B with spaces", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER_1 + "       D-B\n",
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.replace).toHaveBeenCalled();
  });

  it("should replace COPY-FROM statement", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
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

  it("should report an error for COPY-FROM statement with invalid source suffix", async () => {
    await preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
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
