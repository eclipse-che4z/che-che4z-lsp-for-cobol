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

import * as path from "path";
import * as vscode from "vscode";
import {ExtensionUtils} from "../services/settings/util/ExtensionUtils";

const INVALID_TELEMETRY_KEY: string = "INVALID_INSTRUMENTATION_KEY";

jest.mock("vscode-extension-telemetry");
jest.mock("fs-extra");

function generatePath(...pathSegments) {
    vscode.Uri.file = jest.fn().mockReturnValue({
        fsPath: path.join(path.join(__dirname, "../../"), ...pathSegments),
    });
}

describe("Test extension utility class", () => {
    beforeAll(() => {
        jest.clearAllMocks();
    });

    test("Given an existent flat file that contains telemetry key, then the content of that file is not empty and is returned", async () => {
        (ExtensionUtils as any).getExtensionPath = jest.fn().mockReturnValue(path.join(__dirname, "../../"));
        generatePath("resources", "TELEMETRY_KEY");

        // console.log(path.join(__dirname, "../../"));
        // console.log(path.join(path.join(__dirname, "../../"), "resources", "TELEMETRY_KEY"));
        // console.log(fs.existsSync(path.join(path.join(__dirname, "../../"), "resources", "TELEMETRY_KEY")));

        expect(ExtensionUtils.getTelemetryKeyId()).not.toBe(INVALID_TELEMETRY_KEY);
    });

    test("Given a not existent file, then the constant value for invalid telemetry key is returned", () => {
        (ExtensionUtils as any).getExtensionPath = jest.fn().mockReturnValue(path.join(__dirname, "../../"));
        generatePath("bad", "resource", "TELEMETRY_KEY");

        expect(ExtensionUtils.getTelemetryKeyId()).toBe(INVALID_TELEMETRY_KEY);
    });
});
