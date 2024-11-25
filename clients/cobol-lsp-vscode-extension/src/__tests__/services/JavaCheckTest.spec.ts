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

import { JavaCheck } from "../../services/JavaCheck";
import { mockSpawnProcess } from "../../__mocks__/child_process.utility";

jest.mock("../../services/reporter/TelemetryService");
describe("Checks Java version", () => {
  it("If Java version is supported", () => {
    expect(
      JavaCheck.isJavaVersionSupported('openjdk version "1.8.0-internal"'),
    ).toBeTruthy();
    expect(
      JavaCheck.isJavaVersionSupported('java version "1.8.0_181"'),
    ).toBeTruthy();
    expect(
      JavaCheck.isJavaVersionSupported('openjdk version "1.11.0-internal"'),
    ).toBeTruthy();
    expect(
      JavaCheck.isJavaVersionSupported('java version "1.11.0_181"'),
    ).toBeTruthy();
    expect(
      JavaCheck.isJavaVersionSupported('java version "10.0.1" 2018-04-17'),
    ).toBeTruthy();
    expect(JavaCheck.isJavaVersionSupported('java version "9"')).toBeTruthy();
    expect(
      JavaCheck.isJavaVersionSupported('java version "1.8.0_131"'),
    ).toBeTruthy();
    expect(
      JavaCheck.isJavaVersionSupported('openjdk version "11.0.1" 2018-10-16'),
    ).toBeTruthy();
    expect(
      JavaCheck.isJavaVersionSupported('openjdk version "12.0.1" 2018-10-16'),
    ).toBeTruthy();
    expect(JavaCheck.isJavaVersionSupported("java 11 2018-09-25")).toBeTruthy();
    expect(JavaCheck.isJavaVersionSupported("java 12 2019-03-19")).toBeTruthy();
    expect(JavaCheck.isJavaVersionSupported("java 13 2019-09-17")).toBeTruthy();
    expect(JavaCheck.isJavaVersionSupported("java 14 2020-03-17")).toBeTruthy();
  });

  it("If Java version is not supported", () => {
    expect(
      JavaCheck.isJavaVersionSupported('java version "1.7.0_131"'),
    ).toBeFalsy();
    expect(
      JavaCheck.isJavaVersionSupported('java version "1.5.0_22"'),
    ).toBeFalsy();
  });
});

describe("Checks Java installation", () => {
  let javaCheck: JavaCheck;
  const expectedErrMsgSupportedJavaVersion =
    "Minimum expected Java version is 8. Switching to native builds";
  const expectedErrMsgJavaVersionNotFound =
    "Java 8 not found. Switching to native builds";

  beforeEach(() => {
    javaCheck = new JavaCheck();
  });

  it("when required version is supported", async () => {
    mockSpawnProcess("", "java 11 2018-09-25", 0);
    const promise = javaCheck.isJavaInstalled();
    await expect(promise).resolves.toEqual(true);
  });

  it("should skip not relevant lines", async () => {
    mockSpawnProcess(
      "",
      "Picked up JAVA_TOOL_OPTIONS: -Xmx2254m\njava 11 2018-09-25",
      0,
    );
    const promise = javaCheck.isJavaInstalled();
    await expect(promise).resolves.toEqual(true);
  });

  it("should skip not relevant lines and fail", async () => {
    mockSpawnProcess(
      "",
      `Picked up JAVA_TOOL_OPTIONS: -Xmx2254m\njava version "1.5.0_22"`,
      0,
    );
    const promise = javaCheck.isJavaInstalled();
    await expect(promise).rejects.toEqual(
      new Error(expectedErrMsgSupportedJavaVersion),
    );
  });

  it("when required version is not supported", async () => {
    mockSpawnProcess("", `java version "1.5.0_22"`, 0);
    const promise = javaCheck.isJavaInstalled();
    await expect(promise).rejects.toEqual(
      new Error(expectedErrMsgSupportedJavaVersion),
    );
  });

  it("when 'error' event is emitted  - spawned", async () => {
    mockSpawnProcess("", "", 0, "Error: spawn java ENOENT");
    const promise = javaCheck.isJavaInstalled();

    await expect(promise).rejects.toEqual(
      new Error(expectedErrMsgJavaVersionNotFound),
    );
  });

  it("when 'error' event is emitted  - not be spawned", async () => {
    mockSpawnProcess("", "", 0, "Other error");
    const promise = javaCheck.isJavaInstalled();

    await expect(promise).rejects.toEqual("Other error");
  });

  it("when 'close' event is emitted", async () => {
    mockSpawnProcess("", "", 23);
    const promise = javaCheck.isJavaInstalled();

    await expect(promise).rejects.toEqual(
      new Error(
        "An error occurred when checking if Java was installed. Switching to native build.",
      ),
    );
  });
});
