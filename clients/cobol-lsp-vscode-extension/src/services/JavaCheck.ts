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
import { ServerInitError } from "./languageClient/ServerTypes";

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
): Promise<number | Error> {
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
        outputChannel.error(e);
      } else {
        outputChannel.error(JSON.stringify(e));
      }
      resolve(
        new ServerInitError(`Java command "${javaCommand}" failed to start.`),
      );
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
        const initError = new ServerInitError(
          `Java command "${javaCommand}" not found. Install Java or use Java Home setting to point to an existing Java installation.`,
          "Java Home",
        );
        outputChannel.error(initError);
        resolve(initError);
      } else {
        errorCode = -2;
        outputChannel.error(error);
        outputChannel.error(
          new Error(
            `Java command "${javaCommand} ${versionArg}" exited with error: "${JSON.stringify(error)}". Command output was: "${text}".`,
          ),
        );
        resolve(
          new ServerInitError(
            `Java command "${javaCommand}" failed to start. Check the extension output for more details.`,
          ),
        );
      }
    });
    ls.on("close", (code: number) => {
      if (errorCode == 0) {
        if (code === 0) {
          outputChannel.info(
            `Java command "${javaCommand} ${versionArg}" output the following string: "${text}".`,
          );
          const major = toJavaMajor(text);
          if (major) {
            resolve(major);
          } else {
            outputChannel.error(
              `Java command "${javaCommand} ${versionArg}" did not print version string in the expected format.`,
            );
            resolve(
              new ServerInitError(
                "Unable to determine Java version. Check the extension output for more details.",
              ),
            );
          }
        } else {
          outputChannel.error(
            `Java command "${javaCommand}" returned non-zero return code ${code}. Command output was: "${text}".`,
          );
          resolve(
            new ServerInitError(
              `Java command "${javaCommand}" returned non-zero return code ${code}. Check the extension output for more details.`,
            ),
          );
        }
      }
    });
  });
}

export async function checkJavaVersion(
  javaCommand: string,
  minimumSupportedJavaVersion: number,
): Promise<ServerInitError | undefined> {
  const major = await getJavaVersion(javaCommand);
  if (major instanceof Error) {
    telemetryEvent("log", ["bootstrap", "java-version"], "0");
    return major;
  } else if (major < minimumSupportedJavaVersion) {
    telemetryEvent("log", ["bootstrap", "java-version"], `${major}`);
    const error = new ServerInitError(
      `Unsupported Java version ${major} detected. Minimum required version is ${minimumSupportedJavaVersion}. If you have an installation of a supported version of Java you can point to it by the Java Home setting.`,
      "Java Home",
    );
    outputChannel.error(error);
    return error;
  }
  return;
}
