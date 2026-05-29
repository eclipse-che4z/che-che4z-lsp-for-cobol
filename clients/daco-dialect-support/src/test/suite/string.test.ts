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
 *   Broadcom - initial API and implementation
 */
import * as assert from "node:assert";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";

suite("String DML statements Test Suite", function () {
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

  test("Process STRING FIND statement successfully", async () => {
    const editor = await helper.showDocument("DaCo57.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(17, 23), pos(17, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(18, 34), pos(18, 38)),
    );
  });

  test("Process STRING GET statement successfully", async () => {
    const editor = await helper.showDocument("DaCo58.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(15, 22), pos(15, 26)),
    );
  });

  test("Process STRING NEXT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo59.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(16, 23), pos(16, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(17, 44), pos(17, 48)),
    );
  });

  test("Process STRING MATCH statement successfully", async () => {
    const editor = await helper.showDocument("DaCo60.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(20, 24), pos(20, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 35), pos(21, 39)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 46), pos(22, 50)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Allowed range is 0 to 255",
      range(pos(23, 46), pos(23, 49)),
    );
  });

  test("Process STRING CHECK statement successfully", async () => {
    const editor = await helper.showDocument("DaCo61.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(16, 28), pos(16, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Max length limit of 55 bytes allowed for email.",
      range(pos(18, 11), pos(18, 70)),
    );
  });

  test("Process STRING ADD statement successfully", async () => {
    const editor = await helper.showDocument("DaCo62.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(19, 22), pos(19, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(20, 33), pos(20, 37)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 51), pos(21, 55)),
    );
  });

  test("Process STRING INSERT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo63.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(19, 25), pos(19, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(20, 36), pos(20, 40)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 54), pos(21, 58)),
    );
  });

  test("Process STRING FILL statement successfully", async () => {
    const editor = await helper.showDocument("DaCo64.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(19, 23), pos(19, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(20, 34), pos(20, 38)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 52), pos(21, 56)),
    );
  });

  test("Process STRING REPLACE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo65.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 6);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(18, 26), pos(18, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(19, 30), pos(19, 34)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(20, 37), pos(20, 41)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 41), pos(21, 45)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 51), pos(22, 55)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 55), pos(23, 59)),
    );
  });

  test("Process STRING DELETE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo66.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(18, 25), pos(18, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(19, 29), pos(19, 33)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(20, 36), pos(20, 40)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 40), pos(21, 44)),
    );
  });
});
