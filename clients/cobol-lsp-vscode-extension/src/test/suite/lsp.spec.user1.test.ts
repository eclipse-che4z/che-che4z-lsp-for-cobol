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

const TEST_TIMEOUT = 30000;
const WORKSPACE_FILE = "USER1.cbl";

suite("Tests with USER1.cbl", function () {
  let editor: vscode.TextEditor;
  suiteSetup(async function () {
    this.timeout(0);
    this.slow(2000);
    helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );
  this.beforeEach(async () => {
    await helper.showDocument(WORKSPACE_FILE);
    editor = helper.get_editor(WORKSPACE_FILE);
  });

  // open 'open' file, should be recognized as COBOL
  test("TC152048: Cobol file is recognized by LSP", async () => {
    // setting a language takes a while but shouldn't take longer than a second
    await helper.waitFor(() => editor.document.languageId === "cobol");
    assert.ok(editor.document.languageId === "cobol");
  });

  test("TC152046: Nominal - check syntax Ok message", async () => {
    await helper.waitFor(() => editor.document.languageId === "cobol");
    const diagnostics = vscode.languages.getDiagnostics(
      helper.get_active_editor().document.uri,
    );
    const expectedMsg =
      "Checks that when opening Cobol file with correct syntax there is an appropriate message is shown";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test("TC152049: Navigate through definitions", async () => {
    await helper.sleep(10000);
    const result: any[] = await vscode.commands.executeCommand(
      "vscode.executeDefinitionProvider",
      editor.document.uri,
      pos(28, 24),
    );
    assert.strictEqual(result.length, 1);
    assert.ok(
      result[0].uri.fsPath === editor.document.fileName &&
        result[0].range.start.line === 31 &&
        result[0].range.start.character === 7,
      "Checks behavior of go to definition action",
    );
  });

  test("TC152080: Find all references from the word middle", async () => {
    const result: any[] = await vscode.commands.executeCommand(
      "vscode.executeReferenceProvider",
      editor.document.uri,
      pos(20, 15),
    );
    assert.ok(
      result.length === 3 &&
        result[0].uri.fsPath === editor.document.fileName &&
        result[0].range.start.line === 20 &&
        result[1].range.start.line === 34 &&
        result[2].range.start.line === 42,
      "Checks that LSP can find all references and navigate by them",
    );
  });

  test("TC152080: Find all references from the word begin", async () => {
    const result: any[] = await vscode.commands.executeCommand(
      "vscode.executeReferenceProvider",
      editor.document.uri,
      pos(20, 10),
    );
    assert.ok(
      result.length === 3 &&
        result[0].uri.fsPath === editor.document.fileName &&
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
    const result: any[] = await vscode.commands.executeCommand(
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
