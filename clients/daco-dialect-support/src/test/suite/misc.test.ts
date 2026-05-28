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
 *   Broadcom, Inc. - initial API and implementation
 */

import * as vscode from "vscode";
import * as assert from "node:assert";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";

suite("Miscellaneous statements Test Suite", function () {
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

  test("Process READ TRANSACTION statement successfully", async () => {
    const editor = await helper.showDocument("DaCo09.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(6, 19), pos(6, 31)));
  });

  test("Process READ TRANSACTION statement (validate parameters) successfully", async () => {
    const editor = await helper.showDocument("DaCo10.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    const d0 = diagnostics[0];
    assert.strictEqual(
      d0.message,
      "Only alphanumerics are allowed for task name",
    );
    helper.assertRangeIsEqual(d0.range, range(pos(14, 28), pos(14, 32)));

    const d1 = diagnostics[1];
    assert.strictEqual(d1.message, "Exact length of task name must be 4 bytes");
    helper.assertRangeIsEqual(d1.range, range(pos(15, 28), pos(15, 30)));

    const d2 = diagnostics[2];
    assert.strictEqual(d2.message, "Exact length of task name must be 4 bytes");
    helper.assertRangeIsEqual(d2.range, range(pos(16, 28), pos(16, 33)));
  });

  test("Process WRITE TRANSACTION statement (validate parameters) successfully", async () => {
    const editor = await helper.showDocument("DaCo11.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 10);

    const d0 = diagnostics[0];
    assert.strictEqual(
      d0.message,
      "Only alphanumerics are allowed for task name",
    );
    helper.assertRangeIsEqual(d0.range, range(pos(24, 29), pos(24, 33)));

    const d1 = diagnostics[1];
    assert.strictEqual(d1.message, "Exact length of task name must be 4 bytes");
    helper.assertRangeIsEqual(d1.range, range(pos(25, 29), pos(25, 31)));

    const d2 = diagnostics[2];
    assert.strictEqual(d2.message, "Exact length of task name must be 4 bytes");
    helper.assertRangeIsEqual(d2.range, range(pos(26, 29), pos(26, 34)));

    const d3 = diagnostics[3];
    assert.strictEqual(d3.message, "Allowed range is 4 to 2048");
    helper.assertRangeIsEqual(d3.range, range(pos(27, 41), pos(27, 42)));

    const d4 = diagnostics[4];
    assert.strictEqual(d4.message, "Allowed range is 4 to 2048");
    helper.assertRangeIsEqual(d4.range, range(pos(28, 42), pos(28, 43)));

    const d5 = diagnostics[5];
    assert.strictEqual(d5.message, "Allowed range is 4 to 2048");
    helper.assertRangeIsEqual(d5.range, range(pos(29, 41), pos(29, 45)));

    const d6 = diagnostics[6];
    assert.strictEqual(d6.message, "Allowed range is 4 to 2048");
    helper.assertRangeIsEqual(d6.range, range(pos(30, 42), pos(30, 46)));

    const d7 = diagnostics[7];
    assert.strictEqual(
      d7.message,
      "Max length limit of 19 bytes allowed for dbu.",
    );
    helper.assertRangeIsEqual(d7.range, range(pos(31, 47), pos(31, 68)));

    const d8 = diagnostics[8];
    assert.strictEqual(
      d8.message,
      "Max length limit of 19 bytes allowed for dbu.",
    );
    helper.assertRangeIsEqual(d8.range, range(pos(32, 48), pos(32, 69)));

    const d9 = diagnostics[9];
    assert.strictEqual(
      d9.message,
      "Variable FDERESS4342 does not exist in structure NOT_EXISTING",
    );
    helper.assertRangeIsEqual(d9.range, range(pos(33, 38), pos(33, 65)));
  });

  test("Process DFLD statement successfully", async () => {
    const editor = await helper.showDocument("DaCo12.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(14, 19), pos(14, 31)));

    await checkDefinition(editor, new vscode.Position(11, 31), 8);
  });

  test("Process DFLD (exception case) statement successfully", async () => {
    const editor = await helper.showDocument("DaCo13.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(14, 19), pos(14, 31)));

    await checkDefinition(editor, new vscode.Position(11, 24), 7);
  });

  test("Process OPEN PACKET statement successfully", async () => {
    const editor = await helper.showDocument("DaCo18.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 7);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(23, 23), pos(23, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of receiver packet must be 3 bytes",
      range(pos(24, 29), pos(24, 33)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(24, 23), pos(24, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(25, 23), pos(25, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(26, 32), pos(26, 35)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(27, 48), pos(27, 51)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(29, 19), pos(29, 22)),
    );
  });

  test("Process RETURN FIELD statement successfully", async () => {
    const editor = await helper.showDocument("DaCo30.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Max length limit of 12 bytes allowed for field name.",
      range(pos(6, 24), pos(6, 37)),
    );
  });

  test("Process RETURN status statement successfully", async () => {
    const editor = await helper.showDocument("DaCo31.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 9);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(27, 23), pos(27, 25)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(28, 26), pos(28, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(29, 24), pos(29, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(30, 23), pos(30, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(31, 26), pos(31, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(32, 24), pos(32, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(33, 27), pos(33, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(34, 30), pos(34, 33)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(35, 28), pos(35, 31)),
    );
  });
});

async function checkDefinition(
  editor: vscode.TextEditor,
  position: vscode.Position,
  expectedLine: number,
) {
  const definitions = await vscode.commands.executeCommand<vscode.Location[]>(
    "vscode.executeDefinitionProvider",
    editor.document.uri,
    position,
  );

  assert.ok(definitions);
  assert.strictEqual(definitions.length, 1);

  const definition = definitions[0];
  assert.strictEqual(definition.range.start.line, expectedLine);
}
