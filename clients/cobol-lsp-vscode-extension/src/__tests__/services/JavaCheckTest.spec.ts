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

jest.mock("../../services/reporter");
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

describe("Checks Java installation", () => {
  const expectedErrMsgSupportedJavaVersion =
    "Minimum expected Java version is 8. Switching to native builds";
  const expectedErrMsgJavaVersionNotFound =
    "Java 8 not found. Switching to native builds";

  it("when required version is supported", async () => {
    mockSpawnProcess("", "java 11 2018-09-25", 0);
    const promise = getJavaVersion();
    await expect(promise).resolves.toBeTruthy();
  });

  it("should skip not relevant lines", async () => {
    mockSpawnProcess(
      "",
      "Picked up JAVA_TOOL_OPTIONS: -Xmx2254m\njava 11 2018-09-25",
      0,
    );
    const promise = getJavaVersion();
    await expect(promise).resolves.toBeTruthy();
  });

  it("should skip not relevant lines and fail", async () => {
    mockSpawnProcess(
      "",
      `Picked up JAVA_TOOL_OPTIONS: -Xmx2254m\njava version "1.5.0_22"`,
      0,
    );
    const promise = getJavaVersion();
    await expect(promise).rejects.toEqual(
      new Error(expectedErrMsgSupportedJavaVersion),
    );
  });

  it("when required version is not supported", async () => {
    mockSpawnProcess("", `java version "1.5.0_22"`, 0);
    const promise = getJavaVersion();
    await expect(promise).rejects.toEqual(
      new Error(expectedErrMsgSupportedJavaVersion),
    );
  });

  it("when 'error' event is emitted  - spawned", async () => {
    mockSpawnProcess("", "", 0, { code: "ENOENT" } as NodeJS.ErrnoException);
    const promise = getJavaVersion();

    await expect(promise).rejects.toEqual(
      new Error(expectedErrMsgJavaVersionNotFound),
    );
  });

  it("when 'error' event is emitted  - not be spawned", async () => {
    const error = {
      code: "Other error",
    } as NodeJS.ErrnoException;
    mockSpawnProcess("", "", 0, error);
    const promise = getJavaVersion();

    await expect(promise).rejects.toEqual(error);
  });

  it("when 'close' event is emitted", async () => {
    mockSpawnProcess("", "", 23);
    const promise = getJavaVersion();

    await expect(promise).rejects.toEqual(
      new Error(
        "An error occurred when checking if Java was installed. Switching to native build.",
      ),
    );
  });

  it("calling the correct command", async () => {
    mockSpawnProcess("", `java version "1.5.0_22"`, 0);
    const version = await getJavaVersion("/user/defined/path/to/java");
    // expect that child-process spawn is called with "/user/defined/path/to/java" command
    expect(version).toBe(false);
  });
});
