/*
 * Copyright (c) 2022 Broadcom.
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

import * as vscode from "vscode";
import { SettingsService } from "../../../services/Settings";
import { ConfigurationWatcher } from "../../../services/util/ConfigurationWatcher";
jest.mock("../../../services/reporter/TelemetryService");

const DIALECT_NAME = "dummyDialect";

SettingsService.getDialects = jest.fn().mockReturnValue([DIALECT_NAME]);
SettingsService.isNativeServerTypeConfigured = jest.fn().mockReturnValue(true);
jest.mock("vscode", () => ({
    workspace: {
        getConfiguration: jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(9),
            update: jest.fn(),
        }),
        onDidChangeConfiguration: jest.fn().mockReturnValue("onDidChangeConfiguration"),
    },
    window: {
        showInformationMessage: jest.fn(),
    },
    commands: {
        executeCommand: jest.fn(),
    }
}));

describe("Tests ConfigurationWatcher utility", () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    it("Test NATIVE serverType is not compatible with any dialects and gives option to change server type", async () => {
        vscode.window.showInformationMessage = () => Promise.resolve(`Switch to JAVA server type`);
        await ConfigurationWatcher.validateDialectAndServerTypeCompatibility();
        expect(vscode.workspace.getConfiguration().update).toBeCalledWith("cobol-lsp.serverType", "JAVA");
    });

    it("Test NATIVE serverType is not compatible with any dialects and gives option to disable dialects", async () => {
        vscode.window.showInformationMessage = () => Promise.resolve(`Disable ${DIALECT_NAME} dialect(s).`);
        await ConfigurationWatcher.validateDialectAndServerTypeCompatibility();
        expect(vscode.workspace.getConfiguration().update).toBeCalledWith("cobol-lsp.dialects", []);
    });

    it("Test server type configuration change checks server type and dialect compatibility", async () => {
        vscode.window.showInformationMessage = () => Promise.resolve("Ok");
        await (ConfigurationWatcher as any).handleServerTypeConfigurationChange();
        expect(vscode.commands.executeCommand).toBeCalled();
    });
});

describe("Test changing server type from java to native", () => {

    afterEach(() => {
        jest.clearAllMocks();
    });

    it("1. user choose to remove dialect, should restart the vscode", async () => {
        vscode.window.showInformationMessage = jest.fn()
            .mockReturnValue(`Disable dummyDialect dialect(s).`)
            .mockReturnValue("Ok");
        await (ConfigurationWatcher as any).handleServerTypeConfigurationChange();
        expect(vscode.commands.executeCommand).toBeCalled();
    });
    it("2. user choose java server type, shouldn't restart the vscode", async () => {
        vscode.window.showInformationMessage = jest.fn()
            .mockReturnValue(`Switch to JAVA server type`);
        await (ConfigurationWatcher as any).handleServerTypeConfigurationChange();
        expect(vscode.commands.executeCommand).not.toBeCalled();
    });
});
