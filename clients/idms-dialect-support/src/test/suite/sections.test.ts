/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import * as assert from "node:assert";
import * as helper from "./testHelper";

suite("IDMS sections Test Suite", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async function () {
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

  async function checkMapDefinitions(
    fileName: string,
    mapNames: readonly string[],
  ) {
    const editor = await helper.showDocument(fileName);
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(diagnostics.length, 1);
    assert.strictEqual(
      diagnostics[0].message,
      "Variable NOT-EXISTING is not defined",
    );

    const source = editor.document.getText();
    const mapSectionOffset = source.indexOf("MAP SECTION");
    assert.notStrictEqual(mapSectionOffset, -1);

    for (const mapName of mapNames) {
      const definitionOffset = source.indexOf(mapName, mapSectionOffset);
      const usageOffset = source.lastIndexOf(mapName);
      assert.notStrictEqual(
        definitionOffset,
        -1,
        `Definition of ${mapName} not found in ${fileName}`,
      );
      assert.ok(
        usageOffset > definitionOffset,
        `Usage of ${mapName} not found in ${fileName}`,
      );

      const definitionPosition = editor.document.positionAt(definitionOffset);
      const usagePosition = editor.document.positionAt(usageOffset);
      await helper.checkDefinition(
        editor,
        usagePosition,
        definitionPosition.line,
      );
      const expectedHover = `\`\`\`cobol\n       MAP ${mapName}.\n\n\`\`\``;
      await helper.checkHoverText(editor, definitionPosition, expectedHover);
      await helper.checkHoverText(editor, usagePosition, expectedHover);
    }
  }

  test("Recognize a MAP clause as a variable definition", async () => {
    await checkMapDefinitions("MapDefinition001.cbl", ["ABCDE"]);
  });

  test("Recognize MAP clauses with all supported section variants", async () => {
    await checkMapDefinitions("MapDefinition002.cbl", ["MAP1", "MAP2", "MAP3"]);
  });

  test("Recognize multiline MAP clauses from IDMS and COBOL usages", async () => {
    await checkMapDefinitions("MapDefinition003.cbl", ["FIRST", "SECOND"]);
  });
});
