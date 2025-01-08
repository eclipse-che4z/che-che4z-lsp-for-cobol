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

import * as helper from "./testHelper";
import * as vscode from "vscode";
import * as assert from "assert";

suite("Integration Test Suite: Subroutines resolving", () => {
  suiteSetup(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.updateConfig("subroutines.json");
    await helper.activate();
  });

  test("Diagnostics report missing subroutine", async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.showDocument("CALL.cbl");
    const editor = helper.getEditor("CALL.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(diagnostics[0].message, "SUB2: Subroutine not found");
  });

  test("Subroutines auto completions are provided", async function () {
    const editor = await helper.showDocument("CALL.cbl");
    await helper.insertString(
      editor,
      helper.pos(23, 0),
      "           CALL ''.\n",
    );
    helper.moveCursor(editor, helper.pos(23, 17));
    await helper.triggerCompletionsAndWaitForResults();
    await helper.executeCommandMultipleTimes("selectNextSuggestion", 2);
    await vscode.commands.executeCommand("acceptSelectedSuggestion");
    const line = editor.document.lineAt(23).text.trim();
    assert.strictEqual(line, "CALL 'SUB1'.");
  });
});
