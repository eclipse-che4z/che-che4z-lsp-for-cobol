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

import * as fs from "fs-extra";
import * as path from "path";
import * as vscode from "vscode";
import { clearCache } from "../../commands/ClearCopybookCacheCommand";
import { C4Z_FOLDER, COPYBOOK_CACHE_CLEARED_INFO, COPYBOOKS_FOLDER } from "../../constants";

const fsPath = "tmp-ws";
let wsPath: string;
let c4zPath: string;
let copybookCachePath: string;

// fs utils
function createDirectory(targetPath: string) {
    fs.mkdirSync(targetPath, { recursive: true });
}

function createFile(filename: string, folderPath: string): string {
    fs.writeFileSync(path.join(folderPath, filename), "Some dummy content", (err: any) => {
        if (err) {
            return null;
        }
    });
    return path.resolve(folderPath, filename);
}

beforeEach(() => {
    jest.clearAllMocks();
});

beforeAll(() => {
    (vscode.workspace.workspaceFolders as any) = [{ uri: { fsPath } } as any];
    wsPath = path.join(vscode.workspace.workspaceFolders[0].uri.fsPath);
    c4zPath = path.join(wsPath, C4Z_FOLDER);
    copybookCachePath = path.join(c4zPath, COPYBOOKS_FOLDER);
    createDirectory(copybookCachePath);
    createFile("test.cpy", copybookCachePath);
    vscode.window.setStatusBarMessage = jest.fn()
        .mockImplementation(async (text: string, hideWhenDone: Thenable<any>) => {
        await hideWhenDone;
    });
    vscode.window.showInformationMessage = jest.fn().mockImplementation((message: string) => Promise.resolve(message));
});
afterAll(() => {
    if (fs.existsSync(wsPath)) {
        fs.remove(wsPath);
    }
    jest.clearAllMocks();
});

describe("Tests downloaded copybook cache clear", () => {
    it("deletes the copybookfolder", () => {
        expect(fs.pathExistsSync(path.join(copybookCachePath, "test.cpy"))).toBe(true);
        clearCache();
        expect(fs.pathExistsSync(path.join(copybookCachePath, "test.cpy"))).toBe(false);
        expect(vscode.window.showInformationMessage).toBeCalledWith(COPYBOOK_CACHE_CLEARED_INFO);
    });

    it("checks running command multiple times doesn't produce error", () => {
        expect(() => {
            for (let index = 0; index < 3; index++) {
                clearCache();
            }
        }).not.toThrowError();
        expect(fs.pathExistsSync(path.join(copybookCachePath, "test.cpy"))).toBe(false);
        expect(vscode.window.showInformationMessage).toBeCalledWith(COPYBOOK_CACHE_CLEARED_INFO);
    });
});
