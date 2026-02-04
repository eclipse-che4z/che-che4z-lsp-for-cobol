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
import path = require("path");

suite("Integration Test Suite: Dialect specific tests", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async function () {
    await helper.updateConfig("sample_dialect.json");
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

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("Run SAMPLE dialect", async () => {
    const extSrcPath = path.join("cobol-sample", "SAMPLE1.cbl");
    const editor = await helper.showDocument(extSrcPath);

    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

    console.warn("Diagnostics:", diagnostics);
    assert.strictEqual(diagnostics.length, 2);

    const d0 = diagnostics[0];
    assert.strictEqual(d0.severity, vscode.DiagnosticSeverity.Error);
    assert.strictEqual(
      "Variable V2 does not exist in structure G2",
      d0.message,
    );
    assert.strictEqual(d0.range.start.line, 25);
    assert.strictEqual(d0.range.start.character, 28);
    assert.strictEqual(d0.range.end.line, 25);
    assert.strictEqual(d0.range.end.character, 30);

    const d1 = diagnostics[1];
    assert.strictEqual(d1.severity, vscode.DiagnosticSeverity.Error);
    assert.strictEqual(
      "The following paragraph is not defined: P1",
      d1.message,
    );
    assert.strictEqual(d1.range.start.line, 25);
    assert.strictEqual(d1.range.start.character, 48);
    assert.strictEqual(d1.range.end.line, 25);
    assert.strictEqual(d1.range.end.character, 50);
  });
});
