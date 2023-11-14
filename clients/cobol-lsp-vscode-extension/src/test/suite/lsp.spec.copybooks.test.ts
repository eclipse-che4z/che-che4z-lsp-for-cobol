/*
 * Copyright (c) 2022 Broadcom.
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
import { getWorkspacePath, pos, range } from "./testHelper";
import * as path from "path";

suite("Integration Test Suite: Copybooks", function () {
  suiteSetup(async function () {
    this.timeout(0);
    helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  test("TC174655: Copybook - Nominal", async () => {
    await helper.showDocument("USERC1N1.cbl");
    const editor = helper.get_editor("USERC1N1.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(
      diagnostics[0].severity,
      vscode.DiagnosticSeverity.Error,
      "No syntax errors detected in USERC1N1.cbl",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC174657: Copybook - not exist: no syntax ok message", async () => {
    await helper.showDocument("USERC1F.cbl");
    const editor = helper.get_editor("USERC1F.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(
      diagnostics[0].severity,
      vscode.DiagnosticSeverity.Error,
      "No syntax errors detected in USERC1F.cbl",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC174658, TC174658: Copybook - not exist: error underlying and detailed hint", async () => {
    await helper.showDocument("USERC1F.cbl");
    const editor = helper.get_editor("USERC1F.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 3);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      range(pos(18, 12), pos(18, 17)),
    );
    assert.strictEqual(diagnostics[0].message, "BOOK3: Copybook not found");
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC174916/TC174917 Copybook - recursive error and detailed hint", async () => {
    await helper.showDocument("USERC1R.cbl");
    const editor = helper.get_editor("USERC1R.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 3);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      new vscode.Range(pos(18, 12), pos(18, 18)),
    );
    assert.strictEqual(
      diagnostics[0].message,
      "Recursive copybook declaration for: BOOK1R",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC174932/TC174933 Copybook - invalid definition and hint", async () => {
    await helper.showDocument("USERC1N2.cbl");
    const editor = helper.get_editor("USERC1N2.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 4);
    helper.assertRangeIsEqual(
      diagnostics[3].range,
      range(pos(51, 38), pos(51, 56)),
    );
    assert.strictEqual(
      diagnostics[3].message,
      "Variable USER-PHONE-MOBILE1 is not defined",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC174952 Copybook - not exist, but dynamically appears", async () => {
    await helper.showDocument("VAR.cbl");
    let editor = helper.get_editor("VAR.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 2);
    helper.assertRangeIsEqual(
      diagnostics[0].range,
      new vscode.Range(pos(22, 23), pos(22, 43)),
    );
    assert.strictEqual(
      diagnostics[0].message,
      "Variable CHILD1 is not defined",
    );
    helper.assertRangeIsEqual(
      diagnostics[1].range,
      new vscode.Range(pos(23, 23), pos(23, 44)),
    );
    assert.strictEqual(
      diagnostics[1].message,
      "Variable CHILD2 is not defined",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC174952 / TC174953 Copybook - definition not exist, but dynamically appears", async () => {
    await helper.showDocument("USERC1F.cbl");
    let editor = helper.get_editor("USERC1F.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    helper.assertRangeIsEqual(
      diagnostics[2].range,
      new vscode.Range(pos(41, 29), pos(41, 46)),
    );
    assert.strictEqual(
      diagnostics[2].message,
      "Variable USER-PHONE-MOBILE is not defined",
    );

    await editor.edit((edit) => {
      edit.replace(new vscode.Range(pos(18, 17), pos(18, 18)), "T.");
    });
    await helper.waitFor(
      () =>
        vscode.languages
          .getDiagnostics(editor.document.uri)
          .map((d) => d.message)
          .filter((m) => m === "Variable USER-PHONE-MOBILE is not defined")
          .length === 0,
    );

    assert.ok(
      vscode.languages
        .getDiagnostics(editor.document.uri)
        .map((d) => d.message)
        .filter((m) => m === "Variable USER-PHONE-MOBILE is not defined")
        .length === 0,
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC247497 - Local Copybooks - check hidden folders under c4z", async () => {
    const extSrcPath = path.join(getWorkspacePath(), ".c4z", ".extsrcs");
    const extSrcUri = vscode.Uri.file(extSrcPath);
    const hiddenFolder = vscode.workspace.getWorkspaceFolder(extSrcUri);
    assert.ok(hiddenFolder !== undefined);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
});
