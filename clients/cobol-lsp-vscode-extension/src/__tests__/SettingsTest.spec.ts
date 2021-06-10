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
import * as fs from "fs-extra";
import * as path from "path";
import * as vscode from "vscode";
import {C4Z_FOLDER, GITIGNORE_FILE} from "../constants";
import {createFileWithGivenPath} from "../services/Settings";
import {SettingsUtils} from "../services/util/SettingsUtils";

const fsPath = "tmp-ws";
const scheme = "file";
let wsPath: string;
let c4zPath: string;
let filePath: string;

beforeAll(() => {
    (vscode.workspace.workspaceFolders as any) = [{uri: {fsPath}} as any];
    wsPath = path.join(vscode.workspace.workspaceFolders[0].uri.fsPath);
    c4zPath = path.join(wsPath, C4Z_FOLDER);
    filePath = path.join(c4zPath, GITIGNORE_FILE);
});

afterAll(() => {
    if (fs.existsSync(wsPath)) {
        fs.remove(wsPath);
    }
});

describe(".gitignore file in .c4z folder tests", () => {

    it("Create .gitignore file if not exists", () => {
        createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");

        expect(fs.existsSync(wsPath)).toEqual(true);
        expect(fs.existsSync(c4zPath)).toEqual(true);
        expect(fs.existsSync(filePath)).toEqual(true);
    });

    it("Modify .gitignore file if exists", () => {
        const pattern = "srs/*\n.sds/*";
        createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, pattern);
        const found = fs.readFileSync(filePath).toString().split("\n")
            .filter(e => e.trim().length > 0)
            .map(e => e.trim()).indexOf(pattern);

        expect(found).toBeGreaterThanOrEqual(-1);
    });

    it("workspace not exist", () => {
        (vscode.workspace.workspaceFolders as any) = [];
        const createFile = jest.fn();
        createFileWithGivenPath(C4Z_FOLDER, GITIGNORE_FILE, "/**");

        expect(createFile).toHaveBeenCalledTimes(0);
        expect(vscode.workspace.workspaceFolders[0]).toBe(undefined);
    });
});

describe("Validate URI generation for a given workspace folder", () => {
    test("With a valid workspace folder, the method return a valid URI representation", () => {
        const path = "/ws-vscode";
        (vscode.workspace.workspaceFolders as any) = [{uri: {path, scheme}} as any];
        expect(SettingsUtils.getWorkspacesURI()[0]).toBe("file:///ws-vscode");
    });
});
