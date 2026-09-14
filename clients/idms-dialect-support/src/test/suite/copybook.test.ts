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

import * as assert from "assert";
import * as vscode from "vscode";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";

suite("Copybook Test Suite", function () {
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

  test("Error inside the copybook", async () => {
    const editor = await helper.showDocument("Idms001.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Errors inside the copybook",
      range(pos(8, 7), pos(8, 28)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Copybook not found", async () => {
    const editor = await helper.showDocument("Idms002.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "COPY1: Copybook not found",
      range(pos(8, 20), pos(8, 25)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve nested copybook", async () => {
    const editor = await helper.showDocument("Idms003.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Circular dependency", async () => {
    const editor = await helper.showDocument("Idms004.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Errors inside the copybook",
      range(pos(9, 11), pos(9, 32)),
      vscode.DiagnosticSeverity.Error,
    );

    const copyEditor = await helper.showDocument("copybooks/COPY004");
    const copyDiagnostics = await helper.waitForDiagnosticCount(
      copyEditor.document.uri,
      1,
    );
    helper.printAllDiagnostics(copyDiagnostics);
    assert.strictEqual(copyDiagnostics.length, 1);

    helper.checkDiagnostic(
      copyDiagnostics,
      "COPY004: Copybook has circular dependency",
      range(pos(0, 21), pos(0, 28)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve nested copybook and its variables properly constructed (case 1)", async () => {
    const editor = await helper.showDocument("Idms005.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve nested regular COBOL copybook", async () => {
    const editor = await helper.showDocument("Idms006.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
      vscode.DiagnosticSeverity.Error,
    );
  });

  test("Resolve nested copybook and its variables properly constructed (case 2)", async () => {
    const editor = await helper.showDocument("Idms007.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Ambiguous reference for IDMS-NODE",
      range(pos(12, 19), pos(12, 48)),
      vscode.DiagnosticSeverity.Error,
    );
  });
});
