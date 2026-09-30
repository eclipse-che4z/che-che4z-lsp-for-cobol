/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 */

import * as assert from "node:assert";
import * as vscode from "vscode";
import * as helper from "./testHelper";

suite("IDMS variable navigation", function () {
  this.timeout(helper.TEST_TIMEOUT);
  suiteSetup(async () => helper.activate());
  this.afterEach(async () => helper.closeAllEditors());
  this.afterAll(async () => helper.closeAllEditors());

  async function checkSymbolActions(editor: vscode.TextEditor, symbol: string) {
    const declaration = helper.positionOf(editor, symbol);
    const usage = helper.positionOf(editor, symbol, true);
    assert.ok(!declaration.isEqual(usage), `${symbol} needs a separate usage`);
    await helper.checkDefinition(editor, usage, declaration.line);

    const references = await vscode.commands.executeCommand<vscode.Location[]>(
      "vscode.executeReferenceProvider",
      editor.document.uri,
      usage,
      { includeDeclaration: true },
    );
    assert.ok(
      references?.some((reference) => reference.range.contains(declaration)),
    );
    assert.ok(references.some((reference) => reference.range.contains(usage)));

    const hovers = await vscode.commands.executeCommand<vscode.Hover[]>(
      "vscode.executeHoverProvider",
      editor.document.uri,
      usage,
    );
    const hoverText = hovers
      ?.flatMap((hover) => hover.contents)
      .map((content) => (typeof content === "string" ? content : content.value))
      .join("\n");
    assert.ok(hoverText?.includes(symbol), `No hover for ${symbol}`);
  }

  // Java usecase: https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsSetStatement.java
  // Variants: SET_ABEND_ON and SET_ABEND_ON_1.
  for (const variant of ["SET_ABEND_ON", "SET_ABEND_ON_1"]) {
    test(`${variant}: ON status references and hover`, async () => {
      const editor = await helper.openWithoutIdmsErrors(
        `usecase/TestIdmsSetStatement_${variant}.cbl`,
      );
      await checkSymbolActions(editor, "ANY-ERROR-STATUS");
    });
  }

  // Java usecase: https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsInquireMapStatement.java
  // Variant: TST7.
  test("INQUIRE MAP subscript references and hover", async () => {
    const editor = await helper.openWithoutIdmsErrors(
      "usecase/TestIdmsInquireMapStatement_TST7.cbl",
    );
    await checkSymbolActions(editor, "S1");
  });

  // Java usecase: https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/blob/development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol/dialects/idms/usecases/TestIdmsModifyMapStatement.java
  // Variant: TST9.
  test("MODIFY MAP subscript references and hover", async () => {
    const editor = await helper.openWithoutIdmsErrors(
      "usecase/TestIdmsModifyMapStatement_TST9.cbl",
    );
    await checkSymbolActions(editor, "S1");
  });

  // Java usecase: TestIdmsModifyMapStatement / TST9_ON. ANY-STATUS is implicit.
  test("undeclared ON status does not cause an undefined-variable error", async () => {
    await helper.openWithoutIdmsErrors(
      "usecase/TestIdmsModifyMapStatement_TST9_ON.cbl",
    );
  });
});
