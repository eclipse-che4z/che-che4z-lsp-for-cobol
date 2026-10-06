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

export const OUTPUT_MARKER = "@@positive-tests@@ ";

class TaggedSpecReporter extends Mocha.reporters.Spec {
  constructor(runner: Mocha.Runner, options?: Mocha.MochaOptions) {
    (Mocha.reporters.Base as unknown as { consoleLog: (...args: unknown[]) => void }).consoleLog = (
      ...args: unknown[]
    ) => console.log(format(...args)
    .split(/\r?\n/)
    .map((line) => OUTPUT_MARKER + line)
    .join("\n"));
    super(runner, options);
  }
}

export async function run(): Promise<void> {
  const mocha = new Mocha({ ui: "tdd", color: true, reporter: TaggedSpecReporter });
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
