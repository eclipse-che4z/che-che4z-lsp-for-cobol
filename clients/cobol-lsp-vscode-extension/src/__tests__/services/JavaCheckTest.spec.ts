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

import { toJavaMajor, getJavaVersion } from "../../services/JavaCheck";
import { mockSpawnProcess } from "../../__mocks__/child_process.utility";
import { outputChannel } from "../../services/util/OutputChannel";
import { ServerInitError } from "../../services/languageClient/ServerTypes";

describe("Checks Java version", () => {
  it("If Java version is supported", () => {
    expect(toJavaMajor('openjdk version "1.8.0-internal"')).toEqual(8);
    expect(toJavaMajor('java version "1.8.0_181"')).toEqual(8);
    expect(toJavaMajor('openjdk version "1.11.0-internal"')).toEqual(11);
    expect(toJavaMajor('java version "1.11.0_181"')).toEqual(11);
    expect(toJavaMajor('java version "10.0.1" 2018-04-17')).toEqual(10);
    expect(toJavaMajor('java version "9"')).toEqual(9);
    expect(toJavaMajor('java version "1.8.0_131"')).toEqual(8);
    expect(toJavaMajor('openjdk version "11.0.1" 2018-10-16')).toEqual(11);
    expect(toJavaMajor('openjdk version "12.0.1" 2018-10-16')).toEqual(12);
    expect(toJavaMajor("java 11 2018-09-25")).toEqual(11);
    expect(toJavaMajor("java 12 2019-03-19")).toEqual(12);
    expect(toJavaMajor("java 13 2019-09-17")).toEqual(13);
    expect(toJavaMajor("java 14 2020-03-17")).toEqual(14);
    expect(toJavaMajor('openjdk version "1.11.0-internal"')).toEqual(11);
    expect(
      toJavaMajor(
        `java version "17.0.2" 2022-01-18 LTS\nJava(TM) SE Runtime Environment (build 17.0.2+8-LTS-86)\nJava HotSpot(TM) 64-Bit Server VM (build 17.0.2+8-LTS-86, mixed mode, sharing)\n`,
      ),
    ).toEqual(17);
  });
});

describe("Java version check", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });
  it("calling default command", async () => {
    const spawn = mockSpawnProcess("", `java version "1.5.0_22"`, 0);
    await getJavaVersion();
    expect(spawn).toHaveBeenCalledWith("java", ["-version"]);
  });
  it("calling custom command", async () => {
    const spawn = mockSpawnProcess("", `java version "1.5.0_22"`, 0);
    await getJavaVersion("/user/defined/path/to/java");
    expect(spawn).toHaveBeenCalledWith("/user/defined/path/to/java", [
      "-version",
    ]);
  });
  it("for version 11", async () => {
    mockSpawnProcess("", "java 11 2018-09-25", 0);
    const version = await getJavaVersion();
    expect(version).toEqual(11);
  });

  it("should skip irrelevant lines", async () => {
    mockSpawnProcess(
      "",
      "Picked up JAVA_TOOL_OPTIONS: -Xmx2254m\njava 11 2018-09-25",
      0,
    );
    const version = await getJavaVersion();
    expect(version).toEqual(11);
  });

  it("for version 1.5", async () => {
    mockSpawnProcess("", `java version "1.5.0_22"`, 0);
    const version = await getJavaVersion();
    expect(version).toEqual(5);
  });

  it("version cannot be identified", async () => {
    const info = outputChannel.info as jest.Mock;
    const error = outputChannel.error as jest.Mock;
    mockSpawnProcess("", "No version", 0);
    const version = await getJavaVersion();
    expect(version).toEqual(
      new Error(
        "Unable to determine Java version. Check the extension output for more details.",
      ),
    );
    expect(info).toHaveBeenCalledTimes(2);
    expect(info.mock.calls[0]).toEqual([
      'Checking Java version by running command "java -version".',
    ]);
    expect(info.mock.calls[1]).toEqual([
      'Java command "java -version" output the following string: "No version".',
    ]);
    expect(error).toHaveBeenCalledTimes(1);
    expect(error.mock.calls[0]).toEqual([
      'Java command "java -version" did not print version string in the expected format.',
    ]);
  });

  it("when 'error' event is emitted  - spawned", async () => {
    mockSpawnProcess("", "", 0, { code: "ENOENT" } as NodeJS.ErrnoException);
    const version = await getJavaVersion();
    expect(version).toEqual(
      new Error(
        'Java command "java" not found. Install Java or use Java Home setting to point to an existing Java installation.',
      ),
    );
    expect((version as ServerInitError).filter).toEqual("Java Home");
    const logError = outputChannel.error as jest.Mock;
    expect(logError).toHaveBeenCalledTimes(1);
    expect(logError.mock.calls[0]).toEqual([
      new Error(
        'Java command "java" not found. Install Java or use Java Home setting to point to an existing Java installation.',
      ),
    ]);
  });

  it("when 'error' event is emitted  - not spawned", async () => {
    const error = outputChannel.error as jest.Mock;
    mockSpawnProcess("Standard output", "Error output", 0, {
      code: "Other error",
    } as NodeJS.ErrnoException);
    const version = await getJavaVersion();
    expect(version).toEqual(
      new Error(
        'Java command "java" failed to start. Check the extension output for more details.',
      ),
    );
    expect(error).toHaveBeenCalledTimes(2);
    expect(error.mock.calls[0]).toEqual([{ code: "Other error" }]);
    expect(error.mock.calls[1]).toEqual([
      new Error(
        'Java command "java -version" exited with error: "{"code":"Other error"}". Command output was: "Error output".',
      ),
    ]);
  });

  it("when 'close' event is emitted", async () => {
    const error = outputChannel.error as jest.Mock;
    mockSpawnProcess("", "", 23);
    const version = await getJavaVersion();
    expect(version).toEqual(
      new Error(
        'Java command "java" returned non-zero return code 23. Check the extension output for more details.',
      ),
    );
    expect(error).toHaveBeenCalledTimes(1);
    expect(error.mock.calls[0]).toEqual([
      'Java command "java" returned non-zero return code 23. Command output was: "".',
    ]);
  });
});
