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
import { LANGUAGE_ID } from "../../../constants";

suite("Web Extension Test Suite: Snippets", () => {
  suiteSetup(async () => {
    await helper.activate();
  });

  teardown(async () => {
    await helper.closeActiveEditor();
  });

  test("Insert Snippet Command", async function () {
    await vscode.commands.executeCommand(
      "workbench.action.files.newUntitledFile",
      { languageId: LANGUAGE_ID },
    );

    await vscode.commands.executeCommand("cobol-lsp.snippets.insertSnippets");

    await vscode.commands.executeCommand(
      "workbench.action.quickOpenSelectNext",
    );
    vscode.commands.executeCommand(
      "workbench.action.acceptSelectedQuickOpenItem",
    );

    const editor = vscode.window.activeTextEditor!;
    await helper.waitFor(() => editor.document.getText().length > 0);

    const text = editor.document.getText();
    assert.strictEqual(text, "ADD id TO id");
  });
});
