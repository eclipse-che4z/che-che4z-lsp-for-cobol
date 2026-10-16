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

suite("IDMS keywords", function () {
  this.timeout(helper.TEST_TIMEOUT);
  suiteSetup(async () => helper.activate());
  this.afterEach(async () => helper.closeAllEditors());
  this.afterAll(async () => helper.closeAllEditors());

  test("provides IDMS keyword completion with documentation", async () => {
    assert.strictEqual(
      vscode.workspace
        .getConfiguration()
        .get("cobol-lsp.idms.dialect.api.version"),
      "new",
    );

    const editor = await helper.openWithoutIdmsErrors("Statements001.cbl");
    const position = helper
      .positionOf(editor, "ENDPAGE SESSION")
      .translate(0, "ENDPAGE".length);
    let keyword: vscode.CompletionItem | undefined;
    await helper.waitFor(
      async () => {
        const completions =
          await vscode.commands.executeCommand<vscode.CompletionList>(
            "vscode.executeCompletionItemProvider",
            editor.document.uri,
            position,
          );
        keyword = completions?.items.find((item) => item.label === "ENDPAGE");
        return keyword !== undefined;
      },
      50000,
      "IDMS keyword completion",
    );

    assert.strictEqual(keyword?.kind, vscode.CompletionItemKind.Keyword);
    const documentation = keyword?.documentation;
    const text =
      typeof documentation === "string" ? documentation : documentation?.value;
    assert.ok(
      text?.includes("The ENDPAGE statement terminates a map paging session"),
      "IDMS keyword documentation is missing",
    );
  });
});
