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

describe("DaCoPreprocessor test", () => {
  const preprocessor = new DaCoPreprocessor();
  const context: any = {
    resolveCopybook: jest.fn(),
    addDiagnostic: jest.fn(),
  };
  const outputChannel: any = {
    appendLine: jest.fn(),
  };

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("should report a diagnostic for mismatched input", () => {
    preprocessor.execute(
      context,
      Uri.parse("file:///test.cbl"),
      "COPY MAID TEST-AA12.",
      outputChannel,
    );

    expect(context.addDiagnostic).toHaveBeenCalledWith(
      expect.objectContaining({
        severity: DiagnosticSeverity.Error,
        message:
          "mismatched input 'TEST-AA12' expecting DACO_COPYBOOK_IDENTIFIER",
        range: expect.objectContaining({
          start: expect.objectContaining({ line: 0, character: 10 }),
          end: expect.objectContaining({ line: 0, character: 19 }),
        }),
      }),
    );
  });

  it("should", () => {
    // preprocessor.execute(
    //   context,
    //   Uri.parse("file:///test.cbl"),
    //   "        IDENTIFICATION DIVISION.\n" +
    //     "          PROGRAM-ID. PARTEST.\n" +
    //     "        ENVIRONMENT DIVISION.\n" +
    //     "        IDMS-CONTROL SECTION.\n" +
    //     "            PROTOCOL. MODE ABC.\n" +
    //     "            IDMS-RECORDS MANUAL\n" +
    //     "          DATA DIVISION.\n" +
    //     "          WORKING-STORAGE SECTION.\n" +
    //     "          01 COPY MAID NAME.\n" +
    //     "          PROCEDURE DIVISION.\n" +
    //     "              DISPLAY ABC.",
    //   outputChannel,
    // );
    // expect(context.addDiagnostic).not.toHaveBeenCalled();
    // expect(context.resolveCopybook).toHaveBeenCalledWith(
    //   "NAME",
    //   expect.objectContaining({
    //     start: expect.objectContaining({ line: 9, character: 10 }),
    //     end: expect.objectContaining({ line: 9, character: 13 }),
    //   }),
    //   expect.objectContaining({
    //     start: expect.objectContaining({ line: 9, character: 14 }),
    //     end: expect.objectContaining({ line: 9, character: 18 }),
    //   }),
    // );
  });
});
