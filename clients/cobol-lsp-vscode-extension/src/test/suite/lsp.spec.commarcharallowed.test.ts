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

import * as assert from "assert";
import * as helper from "./testHelper";

suite("TF51590: COBOL LS - SQL COMMA DECIMAL ENABLED/DISABLED", function () {
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
    await helper.updateConfig("basic.json");
  });

  test("TC399994-Test sql-decimal-comma-allowed NULL", async () => {
    await helper.updateConfig("basic.json");
    const editor = await helper.showDocument("SQL_IN_KEYWORD.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC399993-Test sql-decimal-comma-allowed FALSE", async () => {
    await helper.updateConfig("sql_decimal_comma_allowed_false.json");
    const editor = await helper.showDocument("SQL_IN_KEYWORD.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC399992-Test sql-decimal-comma-allowed TRUE", async () => {
    await helper.updateConfig("sql_decimal_comma_allowed.json");
    const editor = await helper.showDocument("SQL_IN_KEYWORD.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
});
