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
import * as vscode from "vscode";
import * as helper from "./testHelper";

suite("DaCo keywords", function () {
  this.timeout(helper.TEST_TIMEOUT);

  suiteSetup(async function () {
    await helper.activate();
  });

  this.afterEach(async function () {
    await helper.closeAllEditors();
  });

  test("provides READ TRANSACTION completion from the DaCo keywords file", async () => {
    assert.strictEqual(
      vscode.workspace
        .getConfiguration()
        .get("cobol-lsp.daco.dialect.api.version"),
      "new",
    );

    const editor = await helper.showDocument("DaCo09.cbl");
    await helper.waitForDiagnostics(editor.document.uri);
    const line = editor.document.lineAt(4).text;
    const keywordStart = line.indexOf("READ TRANSACTION");
    assert.ok(keywordStart >= 0);
    const position = new vscode.Position(4, keywordStart + "READ".length);

    let keyword: vscode.CompletionItem | undefined;
    await helper.waitFor(
      async () => {
        const completions =
          await vscode.commands.executeCommand<vscode.CompletionList>(
            "vscode.executeCompletionItemProvider",
            editor.document.uri,
            position,
          );
        keyword = completions?.items.find(
          (item) => item.label === "READ TRANSACTION",
        );
        return keyword !== undefined;
      },
      50000,
      "DaCo keyword completion",
    );

    assert.strictEqual(keyword?.kind, vscode.CompletionItemKind.Keyword);
    const documentation = keyword?.documentation;
    const description =
      typeof documentation === "string" ? documentation : documentation?.value;
    assert.strictEqual(description, "Read Transaction Statement");
  });
});
