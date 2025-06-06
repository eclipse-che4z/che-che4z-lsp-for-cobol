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

import * as vscode from "vscode";
import * as helper from "./testHelper";
import * as assert from "assert";

suite("Integration Test Suite: Subroutines resolving", () => {
  suiteSetup(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.updateConfig("subroutines.json");
    await helper.activate();
  });

  suiteTeardown(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("Diagnostics report missing subroutine", async function () {
    this.timeout(helper.TEST_TIMEOUT);
    const editor = await helper.showDocument("CALL.cbl");

    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.ok(
      diagnostics.some((d) => d.message === "SUB2: Subroutine not found"),
    );
  });

  test("Subroutines auto completions are provided", async function () {
    this.timeout(helper.TEST_TIMEOUT);
    const editor = await helper.openUntitledDocument();

    await helper.insertString(editor, helper.pos(0, 0), "           CALL ''.");
    await helper.sleep(1000);

    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);

    helper.moveCursor(editor, helper.pos(0, 17));
    const completions = await helper.triggerCompletionsAndWaitForResults();
    await helper.sleep(1000);
    const position = completions.items.findIndex((ci) => ci.label === "SUB1");
    assert.notEqual(
      position,
      -1,
      `SUB1 completion not found, ${JSON.stringify(completions.items.slice(0, 10))}`,
    );
    await helper.executeCommandMultipleTimes("selectNextSuggestion", position);
    await vscode.commands.executeCommand("acceptSelectedSuggestion");
    await helper.waitFor(() => {
      return editor.document.lineAt(0).text.trim() === "CALL 'SUB1'.";
    });
    const line = editor.document.lineAt(0).text.trim();
    assert.strictEqual(line, "CALL 'SUB1'.");
  });
});
