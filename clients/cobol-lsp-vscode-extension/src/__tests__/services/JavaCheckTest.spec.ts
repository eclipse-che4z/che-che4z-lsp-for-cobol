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
    const debug = outputChannel.debug as jest.Mock;
    mockSpawnProcess("", "No version", 0);
    const version = await getJavaVersion();
    expect(version).toBe(undefined);
    expect(debug).toHaveBeenCalledTimes(1);
    expect(debug.mock.calls[0]).toEqual([
      'Java command "java -version" did not print version information in the expected format: "No version".',
    ]);
  });

  it("when 'error' event is emitted  - spawned", async () => {
    mockSpawnProcess("", "", 0, { code: "ENOENT" } as NodeJS.ErrnoException);
    const version = await getJavaVersion();
    expect(version).toBe(undefined);
    expect(outputChannel.debug as jest.Mock).toHaveBeenCalledTimes(1);
    expect((outputChannel.debug as jest.Mock).mock.calls[0]).toEqual([
      'Java command "java" not found.',
    ]);
  });

  it("when 'error' event is emitted  - not spawned", async () => {
    const debug = outputChannel.debug as jest.Mock;
    mockSpawnProcess("", "", 0, {
      code: "Other error",
    } as NodeJS.ErrnoException);
    const version = await getJavaVersion();
    expect(version).toBe(undefined);
    expect(debug).toHaveBeenCalledTimes(1);
    expect(debug.mock.calls[0]).toEqual([
      'Java command "java" exited with error "{"code":"Other error"}"',
    ]);
  });

  it("when 'close' event is emitted", async () => {
    const debug = outputChannel.debug as jest.Mock;
    mockSpawnProcess("", "", 23);
    const version = await getJavaVersion();
    expect(version).toBe(undefined);
    expect(debug).toHaveBeenCalledTimes(1);
    expect(debug.mock.calls[0]).toEqual([
      'Java command "java" returned non-zero return code 23.',
    ]);
  });
});
