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

import path = require("path");
import * as helper from "./testHelper";
import * as vscode from "vscode";
import * as assert from "assert";

suite.only("TC384131: Analysis Features for copybooks", function () {
  this.timeout(helper.TEST_TIMEOUT);
  this.slow(1000);
  suiteSetup(async function () {
    await helper.updateConfig("copybook_analysis.json");
    await helper.activate();
    await helper.sleep(1000);
  });

  this.afterEach(async () => {
    await helper.closeAllEditors();
  });

  this.afterAll(async () => await helper.closeAllEditors()).timeout(
    helper.TEST_TIMEOUT,
  );

  test("TC384131-1: Go To References - SLICK", async () => {
    //1- Open COBOL file
    const editor_cobol: vscode.TextEditor = await helper.showDocument(
      path.join("SLICK", "COBPGM", "SLICKBS.cbl"),
    );
    await helper.sleep(3000);

    //2 - Find a COPYBOOK
    helper.moveCursor(editor_cobol, new vscode.Position(336, 21));

    //3- Go to COPYBOOK definition
    await vscode.commands.executeCommand("editor.action.revealDefinition");
    const editor_copybook = vscode.window.activeTextEditor;

    console.log("UI TEST%", editor_copybook?.document?.uri)

    //4- Find a paragprah, right click on it, and select "Go To References"
    assert.notEqual(editor_copybook, null);
    await helper.sleep(2000);

    const locations: vscode.Location[] = await vscode.commands.executeCommand(
      "vscode.executeReferenceProvider",
      editor_copybook!.document.uri,
      new vscode.Position(4, 26),
    );

    //5- Verify number of occurances
    assert.equal(locations.length == 6, true);
  });

  test("TC384131-1: Go To References - Example", async () => {
    //1- Open COBOL file
    const editor_cobol: vscode.TextEditor = await helper.showDocument(
      path.join("copybook-analysis", "mainfile1.cbl"),
    );
    await helper.sleep(3000);

    //2 - Find a COPYBOOK
    helper.moveCursor(editor_cobol, new vscode.Position(0, 18));

    //3- Go to COPYBOOK definition
    await vscode.commands.executeCommand("editor.action.revealDefinition");
    const editor_copybook = vscode.window.activeTextEditor;

    console.log("UI TEST%", editor_copybook?.document?.uri);
    
    //4- Find a paragprah, right click on it, and select "Go To References"
    assert.notEqual(editor_copybook, null);
    await vscode.languages.setTextDocumentLanguage(
      editor_copybook!.document,
      "cobol",
    );
    await helper.sleep(2000);

    const locations: vscode.Location[] = await vscode.commands.executeCommand(
      "vscode.executeReferenceProvider",
      editor_copybook!.document.uri,
      new vscode.Position(0, 16),
    );

    //5- Verify number of occurances
    assert.equal(locations.length == 2, true);
  });
});
