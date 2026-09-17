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

suite("IDMS statements Test Suite", function () {
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

  async function assertStatementsAreProcessed(fileName: string) {
    const editor = await helper.showDocument(fileName);
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);

    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "Variable NOT-EXISTING is not defined",
    );
  }

  test("Process every simple IDMS statement", async () => {
    await assertStatementsAreProcessed("Statements001.cbl");
  });

  test("Process multiline statement variants", async () => {
    await assertStatementsAreProcessed("Statements002.cbl");
  });

  test("Process statements around COBOL IF and periods", async () => {
    await assertStatementsAreProcessed("Statements003.cbl");
  });
});
