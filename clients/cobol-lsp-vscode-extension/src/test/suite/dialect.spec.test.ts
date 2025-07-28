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
import * as vscode from "vscode";
import type { activate } from "../../extension";

type RemovePromise<T> = T extends Promise<infer R> ? R : never;
type ExtensionApi = RemovePromise<ReturnType<typeof activate>>;

suite("Integration Test Suite: Dialect specific tests", function () {
  this.timeout(helper.TEST_TIMEOUT);
  let api: ExtensionApi["v2"];

  suiteSetup(async function () {
    await helper.updateConfig("sample_dialect.json");
    await helper.activate();
    const tmp = vscode.extensions.getExtension<ExtensionApi>(
      "BroadcomMFD.cobol-language-support",
    )?.exports.v2;
    assert(tmp);
    api = tmp;
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("Register SAMPLE dialect that causes an error", async () => {
    const dialectHolder = await api.registerDialect(
      "BroadcomMFD.cobol-language-support",
      {
        name: "SAMPLE",
        description: "SAMPLE dialect support",
        snippets: vscode.Uri.file(""),
        isCopyStatement: () => ({ isCopy: false }),
      },
      () => {
        throw Error("Error from dialect");
      },
    );

    try {
      const editor = await helper.showDocument("USER1.cbl");

      const diagnostics = await helper.waitForDiagnostics(editor.document.uri);
      assert.strictEqual(diagnostics.length, 1);
      const d0 = diagnostics[0];
      const message =
        "SAMPLE dialect was stopped due to internal error (required for";
      const diagMessage = d0.message.substring(0, message.length);

      assert.strictEqual(d0.severity, vscode.DiagnosticSeverity.Error);
      assert.strictEqual(message, diagMessage);
    } finally {
      if (dialectHolder instanceof vscode.Disposable) {
        dialectHolder.dispose();
      }
    }
  });
});
