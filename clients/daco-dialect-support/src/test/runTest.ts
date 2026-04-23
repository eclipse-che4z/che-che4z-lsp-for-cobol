/*
 * Copyright (c) 2023 Broadcom.
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

import * as path from "node:path";

import { runTests } from "@vscode/test-electron";
import * as os from "node:os";

async function main() {
  try {
    // The folder containing the Extension Manifest package.json
    // Passed to `--extensionDevelopmentPath`
    const extensionDevelopmentPath = [
      path.join(__dirname, "../../"),
      path.join(__dirname, "../../../idms-dialect-support/"),
      path.join(__dirname, "../../../cobol-lsp-vscode-extension/"),
    ];
    // The path to test runner
    // Passed to --extensionTestsPath
    const extensionTestsPath = path.resolve(__dirname, "./suite/index");

    const launchArgs = [
      path.join(__dirname, "../../test_files"),
      "--disable-extensions",
      "--disable-workspace-trust",
      "--user-data-dir",
      `${os.tmpdir()}`,
    ];

    // Download VS Code, unzip it and run the integration test
    await runTests({
      extensionDevelopmentPath,
      extensionTestsPath,
      launchArgs,
    });
  } catch (err) {
    console.error("Failed to run tests: ", err);
    process.exit(1);
  }
}
main();
