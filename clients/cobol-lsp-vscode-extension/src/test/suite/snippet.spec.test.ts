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

suite.skip(
  "Integration Test Suite: Snippets with different dialects settings",
  function () {
    suiteSetup(async function () {
      this.timeout(helper.TEST_TIMEOUT);
      helper.updateConfig("idms.json");
      await helper.activate();
    });
    this.afterEach(async () => await helper.closeAllEditors()).timeout(
      helper.TEST_TIMEOUT,
    );

    test("Autocompletion basic dialect", async () => {
      helper.updateConfig("basic.json");
      await helper.showDocument("SNIPPET.cbl");
      const editor = helper.get_editor("SNIPPET.cbl");
      await helper.waitFor(() => editor.document.languageId === "cobol");
      await helper.insertString(editor, pos(2, 0), "   IDENTIFICATION");
      await vscode.commands.executeCommand(
        "editor.action.triggerSuggest",
        editor.document.uri,
      );
      await helper.sleep(1000);
      await helper.executeCommandMultipleTimes("selectNextSuggestion", 1);
      await vscode.commands.executeCommand("acceptSelectedSuggestion");
      await helper.waitFor(() => editor.document.getText().length > 0);
      await helper.sleep(1000);
      const text = editor.document.getText();
      assert.strictEqual(text.trimEnd(), "   IDENTIFICATION DIVISION.");
    }).timeout(helper.TEST_TIMEOUT);

    test("Autocompletion with IDMS dialect", async () => {
      await helper.showDocument("SNIPPET_IDMS.cbl");
      const editor = helper.get_editor("SNIPPET_IDMS.cbl");
      await helper.waitFor(() => editor.document.languageId === "cobol");
      await helper.insertString(editor, pos(1, 0), "   COPY");
      await vscode.commands.executeCommand(
        "editor.action.triggerSuggest",
        editor.document.uri,
      );
      await helper.executeCommandMultipleTimes("selectNextSuggestion", 1);
      await vscode.commands.executeCommand("acceptSelectedSuggestion");
      await helper.waitFor(() => editor.document.getText().length > 0);
      const text = editor.document.getText();
      assert.ok(text, "   COPY IDMS idms-entity.");
    }).timeout(helper.TEST_TIMEOUT);

    test("Keywords Autocompletion for IDMS dialect", async () => {
      await helper.showDocument("SNIPPET_IDMS.cbl");
      const editor = helper.get_editor("SNIPPET_IDMS.cbl");
      await helper.waitFor(() => editor.document.languageId === "cobol");
      await helper.insertString(editor, pos(1, 0), "   IDMS-STATIST");
      await vscode.commands.executeCommand(
        "editor.action.triggerSuggest",
        editor.document.uri,
      );
      await helper.executeCommandMultipleTimes("selectNextSuggestion", 1);
      await vscode.commands.executeCommand("acceptSelectedSuggestion");
      await helper.waitFor(() => editor.document.getText().length > 0);
      const text = editor.document.getText();
      assert.ok(text, "   IDMS-STATISTICS");
      await helper.sleep(1000);
      await helper.closeActiveEditor();
    }).timeout(helper.TEST_TIMEOUT);

    test("TC152058 Autocompletion basic dialect", async () => {
      await helper.showDocument("USER1.cbl");
      const editor = helper.get_editor("USER1.cbl");
      helper.updateConfig("basic.json");
      await helper.waitFor(() => editor.document.languageId === "cobol");
      await helper.insertString(editor, pos(40, 0), "           A");
      await vscode.commands.executeCommand(
        "editor.action.triggerSuggest",
        editor.document.uri,
      );
      await helper.sleep(1000);
      await helper.executeCommandMultipleTimes("selectNextSuggestion", 5);
      await vscode.commands.executeCommand("acceptSelectedSuggestion");
      await editor.edit((edit) => edit.replace(editor.selection, "1"));
      await helper.sleep(1000);
      await vscode.commands.executeCommand("jumpToNextSnippetPlaceholder");
      await helper.sleep(1000);
      await editor.edit((edit) => edit.replace(editor.selection, "str"));
      await helper.waitFor(() =>
        editor.document.getText().includes("ADD 1 TO str"),
      );
      const text = editor.document.getText();
      const acceptedLine = text.split("\n")[40];
      assert.ok(
        acceptedLine.includes("ADD 1 TO str"),
        "Checks auto complete functionality, also with navigation by snippets",
      );
    }).timeout(helper.TEST_TIMEOUT);
  },
);

suite("TF42379 COBOL LS F96588 - Insert code snippets", function () {
  suiteSetup(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    helper.updateConfig("basic.json");
    await helper.activate();
  });
  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  test.skip("TC289633 Provide default COBOL code snippets - basic scenario", async () => {
    await helper.showDocument("SNIPPET.cbl");
    const editor = helper.get_editor("SNIPPET.cbl");
    await helper.insertString(editor, pos(2, 0), "sh");
    await vscode.commands.executeCommand(
      "editor.action.triggerSuggest",
      editor.document.uri,
    );
    await helper.waitFor(() => editor.document.getText().length > 2, 500);
    await helper.executeCommandMultipleTimes("selectNextSuggestion", 0);
    await vscode.commands.executeCommand("acceptSelectedSuggestion");
    await helper.waitFor(() => editor.document.getText().length > 5);
    const lines = editor.document.getText().split(/\r\n|\r|\n/);
    assert.strictEqual(lines[0], "       IDENTIFICATION DIVISION.");
    assert.strictEqual(lines[2], "       ENVIRONMENT DIVISION.");
    assert.strictEqual(lines[7], "       DATA DIVISION.");
    assert.strictEqual(lines[11], "       PROCEDURE DIVISION.");
  });
  // .timeout(helper.TEST_TIMEOUT);

  test.skip("TC289635 Provide default COBOL code snippets - upper case", async () => {
    await helper.showDocument("SNIPPET.cbl");
    const editor = helper.get_editor("SNIPPET.cbl");
    await helper.insertString(editor, pos(2, 0), "sh");
    await vscode.commands.executeCommand(
      "editor.action.triggerSuggest",
      editor.document.uri,
    );
    await helper.waitFor(() => editor.document.getText().length > 2, 500);
    await helper.executeCommandMultipleTimes("selectNextSuggestion", 0);
    await vscode.commands.executeCommand("acceptSelectedSuggestion");
    await helper.waitFor(() => editor.document.getText().length > 5);
    await helper.insertString(editor, pos(14, 0), "           COPY AB.");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(diagnostics[0].message, "AB: Copybook not found");

    await helper.insertString(editor, pos(15, 0), "\n");
    await helper.insertString(editor, pos(15, 0), "           FUNCTION CO");
    await vscode.commands.executeCommand(
      "editor.action.triggerSuggest",
      editor.document.uri,
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 3,
      500,
    );
    await helper.executeCommandMultipleTimes("selectNextSuggestion", 0);
    await vscode.commands.executeCommand("acceptSelectedSuggestion");
    const lines = editor.document.getText().split(/\r\n|\r|\n/);
    assert.ok(lines[15].includes("FUNCTION COS"));
  });
  // .timeout(helper.TEST_TIMEOUT);

  test.skip("TC289636 Provide default COBOL code snippets - lower case", async () => {
    await helper.showDocument("SNIPPET.cbl");
    const editor = helper.get_editor("SNIPPET.cbl");
    await helper.insertString(editor, pos(2, 0), "sh");
    await vscode.commands.executeCommand(
      "editor.action.triggerSuggest",
      editor.document.uri,
    );
    await helper.waitFor(() => editor.document.getText().length > 2, 500);
    await helper.executeCommandMultipleTimes("selectNextSuggestion", 0);
    await vscode.commands.executeCommand("acceptSelectedSuggestion");
    await helper.waitFor(() => editor.document.getText().length > 5);
    await helper.insertString(editor, pos(14, 0), "           COPY AB.");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(diagnostics[0].message, "AB: Copybook not found");

    await helper.insertString(editor, pos(15, 0), "\n");
    await helper.insertString(editor, pos(15, 0), "           function co");
    await vscode.commands.executeCommand(
      "editor.action.triggerSuggest",
      editor.document.uri,
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 3,
      500,
    );
    await helper.executeCommandMultipleTimes("selectNextSuggestion", 0);
    await vscode.commands.executeCommand("acceptSelectedSuggestion");
    const lines = editor.document.getText().split(/\r\n|\r|\n/);
    assert.ok(lines[15].includes("FUNCTION COS"));
  });
  // .timeout(helper.TEST_TIMEOUT);
});
