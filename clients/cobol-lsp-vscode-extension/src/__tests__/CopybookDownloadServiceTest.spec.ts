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
import {
    C4Z_FOLDER,
    COPYBOOKS_FOLDER,
    DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
    PROCESS_DOWNLOAD_ERROR_MSG,
    PROFILE_NAME_PLACEHOLDER,
    UNLOCK_DOWNLOAD_QUEUE_MSG
} from "../constants";
import {CopybookDownloadService} from "../services/copybook/CopybookDownloadService";
import {
    CopybooksPathGenerator,
    createCopybookPath,
    createDatasetPath,
    checkWorkspace
} from "../services/copybook/CopybooksPathGenerator";
import {CopybookProfile} from "../services/copybook/DownloadQueue";
import {ZoweApi} from "../services/ZoweApi";
import {Type, ZoweError} from "../services/ZoweError";
import {ProfileService} from "../services/ProfileService";
import anything = jasmine.anything;

const profile = "zoweProfile";
const wrongCredProfile = "wrongCredProfile";
const errorMessage = "The error";
const copybookProfile = new CopybookProfile("copybook", profile, false);
const zoweGeneralError = new ZoweError("zowe error", Type.General);
const downloadQueueLockedErrorMsg = DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, wrongCredProfile);

vscode.workspace.workspaceFolders = [{} as any];
vscode.window.showInformationMessage = () => Promise.resolve("Download Copybooks");
vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
    get: jest.fn().mockReturnValue(undefined),
});

beforeEach(() => {
    jest.clearAllMocks();
});

jest.mock("../services/reporter/TelemetryService");
jest.mock("../services/ProfileService");

describe("Test fetchCopybook against bad and correct configurations", () => {
    const zoweApi: ZoweApi = new ZoweApi();
    const copybookDownloadService: CopybookDownloadService = new CopybookDownloadService(zoweApi, null, null);

    test("Given a copybook name that is not a valid member on MF, the copybook is not downloaded", async () => {
        zoweApi.listMembers = jest.fn().mockReturnValue("ANTHMEM");

        const result = await (copybookDownloadService as any).fetchCopybook("HLQ.DSN1", copybookProfile);
        expect(result).toBe(false);
    });

    test("Given a copybook name but a wrong instance of profile, the copybook is not downloaded and exception is thrown", async () => {
        zoweApi.listMembers = jest.fn().mockRejectedValue(null);
        vscode.window.showErrorMessage = jest.fn().mockResolvedValue(undefined);
        const result = await (copybookDownloadService as any).fetchCopybook("HLQ.DSN1", copybookProfile);
        expect(result).toBe(false);
    });

    test("Given a copybook name that is a valid member on MF, the fetchCopybook correctly invoke download from MF", async () => {
        zoweApi.listMembers = jest.fn().mockReturnValue("copybook");
        (copybookDownloadService as any).downloadCopybookFromMFUsingZowe = jest.fn();
        const result = await (copybookDownloadService as any).fetchCopybook("HLQ.DSN1", copybookProfile);
        expect(result).toBe(true);
    });
});
describe("Receiving an error from zowe api layer, copybooks are not retrivied and user is correctly notified", () => {
    describe("Suite of tests related to fetchCopybook", () => {
        it("fetchCopybook rethrow ZoweError from zoweApi", async () => {
            const zoweApi: any = {
                listMembers: jest.fn().mockRejectedValue(zoweGeneralError),
            };
            const cbd = new CopybookDownloadService(zoweApi, null, null);
            await expect((cbd as any).fetchCopybook(null, {profile: null})).rejects.toEqual(zoweGeneralError);
        });
    });

    describe("Suite of tests related to handleCopybook", () => {
        const zoweApi: any = {
            listMembers: jest.fn().mockRejectedValue(zoweGeneralError),
        };
        const cbd = new CopybookDownloadService(zoweApi, null, null);

        it("handleCopybook rethrow ZoweError from zoweApi", async () => {
            await expect((cbd as any).handleCopybook(null, {profile: null}, null)).rejects.toEqual(zoweGeneralError);
        });

        it("handleCopybook delete copybook from its internal queue if the copybook is a valid member on MF", async () => {
            (cbd as any).fetchCopybook = jest.fn().mockReturnValue(true);

            const errorQueue: Set<string> = new Set();
            errorQueue.add("copybook");

            await (cbd as any).handleCopybook("DSNAME1", copybookProfile, errorQueue);
            expect(errorQueue.size).toBe(0);
        });
    });

    describe("Suite of tests related to handleDataset", () => {
        const cbd = new CopybookDownloadService(null, null, null);
        const toDownload = [copybookProfile];
        const progress = {report: jest.fn()};
        const zoweError = new ZoweError("not found", Type.NotFound);
        vscode.window.showErrorMessage = jest.fn();

        it("handleDataset rethow non NotFound ZoweErrors", async () => {
            (cbd as any).handleCopybook = jest.fn().mockRejectedValue(zoweGeneralError);
            await expect((cbd as any).handleDataset(null, toDownload, null, progress)).rejects.toEqual(zoweGeneralError);
        });
        it("handleDataset show an error if copybook is not found", async () => {
            (cbd as any).handleCopybook = jest.fn().mockRejectedValue(zoweError);
            await (cbd as any).handleDataset("DATA.SET", toDownload, null, progress);
            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Dataset DATA.SET not found.");
        });
        it("handleDataset show an error for non ZoweError", async () => {
            (cbd as any).handleCopybook = jest.fn().mockRejectedValue(new Error(errorMessage));
            await (cbd as any).handleDataset("DATA.SET", toDownload, null, progress);
            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Error: " + errorMessage);
        });
    });

    describe("Suite of tests related to handleQueue", () => {
        const pathGenerator = new CopybooksPathGenerator(null);
        const cbd = new CopybookDownloadService(null, null, pathGenerator);
        pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
        vscode.window.showErrorMessage = jest.fn();

        it("handleQueue show an error for non ZoweError", async () => {
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new Error(errorMessage));
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Error: " + errorMessage);
        });
        it("handleQueue handle Invalid credentials ZoweError", async () => {
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.InvalidCredentials));
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage)
                .toHaveBeenCalledWith("Incorrect credentials in Zowe profile zoweProfile.");
        });
        it("handleQueue handle Connection refused ZoweError", async () => {
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.ConnRefused));
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage)
                .toHaveBeenCalledWith("Connection to mainframe using Zowe profile zoweProfile failed.");
        });
        it("handleQueue handle No password ZoweError", async () => {
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.NoPassword));
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("No password in Zowe profile zoweProfile.");
        });
    });
});

describe("Test the creation of folders that contains copybooks downloaded from MF against correct configuration in settings provided by the user", () => {
    function setupScenario() {
        const testFolder = path.join(__dirname, C4Z_FOLDER, COPYBOOKS_FOLDER, "profile", "dataset");
        const copybookURIPath = path.join(testFolder, "copybook" + ".cpy");
        const zoweApi = new ZoweApi();
        const copybooksDownloadService: CopybookDownloadService = new CopybookDownloadService(zoweApi, undefined, undefined);

        zoweApi.fetchMember = jest.fn().mockReturnValue("");
        (createCopybookPath as any) = jest.fn().mockReturnValue(copybookURIPath);
        (createDatasetPath as any) = jest.fn().mockReturnValue(testFolder);
        return {copybookURIPath, copybooksDownloadService};
    }

    function cleanupScenario() {
        fs.remove(path.join(__dirname, C4Z_FOLDER));
    }

    test("With a valid configuration of dataset, copybook is created on FS", async () => {
        const {copybookURIPath, copybooksDownloadService} = setupScenario();
        await (copybooksDownloadService as any).downloadCopybookFromMFUsingZowe("dataset", "copybook", "profile");
        expect(fs.existsSync(copybookURIPath)).toBe(true);

        cleanupScenario();
    });
});

describe("Test downloadCopybook user interaction", () => {
    const profileService = new ProfileService(null);
    const copybooksDownloadService = new CopybookDownloadService(null, profileService, null);
    const queuePush = jest.fn();

    beforeEach(() => {
        (checkWorkspace as any) = jest.fn().mockReturnValue(true);
        (profileService as any).resolveProfile = jest.fn().mockResolvedValue('profile');
        (copybooksDownloadService as any).queue.push = queuePush;
        (copybooksDownloadService as any).lockedProfile = new Set([wrongCredProfile]);
        vscode.window.showErrorMessage = jest.fn().mockResolvedValue(undefined);
    });

    test("check workspace fail", async () => {
        (checkWorkspace as any) = jest.fn().mockReturnValue(false);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect((profileService as any).resolveProfile).not.toBeCalled();
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).not.toBeCalled();
    });

    test("check profile not found", async () => {
        (profileService as any).resolveProfile = jest.fn().mockResolvedValue(null);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect((profileService as any).resolveProfile).toBeCalled();
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).not.toBeCalled();
    });

    test("check profile not found with user interaction", async () => {
        (profileService as any).resolveProfile = jest.fn().mockResolvedValue(null);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"], false);
        expect((profileService as any).resolveProfile).toBeCalled();
        expect(vscode.window.showErrorMessage).toBeCalledWith(PROCESS_DOWNLOAD_ERROR_MSG + "copybook", anything());
        expect(queuePush).not.toBeCalled();
    });

    test("check good path", async () => {
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).toBeCalledWith("copybook", "profile", true);
    });

    test("check locked profile", async () => {
        (profileService as any).resolveProfile = jest.fn().mockResolvedValue(wrongCredProfile);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).not.toBeCalled();
    });

    test("check locked profile and user kept it locked", async () => {
        (profileService as any).resolveProfile = jest.fn().mockResolvedValue(wrongCredProfile);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"], false);
        expect(vscode.window.showErrorMessage).toBeCalledWith(downloadQueueLockedErrorMsg, anything());
        expect(queuePush).not.toBeCalled();
        expect((copybooksDownloadService as any).lockedProfile).toContain(wrongCredProfile);
    });

    test("queue locked and user unlocked it", async () => {
        (profileService as any).resolveProfile = jest.fn().mockResolvedValue(wrongCredProfile);
        vscode.window.showErrorMessage = jest.fn().mockResolvedValue(UNLOCK_DOWNLOAD_QUEUE_MSG);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"], false);
        expect(vscode.window.showErrorMessage).toBeCalledWith(downloadQueueLockedErrorMsg, anything());
        expect(queuePush).toBeCalledWith("copybook", wrongCredProfile, false);
        expect((copybooksDownloadService as any).lockedProfile).not.toContain(wrongCredProfile);
    });
});
