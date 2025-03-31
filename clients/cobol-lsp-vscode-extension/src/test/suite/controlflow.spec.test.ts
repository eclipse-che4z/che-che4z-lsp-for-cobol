/*
 * Copyright (c) 2025 Broadcom.
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
import * as vscode from "vscode";

suite("Integration Test Suite", function () {
  suiteSetup(async function () {
    this.timeout(0);
    await helper.updateConfig("controlflow.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  this.afterAll(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  test("Show errors only for opened files", async () => {
    // Open program with error inside a copybook
    await helper.showDocument("TESTCPY1.cbl");
    const progUri = await helper.getUri("TESTCPY1.cbl");

    await helper.waitFor(
      () => vscode.languages.getDiagnostics(progUri).length === 2,
    );
    const diagnostics = vscode.languages.getDiagnostics(progUri);
    assert.strictEqual(
      diagnostics.length,
      2,
      "got: " + JSON.stringify(diagnostics),
    );
    helper.hasDiagnosticMatches(
      progUri,
      (d) => d.message === "Implicit EXIT PROGRAM statement executed",
    );
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
});
