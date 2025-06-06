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

import * as helper from "./testHelper";
import * as vscode from "vscode";
import * as assert from "assert";

suite("TC384131: Analysis Features for copybooks", function () {
  this.timeout(helper.TEST_TIMEOUT);
  this.slow(6000);
  suiteSetup(async function () {
    await helper.updateConfig("copybook_analysis.json");
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

  test("TC384131-1: Go To References", async () => {
    //1- Open COBOL file
    const editor_cobol: vscode.TextEditor = await helper.showDocument(
      "copybook-analysis/mainfile1.cbl",
    );

    const copybookUri = (
      await helper.getUri("copybook-analysis/v1/COPYBOOK")
    ).toString();
    let editor_copybook;

    while (true) {
      //2 - Find a COPYBOOK
      helper.moveCursor(editor_cobol, new vscode.Position(13, 18));

      //3- Go to COPYBOOK definition
      await vscode.commands.executeCommand("editor.action.revealDefinition");
      editor_copybook = vscode.window.activeTextEditor;
      if (editor_copybook?.document.uri.toString() === copybookUri) break;

      await helper.sleep(1000);
    }

    //4- Find a paragprah, right click on it, and select "Go To References"
    const locations: vscode.Location[] = await vscode.commands.executeCommand(
      "vscode.executeReferenceProvider",
      editor_copybook.document.uri,
      new vscode.Position(13, 16),
    );

    //5- Verify number of occurances and URIs are matching
    const fileURIs = [
      (await helper.getUri("copybook-analysis/v1/COPYBOOK")).toString(),
      (await helper.getUri("copybook-analysis/v1/FUNC1")).toString(),
    ];

    assert.deepStrictEqual(
      locations.map((a) => a.uri.toString()).sort(),
      fileURIs,
    );
  });

  test("TC384131-2: Go To Definition", async () => {
    //1- Open COBOL file
    const editor_cobol: vscode.TextEditor = await helper.showDocument(
      "copybook-analysis/mainfile1.cbl",
    );

    const copybookUri = (
      await helper.getUri("copybook-analysis/v1/PARS")
    ).toString();
    let editor_copybook;

    while (true) {
      //2 - Find a COPYBOOK
      helper.moveCursor(editor_cobol, new vscode.Position(32, 15));

      //3- Go to COPYBOOK definition
      await vscode.commands.executeCommand("editor.action.revealDefinition");
      editor_copybook = vscode.window.activeTextEditor;
      if (editor_copybook?.document.uri.toString() === copybookUri) break;

      await helper.sleep(1000);
    }

    //4- Find a perform statement, right click and select "Go To Definition"
    const locations: vscode.Location[] = await vscode.commands.executeCommand(
      "vscode.executeDefinitionProvider",
      editor_copybook.document.uri,
      new vscode.Position(14, 28),
    );

    //5- Verify the file URI, and definition position.
    assert.strictEqual(locations.length, 1);
    assert.strictEqual(
      locations[0].uri.toString(),
      (await helper.getUri("copybook-analysis/v1/PARS")).toString(),
    );
    assert.strictEqual(locations[0].range.start.line, 16);
    assert.strictEqual(locations[0].range.start.character, 7);
    assert.strictEqual(locations[0].range.end.line, 16);
    assert.strictEqual(locations[0].range.end.character, 23);
  });
});
