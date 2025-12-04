/*
 * Copyright (c) 2020 Broadcom.
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
import * as cp from "child_process";

const stopLength = 80;
const versionPattern = /\b(?:java|openjdk)\b(?:\s+version)?\s+"?(?:1\.)?(\d+)/i;

export function toJavaMajor(versionString: string) {
  const match = versionPattern.exec(versionString);
  if (match) {
    const major = Number.parseInt(match[1]);
    return major;
  }
}

export async function getJavaVersion(javaCommand: string) {
  return new Promise<number>((resolve, reject) => {
    let text = "";
    const ls = cp.spawn(javaCommand, ["-version"]);
    ls.stderr.on("data", (data: Buffer) => {
      if (text.length < stopLength) {
        text = text + data.toString();
        text = text.substring(0, stopLength);
      }
    });
    ls.on("error", (error: NodeJS.ErrnoException) => {
      if (error.code === "ENOENT") {
        reject(new Error(`Java command not found: "${javaCommand}".`));
      } else {
        reject(error);
      }
    });
    ls.on("close", (code: number) => {
      const firstLine = text.split("\n")[0];
      if (code === 0) {
        const major = toJavaMajor(firstLine);
        if (major) {
          resolve(major);
        } else {
          reject(
            new Error(
              `Java version cannot be identified from first line "${firstLine}" retuned by Java command "${javaCommand}"`,
            ),
          );
        }
      } else {
        reject(
          new Error(
            `Non-zero return code ${code} was returned by Java command "${javaCommand}".`,
          ),
        );
      }
    });
  });
}
