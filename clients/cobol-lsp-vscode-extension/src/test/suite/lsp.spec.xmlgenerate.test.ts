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
import { pos } from "./testHelper";
import * as vscode from "vscode";
import * as path from "path";

suite("TF48417: XML GENERATE", function () {
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

  test("TC369351: Identifier1 must be alphanumeric", async () => {
    const extSrcPath = path.join("TEST21.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST21.CBL");
    await helper.insertString(
      editor,
      pos(19, 0),
      "       01 XML-DOC123 PIC X(5000) USAGE NATIONAL.\n",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369351: identifier1 must be category national, national group", async () => {
    const extSrcPath = path.join("TEST21.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST21.CBL");
    await helper.insertString(
      editor,
      pos(19, 0),
      "       01 XML-DOC123 PIC X(5000) USAGE NATIONAL.\n" +
        "       01 REQUEST  GROUP-USAGE NATIONAL.\n" +
        "         06 ROUTE.\n" +
        "            11 NAME PIC X(030).\n" +
        "            11 VERSION PIC 9(004).\n",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369351: Identifier1 must not overlap identifier2, identifier3, identifier4, identifier5.", async () => {
    const extSrcPath = path.join("TEST21.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST21.CBL");
    await helper.insertString(
      editor,
      pos(19, 0),
      "       01 OutputXml.\n" + "         05 TestXmlTag      PIC X(20).\n",
    );
    await helper.insertString(
      editor,
      pos(23, 0),
      "           XML GENERATE OutputXml FROM TestXmlTag\n" +
        "           END-XML.\n",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(
      message,
      /^XML generate TESTXMLTAG must not overlap OUTPUTXML/,
    );
    await helper.deleteLine(editor, 19);
    await helper.deleteLine(editor, 20);
    await helper.insertString(
      editor,
      pos(19, 0),
      "       01  TestXmlTag      PIC X(20).\n" +
        "       01  OutputXml       PIC X(100).\n",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369352: identifier2 references a national group item", async () => {
    const extSrcPath = path.join("TEST14.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST14.CBL");
    await helper.insertString(
      editor,
      pos(10, 0),
      "       01  WS-ORDERS GROUP-USAGE NATIONAL.\n" +
        "           05  WS-ORDER OCCURS 2.\n" +
        "               10  WS-DATA usage NATIONAL   PIC X(4096).\n" +
        "       01  WS-ORDERS.\n" +
        "           05  WS-ORDER OCCURS 2.\n" +
        "               10  WS-DATA USAGE NATIONAL   PIC X(4096).\n",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369352: identifier2 must not overlap identifier1,or identifier3", async () => {
    const extSrcPath = path.join("TEST14.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST14.CBL");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.deleteLine(editor, 8);
    await helper.deleteLine(editor, 6);
    await helper.insertString(
      editor,
      pos(6, 0),
      "           05 DOC PIC X(512).",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^XML generate GREET must not overlap DOC/);
    await helper.sleep(5000);
  });

  test("TC369354: must not overlap identifier1, identifier2,  identifier4, or identifier5", async () => {
    const extSrcPath = path.join("TEST14.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST14.CBL");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.deleteLine(editor, 9);
    await helper.deleteLine(editor, 7);
    await helper.insertString(
      editor,
      pos(7, 0),
      "           05 DOC-LENGTH PIC 9(05).",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    const message = diagnostics[0].message;
    assert.match(message, /^XML generate DOC-LENGTH must not overlap GREET/);
    await helper.sleep(5000);
  });

  test(
    "TC369355: COUNT IN phrase, " +
      "TC369360: NAMESPACE and NAMESPACE-PREFIX phrases",
    async () => {
      const extSrcPath = path.join("TEST14.CBL");
      await helper.showDocument(extSrcPath);
      const editor = helper.getEditor("TEST14.CBL");
      await helper.waitFor(
        () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
      );
      const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
      assert.strictEqual(diagnostics.length, 0);
      await helper.sleep(5000);
    },
  );

  test("TC369356: ENCODING phrase without codepage", async () => {
    const extSrcPath = path.join("TEST61.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST61.CBL");
    await helper.deleteLine(editor, 11);
    await helper.insertString(editor, pos(11, 0), "           WITH ENCODING");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    const diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.sleep(5000);
  });

  test("TC369358: XML-DECLARATION phrase", async () => {
    const extSrcPath = path.join("TEST61.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST61.CBL");
    await helper.deleteLine(editor, 11);
    await helper.deleteLine(editor, 12);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.insertString(
      editor,
      pos(11, 0),
      "           WITH XML-DECLARATION.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369359: ATTRIBUTES phrase", async () => {
    const extSrcPath = path.join("TEST51.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST51.CBL");
    await helper.deleteLine(editor, 12);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.insertString(
      editor,
      pos(12, 0),
      "       01  XML-OUT          PIC X(200).",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369361: NAME phrase", async () => {
    const extSrcPath = path.join("TEST15.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST15.CBL");
    await helper.deleteLine(editor, 10);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 2,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 2);
    await helper.insertString(
      editor,
      pos(10, 0),
      "               05  abc PIC x(3) value spaces.",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369362: TYPE phrase", async () => {
    const extSrcPath = path.join("TEST16.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST16.CBL");
    await helper.deleteLine(editor, 8);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 1,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 1);
    await helper.insertString(editor, pos(8, 0), "       01 Doc pic X(500).");
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });

  test("TC369363: SUPPRESS, generic-suppression-phrase, ON EXCEPTION, NOT ON EXCEPTION phrase", async () => {
    const extSrcPath = path.join("TEST10.CBL");
    await helper.showDocument(extSrcPath);
    const editor = helper.getEditor("TEST10.CBL");
    await helper.deleteLine(editor, 16);
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 3,
    );
    let diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 3);
    await helper.insertString(
      editor,
      pos(16, 0),
      "        01  OUTPUT-XML                    PIC X(5000).",
    );
    await helper.waitFor(
      () => vscode.languages.getDiagnostics(editor.document.uri).length === 0,
    );
    diagnostics = vscode.languages.getDiagnostics(editor.document.uri);
    assert.strictEqual(diagnostics.length, 0);
    await helper.sleep(5000);
  });
});
