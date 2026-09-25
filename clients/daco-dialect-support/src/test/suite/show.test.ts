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

  test("Process SHOW error MESSAGE statement successfully", async () => {
    const editor = await helper.showDocument("DaCo26.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of language code must be 2 bytes",
      range(pos(17, 24), pos(17, 30)),
    );

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(62, 21), pos(62, 23)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(63, 25), pos(63, 27)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(64, 24), pos(64, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(65, 28), pos(65, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(66, 22), pos(66, 24)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(67, 26), pos(67, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(68, 21), pos(68, 25)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(69, 25), pos(69, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(70, 24), pos(70, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(71, 28), pos(71, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(72, 22), pos(72, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of message code must be 3 bytes",
      range(pos(73, 26), pos(73, 30)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(74, 25), pos(74, 28)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(75, 29), pos(75, 32)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(76, 28), pos(76, 31)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(77, 32), pos(77, 35)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(78, 26), pos(78, 29)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(79, 30), pos(79, 33)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(80, 36), pos(80, 39)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(81, 40), pos(81, 43)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(82, 39), pos(82, 42)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(83, 43), pos(83, 46)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(84, 37), pos(84, 40)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(85, 41), pos(85, 44)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(86, 47), pos(86, 50)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(87, 51), pos(87, 54)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(88, 50), pos(88, 53)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(89, 54), pos(89, 57)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable ASD is not defined",
      range(pos(90, 48), pos(90, 51)),
    );

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
      diagnostics,
      "Exact length of task name must be 4 bytes",
      range(pos(11, 23), pos(11, 25)),
    );

    helper.checkDiagnostic(
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

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });
});
