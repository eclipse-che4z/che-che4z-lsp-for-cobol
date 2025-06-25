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
import { pos } from "./testHelper";

suite("TF35623: Support for Replacing and Mapping statement", function () {
  this.timeout(helper.TEST_TIMEOUT);
  this.slow(1000);
  suiteSetup(async function () {
    await helper.updateConfig("basic.json");
    await helper.activate();
    await helper.sleep(1000);
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  this.afterAll(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("TC248045: Replacing Basic Scenario", async () => {
    const editor = await helper.showDocument("TEST1.CBL");
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Variable ABC-ID is not defined/);
    await helper.deleteLine(editor, 18);
    await helper.insertString(
      editor,
      pos(18, 0),
      "       COPY REPL REPLACING ==TAG-ID== BY ==ABC-ID==.",
    );
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 0);
    assert.strictEqual(diagnostics.length, 0);
  });

  test("TC248087: Replacing twice for one variable", async () => {
    const editor = await helper.showDocument("TEST2.CBL");
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
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
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 0);
    assert.strictEqual(diagnostics.length, 0);
  });

  test("TC248131: Several COPY statements with replacing", async () => {
    const extSrcPath = path.join("TEST3.CBL");
    const editor = await helper.showDocument(extSrcPath);
    let diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Variable DEF-ID is not defined/);
    await helper.insertString(
      editor,
      pos(20, 0),
      "       COPY REPL REPLACING ==TAG-ID== BY ==DEF-ID==.",
    );
    diagnostics = await helper.waitForDiagnosticCount(editor.document.uri, 0);
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
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) => d.message === "Syntax error on 'DIVISIO' expected DIVISION",
    );
  });

  test("TC250951: Show Syntax and Semantic Errors from Copybooks", async () => {
    let editor = await helper.showDocument(path.join("TEST5.CBL"));
    await helper.insertString(editor, pos(21, 0), "       COPY CHOPIN1.");
    const extSrcPath = path.join("testing", "CHOPIN1.CPY");
    editor = await helper.showDocument(extSrcPath);
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^Variable VARNAME is not defined/);
  });

  test.skip("TC250747: Support building of the extended document", async () => {
    const extSrcPath = path.join("TEST6.CBL");
    const editor = await helper.showDocument(extSrcPath);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length > 0,
    );
    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) => d.message === "Syntax error on 'NEW' expected SECTION",
    );
    helper.hasDiagnosticMatches(
      editor.document.uri,
      (d) => d.message === "Syntax error on 'REPLACING' expected SECTION",
    );
  });

  test(
    "TC250946: Support building of the extended document - Replace by arithmetic operations\r\n" +
      "TC314935: Copybook with Name in Quotes is Recognized",
    async () => {
      const editor = await helper.showDocument("TEST7.CBL");

      const documentDiagnostics = await helper.waitForDiagnostics(
        editor.document.uri,
      );

      const message = documentDiagnostics[1].message;
      assert.strictEqual(message, "Errors inside the copybook");

      const editorCopy = await helper.showDocument("testing/NEW.CPY");

      const copybookDiagnostics = await helper.waitForDiagnosticCount(
        editorCopy.document.uri,
        1,
      );
      assert.strictEqual(copybookDiagnostics.length, 1);
      assert.match(
        copybookDiagnostics[0].message,
        /^A period was assumed before "\+3"./,
      );
    },
  );
});
