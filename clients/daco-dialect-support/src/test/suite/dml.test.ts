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
import * as assert from "node:assert";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";
import { DiagnosticSeverity } from "vscode";

suite("DML statements Test Suite", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async function () {
    await helper.activate();
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  this.afterAll(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("Process GET TABLE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo50.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of table reference must be 4 bytes",
      range(pos(12, 25), pos(12, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of table reference must be 4 bytes",
      range(pos(13, 25), pos(13, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of table reference must be 4 bytes",
      range(pos(14, 25), pos(14, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of table reference must be 4 bytes",
      range(pos(15, 25), pos(15, 30)),
    );
  });

  test("Process SORT TABLE statement must show a warning (unsupported)", async () => {
    const editor = await helper.showDocument("DaCo51.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "The code block is deprecated and not supported",
      range(pos(13, 11), pos(13, 47)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "The code block is deprecated and not supported",
      range(pos(14, 11), pos(14, 48)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "The code block is deprecated and not supported",
      range(pos(15, 11), pos(15, 47)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "The code block is deprecated and not supported",
      range(pos(16, 11), pos(16, 48)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDefinition(editor, pos(16, 23), 10);
    helper.checkDefinition(editor, pos(16, 28), 10);
    helper.checkDefinition(editor, pos(16, 37), 10);
  });

  test("Process OPEN FILE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo52.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(18, 21), pos(18, 23)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(19, 21), pos(19, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ABCD is not defined",
      range(pos(20, 37), pos(20, 41)),
    );
  });

  test("Process READ FILE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo53.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(18, 25), pos(18, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(19, 25), pos(19, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ABCD is not defined",
      range(pos(20, 41), pos(20, 45)),
    );
  });

  test("Process WRITE FILE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo54.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(17, 22), pos(17, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(18, 22), pos(18, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ABCD is not defined",
      range(pos(19, 34), pos(19, 38)),
    );
  });

  test("Process CLOSE FILE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo55.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(18, 28), pos(18, 33)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of file reference must be 4 bytes",
      range(pos(19, 29), pos(19, 34)),
    );
  });

  test("Process GET FILE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo56.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Variable ABCD is not defined",
      range(pos(18, 36), pos(18, 40)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ABCD is not defined",
      range(pos(19, 59), pos(19, 63)),
    );
  });
});
