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
import { pos, range } from "./testHelper";

suite("TF35623: Support for Replacing and Mapping statement", function () {
  this.timeout(helper.TEST_TIMEOUT);
  this.slow(1000);
  suiteSetup(async function () {
    helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.beforeEach(async () => {
    await helper.closeAllEditors();
  });

  test("TC248045: Replacing Basic Scenario", async () => {
    const extSrcPath = path.join("TEST1.CBL");
    let diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    await helper.showDocument(extSrcPath);
    let editor = helper.get_editor("TEST1.CBL");
    let diagnostics = await diagPromise;
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Variable ABC-ID is not defined/);
    await helper.deleteLine(editor, 18);
    await helper.insertString(
      editor,
      pos(18, 0),
      "       COPY REPL REPLACING ==TAG-ID== BY ==ABC-ID==.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  });

  test("TC248087: Replacing twice for one variable", async () => {
    const extSrcPath = path.join("TEST2.CBL");
    let diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    await helper.showDocument(extSrcPath);
    let editor = helper.get_editor("TEST2.CBL");
    let diagnostics = await diagPromise;
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Variable XYZ-ID is not defined/);
    await helper.deleteLine(editor, 18);
    await helper.insertString(
      editor,
      pos(18, 0),
      "       COPY REPL REPLACING ==TAG-ID== BY ==ABC-ID== ",
    );
    await helper.insertString(
      editor,
      pos(19, 0),
      "           ==ABC-ID== by ==XYZ-ID==.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC248131: Several COPY statements with replacing", async () => {
    const extSrcPath = path.join("TEST3.CBL");
    let diagPromise = helper.waitForDiagnosticsChange(extSrcPath);
    let editor = await helper.showDocument(extSrcPath);
    let diagnostics = await diagPromise;
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Variable DEF-ID is not defined/);
    await helper.insertString(
      editor,
      pos(20, 0),
      "       COPY REPL REPLACING ==TAG-ID== BY ==DEF-ID==.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
  });

  test.skip("TC250950: Parser Does React on CPY Exit Tag", async () => {
    let editor = await helper.showDocument(path.join("TEST4.CBL"));
    await helper.deleteLine(editor, 13);
    await helper.insertString(editor, pos(13, 0), "       COPY CHOPIN.");
    const extSrcPath = path.join("testing", "CHOPIN.CPY");
    editor = await helper.showDocument(extSrcPath);
    await helper.deleteLine(editor, 0);
    await helper.insertString(
      editor,
      pos(0, 0),
      "       IDENTIFICATION DIVISIO.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Syntax error on 'DIVISIO' expected DIVISION/);
  });

  test("TC250951: Show Syntax and Semantic Errors from Copybooks", async () => {
    let editor = await helper.showDocument(path.join("TEST5.CBL"));
    await helper.insertString(editor, pos(21, 0), "       COPY CHOPIN1.");
    const extSrcPath = path.join("testing", "CHOPIN1.CPY");
    editor = await helper.showDocument(extSrcPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Variable VARNAME is not defined/);
  });

  test.skip("TC250747: Support building of the extended document", async () => {
    const extSrcPath = path.join("TEST6.CBL");
    let editor = await helper.showDocument(extSrcPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    diagnostics.sort((a, b) => a.severity - b.severity);
    let message = diagnostics[0].message;
    assert.match(message, /^Syntax error on 'NEW' expected SECTION/);
    message = diagnostics[1].message;
    assert.match(message, /^Syntax error on 'REPLACING' expected SECTION/);
  });

  test(
    "TC250946: Support building of the extended document - Replace by arithmetic operations" +
      "TC314935: Copybook with Name in Quotes is Recognized",
    async () => {
      let editor = await helper.showDocument(path.join("TEST7.CBL"));
      const extSrcPath = path.join("testing", "NEW.CPY");
      editor = await helper.showDocument(extSrcPath);
      await helper.waitFor(
        () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
      );
      let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
      const message = diagnostics[0].message;
      assert.match(message, /^Missing token SECTION at procedureSectionHeader/);
    },
  );
});
