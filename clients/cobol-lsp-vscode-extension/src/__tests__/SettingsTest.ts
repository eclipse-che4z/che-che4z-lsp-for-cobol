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
import {createFileWithGivenPath, initializeSettings} from "../services/Settings";
import {SettingsUtils} from "../services/settings/util/SettingsUtils";

const fsPath = "/ws-vscode";
const scheme = "file";
const c4zFolder = ".c4z";
const fileName = ".gitignore";
let filePath: string;

beforeAll(() => {
    vscode.workspace.workspaceFolders = [{uri: {fsPath}} as any];
    filePath = path.join(vscode.workspace.workspaceFolders[0].uri.fsPath, c4zFolder, fileName);
});

afterAll(() => {
    if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
    }
});

describe("Settings initialization tests", () => {

    it("Update all settings if not present in workspace", async () => {
        const updateSettings = jest.fn();
        const inspectSettings = jest.fn().mockReturnValue({workspaceValue: undefined});
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            update: updateSettings,
            get: jest.fn().mockReturnValueOnce({prop1: "val1", prop2: "val2", prop3: "val3"})
                .mockReturnValueOnce("val1")
                .mockReturnValueOnce("val2")
                .mockReturnValueOnce("val3"),
            inspect: inspectSettings
        });

        initializeSettings();

        expect(inspectSettings).toHaveBeenCalledTimes(3);
        expect(updateSettings).toHaveBeenCalledWith("prop1", "val1", vscode.ConfigurationTarget.Workspace);
        expect(updateSettings).toHaveBeenCalledWith("prop2", "val2", vscode.ConfigurationTarget.Workspace);
        expect(updateSettings).toHaveBeenCalledWith("prop3", "val3", vscode.ConfigurationTarget.Workspace);
        expect(updateSettings).toHaveBeenCalledTimes(3);
    });

    it("Update no settings if one present in workspace", async () => {
        const updateSettings = jest.fn();
        const inspectSettings = jest.fn().mockReturnValueOnce({workspaceValue: undefined})
            .mockReturnValueOnce({workspaceValue: "val2"})
            .mockReturnValueOnce({workspaceValue: undefined});
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            update: updateSettings,
            get: jest.fn().mockReturnValueOnce({prop1: "val1", prop2: "val2", prop3: "val3"})
                .mockReturnValueOnce("val1")
                .mockReturnValueOnce("val2")
                .mockReturnValueOnce("val3"),
            inspect: inspectSettings
        });

        initializeSettings();

        expect(inspectSettings).toHaveBeenCalledTimes(2);
        expect(updateSettings).toHaveBeenCalledTimes(0);
    });

});

describe(".gitignore file in .c4z folder tests", () => {

    it.skip("Create .gitignore file if not exists", () => {
        createFileWithGivenPath(c4zFolder, fileName, "/**");

        expect(fs.existsSync(filePath)).toEqual(true);
    });

    it.skip("Modify .gitignore file if exists", () => {
        const pattern = "srs/*\n.sds/*";
        createFileWithGivenPath(c4zFolder, fileName, pattern);
        const found = fs.readFileSync(filePath).toString().split("\n")
            .filter(e => e.trim().length > 0)
            .map(e => e.trim()).indexOf(pattern);

        expect(found).toBeGreaterThanOrEqual(-1);
    });
});

describe("Validate URI generation for a given workspace folder", () => {
    test("With a valid workspace folder, the method return a valid URI representation", () => {
        const path = "/ws-vscode";
        vscode.workspace.workspaceFolders = [{uri: {path, scheme}} as any];
        expect(SettingsUtils.getWorkspacesURI()[0]).toBe("file:///ws-vscode");
    });
});
