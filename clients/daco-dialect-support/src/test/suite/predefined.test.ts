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
import * as assert from "node:assert";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";

suite("Predefined Code Blocks Test Suite", function () {
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

  test("Resolve lowercase predefined section sucessfully", async () => {
    const editor = await helper.showDocument("DaCo92.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(14, 19), pos(14, 31)),
    );
  });

  test("Resolve already defined predefined section", async () => {
    const editor = await helper.showDocument("DaCo93.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(14, 19), pos(14, 31)),
    );
  });

  test("working storage predefined static variables (case 1)", async () => {
    const editor = await helper.showDocument("DaCo94.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(10, 19), pos(10, 31)),
    );
  });

  test("linkage section predefined variables", async () => {
    const editor = await helper.showDocument("DaCo95.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(11, 19), pos(11, 31)),
    );
  });

  test("working storage predefined table variables (case 1)", async () => {
    const editor = await helper.showDocument("DaCo96.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(8, 7), pos(8, 28)),
      vscode.DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });

  test("working storage predefined table variables (case 2)", async () => {
    const editor = await helper.showDocument("DaCo97.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });

  test("working storage predefined table variables with duplicates", async () => {
    const editor = await helper.showDocument("DaCo98.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
    );
  });

  test("working storage predefined static variables (case 2)", async () => {
    const editor = await helper.showDocument("DaCo99.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(10, 19), pos(10, 31)),
    );
  });
});
