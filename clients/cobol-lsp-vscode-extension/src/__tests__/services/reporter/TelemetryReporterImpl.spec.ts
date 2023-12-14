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
import * as fs from "fs";
import * as path from "path";
import { TelemetryReporterImpl } from "../../../services/reporter/TelemetryReporterImpl";
import * as vscode from "vscode";

const INVALID_TELEMETRY_KEY: string = "INVALID_INSTRUMENTATION_KEY";
const INVALID_TELEMETRY_KEY_FOR_TESTING: string =
  "INSTRUMENTATION_KEY_FOR_TESTING";

function generatePath(...pathSegments: string[]): string {
  return path.join(path.join(__dirname, "../../../../"), ...pathSegments);
}

function mockFsPath(inputPath: string): void {
  vscode.Uri.file = jest.fn().mockReturnValue({
    fsPath: inputPath,
  });
}

describe("Telemetry key retrieval functionality is able to return a decoded existing key or a default string", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  test("Given an existent flat file that contains telemetry key, then the content of that file is not empty and is returned", async () => {
    const targetPath: string = generatePath("resources", "TELEMETRY_KEY_TEST");
    mockFsPath(targetPath);
    fs.writeFileSync(
      targetPath,
      "SU5TVFJVTUVOVEFUSU9OX0tFWV9GT1JfVEVTVElORwo=",
    );

    expect((TelemetryReporterImpl as any).getTelemetryKeyId()).not.toBe(
      INVALID_TELEMETRY_KEY,
    );
    expect((TelemetryReporterImpl as any).getTelemetryKeyId()).toBe(
      INVALID_TELEMETRY_KEY_FOR_TESTING,
    );

    fs.unlinkSync(targetPath);
  });

  test("Given a not existent file, then the constant value for invalid telemetry key is returned", () => {
    const targetPath: string = generatePath("bad", "resource", "TELEMETRY_KEY");
    mockFsPath(targetPath);
    expect((TelemetryReporterImpl as any).getTelemetryKeyId()).toBe(
      INVALID_TELEMETRY_KEY,
    );
  });
});
