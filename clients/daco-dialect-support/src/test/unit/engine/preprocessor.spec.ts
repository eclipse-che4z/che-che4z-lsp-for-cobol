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
 *   Broadcom, Inc. - initial API and implementation
 */

import { Uri, DiagnosticSeverity } from "vscode";
import { DaCoPreprocessor } from "../../../engine/preprocessor";
import { MessageService } from "../../../engine/services/MessageService";

describe("DaCoPreprocessor test", () => {
  const HEADER =
    "        IDENTIFICATION DIVISION.\n" +
    "          PROGRAM-ID. PARTEST.\n" +
    "        ENVIRONMENT DIVISION.\n" +
    "        IDMS-CONTROL SECTION.\n" +
    "            PROTOCOL. MODE ABC.\n" +
    "            IDMS-RECORDS MANUAL\n" +
    "          DATA DIVISION.\n" +
    "          WORKING-STORAGE SECTION.\n";

  const preprocessor = new DaCoPreprocessor();
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
    addDiagnostic: jest.fn(),
  };
  const outputChannel: any = {
    appendLine: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should report a diagnostic for mismatched layout identifier", () => {
    preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER +
        "          01 COPY MAID TEST-AA12.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
      outputChannel,
      createMessageService(),
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

  it("should report a diagnostic for mismatched layout usage", () => {
    preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER + "          COPY MAID TEST-A12 SUFFIX.",
      outputChannel,
      createMessageService(),
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

  it("should resolve copybook reference", () => {
    preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER +
        "          01 COPY MAID NAME.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
      outputChannel,
      createMessageService(),
    );
    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "NAME",
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 10 }),
        end: expect.objectContaining({ line: 8, character: 28 }),
      }),
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 23 }),
        end: expect.objectContaining({ line: 8, character: 27 }),
      }),
    );
  });

  it("should resolve copybook reference with suffix", () => {
    preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      HEADER +
        "          01 COPY MAID NAME-ABC KMK.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
      outputChannel,
      createMessageService(),
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
      HEADER +
        "          01 COPY MAID NAME.\n" +
        "          PROCEDURE DIVISION.\n" +
        "              DISPLAY ABC.\n",
      outputChannel,
      createMessageService(),
    );

    expect(context.addDiagnostic).not.toHaveBeenCalled();
    expect(context.resolveCopybook).toHaveBeenCalledWith(
      "NAME",
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 10 }),
        end: expect.objectContaining({ line: 8, character: 28 }),
      }),
      expect.objectContaining({
        start: expect.objectContaining({ line: 8, character: 23 }),
        end: expect.objectContaining({ line: 8, character: 27 }),
      }),
    );
    expect(copybookContext.replace).not.toHaveBeenCalled();
  });
});

function createMessageService() {
  return new MessageService({
    "validation.layout_identifier": "Invalid layout identifier",
    "validation.layout_usage": "Invalid layout usage",
  });
}
