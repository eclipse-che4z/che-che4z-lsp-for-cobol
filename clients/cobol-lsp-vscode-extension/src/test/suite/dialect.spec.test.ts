/*
 * Copyright (c) 2025 Broadcom.
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
import * as assert from "assert";
import * as helper from "./testHelper";
import * as vscode from "vscode";

suite("Integration Test Suite: Dialect specific tests", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async function () {
    await helper.updateConfig("sample_dialect.json");
    await helper.activate();
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("Run SAMPLE dialect", async () => {
    const editor = await helper.showDocument("cobol-sample/SAMPLE1.cbl");

    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    checkDiagnostic(
      diagnostics,
      "Errors inside the copybook",
      24,
      11,
      24,
      33,
      "COBOL Language Support (copybook)",
    );

    checkDiagnostic(
      diagnostics,
      "Variable V2 does not exist in structure G2",
      25,
      28,
      25,
      30,
      "COBOL Language Support (parsing)",
    );

    checkDiagnostic(
      diagnostics,
      "The following paragraph is not defined: P1",
      25,
      48,
      25,
      50,
      "COBOL Language Support (parsing)",
    );

    checkDiagnostic(
      diagnostics,
      "Sample dialect diagnostic (MAKEDIAG)",
      26,
      11,
      26,
      19,
      "COBOL Language Support (dialect)",
    );

    const copybookEditor = await helper.showDocument("copy-sample/COPY1.cpy");
    const copybookDiagnostics = await helper.waitForDiagnostics(
      copybookEditor.document.uri,
    );
    helper.printAllDiagnostics(copybookDiagnostics);

    assert.strictEqual(copybookDiagnostics.length, 1);

    checkDiagnostic(
      copybookDiagnostics,
      "Sample dialect diagnostic (MAKEDIAG)",
      1,
      11,
      1,
      19,
      "COBOL Language Support (dialect)",
    );
  });
});

function checkDiagnostic(
  diagnostics: vscode.Diagnostic[],
  message: string,
  startLine: number,
  startCharacter: number,
  endLine: number,
  endCharacter: number,
  source: string,
) {
  const diagnostic = diagnostics.find(
    (diag) =>
      diag.message === message &&
      diag.source === source &&
      diag.range.start.line === startLine &&
      diag.range.start.character === startCharacter &&
      diag.range.end.line === endLine &&
      diag.range.end.character === endCharacter,
  );
  assert.ok(diagnostic, `Diagnostic with message "${message}" not found.`);
}
