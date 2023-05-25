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

suite(
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
