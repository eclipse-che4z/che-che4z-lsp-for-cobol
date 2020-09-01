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
import * as vscode from "vscode";


import {C4Z_FOLDER} from "../constants";
import {ExtensionUtils} from "../services/settings/util/ExtensionUtils";

const fsPath = "tmp-ws";
const scheme = "file";
let wsPath: string;
let c4zPath: string;
let filePath: string;
jest.mock("vscode-extension-telemetry");
jest.mock("fs-extra");

describe("Test extension utility class", () => {
    beforeAll(() => {
        jest.clearAllMocks();
        vscode.workspace.workspaceFolders = [{uri: {fsPath, scheme}} as any];
        wsPath = path.join(vscode.workspace.workspaceFolders[0].uri.fsPath);
        c4zPath = path.join(wsPath, C4Z_FOLDER);
        filePath = path.join(c4zPath, "TELEMETRY_KEY");

    });
    test("Given a not existent flat file that contais telemetry key, then a default string value is returned", () => {
        (fs as any).existsSync = jest.fn().mockImplementation(() => {
            return false;
        });

        expect(ExtensionUtils.getTelemetryKeyId()).toBe("GENERIC_INVALID_KEY");
    });

    test("Given an existent flat file that contains telemetry key, then the content of that file is not empty and is returned", async () => {
        (fs as any).existsSync = jest.fn().mockImplementation(() => {
            return true;
        });
        (ExtensionUtils as any).readContentFromFile = jest.fn().mockImplementation(() => {
            return "KEY";
        });

        expect(ExtensionUtils.getTelemetryKeyId()).not.toBe("GENERIC_INVALID_KEY");
    });
});
