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

export async function run(): Promise<void> {
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
}
