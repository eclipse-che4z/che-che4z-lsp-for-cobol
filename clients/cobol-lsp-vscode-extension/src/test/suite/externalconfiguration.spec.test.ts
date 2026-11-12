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

import * as assert from "assert";
import * as path from "path";
import * as vscode from "vscode";
import * as helper from "./testHelper";
import type { ExternalConfigurationApi } from "../../type/externalConfigurationApi";

const PROGRAM = path.join("external-config", "EXTCFG.cbl");
const COPYBOOK_NOT_FOUND = "EXTBOOK: Copybook not found";

function isCopybookMissing(uri: vscode.Uri) {
  return vscode.languages
    .getDiagnostics(uri)
    .some((d) => d.message === COPYBOOK_NOT_FOUND);
}

suite("Integration Test Suite: External configuration provider", function () {
  this.timeout(helper.TEST_TIMEOUT);
  this.slow(1000);

  suiteSetup(async function () {
    await helper.updateConfig("basic.json");
    await helper.activate();
  });

  this.afterEach(async function () {
    this.timeout(helper.TEST_TIMEOUT);
    await helper.closeAllEditors();
  });

  test("copybooks are resolved from the provided processor group until the provider is disposed", async () => {
    const api = vscode.extensions.getExtension<ExternalConfigurationApi>(
      "BroadcomMFD.cobol-language-support",
    )!.exports;
    const editor = await helper.showDocument(PROGRAM);
    const programUri = editor.document.uri;

    await helper.waitFor(() => isCopybookMissing(programUri));
    assert.ok(
      isCopybookMissing(programUri),
      "Copybook is expected to be missing without the provider",
    );

    const copybooks = vscode.Uri.joinPath(
      helper.getWorkspace().uri,
      "external-config",
      "copybooks",
    ).fsPath;
    const registration = api.registerExternalConfigurationProvider(
      "test.external-configuration",
      (uri) =>
        uri.toString() === programUri.toString()
          ? { configuration: { name: "EXTERNAL", libs: [copybooks] } }
          : null,
    );

    try {
      await helper.waitFor(() => !isCopybookMissing(programUri));
      assert.ok(
        !isCopybookMissing(programUri),
        "Copybook from the provided processor group is not resolved",
      );
    } finally {
      registration.dispose();
    }

    await helper.waitFor(() => isCopybookMissing(programUri));
    assert.ok(
      isCopybookMissing(programUri),
      "Workspace configuration is not used after the provider is disposed",
    );
  });
});
