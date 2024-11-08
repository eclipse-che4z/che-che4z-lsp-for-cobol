/*
 * Copyright (c) 2024 Broadcom.
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

suite("Integration Test Suite: CFAST generation", function () {
  suiteSetup(async function () {
    this.timeout(0);
    await helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  test("CFAST generation call", async () => {
    await helper.showDocument("CFAST.cbl");
    const editor = helper.getEditor("CFAST.cbl");
    const cobolExtension = vscode.extensions.getExtension(
      "broadcommfd.cobol-language-support",
    );
    if (cobolExtension === undefined) {
      assert.fail("can't find extension: broadcommfd.cobol-language-support");
    }
    helper.moveCursor(editor, new vscode.Position(1, 1));
    const result = await cobolExtension.exports.analysis(
      editor.document.uri.toString(),
      editor.document.getText(),
    );
    assert.strictEqual(
      result.controlFlowAST.length,
      1,
      "Expects only one program",
    );
    assert.strictEqual(
      result.controlFlowAST[0].name,
      "MAIN",
      "Program is to be MAIN",
    );
  });

  test("CFAST generation call for nested program", async () => {
    await helper.showDocument("CFAST.cbl");
    const editor = helper.getEditor("CFAST.cbl");
    const cobolExtension = vscode.extensions.getExtension(
      "broadcommfd.cobol-language-support",
    );
    if (cobolExtension === undefined) {
      assert.fail("can't find extension: broadcommfd.cobol-language-support");
    }
    helper.moveCursor(editor, new vscode.Position(23, 1));
    const result = await cobolExtension.exports.analysis(
      editor.document.uri.toString(),
      editor.document.getText(),
    );
    assert.strictEqual(
      result.controlFlowAST.length,
      1,
      "Expects only one program",
    );
    assert.strictEqual(
      result.controlFlowAST[0].name,
      "NESTED1",
      "Program is to be NESTED1",
    );
  });

  test("CFAST generation call for MAIN2 program", async () => {
    await helper.showDocument("CFAST.cbl");
    const editor = helper.getEditor("CFAST.cbl");
    const cobolExtension = vscode.extensions.getExtension(
      "broadcommfd.cobol-language-support",
    );
    if (cobolExtension === undefined) {
      assert.fail("can't find extension: broadcommfd.cobol-language-support");
    }
    helper.moveCursor(editor, new vscode.Position(30, 1));
    const result = await cobolExtension.exports.analysis(
      editor.document.uri.toString(),
      editor.document.getText(),
    );
    assert.strictEqual(
      result.controlFlowAST.length,
      1,
      "Expects only one program",
    );
    assert.strictEqual(
      result.controlFlowAST[0].name,
      "MAIN2",
      "Program is to be MAIN2",
    );
  });

  test("CFAST generation: MAIN program after nested click", async () => {
    await helper.showDocument("CFAST.cbl");
    const editor = helper.getEditor("CFAST.cbl");
    const cobolExtension = vscode.extensions.getExtension(
      "broadcommfd.cobol-language-support",
    );
    if (cobolExtension === undefined) {
      assert.fail("can't find extension: broadcommfd.cobol-language-support");
    }
    helper.moveCursor(editor, new vscode.Position(25, 1));
    const result = await cobolExtension.exports.analysis(
      editor.document.uri.toString(),
      editor.document.getText(),
    );
    assert.strictEqual(
      result.controlFlowAST.length,
      1,
      "Expects only one program",
    );
    assert.strictEqual(
      result.controlFlowAST[0].name,
      "MAIN",
      "Program is to be MAIN",
    );
  });

  test("CFAST generation: before MAIN program click", async () => {
    await helper.showDocument("CFAST.cbl");
    const editor = helper.getEditor("CFAST.cbl");
    const cobolExtension = vscode.extensions.getExtension(
      "broadcommfd.cobol-language-support",
    );
    if (cobolExtension === undefined) {
      assert.fail("can't find extension: broadcommfd.cobol-language-support");
    }
    helper.moveCursor(editor, new vscode.Position(25, 1));
    const result = await cobolExtension.exports.analysis(
      editor.document.uri.toString(),
      editor.document.getText(),
    );
    assert.strictEqual(
      result.controlFlowAST.length,
      1,
      "Expects only one program",
    );
    assert.strictEqual(
      result.controlFlowAST[0].name,
      "MAIN",
      "Program is to be MAIN",
    );
  });

  test("CFAST generation: before MAIN2 after MAIN programs click", async () => {
    await helper.showDocument("CFAST.cbl");
    const editor = helper.getEditor("CFAST.cbl");
    const cobolExtension = vscode.extensions.getExtension(
      "broadcommfd.cobol-language-support",
    );
    if (cobolExtension === undefined) {
      assert.fail("can't find extension: broadcommfd.cobol-language-support");
    }
    helper.moveCursor(editor, new vscode.Position(28, 1));
    const result = await cobolExtension.exports.analysis(
      editor.document.uri.toString(),
      editor.document.getText(),
    );
    assert.strictEqual(
      result.controlFlowAST.length,
      1,
      "Expects only one program",
    );
    assert.strictEqual(
      result.controlFlowAST[0].name,
      "MAIN2",
      "Program is to be MAIN2",
    );
  });

  test("CFAST generation: after MAIN2 programs click", async () => {
    await helper.showDocument("CFAST.cbl");
    const editor = helper.getEditor("CFAST.cbl");
    const cobolExtension = vscode.extensions.getExtension(
      "broadcommfd.cobol-language-support",
    );
    if (cobolExtension === undefined) {
      assert.fail("can't find extension: broadcommfd.cobol-language-support");
    }
    helper.moveCursor(editor, new vscode.Position(34, 1));
    const result = await cobolExtension.exports.analysis(
      editor.document.uri.toString(),
      editor.document.getText(),
    );
    assert.strictEqual(
      result.controlFlowAST.length,
      1,
      "Expects only one program",
    );
    assert.strictEqual(
      result.controlFlowAST[0].name,
      "MAIN2",
      "Program is to be MAIN2",
    );
  });
});
