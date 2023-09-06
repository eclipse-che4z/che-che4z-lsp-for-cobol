/*
 * Copyright (c) 2022 Broadcom.
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

import * as path from "path";
import { runTests, downloadAndUnzipVSCode } from "@vscode/test-electron";
import { TestOptions } from "@vscode/test-electron/out/runTest";
import * as os from "os";
import * as process from "process";

async function main() {
  try {
    // prepare development and tests paths
    const extensionDevelopmentPath = [
      path.join(__dirname, "../../"),
      path.join(__dirname, "../../../idms-dialect-support/"),
      path.join(__dirname, "../../../daco-dialect-support/"),
    ];
    const extensionTestsPath = path.join(__dirname, "./suite/index");
    const launchArgs = [
      path.join(__dirname, "../../../../tests/test_files/project"),
      "--disable-extensions",
      "--disable-workspace-trust",
      "--user-data-dir",
      `${os.tmpdir()}`,
    ];
    var options: TestOptions;
    if (process.argv.length > 2 && process.argv[2] == "insiders") {
      const vscodeExecutablePath = await downloadAndUnzipVSCode("insiders");
      options = {
        vscodeExecutablePath,
        extensionDevelopmentPath,
        extensionTestsPath,
        launchArgs,
      };
    } else {
      options = {
        extensionDevelopmentPath,
        extensionTestsPath,
        launchArgs,
      };
    }
    // run tests
    await runTests(options);
  } catch (error) {
    console.log(error);
    console.error("Tests Failed");
    process.exit(1);
  }
}

main();
