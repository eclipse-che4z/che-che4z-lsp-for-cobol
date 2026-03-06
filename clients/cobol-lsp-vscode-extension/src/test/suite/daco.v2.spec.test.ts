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

suite("Integration Test Suite: New DaCo Dialect specific tests", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async function () {
    await helper.updateConfig("daco_new.json");
    await helper.activate();
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("Run New DaCo dialect", async () => {
    const editor = await helper.showDocument("cobol-daco/DACOSMPL.cbl");
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 4);
  })

});