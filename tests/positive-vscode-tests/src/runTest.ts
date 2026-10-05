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

import * as fs from "fs";
import * as os from "os";
import * as path from "path";
import * as process from "process";
import {
  downloadAndUnzipVSCode,
  runTests,
  TestOptions,
  TestRunFailedError,
} from "@vscode/test-electron";
import { findTestFolders } from "./lib/discovery";
import { filteredOutput } from "./lib/output";

async function main() {
  try {
    const root = process.argv[2] || process.env.POSITIVE_TESTS_ROOT;
    if (!root) {
      console.error("Usage: npm test -- <tests root folder>");
      process.exit(2);
    }

    // prepare development and tests paths
    const extensionDevelopmentPath = [
      path.join(__dirname, "../../../clients/cobol-lsp-vscode-extension/"),
      path.join(__dirname, "../../../clients/idms-dialect-support/"),
      path.join(__dirname, "../../../clients/daco-dialect-support/"),
    ];
    const extensionTestsPath = path.join(__dirname, "./suite/index");

    const filter = process.env.POSITIVE_TESTS_FILTER;
    const testFolders = findTestFolders(root).filter(
      (folder) => !filter || new RegExp(filter).test(folder),
    );
    if (testFolders.length === 0) {
      console.error(`No folders with .cobolplugin/pgm_conf.json found under ${root}`);
      process.exit(2);
    }
    console.log(`Found ${testFolders.length} test folder(s) under ${path.resolve(root)}`);
    const vscodeExecutablePath = await downloadAndUnzipVSCode("insiders");

    // every test folder is a workspace of its own, with its own .cobolplugin configuration
    const failed: string[] = [];
    for (const folder of testFolders) {
      console.log(`\n=== ${folder}`);
      const userDir = fs.mkdtempSync(path.join(os.tmpdir(), "cobol-positive"));
      writeUserSettings(userDir);
      const launchArgs = [
        folder,
        "--disable-extensions",
        "--disable-workspace-trust",
        "--user-data-dir",
        userDir,
      ];
      const options: TestOptions = {
        vscodeExecutablePath,
        extensionDevelopmentPath,
        extensionTestsPath,
        extensionTestsEnv: { POSITIVE_TEST_FOLDER: folder },
        launchArgs,
        stdout: filteredOutput(process.stdout),
        stderr: filteredOutput(process.stderr),
      };
      try {
        // run tests
        await runTests(options);
      } catch (error) {
        // test failures are already reported by the suite, show other errors only
        if (!(error instanceof TestRunFailedError)) {
          console.log(error);
        }
        failed.push(folder);
      } finally {
        fs.rmSync(userDir, { recursive: true, force: true });
      }
    }

    console.log("\n=== Summary");
    for (const folder of testFolders) {
      console.log(`${failed.includes(folder) ? "FAIL" : "PASS"}  ${folder}`);
    }
    if (failed.length > 0) {
      console.error("Tests Failed");
      process.exit(1);
    }
  } catch (error) {
    console.log(error);
    console.error("Tests Failed");
    process.exit(1);
  }
}

function writeUserSettings(userDir: string) {
  const settings: Record<string, unknown> = {};
  fs.mkdirSync(path.join(userDir, "User"), { recursive: true });
  fs.writeFileSync(
    path.join(userDir, "User", "settings.json"),
    JSON.stringify(settings, null, 2),
  );
}

void main();
