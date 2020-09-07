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
const USERNAME: string = "usernameToAnonymize";

jest.mock("vscode-extension-telemetry");
jest.mock("fs-extra");

function generatePath(...pathSegments) {
    vscode.Uri.file = jest.fn().mockReturnValue({
        fsPath: path.join(path.join(__dirname, "../../"), ...pathSegments),
    });
}

describe("Test extension utility class", () => {
    beforeEach(() => {
        jest.clearAllMocks();
    });

    test("Given an existent flat file that contains telemetry key, then the content of that file is not empty and is returned", async () => {
        (ExtensionUtils as any).getExtensionPath = jest.fn().mockReturnValue(path.join(__dirname, "../../"));
        generatePath("resources", "TELEMETRY_KEY");

        expect(ExtensionUtils.getTelemetryKeyId()).not.toBe(INVALID_TELEMETRY_KEY);
    });

    test("Given a not existent file, then the constant value for invalid telemetry key is returned", () => {
        (ExtensionUtils as any).getExtensionPath = jest.fn().mockReturnValue(path.join(__dirname, "../../"));
        generatePath("bad", "resource", "TELEMETRY_KEY");

        expect(ExtensionUtils.getTelemetryKeyId()).toBe(INVALID_TELEMETRY_KEY);
    });

    test("Given a verbose exception log content, then the information about the user is obfuscated", () => {
        (ExtensionUtils as any).getUsername = jest.fn().mockReturnValue(USERNAME);

        const input = "Error: ENOENT: no such file or directory, scandir 'test'\n" +
            "\tat Object.readdirSync (fs.js:795:3)\n" +
            "\tat Object.<anonymous> (electron/js2c/asar.js:605:39)\n" +
            "\tat Object.readdirSync (electron/js2c/asar.js:605:39)\n" +
            "\tat c:\\Users\\usernameToAnonymize\\folder1\\folder2\\folder3\\out\\extension.js:58:16\n" +
            "\tat Generator.next (<anonymous>)\n" +
            "\tat c:\\Users\\usernameToAnonymize\\folder1\\folder2\\folder3\\out\\extension.js:21:71\n" +
            "\tat new Promise (<anonymous>)\n" +
            "\tat c:\\Users\\usernameToAnonymize\\folder1\\folder2\\folder3\\out\\extension.js:17:12\n" +
            "\tat activate (c:\\Users\\usernameToAnonymize\\folder1\\folder2\\folder3\\out\\extension.js:46:12)\n" +
            "\tat Function._callActivateOptional (c:\\Program Files\\Microsoft VS Code\\resources\\app\\out\\vs\\workbench\\services\\extensions\\node\\extensionHostProcess.js:837:509)\n" +
            "\tat Function._callActivate (c:\\Program Files\\Microsoft VS Code\\resources\\app\\out\\vs\\workbench\\services\\extensions\\node\\extensionHostProcess.js:837:160)\n" +
            "\tat c:\\Program Files\\Microsoft VS Code\\resources\\app\\out\\vs\\workbench\\services\\extensions\\node\\extensionHostProcess.js:835:703\n" +
            "\tat processTicksAndRejections (internal/process/task_queues.js:85:5)\n" +
            "\tat async Promise.all (index 0)\n";

        expect(ExtensionUtils.anonymizeContent(input).includes(USERNAME)).toBeFalsy();
    });
});
