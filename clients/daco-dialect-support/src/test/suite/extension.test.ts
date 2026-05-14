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
});
