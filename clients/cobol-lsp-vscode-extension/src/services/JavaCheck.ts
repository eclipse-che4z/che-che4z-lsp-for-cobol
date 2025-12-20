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
import { outputChannel } from "./util/OutputChannel";
import { telemetryEvent } from "./reporter";

const maxLength = 255;
const versionPattern = /\b(?:java|openjdk)\b(?:\s+version)?\s+"?(?:1\.)?(\d+)/i;

export function toJavaMajor(versionString: string) {
  const match = versionPattern.exec(versionString);
  if (match) {
    const major = Number.parseInt(match[1]);
    return major;
  }
}

export async function getJavaVersion(
  javaCommand: string = "java",
): Promise<number | undefined> {
  const versionArg = "-version";
  outputChannel.info(
    `Checking Java version by running command "${javaCommand} ${versionArg}".`,
  );
  return new Promise((resolve) => {
    let ls: cp.ChildProcessWithoutNullStreams;
    try {
      ls = cp.spawn(javaCommand, [versionArg]);
    } catch (e: unknown) {
      if (e instanceof Error) {
        outputChannel.error(e.toString());
      } else {
        outputChannel.error(JSON.stringify(e));
      }
      resolve(undefined);
      return;
    }
    let text = "";
    let errorCode = 0;
    ls.stderr.on("data", (data: Buffer) => {
      if (text.length < maxLength) {
        text = text + data.toString();
        text = text.substring(0, maxLength);
      }
    });
    ls.on("error", (error: NodeJS.ErrnoException) => {
      if (error.code === "ENOENT") {
        errorCode = -1;
        outputChannel.error(`Java command "${javaCommand}" not found.`);
      } else {
        errorCode = -2;
        outputChannel.error(
          `Java command "${javaCommand} ${versionArg}" exited with error "${JSON.stringify(error)}". Command output was: "${text}".`,
        );
      }
      resolve(undefined);
    });
    ls.on("close", (code: number) => {
      if (errorCode == 0) {
        if (code === 0) {
          outputChannel.info(
            `Java command "${javaCommand} ${versionArg}" output the following string: ${text} `,
          );
          const major = toJavaMajor(text);
          if (major) {
            resolve(major);
          } else {
            outputChannel.warn(
              `Java command "${javaCommand} ${versionArg}" did not print version string in the expected format.`,
            );
          }
        } else {
          outputChannel.warn(
            `Java command "${javaCommand}" returned non-zero return code ${code}. Command output was: "${text}".`,
          );
        }
      }
      resolve(undefined);
    });
  });
}

export async function hasSupportedJava(
  javaCommand: string,
  minimumSupportedJavaVersion: number,
): Promise<boolean> {
  const major = await getJavaVersion(javaCommand);
  if (major === undefined) {
    telemetryEvent("log", ["bootstrap", "java-version"], "0");
    outputChannel.warn(`Java check failed.`);
    return false;
  } else if (major < minimumSupportedJavaVersion) {
    telemetryEvent("log", ["bootstrap", "java-version"], `${major}`);
    outputChannel.warn(
      `Unsupported Java version ${major} detected. Minimum required version is ${minimumSupportedJavaVersion}.`,
    );
    return false;
  }
  return true;
}
