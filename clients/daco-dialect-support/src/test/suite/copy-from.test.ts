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

suite("COPY-FROM statement Test Suite", function () {
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

  test("Process COPY-FROM statement successfully (case 1)", async () => {
    const editor = await helper.showDocument("DaCo74.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(11, 7), pos(11, 29)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(14, 19), pos(14, 31)),
    );
  });

  test("Process COPY-FROM statement successfully (case 2)", async () => {
    const editor = await helper.showDocument("DaCo75.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(10, 7), pos(10, 29)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
    );
  });

  test("Process COPY-FROM statement successfully (case 3)", async () => {
    const editor = await helper.showDocument("DaCo76.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(10, 7), pos(10, 29)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
    );
  });

  test("Process COPY-FROM statement successfully (line continuation)", async () => {
    const editor = await helper.showDocument("DaCo77.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(15, 19), pos(15, 31)),
    );
  });

  test("Process COPY-FROM statement successfully (no source)", async () => {
    const editor = await helper.showDocument("DaCo78.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Source for NODE1 not found",
      range(pos(9, 20), pos(9, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      'A "PICTURE" or "USAGE INDEX" clause was not found for elementary item NODE1',
      range(pos(9, 14), pos(9, 19)),
    );
  });

  test("Process COPY-FROM statement successfully (case 4)", async () => {
    const editor = await helper.showDocument("DaCo79.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(10, 7), pos(10, 29)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
    );
  });

  test("Process COPY-FROM statement successfully (duplicate variables)", async () => {
    const editor = await helper.showDocument("DaCo80.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(15, 19), pos(15, 31)),
    );
  });

  test("Process COPY-FROM statement successfully (undefined variable)", async () => {
    const editor = await helper.showDocument("DaCo81.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(16, 19), pos(16, 31)),
    );
  });

  test("Process COPY-FROM statement successfully (group variable)", async () => {
    const editor = await helper.showDocument("DaCo82.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(16, 19), pos(16, 31)),
    );
  });

  test("Process COPY-FROM as a variable name successfully", async () => {
    const editor = await helper.showDocument("DaCo83.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(10, 19), pos(10, 31)),
    );
  });

  test("Process COPY-FROM with redefines variables", async () => {
    const editor = await helper.showDocument("DaCo89.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(38, 19), pos(38, 31)),
    );
  });
});
