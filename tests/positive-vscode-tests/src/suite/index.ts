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

import * as path from "path";
import * as Mocha from "mocha";
import { glob } from "glob";
import { format } from "util";
import { tag } from "../lib/output";

// route the reporter output through tagged lines, see lib/output.ts
const reporterBase = Mocha.reporters.Base as unknown as {
  consoleLog: (...args: unknown[]) => void;
};
reporterBase.consoleLog = (...args: unknown[]) => console.log(tag(format(...args)));

export async function run(): Promise<void> {
  const mocha = new Mocha({ ui: "tdd", color: true });
  const files = await glob("**/*.test.js", { cwd: __dirname });
  files.forEach((file) => mocha.addFile(path.resolve(__dirname, file)));

  await new Promise((resolve, reject) => {
    mocha.run((failures) => {
      if (failures > 0) {
        reject(new Error(`${failures} tests failed.`));
      } else {
        resolve(undefined);
      }
    });
  });
}
