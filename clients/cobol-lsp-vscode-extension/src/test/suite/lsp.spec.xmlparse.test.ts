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

suite("TF48416: XML PARSE", function () {
  let editor: vscode.TextEditor;
  suiteSetup(async function () {
    this.timeout(0);
    this.slow(2000);
    await helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  this.afterAll(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  test("TC369336: RETURNING NATIONAL phrase with compiler", async () => {
    await helper.showDocument("XML1.cbl");
    editor = helper.getEditor("XML1.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg =
      "RETURNING NATIONAL in xml parse statement with PROCESS XMLPARSE(XMLSS) compiler option => No errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test.skip("TC369337: RETURNING NATIONAL phrase without compiler", async () => {
    await helper.showDocument("XML2.cbl");
    editor = helper.getEditor("XML2.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

    assert.strictEqual(diagnostics.length, 1);
  });

  test("TC369338: VALIDATING phrase with FILE keyword", async () => {
    await helper.showDocument("validck.cbl");
    editor = helper.getEditor("validck.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg = "No Errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test("TC369338: VALIDATING phrase with FILE keyword - special schema", async () => {
    await helper.showDocument("special_schema.cbl");
    editor = helper.getEditor("special_schema.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

    assert.strictEqual(diagnostics.length, 8);
  });

  test("TC369339: VALIDATING phrase without FILE keyword", async () => {
    await helper.showDocument("xmls.cbl");
    editor = helper.getEditor("xmls.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg = "No Errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test("TC369341: VALIDATING phrase with compiler", async () => {
    await helper.showDocument("xmls.cbl");
    editor = helper.getEditor("xmls.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg = "No Errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test.skip("TC369344: VALIDATING phrase without compiler", async () => {
    await helper.showDocument("xmls1.cbl");
    editor = helper.getEditor("xmls1.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

    assert.strictEqual(diagnostics.length, 1);
  });

  test("TC369345: ENCODING phrase with compiler", async () => {
    await helper.showDocument("xmls.cbl");
    editor = helper.getEditor("xmls.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg = "No Errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test.skip("TC369346: ENCODING phrase without compiler", async () => {
    await helper.showDocument("xmls.cbl");
    editor = helper.getEditor("xmls.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);

    assert.strictEqual(diagnostics.length, 1);
  });

  test("TC369347: ENCODING phrase with codepage", async () => {
    await helper.showDocument("xmls2.cbl");
    editor = helper.getEditor("xmls2.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg = "No Errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test("TC369348: ENCODING phrase without codepage", async () => {
    await helper.showDocument("xmls3.cbl");
    editor = helper.getEditor("xmls3.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
    const d0 = diagnostics[1];
    assert.strictEqual(diagnostics.length, 3);
    assert.strictEqual(d0.message, "A national item codepage must be 1200");
  });

  test("TC369349: PROCESSING PROCEDURE phrase", async () => {
    await helper.showDocument("xmlup.cbl");
    editor = helper.getEditor("xmlup.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg = "No Errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });

  test("TC369350: identifier1", async () => {
    await helper.showDocument("XML3.cbl");
    editor = helper.getEditor("XML3.cbl");
    await helper.waitFor(() => editor.document.languageId === "cobol");
    if (vscode.window.activeTextEditor === undefined) {
      assert.fail("activeTextEditor in undefined");
    }
    let diagnostics: vscode.Diagnostic[] = [];

    await helper.waitFor(() => {
      diagnostics = vscode.languages.getDiagnostics(
        vscode.window.activeTextEditor!.document.uri,
      );
      return diagnostics.length === 0;
    });

    const expectedMsg = "No Errors";
    assert.strictEqual(diagnostics.length, 0, expectedMsg);
  });
});
