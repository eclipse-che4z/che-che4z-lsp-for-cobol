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

import * as assert from "assert";
import * as helper from "./testHelper";
import * as path from "path";

suite("Integration Test Suite: Processor Groups", function () {
  this.timeout(helper.TEST_TIMEOUT);
  this.slow(1000);
  suiteSetup(async function () {
    helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.beforeEach(async () => {
    await helper.closeAllEditors();
  });

  // cobol-dialect-api (development) npm ci && npm run compile
  // daco-dialect-support (development) npm ci && npm run package
  // idms-dialect-support (development) npm ci && npm run package
  // put server.jar, dialect-idms.jar and dialect-daco.jar into their server/jar folders

  test.skip("TC355920: IDMS - with preprocessor setup", async () => {
    const extSrcPath = path.join("cobol-idms", "IDMSSMPL.cbl");
    const diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    await helper.showDocument(extSrcPath);
    const diagnostics = await diagPromise;
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^IDMSABCD: Copybook not found/);
  });

  test.skip("TC355921: DaCo - with processor setup", async () => {
    const extSrcPath = path.join("cobol-daco", "DACOSMPL.cbl");
    const diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    await helper.showDocument(extSrcPath);
    const diagnostics = await diagPromise;
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^MAIDABCD: Copybook not found/);
  });

  test("TC355918: IDMS - without preprocessor setup", async () => {
    const extSrcPath = path.join("cobol-vanila", "IDMSSMPL.cbl");
    const diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    await helper.showDocument(extSrcPath);
    const diagnostics = await diagPromise;
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Syntax error on 'IDMS-CONTROL'/);
  });

  test.skip("TC355919: DaCo - without preprocessor setup", async () => {
    const extSrcPath = path.join("cobol-idms", "DACOSMPL.cbl");
    const diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    await helper.showDocument(extSrcPath);
    const diagnostics = await diagPromise;
    const maidSyntaxErrors = diagnostics.filter((diag) =>
      diag.message.startsWith("Syntax error on 'MAID'"),
    );
    assert.strictEqual(maidSyntaxErrors.length, 2);
  });
});
