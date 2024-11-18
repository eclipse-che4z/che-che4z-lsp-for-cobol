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
import * as Mocha from "mocha";
import { glob } from "glob";
import type { Config, NYC } from "nyc";

export async function run(): Promise<void> {
  const sourceRoot = path.join(__dirname, "..", "..");

  // initialize nyc code coverage
  const NYC = (await import("nyc")) as new (cfg: Config) => NYC;
  const config: Config = {
    cwd: path.join(sourceRoot, ".."),
    reporter: ["lcov"],
    hookRequire: true,
    exclude: ["**/test/**", ".vscode-test/**", ".vscode-test-web/**"],
  };

  const nyc = new NYC(config);

  // decache files on windows to be hookable by nyc
  const decache = (await import("decache")) as unknown as (f: string) => void;
  glob
    .sync("**/**.js", {
      cwd: sourceRoot,
    })
    .forEach((file) => {
      decache(path.join(sourceRoot, file));
    });

  await nyc.createTempDirectory();
  nyc.wrap();

  // Create the mocha test
  const mocha = new Mocha({ ui: "tdd", color: true });
  const testsPath = path.join(__dirname, "..");
  const files = await glob("**/*.test.js", { cwd: testsPath });
  // Add files to the test suite
  files.forEach((file) => mocha.addFile(path.resolve(testsPath, file)));

  await new Promise((resolve, reject) => {
    // Run the mocha test
    mocha.run((failures) => {
      if (failures > 0) {
        reject(new Error(`${failures} tests failed.`));
      } else {
        resolve(undefined);
      }
    });
  });

  // report code coverage
  await nyc.writeCoverageFile();
  await nyc.report();
  console.log("Report created");
}
