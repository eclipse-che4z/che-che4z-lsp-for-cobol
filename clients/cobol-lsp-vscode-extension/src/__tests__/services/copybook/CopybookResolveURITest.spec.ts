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
import { COPYBOOK_EXT_ARRAY } from "../../../constants";
import { CopybookURI } from "../../../services/copybook/CopybookURI";
import { SettingsService } from "../../../services/Settings";
import * as fsUtils from "../../../services/util/FSUtils";
import { ProfileUtils } from "../../../services/util/ProfileUtils";
import { SettingsUtils } from "../../../services/util/SettingsUtils";

const copybookName: string = "NSTCOPY1";
const copybookNameWithExtension: string = "NSTCOPY2.CPY";
const CPY_FOLDER_NAME = ".cobcopy";
const RELATIVE_CPY_FOLDER_NAME = "../relativeCobcopy";
const folderPath = path.join(__dirname, CPY_FOLDER_NAME);

SettingsUtils.findUriScheme = jest.fn().mockReturnValue("file");
SettingsUtils.getWorkspaceFoldersPath = jest.fn().mockReturnValue([__dirname]);
vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
    get: jest.fn().mockReturnValue(undefined),
});
jest.mock('@zowe/zowe-explorer-api/lib/vscode', () => {
    return {
      ZoweVsCodeExtension: jest.fn()
    };
  });

// file utils
function createFile(filename: string, folderPath: string): string {
    fs.writeFileSync(path.join(folderPath, filename), "Some dummy content");
    return path.resolve(folderPath, filename);
}

function createDirectory(targetPath: string) {
    fs.mkdirSync(targetPath, { recursive: true });
}

function removeFolder(targetPath: string) {
    if (fs.existsSync(targetPath)) {
        fs.remove(targetPath);
    }
}

function buildResultArrayFrom(settingsMockValue: string[], filename: string, profileName: string, ussPath: string[] = []): number {
    vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
        get: jest.fn().mockReturnValueOnce(settingsMockValue),
    });
    if (ussPath.length > 0) {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(ussPath),
        });
    }
    ProfileUtils.getProfileNameForCopybook = jest.fn().mockReturnValue(profileName);
    return (CopybookURI as any).createPathForCopybookDownloaded(filename, SettingsService.DEFAULT_DIALECT).length;
}

beforeEach(() => {
    jest.clearAllMocks();
});
beforeAll(() => {
    createDirectory(folderPath);
    createFile(copybookName, folderPath);
    createFile(copybookNameWithExtension, folderPath);
});
afterAll(() => {
    return removeFolder(folderPath);
});
describe("Resolve local copybook against bad configuration of target folders", () => {
    test("given an undefined value as list of folders, the copybook is not retrieved", () => {
        expect(fsUtils.searchInWorkspace(copybookName, undefined, COPYBOOK_EXT_ARRAY)).toBe(undefined);
    });
    test("given an empty list of folders, the copybook is not retrieved", () => {
        expect(fsUtils.searchInWorkspace(copybookName, [], COPYBOOK_EXT_ARRAY)).toBe(undefined);
    });
    test("given a folder that not contains copybooks, the target copybook is not retrieved", () => {
        expect(fsUtils.searchInWorkspace(copybookName, [__dirname], COPYBOOK_EXT_ARRAY)).toBe(undefined);
    });
    test("given a not empty folder, a copybook that is not present in that folder is not retrivied and the uri returned is undefined", () => {
        expect(fsUtils.searchInWorkspace("NSTCPY2", [CPY_FOLDER_NAME], COPYBOOK_EXT_ARRAY)).toBeUndefined();
    });
});
describe("Resolve local copybook present in one or more folders specified by the user", () => {
    test("given a folder that contains the target copybook, it is found and its uri is returned", () => {
        expect(fsUtils.searchInWorkspace(copybookName, [CPY_FOLDER_NAME], COPYBOOK_EXT_ARRAY)).toBeDefined();
    });
    test("given two times the same folder that contains the target copybook, one uri is still returned", () => {
        expect(fsUtils.searchInWorkspace(copybookName, [CPY_FOLDER_NAME], COPYBOOK_EXT_ARRAY)).toBeDefined();
    });
    test("Given a copybook with extension on filesystem, the uri is correctly returned", () => {
        expect(fsUtils.searchInWorkspace("NSTCOPY2", [CPY_FOLDER_NAME], COPYBOOK_EXT_ARRAY)).toBeDefined();
    });
    test("Given a valid relative path for copybook with extension on filesystem, the uri is correctly returned", () => {
        const dir = path.join(__dirname, RELATIVE_CPY_FOLDER_NAME);
        createDirectory(dir);
        createFile(copybookNameWithExtension, dir);
        expect(fsUtils.searchInWorkspace("NSTCOPY2", [RELATIVE_CPY_FOLDER_NAME], COPYBOOK_EXT_ARRAY)).toBeDefined();
        removeFolder(dir);
    });
    test("Given a valid absolute path for copybook with extension on filesystem, the uri is correctly returned", () => {
        expect(fsUtils.searchInWorkspace("NSTCOPY2", [path.normalize(folderPath)], COPYBOOK_EXT_ARRAY)).toBeDefined();
    });
});
describe("With invalid input parameters, the list of URI that represent copybook downloaded are not generated", () => {
    test("given a profile but no dataset, the result list returned is empty", () => {
        expect(buildResultArrayFrom(undefined, "file", "PRF")).toBe(0);
    });
    test("given a list of dataset but no profile, the result list returned is empty", () => {
        expect(buildResultArrayFrom(["HLQ.DATASET1.DATASET2"], "file", undefined)).toBe(0);
    });
});
describe("With allowed input parameters, the list of URI that represent copybook downloaded is correctly generated", () => {
    test("given profile and dataset list with one element, the result list is correctly generated with size 1 ", () => {
        expect(buildResultArrayFrom(["HLQ.DATASET1.DATASET2"], "file", "PRF")).toBe(1);
    });
    test("given profile, dataset and USS path, list with one element each, the result list is correctly generated with size 2 ", () => {
        expect(buildResultArrayFrom(["HLQ.DATASET1.DATASET2"], "file", "PRF", ["/test/uss/path"])).toBe(2);
    });
});
describe("Prioritize search criteria for copybooks test suite", () => {
    function provideMockValueForLocalAndDSN(localPath: string, dsnPath: string) {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValueOnce({
            get: jest.fn().mockReturnValueOnce([localPath]),
        }).mockReturnValue({
            get: jest.fn().mockReturnValueOnce([dsnPath]),
        });
    }

    const spySearchInWorkspace = jest.spyOn(fsUtils, "searchInWorkspace");
    test("With only a local folder defined in the settings.json, the search is applied locally", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue([CPY_FOLDER_NAME]),
        });
        const uri: string = await CopybookURI.resolveCopybookURI(copybookName, "PRGNAME", "COBOL");
        expect(uri).toMatch(CPY_FOLDER_NAME);
        expect(spySearchInWorkspace).toBeCalledTimes(1);
    });
    test("With no settings provided, two search strategies are applied and function return an empty string", async () => {
        provideMockValueForLocalAndDSN("", "");
        ProfileUtils.getProfileNameForCopybook = jest.fn().mockReturnValue(undefined);
        const uri: string = await CopybookURI.resolveCopybookURI(copybookName, "PRGNAME", "COBOL");
        expect(uri).toBe("");
        expect(spySearchInWorkspace).toBeCalledTimes(2);
    });
    test("With both local and dsn references defined in the settings.json, the search is applied on local resources" +
        "first", async () => {
            provideMockValueForLocalAndDSN(CPY_FOLDER_NAME, "");
            const uri: string = await CopybookURI.resolveCopybookURI(copybookName, "PRGNAME", "COBOL");
            expect(uri).not.toBe("");
            expect(spySearchInWorkspace).toBeCalledTimes(1);
    });
    test("With only a local folder defined for the dialect in the settings.json, the search is applied locally", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue([CPY_FOLDER_NAME]),
        });
        const uri: string = await CopybookURI.resolveCopybookURI(copybookName, "PRGNAME", "DIALECT");
        expect(uri).toMatch(CPY_FOLDER_NAME);
        expect(spySearchInWorkspace).toBeCalledTimes(1);
    });

});
