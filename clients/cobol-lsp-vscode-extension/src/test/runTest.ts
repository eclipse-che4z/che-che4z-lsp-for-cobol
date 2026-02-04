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
import {
  runTests,
  downloadAndUnzipVSCode,
  resolveCliArgsFromVSCodeExecutablePath,
} from "@vscode/test-electron";
import { TestOptions } from "@vscode/test-electron/out/runTest";
import * as os from "os";
import * as process from "process";
import * as fs from "fs";
import * as cp from "child_process";

async function main() {
  try {
    // prepare development and tests paths
    const extensionDevelopmentPath = [
      path.join(__dirname, "../../"),
      path.join(__dirname, "../../../idms-dialect-support/"),
      path.join(__dirname, "../../../daco-dialect-support/"),
    ];
    const extensionTestsPath = path.join(__dirname, "./suite/index");

    // Use dedicated, unique dirs (do NOT use os.tmpdir() directly)
    const userDataDir = fs.mkdtempSync(
      path.join(os.tmpdir(), "vscode-test-user-"),
    );
    const extensionsDir = fs.mkdtempSync(
      path.join(os.tmpdir(), "vscode-test-ext-"),
    );

    // Optional settings
    if (process.argv.includes("--native")) {
      console.log("Running tests with native language server");
      fs.mkdirSync(path.join(userDataDir, "User"), { recursive: true });
      fs.writeFileSync(
        path.join(userDataDir, "User", "settings.json"),
        '{"cobol-lsp.serverRuntime": "NATIVE"}',
        "utf8",
      );
    }

    const launchArgs = [
      path.join(__dirname, "../../../../tests/test_files/project"),
      "--disable-workspace-trust",
      "--user-data-dir",
      userDataDir,
      "--extensions-dir",
      extensionsDir,
      // NOTE: do NOT use "--disable-extensions" or the installed VSIX won't load.
    ];

    const channel =
      process.argv.length > 2 && process.argv[2] === "insiders"
        ? "insiders"
        : "stable";

    // Always use the same VS Code build for install + runTests
    const vscodeExecutablePath = await downloadAndUnzipVSCode(channel);

    // Install SAMPLE dialect extension into the SAME dirs we launch with
    const vsixDir = path.join(__dirname, "../../../../dialects");
    const vsix = fs.readdirSync(vsixDir).find((f) => f.endsWith(".vsix"));
    if (!vsix) throw new Error(`No .vsix found in ${vsixDir}`);
    const sampleDialectVsixPath = path.join(vsixDir, vsix);

    assertFile(sampleDialectVsixPath, "VSIX");

    installVsixCrossPlatform(
      vscodeExecutablePath,
      sampleDialectVsixPath,
      userDataDir,
      extensionsDir,
    );

    // Run tests
    const options: TestOptions = {
      vscodeExecutablePath,
      extensionDevelopmentPath,
      extensionTestsPath,
      launchArgs,
    };

    // run tests
    await runTests(options);
  } catch (error) {
    console.log(error);
    console.error("Tests Failed");
    process.exit(1);
  }
}

function assertFile(p: string, label: string) {
  const st = fs.statSync(p);
  if (!st.isFile()) {
    throw new Error(`${label} path is not a file: ${p}`);
  }
}

function getVSCodeRootFromExecutablePath(vscodeExecutablePath: string): string {
  // On Windows, vscodeExecutablePath can be ...\Code.exe (file) or ...\bin\code.cmd
  const lower = vscodeExecutablePath.toLowerCase();
  if (process.platform === "win32" && lower.endsWith(".exe")) {
    return path.dirname(vscodeExecutablePath);
  }
  // For mac/linux it's usually .../bin/code -> root is one level above "bin"
  return path.dirname(path.dirname(vscodeExecutablePath));
}

function installVsixCrossPlatform(
  vscodeExecutablePath: string,
  vsixPath: string,
  userDataDir: string,
  extensionsDir: string,
) {
  // Always pass the SAME user-data-dir and extensions-dir used for launchArgs.
  if (process.platform === "win32") {
    // Avoid code.cmd spawnSync EINVAL on Windows: use Node-based cli.js
    const vscodeRoot = getVSCodeRootFromExecutablePath(vscodeExecutablePath);

    const candidates = [
      path.join(vscodeRoot, "resources", "app", "out", "cli.js"),
      path.join(vscodeRoot, "resources", "app", "out", "cli", "cli.js"),
    ];

    const cliJsPath = candidates.find((p) => fs.existsSync(p));
    if (!cliJsPath) {
      throw new Error(`cli.js not found. Tried:\n${candidates.join("\n")}`);
    }

    cp.execFileSync(
      process.execPath,
      [
        cliJsPath,
        "--user-data-dir",
        userDataDir,
        "--extensions-dir",
        extensionsDir,
        "--install-extension",
        vsixPath,
        "--force",
      ],
      { stdio: "inherit" },
    );
    return;
  }

  // mac/linux path
  const [cliPath, ...cliArgs] =
    resolveCliArgsFromVSCodeExecutablePath(vscodeExecutablePath);

  cp.execFileSync(
    cliPath,
    [
      ...cliArgs,
      "--user-data-dir",
      userDataDir,
      "--extensions-dir",
      extensionsDir,
      "--install-extension",
      vsixPath,
      "--force",
    ],
    { stdio: "inherit" },
  );
}

void main();
