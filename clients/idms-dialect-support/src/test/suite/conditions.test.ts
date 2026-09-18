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

suite("IDMS conditions Test Suite", function () {
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

  async function assertConditionVariableDefinitions(
    fileName: string,
    variableNames: readonly string[],
  ) {
    const editor = await helper.showDocument(fileName);
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(
      diagnostics[0].message,
      "Variable NOT-EXISTING is not defined",
    );

    const source = editor.document.getText();
    for (const variableName of variableNames) {
      const declarationOffset = source.indexOf(variableName);
      const usageOffset = source.lastIndexOf(variableName);
      assert.notStrictEqual(
        declarationOffset,
        -1,
        `Declaration of ${variableName} not found in ${fileName}`,
      );
      assert.ok(
        usageOffset > declarationOffset,
        `Usage of ${variableName} not found in ${fileName}`,
      );

      await helper.checkDefinition(
        editor,
        editor.document.positionAt(usageOffset),
        editor.document.positionAt(declarationOffset).line,
      );
    }
  }

  const conditionTests = [
    ["IDMS MEMBER condition", "Conditions001.cbl", ["IX-EMP"]],
    [
      "IDMS EMPTY condition followed by a COBOL condition",
      "Conditions002.cbl",
      ["IX-EMP", "MT-FLAG"],
    ],
    ["INQUIRE MAP INPUT condition", "Conditions003.cbl", ["EMPMAP"]],
    [
      "INQUIRE MAP qualified DFLD condition",
      "Conditions004.cbl",
      ["EMPMAP", "MFLD2", "MAP1"],
    ],
  ] as const;

  for (const [condition, fileName, variableNames] of conditionTests) {
    test(`Process ${condition}`, async () => {
      await assertConditionVariableDefinitions(fileName, variableNames);
    });
  }

  test("Process an IDMS condition defined inside a copybook", async () => {
    const editor = await helper.showDocument("Conditions005.cbl");
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    helper.printAllDiagnostics(diagnostics);
    assert.strictEqual(
      diagnostics[0].message,
      "Variable NOT-EXISTING is not defined",
    );
  });
});
