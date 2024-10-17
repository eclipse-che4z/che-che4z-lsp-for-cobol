/*
 * Copyright (c) 2024 Broadcom.
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

import * as helper from "../../../test/suite/testHelper";
import * as vscode from "vscode";
import * as assert from "assert";

suite("Web Extension Test Suite: Smart Tab", () => {
  suiteSetup(async () => {
    await helper.activate();
  });

  teardown(async () => {
    await helper.closeActiveEditor();
    const config = vscode.workspace.getConfiguration();
    await config.update(
      "cobol-lsp.smart-tab",
      undefined,
      vscode.ConfigurationTarget.Workspace,
    );
  });

  suite("Default configuration", () => {
    setup(async () => {
      const config = vscode.workspace.getConfiguration();
      await config.update(
        "cobol-lsp.smart-tab",
        true,
        vscode.ConfigurationTarget.Workspace,
      );
    });

    test("Simulates tab presses", async function () {
      await helper.openUntitledDocument();

      const editor = vscode.window.activeTextEditor!;

      assert.strictEqual(editor.selection.active.character, 0);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 6);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 7);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 11);
    });
  });

  suite("Custom configuration", () => {
    setup(async () => {
      const config = vscode.workspace.getConfiguration();
      await config.update(
        "cobol-lsp.smart-tab",
        {
          default: [5, 20, 50, 70],
          anchors: {
            "DATA +DIVISION": [1, 2, 3, 4],
            "PROCEDURE +DIVISION": [3, 5, 70],
          },
        },
        vscode.ConfigurationTarget.Workspace,
      );
    });

    test("Default custom configuration", async function () {
      await helper.openUntitledDocument();

      const editor = vscode.window.activeTextEditor!;

      assert.strictEqual(editor.selection.active.character, 0);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 5);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 20);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 50);
    });

    test("Anchor custom configuration", async function () {
      await helper.openUntitledDocument();

      const editor = vscode.window.activeTextEditor!;

      await vscode.commands.executeCommand("type", {
        text: "DATA DIVISION.\n",
      });

      assert.strictEqual(editor.selection.active.character, 0);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 1);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 2);

      await vscode.commands.executeCommand("cobol-lsp.smart-tab");
      assert.strictEqual(editor.selection.active.character, 3);
    });
  });
});
