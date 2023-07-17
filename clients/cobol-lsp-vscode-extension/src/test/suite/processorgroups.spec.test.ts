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
import * as vscode from "vscode";
import * as path from "path";

suite("Integration Test Suite: Processor Groups", function () {
  suiteSetup(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  // cobol-dialect-api (development) npm ci && npm run compile
  // daco-dialect-support (development) npm ci && npm run package
  // idms-dialect-support (development) npm ci && npm run package
  // put server.jar, dialect-idms.jar and dialect-daco.jar into their server/jar folder

  test("TC355920: IDMS - processor group", async () => {
    const extSrcPath = path.join("cobol-idms", "DACRFIERR.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    const waitResult = await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length == 1
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
  
  test("TC355921: DaCo - processor group", async () => {
    const extSrcPath = path.join("cobol-daco", "DABPAERR.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    const waitResult = await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length == 1
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC355918: IDMS - No processor group", async () => {
    const extSrcPath = path.join("cobol-idms-noconf", "DACRFI11N.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length == 1,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);

  test("TC355919: DaCo - No processor group", async () => {
    const extSrcPath = path.join("cobol-daco-noconf", "DABPA11N.cbl");
    await helper.showDocument(extSrcPath);
    const editor = helper.get_editor(extSrcPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length == 1,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.closeAllEditors();
  })
    .timeout(helper.TEST_TIMEOUT)
    .slow(1000);
});
