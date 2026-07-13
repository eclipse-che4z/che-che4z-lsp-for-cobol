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
import { DiagnosticSeverity } from "vscode";

suite("Copybook Test Suite", function () {
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
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      2,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(8, 11), pos(8, 35)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(11, 19), pos(11, 31)),
    );
  });

  test("Show diagnostic for invalid layout identifier", async () => {
    const editor = await helper.showDocument("DaCo02.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 7);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(8, 11), pos(8, 34)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Invalid layout identifier",
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

    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Parent variable 'ABC' must match the pattern <NAME>-XXN",
      range(pos(8, 10), pos(8, 13)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(17, 19), pos(17, 31)),
    );
  });

  test("Resolve copybook with WRK suffix (different case) successfully", async () => {
    const editor = await helper.showDocument("DaCo06.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);

    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Parent variable 'PARENT-XNT' must match the pattern <NAME>-XXN",
      range(pos(8, 10), pos(8, 20)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });

  test("Resolve copybook with WRK suffix (88 level case) successfully", async () => {
    const editor = await helper.showDocument("DaCo07.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Parent variable 'PARENT-XLD' must match the pattern <NAME>-XXN",
      range(pos(8, 10), pos(8, 20)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(14, 19), pos(14, 31)),
    );
  });

  test("Resolve copybook with WRK suffix (redefine use case) successfully", async () => {
    const editor = await helper.showDocument("DaCo08.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Parent variable 'PARENT-XLO' must match the pattern <NAME>-XXN",
      range(pos(8, 10), pos(8, 20)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });

  test("Validate parent name for copybook with WRK suffix", async () => {
    const editor = await helper.showDocument("DaCo84.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Parent variable 'BHTREG-XWX' must match the pattern <NAME>-XXN",
      range(pos(10, 16), pos(10, 26)),
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(13, 19), pos(13, 31)),
    );
  });

  test("Validate suffix name for copybook", async () => {
    const editor = await helper.showDocument("DaCo85.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    helper.checkDiagnostic(
      diagnostics,
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
      range(pos(8, 11), pos(8, 35)),
      DiagnosticSeverity.Warning,
    );

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(10, 19), pos(10, 31)),
    );
  });

  test("Resolve copybook in LINKAGE SECTION without WORKING-STORAGE", async () => {
    const editor = await helper.showDocument("DaCo86.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });

  test("Resolve copybook in both WORKING-STORAGE and LINKAGE SECTION", async () => {
    const editor = await helper.showDocument("DaCo87.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(16, 19), pos(16, 31)),
    );
  });

  test("Skip copybook from the PROCEDURE DIVISION sucessfully", async () => {
    const editor = await helper.showDocument("DaCo88.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(12, 19), pos(12, 31)),
    );
  });

  test("Skip copybook from the PROCEDURE DIVISION without final dot sucessfully", async () => {
    const editor = await helper.showDocument("DaCo90.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);

    helper.checkDiagnostic(
      diagnostics,
      "Variable NOT_EXISTING is not defined",
      range(pos(16, 19), pos(16, 31)),
    );
  });
});
