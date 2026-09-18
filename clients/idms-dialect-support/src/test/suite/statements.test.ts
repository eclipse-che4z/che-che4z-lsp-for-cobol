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

suite("IDMS statements Test Suite", function () {
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

  async function assertStatementsAreProcessed(fileName: string) {
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
  }

  async function assertVariableDefinitions(
    fileName: string,
    variableNames: readonly string[],
  ) {
    const editor = await helper.showDocument(fileName);
    const diagnostics = await helper.waitForDiagnosticCount(
      editor.document.uri,
      1,
    );
    assert.strictEqual(
      diagnostics[0].message,
      "Variable NOT-EXISTING is not defined",
    );
    const source = editor.document.getText();

    for (const variableName of variableNames) {
      const declarationMarker = `01 ${variableName} `;
      const declarationMarkerOffset = source.indexOf(declarationMarker);
      assert.notStrictEqual(
        declarationMarkerOffset,
        -1,
        `Declaration of ${variableName} not found in ${fileName}`,
      );

      const declarationOffset = declarationMarkerOffset + 3;
      const usageOffset = source.lastIndexOf(variableName);
      assert.ok(
        usageOffset > declarationOffset,
        `Usage of ${variableName} not found in ${fileName}`,
      );

      const declarationStart = editor.document.positionAt(declarationOffset);
      await helper.checkDefinition(
        editor,
        editor.document.positionAt(usageOffset),
        declarationStart.line,
      );
    }
  }

  test("Process every simple IDMS statement", async () => {
    await assertStatementsAreProcessed("Statements001.cbl");
  });

  test("Process multiline statement variants", async () => {
    await assertStatementsAreProcessed("Statements002.cbl");
  });

  test("Process statements around COBOL IF and periods", async () => {
    await assertStatementsAreProcessed("Statements003.cbl");
  });

  test("Process imperative IDMS statements without variable usages", async () => {
    await assertStatementsAreProcessed("Statements004.cbl");
  });

  test("Process IDMS statements defined inside a copybook", async () => {
    await assertStatementsAreProcessed("Statements005.cbl");
  });

  const variableStatementTests = [
    ["READY", "Statements004Ready.cbl", ["AREA-A"]],
    ["BIND PROCEDURE", "Statements004BindProcedure.cbl", ["ABCPROC", "WS-A"]],
    ["CONNECT", "Statements004Connect.cbl", ["EMPLOYEE", "EMP-SET"]],
    ["DISCONNECT", "Statements004Disconnect.cbl", ["EMPLOYEE", "EMP-SET"]],
    ["ERASE", "Statements004Erase.cbl", ["EMPLOYEE"]],
    ["OBTAIN", "Statements004Obtain.cbl", ["EMPLOYEE", "EMP-SET"]],
    ["GET TIME", "Statements004GetTime.cbl", ["WS-LENGTH"]],
    ["INQUIRE MAP", "Statements004InquireMap.cbl", ["EMPMAP", "WS-A"]],
    ["KEEP", "Statements004Keep.cbl", ["EMPLOYEE"]],
    ["LOAD", "Statements004Load.cbl", ["WS-A", "WS-B"]],
    ["CHECK TERMINAL", "Statements004CheckTerminal.cbl", ["WS-A", "WS-LENGTH"]],
    ["MAP IN", "Statements004MapIn.cbl", ["EMPMAP"]],
    ["MODIFY MAP", "Statements004ModifyMap.cbl", ["EMPMAP", "WS-A"]],
    ["PUT", "Statements004Put.cbl", ["WS-A"]],
    ["SNAP", "Statements004Snap.cbl", ["WS-A"]],
    ["STARTPAGE", "Statements004Startpage.cbl", ["EMPMAP"]],
    ["READ TERMINAL", "Statements004ReadTerminal.cbl", ["WS-A"]],
    ["WRITE TERMINAL", "Statements004WriteTerminal.cbl", ["WS-A", "WS-LENGTH"]],
    ["ACCEPT", "Statements004Accept.cbl", ["WS-A", "EMPLOYEE"]],
    ["RETURN", "Statements004Return.cbl", ["WS-A", "EMPLOYEE"]],
    ["SEND", "Statements004Send.cbl", ["WS-A", "WS-B"]],
    ["SNAP with NEXT SENTENCE", "Statements004SnapNextSentence.cbl", ["WS-A"]],
  ] as const;

  for (const [statement, fileName, variableNames] of variableStatementTests) {
    test(`Preserve variable usages in ${statement}`, async () => {
      await assertVariableDefinitions(fileName, variableNames);
    });
  }
});
