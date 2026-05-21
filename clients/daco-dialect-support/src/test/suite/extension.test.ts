/*
 * Copyright (c) 2023 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import * as assert from "node:assert";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";

suite("Extension Test Suite", function () {
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

  test("Resolve copybook without suffix successfully", async () => {
    const editor = await helper.showDocument("DaCo01.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(11, 19), pos(11, 31)));
  });

  test("Show diagnostic for invalid layout identifier", async () => {
    const editor = await helper.showDocument("DaCo02.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 6);

    const invalidLayoutDiagnostics = diagnostics.filter((d) =>
      d.message.includes("Invalid layout identifier"),
    );
    assert.strictEqual(invalidLayoutDiagnostics.length, 1);

    helper.assertRangeIsEqual(
      invalidLayoutDiagnostics[0].range,
      range(pos(8, 24), pos(8, 33)),
    );
  });

  test("Resolve copybook with suffix successfully", async () => {
    const editor = await helper.showDocument("DaCo03.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);

    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(11, 19), pos(11, 31)));
  });

  test("Resolve copybook with WRK suffix successfully", async () => {
    const editor = await helper.showDocument("DaCo04.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);

    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(17, 19), pos(17, 31)));
  });

  test("Resolve copybook with WRK suffix with various cases successfully", async () => {
    const editor = await helper.showDocument("DaCo05.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);

    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(17, 19), pos(17, 31)));
  });

  test("Resolve copybook with WRK suffix (different case) successfully", async () => {
    const editor = await helper.showDocument("DaCo06.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);

    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(12, 19), pos(12, 31)));
  });

  test("Resolve copybook with WRK suffix (88 level case) successfully", async () => {
    const editor = await helper.showDocument("DaCo07.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(14, 19), pos(14, 31)));
  });

  test("Resolve copybook with WRK suffix (redefine use case) successfully", async () => {
    const editor = await helper.showDocument("DaCo08.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(12, 19), pos(12, 31)));
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
});
