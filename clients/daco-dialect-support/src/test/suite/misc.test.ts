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

    await helper.checkDefinition(editor, new vscode.Position(11, 31), 8);
  });

  test("Process DFLD (exception case) statement successfully", async () => {
    const editor = await helper.showDocument("DaCo13.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.message, "Variable NOT_EXISTING is not defined");
    helper.assertRangeIsEqual(d0.range, range(pos(14, 19), pos(14, 31)));

    await helper.checkDefinition(editor, new vscode.Position(11, 24), 7);
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

  test("Process IF ROW statement successfully", async () => {
    const editor = await helper.showDocument("DaCo69.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(14, 23), pos(14, 35)),
    );
  });

  test("Cleanup D-C and D-B tokens successfully", async () => {
    const editor = await helper.showDocument("DaCo72.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(14, 19), pos(14, 31)),
    );
  });

  test("Process DACO-SECTION successfully", async () => {
    const editor = await helper.showDocument("DaCo73.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable UNKVAR-XW4 is not defined",
      range(pos(7, 22), pos(7, 32)),
    );
  });

  test("Process PROCEDURE DIVISION with options successfully", async () => {
    const editor = await helper.showDocument("DaCo91.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(11, 19), pos(11, 31)),
    );
  });

  test("Process PIC clause with dots inside successfully", async () => {
    const editor = await helper.showDocument("DaCo104.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
    );
  });

  test("Allow for 66, 77 and 88 levels non-canonical variable names", async () => {
    const editor = await helper.showDocument("DaCo107.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
    );
  });

  test("Process OPEN PACKET statement successfully", async () => {
    const editor = await helper.showDocument("DaCo18.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 7);

    checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(23, 23), pos(23, 24)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of receiver packet must be 3 bytes",
      range(pos(24, 29), pos(24, 33)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(24, 23), pos(24, 24)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(25, 23), pos(25, 28)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(26, 32), pos(26, 35)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(27, 48), pos(27, 51)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(29, 19), pos(29, 22)),
    );
  });

  test("Process GET ENTITY statement successfully", async () => {
    const editor = await helper.showDocument("DaCo19.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 5);

    checkDiagnostic(
      diagnostics,
      "String length must be between 3 and 4",
      range(pos(30, 22), pos(30, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "String length must be between 3 and 4",
      range(pos(31, 22), pos(31, 29)),
    );

    checkDiagnostic(
      diagnostics,
      "Only allowed value(s): OWNER, OWN, DESIGNER, AVG, ANALIST, ANA",
      range(pos(32, 39), pos(32, 47)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of tal must be 2 bytes",
      range(pos(33, 51), pos(33, 56)),
    );

    checkDiagnostic(
      diagnostics,
      "Only allowed value(s): DOM",
      range(pos(34, 22), pos(34, 28)),
    );
  });

  test("Process GET ITEM statement successfully", async () => {
    const editor = await helper.showDocument("DaCo20.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 7);

    checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(24, 24), pos(24, 34)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(25, 46), pos(25, 56)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(26, 35), pos(26, 45)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(27, 24), pos(27, 34)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(28, 32), pos(28, 42)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(29, 32), pos(29, 42)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(30, 42), pos(30, 52)),
    );
  });

  test("Process GET JOB statement successfully", async () => {
    const editor = await helper.showDocument("DaCo21.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    checkDiagnostic(
      diagnostics,
      "Variable DET002-XW1 is not defined",
      range(pos(16, 19), pos(16, 29)),
    );
  });

  test("Process GET NETWORK statement successfully", async () => {
    const editor = await helper.showDocument("DaCo22.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    checkDiagnostic(
      diagnostics,
      "Variable DET002-XW1 is not defined",
      range(pos(16, 23), pos(16, 33)),
    );
  });

  test("Process GET ODETTE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo23.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    checkDiagnostic(
      diagnostics,
      "Variable DET002-XW1 is not defined",
      range(pos(16, 22), pos(16, 32)),
    );
  });

  test("Process GET TASK statement successfully", async () => {
    const editor = await helper.showDocument("DaCo24.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(16, 20), pos(16, 27)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable SDFRE is not defined",
      range(pos(17, 20), pos(17, 25)),
    );
  });

  test("Process GET USER statement successfully", async () => {
    const editor = await helper.showDocument("DaCo25.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    checkDiagnostic(
      diagnostics,
      "Exact length of kls must be 3 bytes",
      range(pos(18, 20), pos(18, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable DETFR-EW is not defined",
      range(pos(19, 26), pos(19, 34)),
    );
  });

  test("Process SHOW error MESSAGE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo26.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    checkDiagnostic(
      diagnostics,
      "Exact length of language code must be 2 bytes",
      range(pos(17, 24), pos(17, 30)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(18, 24), pos(18, 27)),
    );
  });

  test("Process SHOW MESSAGE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo27.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 30);

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(62, 21), pos(62, 23)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(63, 25), pos(63, 27)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(64, 24), pos(64, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(65, 28), pos(65, 30)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(66, 22), pos(66, 24)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(67, 26), pos(67, 28)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(68, 21), pos(68, 25)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(69, 25), pos(69, 29)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(70, 24), pos(70, 28)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(71, 28), pos(71, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(72, 22), pos(72, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(73, 26), pos(73, 30)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(74, 25), pos(74, 28)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(75, 29), pos(75, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(76, 28), pos(76, 31)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(77, 32), pos(77, 35)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(78, 26), pos(78, 29)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(79, 30), pos(79, 33)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(80, 36), pos(80, 39)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(81, 40), pos(81, 43)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(82, 39), pos(82, 42)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(83, 43), pos(83, 46)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(84, 37), pos(84, 40)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(85, 41), pos(85, 44)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(86, 47), pos(86, 50)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(87, 51), pos(87, 54)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(88, 50), pos(88, 53)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(89, 54), pos(89, 57)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(90, 48), pos(90, 51)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(91, 52), pos(91, 55)),
    );
  });

  test("Process SHOW RESULT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo28.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(11, 23), pos(11, 25)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(12, 23), pos(12, 28)),
    );
  });

  test("Process SHOW RESULT statement successfully", async () => {
    const editor = await helper.showDocument("DaCo29.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });

  test("Process RETURN FIELD statement successfully", async () => {
    const editor = await helper.showDocument("DaCo30.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(27, 23), pos(27, 25)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(28, 26), pos(28, 28)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(29, 24), pos(29, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(30, 23), pos(30, 27)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(31, 26), pos(31, 30)),
    );

    checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(32, 24), pos(32, 28)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(33, 27), pos(33, 30)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(34, 30), pos(34, 33)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(35, 28), pos(35, 31)),
    );
  });

  test("Process ROW ADD statement successfully", async () => {
    const editor = await helper.showDocument("DaCo32.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(23, 19), pos(23, 29)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(24, 19), pos(24, 23)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(24, 19), pos(24, 23)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 19), pos(20, 29)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(17, 22), pos(17, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(18, 22), pos(18, 26)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 22), pos(20, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 26)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 25), pos(20, 35)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 25), pos(21, 29)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 25), pos(21, 29)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(30, 19), pos(30, 29)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(31, 19), pos(31, 23)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(31, 19), pos(31, 23)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(32, 33), pos(32, 37)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(33, 47), pos(33, 51)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 26), pos(20, 36)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 26), pos(21, 30)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 22), pos(22, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 22), pos(22, 26)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 22), pos(20, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 26)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 21), pos(20, 31)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(26, 22), pos(26, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(27, 22), pos(27, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(27, 22), pos(27, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(28, 36), pos(28, 40)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 20), pos(22, 30)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 21), pos(22, 31)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 23), pos(21, 33)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 23), pos(22, 27)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 23), pos(22, 27)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 20), pos(21, 30)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 20), pos(22, 24)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(22, 20), pos(22, 24)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 22), pos(20, 32)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 22), pos(21, 26)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 22), pos(21, 26)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(22, 20), pos(22, 30)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(23, 20), pos(23, 24)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(23, 20), pos(23, 24)),
    );

    checkDiagnostic(
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

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(20, 21), pos(20, 31)),
    );

    checkDiagnostic(
      diagnostics,
      "String must starts with TBL or TBF values",
      range(pos(21, 21), pos(21, 25)),
    );

    checkDiagnostic(
      diagnostics,
      "Variable GBR4 is not defined",
      range(pos(21, 21), pos(21, 25)),
    );
  });
});
