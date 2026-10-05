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

import { Writable } from "stream";

/**
 * Lines written by the test suite are tagged, so that the runner can drop the console noise of
 * VS Code itself (workbench, agent host, product.json checks, ...) and keep only the test results.
 */
export const OUTPUT_MARKER = "@@positive-tests@@ ";

export function tag(text: string): string {
  return text
    .split(/\r?\n/)
    .map((line) => OUTPUT_MARKER + line)
    .join("\n");
}

/** Stream printing only tagged lines (without the marker) */
export function filteredOutput(target: NodeJS.WriteStream): Writable {
  let pending = "";
  const writeLine = (line: string) => {
    const index = line.indexOf(OUTPUT_MARKER);
    if (index >= 0) {
      target.write(line.slice(index + OUTPUT_MARKER.length) + "\n");
    } 
  };
  return new Writable({
    write(chunk, _encoding, callback) {
      const lines = (pending + chunk.toString()).split("\n");
      pending = lines.pop() ?? "";
      lines.forEach(writeLine);
      callback();
    },
    final(callback) {
      if (pending) {
        writeLine(pending);
      }
      callback();
    },
  });
}
