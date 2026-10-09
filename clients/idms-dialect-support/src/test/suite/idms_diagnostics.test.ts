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
 * Java usecases:
 * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsTransferStatement.java
 * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsLoadStatement.java
 */

import * as vscode from "vscode";
import * as helper from "./testHelper";

suite("IDMS-specific diagnostics", function () {
  this.timeout(helper.TEST_TIMEOUT);
  suiteSetup(async () => helper.activate());
  this.afterEach(async () => helper.closeAllEditors());
  this.afterAll(async () => helper.closeAllEditors());

  test("reports an overlong name in an IDMS copybook at the copybook location", async () => {
    await helper.showDocument("IdmsDiagnosticsCopybook.cbl");
    await helper.showDocument("copybooks/IDMS-DIAGNOSTICS-COPY");
    const copybookUri = await helper.getUri("copybooks/IDMS-DIAGNOSTICS-COPY");
    const diagnostics = await helper.waitForDiagnosticMessages(copybookUri, [
      "Max length limit of 8 bytes allowed for program name.",
    ]);
    helper.checkDiagnostic(
      diagnostics,
      "Max length limit of 8 bytes allowed for program name.",
      new vscode.Range(0, 31, 0, 43),
      vscode.DiagnosticSeverity.Error,
      "COBOL Language Support (dialect)",
    );
  });

  test("accepts a valid table, node and dictionary name", async () => {
    await helper.openWithoutIdmsErrors(
      "usecase/TestIdmsLoadStatement_LOAD_LITERALS.cbl",
    );
  });

  test("rejects a three-digit SUBSCHEMA-NAMES LENGTH", async () => {
    const editor = await helper.showDocument("IdmsLength116.cbl");
    const message = "The length 116 is not allowed. Allowed values are 16, 18.";
    const diagnostics = await helper.waitForDiagnosticMessages(
      editor.document.uri,
      [message],
    );
    const start = helper.positionOf(editor, "116", true);
    helper.checkDiagnostic(
      diagnostics,
      message,
      new vscode.Range(start, start.translate(0, 3)),
      vscode.DiagnosticSeverity.Error,
      "COBOL Language Support (dialect)",
    );
  });
});
