/*
 * Copyright (c) 2023 Broadcom.
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
import * as vscode from "vscode";
import * as helper from "./testHelper";
import { pos, range } from "./testHelper";

suite("Extension Test Suite", function () {
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

  test("Sample test", async () => {
    await helper.sleep(100000);

    // const editor = await helper.showDocument("USER2.cbl");
    // const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    // assert.strictEqual(diagnostics.length, 1);
    // const d0 = diagnostics[0];

    // assert.strictEqual(d0.message, "Syntax error on 'Program1-id'");
    // helper.assertRangeIsEqual(d0.range, range(pos(14, 7), pos(14, 18)));
  });
});
