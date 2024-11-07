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
import * as constants from "../../../constants";
import { TelemetryReporterImpl } from "../../../services/reporter/TelemetryReporterImpl";
import { asMutable } from "../../../test/suite/testHelper";
import * as TelemetryReporter from "@vscode/extension-telemetry";

function simulateTelemetryKeyInjection(value: string) {
  asMutable(constants).TELEMETRY_DEFAULT_CONTENT = value as "";
}

describe("Telemetry key retrieval functionality is able to return a decoded existing key or a default string", () => {
  beforeEach(() => {
    jest.spyOn(TelemetryReporter, "default").mockImplementation(jest.fn());
  });

  afterEach(() => {
    jest.clearAllMocks();
    // restore original value
    simulateTelemetryKeyInjection("");
  });

  test("If not replaced by correct value in CI, empty string as invalid telemetry key is returned", () => {
    const telemetryKey = TelemetryReporterImpl["getTelemetryKeyId"]();
    expect(telemetryKey).toBe("");
    const telemetryReporter = new TelemetryReporterImpl(telemetryKey);
    expect(telemetryReporter["isValidTelemetryKey"]()).toBeFalsy();
  });

  test("CI injected base64 encoded telemetry key secret is decoded as valid key", () => {
    simulateTelemetryKeyInjection("c2VjcmV0X2tleQ==");

    const telemetryKey = TelemetryReporterImpl["getTelemetryKeyId"]();
    expect(telemetryKey).toBe("secret_key");
    const telemetryReporter = new TelemetryReporterImpl(telemetryKey);
    expect(telemetryReporter["isValidTelemetryKey"]()).toBeTruthy();
  });
});
