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

suite("WRITE statement Test Suite", function () {
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

  test("Process ROW ADD statement successfully", async () => {
    const editor = await helper.showDocument("DaCo32.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(23, 19), pos(23, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(24, 19), pos(24, 23)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(24, 19), pos(24, 23)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(25, 35), pos(25, 39)),
    );
  });

  test("Process ROW ANY statement successfully", async () => {
    const editor = await helper.showDocument("DaCo33.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 19), pos(20, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 36), pos(21, 40)),
    );
  });

  test("Process ROW BUFFER statement successfully", async () => {
    const editor = await helper.showDocument("DaCo34.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(17, 22), pos(17, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(18, 22), pos(18, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(18, 22), pos(18, 26)),
    );
  });

  test("Process ROW DELETE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo35.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 22), pos(20, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 22), pos(21, 26)),
    );
  });

  test("Process ROW DUPLICATE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo36.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 25), pos(20, 35)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 25), pos(21, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 25), pos(21, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 39), pos(22, 43)),
    );
  });

  test("Process ROW GET statement successfully", async () => {
    const editor = await helper.showDocument("DaCo37.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 6);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(30, 19), pos(30, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(31, 19), pos(31, 23)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(31, 19), pos(31, 23)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(32, 33), pos(32, 37)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(33, 47), pos(33, 51)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(34, 33), pos(34, 37)),
    );
  });

  test("Process ROW INITIALIZE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo38.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 26), pos(20, 36)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 26), pos(21, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 26), pos(21, 30)),
    );
  });

  test("Process ROW INSERT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo39.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 22), pos(22, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 22), pos(22, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 38), pos(23, 42)),
    );
  });

  test("Process ROW INVERT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo40.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 22), pos(20, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 22), pos(21, 26)),
    );
  });

  test("Process ROW MATCH statement successfully", async () => {
    const editor = await helper.showDocument("DaCo41.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 21), pos(20, 31)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 38), pos(21, 42)),
    );
  });

  test("Process ROW MODIFY statement successfully", async () => {
    const editor = await helper.showDocument("DaCo42.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 5);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(26, 22), pos(26, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(27, 22), pos(27, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(27, 22), pos(27, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(28, 36), pos(28, 40)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(29, 52), pos(29, 56)),
    );
  });

  test("Process ROW NEXT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo43.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 20), pos(22, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 34), pos(23, 38)),
    );
  });

  test("Process ROW PRIOR statement successfully", async () => {
    const editor = await helper.showDocument("DaCo44.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 21), pos(22, 31)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 35), pos(23, 39)),
    );
  });

  test("Process ROW RESTORE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo45.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 23), pos(21, 33)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 23), pos(22, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 23), pos(22, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 39), pos(23, 43)),
    );
  });

  test("Process ROW SAVE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo46.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 20), pos(21, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 20), pos(22, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 20), pos(22, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 34), pos(23, 38)),
    );
  });

  test("Process ROW SINGLE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo47.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 22), pos(20, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 22), pos(21, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 36), pos(22, 40)),
    );
  });

  test("Process ROW SORT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo48.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 20), pos(22, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(23, 20), pos(23, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 20), pos(23, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(24, 38), pos(24, 42)),
    );
  });

  test("Process ROW START statement successfully", async () => {
    const editor = await helper.showDocument("DaCo49.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 3);

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 21), pos(20, 31)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 21), pos(21, 25)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 21), pos(21, 25)),
    );
  });
});
