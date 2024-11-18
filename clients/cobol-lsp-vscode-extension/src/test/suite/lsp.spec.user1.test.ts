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
import { pos } from "./testHelper";
import * as vscode from "vscode";

const WORKSPACE_FILE = "USER1.cbl";

suite("Tests with USER1.cbl", function () {
  let editor: vscode.TextEditor;
  suiteSetup(async function () {
    this.timeout(0);
    this.slow(2000);
    await helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );
  this.beforeEach(async () => {
    await helper.showDocument(WORKSPACE_FILE);
    editor = helper.getEditor(WORKSPACE_FILE);
  });

  this.afterAll(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  // open 'open' file, should be recognized as COBOL
  test("TC152048: Cobol file is recognized by LSP", async () => {
    // setting a language takes a while but shouldn't take longer than a second
    await helper.waitFor(() => editor.document.languageId === "cobol");
    assert.ok(editor.document.languageId === "cobol");
  });

  test("TC152046: Nominal - check syntax Ok message", async () => {
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg =
      "Checks that when opening Cobol file with correct syntax there is an appropriate message is shown";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  async function executeProvider(
    provider:
      | "vscode.executeDefinitionProvider"
      | "vscode.executeReferenceProvider",
    line: number,
    char: number,
  ) {
    let locations: vscode.Location[] = [];
    await helper.waitFor(async () => {
      locations = await vscode.commands.executeCommand(
        provider,
        editor.document.uri,
        pos(line, char),
      );

      return locations.length > 0;
    });
    return locations;
  }

  test("TC152049: Navigate through definitions", async () => {
    const result = await executeProvider(
      "vscode.executeDefinitionProvider",
      28,
      24,
    );

    assert.strictEqual(result.length, 1);
    assert.ok(
      result[0].uri.fsPath.includes(editor.document.fileName) &&
        result[0].range.start.line === 31 &&
        result[0].range.start.character === 7,
      "Checks behavior of go to definition action",
    );
  });

  test("TC152080: Find all references from the word middle", async () => {
    const result = await executeProvider(
      "vscode.executeReferenceProvider",
      20,
      15,
    );

    assert.strictEqual(result.length, 3, "Check references count");
    assert.ok(
      result[0].uri.fsPath.includes(editor.document.fileName),
      "Check references path",
    );
    assert.strictEqual(result[0].range.start.line, 20, "Check reference line");
    assert.strictEqual(
      result[0].range.start.line,
      20,
      "Check 1 reference line",
    );
    assert.strictEqual(
      result[1].range.start.line,
      34,
      "Check 2 reference line",
    );
    assert.strictEqual(
      result[2].range.start.line,
      42,
      "Check 3 reference line",
    );
  });

  test("TC152080: Find all references from the word begin", async () => {
    const result = await executeProvider(
      "vscode.executeReferenceProvider",
      20,
      10,
    );

    assert.ok(
      result.length === 3 &&
        result[0].uri.fsPath.includes(editor.document.fileName) &&
        result[0].range.start.line === 20 &&
        result[1].range.start.line === 34 &&
        result[2].range.start.line === 42,
      "Checks that LSP can find all references and navigate by them",
    );
  });

  test("TC152054 Auto format of right trailing spaces", async () => {
    await helper.insertString(
      editor,
      pos(34, 57),
      "                                ",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    assert.strictEqual(
      vscode.languages.getDiagnostics(editor.document.uri).length,
      1,
    );
    await vscode.workspace
      .getConfiguration()
      .update("cobol-lsp.formatting", "None");
    const result = await vscode.commands.executeCommand<vscode.TextEdit[]>(
      "vscode.executeFormatDocumentProvider",
      editor.document.uri,
      { tabSize: 4, insertSpaces: true },
    );
    assert.strictEqual(result.length, 1);

    helper.assertRangeIsEqual(
      result[0].range,
      new vscode.Range(pos(34, 57), pos(34, 89)),
    );
    assert.strictEqual(result[0].newText, "");
  });
});
