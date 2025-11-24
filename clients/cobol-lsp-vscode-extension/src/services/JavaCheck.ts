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
import { SettingsService } from "./Settings";

export const SUPPORTED_JAVA_VERSION = 8;

const versionCapturer =
  /\b(?:java|openjdk)\b(?:\s+version)?\s+"?(?:1\.)?(\d+)/i;

export class JavaCheck {
  public static isJavaVersionSupported(versionString: string) {
    const match = versionCapturer.exec(versionString);
    if (match) {
      const major = Number.parseInt(match[1]);
      return major >= SUPPORTED_JAVA_VERSION;
    }
    return false;
  }

  public async isJavaInstalled() {
    return new Promise((resolve, reject) => {
      let resolved = false;
      const ls = cp.spawn(SettingsService.getJavaCommand(), ["-version"]);
      ls.stderr.on("data", (data: Buffer) => {
        if (JavaCheck.isJavaVersionSupported(data.toString())) {
          resolved = true;
          resolve(resolved);
        }
      });
      ls.on("error", (error: NodeJS.ErrnoException) => {
        if (error.code === "ENOENT") {
          reject(
            new Error(
              `Java ${SUPPORTED_JAVA_VERSION} not found. Switching to native builds`,
            ),
          );
        }
        reject(error);
      });
      ls.on("close", (code: number) => {
        if (code !== 0) {
          reject(
            new Error(
              "An error occurred when checking if Java was installed. Switching to native build.",
            ),
          );
        }
        if (!resolved) {
          reject(
            new Error(
              `Minimum expected Java version is ${SUPPORTED_JAVA_VERSION}. Switching to native builds`,
            ),
          );
        }
      });
    });
  }
}
