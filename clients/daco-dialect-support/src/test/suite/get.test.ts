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

  test("Process GET ENTITY statement successfully", async () => {
    const editor = await helper.showDocument("DaCo19.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 5);

    helper.checkDiagnostic(
      diagnostics,
      "String length must be between 3 and 4",
      range(pos(30, 22), pos(30, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "String length must be between 3 and 4",
      range(pos(31, 22), pos(31, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Only allowed value(s): OWNER, OWN, DESIGNER, AVG, ANALIST, ANA",
      range(pos(32, 39), pos(32, 47)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of tal must be 2 bytes",
      range(pos(33, 51), pos(33, 56)),
    );

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(24, 24), pos(24, 34)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(25, 46), pos(25, 56)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(26, 35), pos(26, 45)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(27, 24), pos(27, 34)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(28, 32), pos(28, 42)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable DSR443-RW1 is not defined",
      range(pos(29, 32), pos(29, 42)),
    );

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(16, 20), pos(16, 27)),
    );

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of kls must be 3 bytes",
      range(pos(18, 20), pos(18, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable DETFR-EW is not defined",
      range(pos(19, 26), pos(19, 34)),
    );
  });
});
