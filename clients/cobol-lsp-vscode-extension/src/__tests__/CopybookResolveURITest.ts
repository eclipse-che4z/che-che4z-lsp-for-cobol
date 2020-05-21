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
import {CopybookResolveURI} from "../services/CopybookResolveURI";
import {SettingsUtils} from "../services/settings/util/SettingsUtils";
const copybookName: string = "NSTCOPY1";
const CPY_FOLDER_NAME = ".cobcopy";
const folderPath = path.join(__dirname, CPY_FOLDER_NAME);

SettingsUtils.getWorkspacesURI = jest.fn().mockReturnValue(["file://" + __dirname]);

// file utils
function createFile(filename: string): string {
    fs.writeFile(path.join(folderPath, filename), "Some dummy content", err => {
        if (err) {
            return null;
        }
    });
    return path.resolve(folderPath, filename);
}
function createDirectory(targetPath: string) {
    fs.promises.mkdir(targetPath, { recursive: true }).catch(console.error);
}

function removeFolder(pathFile: string) {
    fs.remove(pathFile);
}

beforeAll(() => {
    createDirectory(folderPath);
    createFile(copybookName);
});

afterAll(() => {
    return removeFolder(folderPath);
});

describe("Resolve local copybook against bad configuration of target folders", () => {
    test("given an undefined value as list of folders, the copybook is not retrieved", () => {
        expect(CopybookResolveURI.searchCopybookLocally(copybookName, undefined)).toBe(undefined);
    });

    test("given an empty list of folders, the copybook is not retrieved", () => {
        expect(CopybookResolveURI.searchCopybookLocally(copybookName, [])).toBe(undefined);
    });

    test("given a folder that not contains copybooks, the target copybook is not retrieved", () => {
        expect(CopybookResolveURI.searchCopybookLocally(copybookName, [__dirname])).toBe(undefined);
    });

    test("given a not empty folder, a copybook that is not present in that folder is not retrivied and the uri returned is undefined", () => {
        expect(CopybookResolveURI.searchCopybookLocally("NSTCPY2", [CPY_FOLDER_NAME])).toBeUndefined();
    });
});

describe("Resolve local copybook present in one or more folders specified by the user", () => {
    test("given a folder that contains the target copybook, it is found and its uri is returned", () => {
        expect(CopybookResolveURI.searchCopybookLocally(copybookName, [CPY_FOLDER_NAME])).toBeDefined();
    });

    test("given two times the same folder that contains the target copybook, one uri is still returned", () => {
        expect(CopybookResolveURI.searchCopybookLocally(copybookName, [CPY_FOLDER_NAME])).toBeDefined();
    });
});
