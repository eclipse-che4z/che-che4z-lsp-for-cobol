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

suite("WRITE statement Test Suite", function () {
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

  test("Process WRITE REPORT (ENDRPT case) statement successfully", async () => {
    const editor = await helper.showDocument("DaCo14.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 5);

    helper.checkDiagnostic(
      diagnostics,
      "Only alphanumerics are allowed for report name",
      range(pos(13, 24), pos(13, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of report name must be 5 bytes",
      range(pos(13, 24), pos(13, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Only alphanumerics are allowed for report name",
      range(pos(14, 24), pos(14, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of report name must be 5 bytes",
      range(pos(15, 24), pos(15, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with R or T",
      range(pos(16, 24), pos(16, 29)),
    );
  });

  test("Process WRITE REPORT (AUTO case) statement successfully", async () => {
    const editor = await helper.showDocument("DaCo15.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 5);

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(16, 29), pos(16, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(17, 37), pos(17, 40)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(17, 29), pos(17, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(18, 44), pos(18, 47)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(19, 29), pos(19, 32)),
    );
  });

  test("Process WRITE REPORT (mapping case) statement successfully", async () => {
    const editor = await helper.showDocument("DaCo16.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 80 to 200",
      range(pos(14, 46), pos(14, 48)),
      vscode.DiagnosticSeverity.Warning,
    );
  });

  test("Process WRITE REPORT (report with name case) statement successfully", async () => {
    const editor = await helper.showDocument("DaCo17.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 15);

    helper.checkDiagnostic(
      diagnostics,
      "Only alphanumerics are allowed for report name",
      range(pos(45, 24), pos(45, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of report name must be 5 bytes",
      range(pos(45, 24), pos(45, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of report name must be 5 bytes",
      range(pos(46, 24), pos(46, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with R or T",
      range(pos(47, 24), pos(47, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with R or T",
      range(pos(47, 24), pos(47, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 80 to 200",
      range(pos(48, 53), pos(48, 55)),
      vscode.DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 80 to 200",
      range(pos(49, 53), pos(49, 56)),
      vscode.DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(50, 49), pos(50, 52)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 80 to 200",
      range(pos(51, 67), pos(51, 69)),
      vscode.DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 80 to 200",
      range(pos(52, 67), pos(52, 70)),
      vscode.DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 80 to 200",
      range(pos(54, 60), pos(54, 63)),
      vscode.DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(54, 49), pos(54, 52)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(55, 52), pos(55, 55)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(56, 49), pos(56, 52)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 80 to 200",
      range(pos(56, 60), pos(56, 63)),
      vscode.DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(57, 23), pos(57, 26)),
    );
  });
});
