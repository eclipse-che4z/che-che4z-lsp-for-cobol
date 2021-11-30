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

import anything = jasmine.anything;
import { ZoweVsCodeExtension } from "@zowe/zowe-explorer-api/lib/vscode";
import * as fs from "fs-extra";
import * as path from "path";
import * as vscode from "vscode";
import {
    C4Z_FOLDER,
    COPYBOOKS_FOLDER,
    DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
    PROCESS_DOWNLOAD_ERROR_MSG,
    PROFILE_NAME_PLACEHOLDER,
    UNLOCK_DOWNLOAD_QUEUE_MSG,
} from "../constants";
import { CopybookDownloadService } from "../services/copybook/CopybookDownloadService";
import {
    checkWorkspace,
    CopybooksPathGenerator,
    createCopybookPath,
    createDatasetPath,
} from "../services/copybook/CopybooksPathGenerator";
import { CopybookProfile } from "../services/copybook/DownloadQueue";

const profile = "zoweProfile";
const wrongCredProfile = "wrongCredProfile";
const copybookProfile = new CopybookProfile("copybook", profile, false);
const downloadQueueLockedErrorMsg = DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, wrongCredProfile);

(vscode.workspace.workspaceFolders as any) = [{} as any];
vscode.window.showInformationMessage = () => Promise.resolve("Download Copybooks");
vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
    get: jest.fn().mockReturnValue(undefined),
});

const getZoweExplorerMock = (forError: boolean = false) => {
    const error = new Error("Error");
    (error as any).mDetails = {
        errorCode: 401,
    };
    const allMemberMock = forError ? jest.fn().mockRejectedValue(error) : jest.fn().mockReturnValue({
        apiResponse: {
            items: [{
                member: "copybook",
            }, { member: "DATASET2" }],
        },
    });
    return jest.fn().mockReturnValue({
        getExplorerExtenderApi: jest.fn().mockReturnValue({
            getProfilesCache: jest.fn().mockReturnValue({
                loadNamedProfile: jest.fn().mockReturnValue("profile"),
            }),
        }),
        getMvsApi: jest.fn().mockReturnValue({
            allMembers: allMemberMock,
        }),
    },
    );
};
beforeEach(() => {
    jest.clearAllMocks();
});

jest.mock("../services/reporter/TelemetryService");

describe("Test fetchCopybook against bad and correct configurations", () => {
    const copybookDownloadService: CopybookDownloadService = new CopybookDownloadService(new CopybooksPathGenerator());

    test("Given a profile with wrong cred, invalid cred is thrown", async () => {
        ZoweVsCodeExtension.getZoweExplorerApi = getZoweExplorerMock(true);
        try {
            await (copybookDownloadService as any).fetchCopybook("HLQ.DSN1", copybookProfile);
        } catch (e) {
            expect(e.message).toBe("Error");
            expect(e.mDetails.errorCode).toBe(401);
        }
    });

    test("Given a copybook name that is a valid member on MF, the fetchCopybook correctly invoke download from MF", async () => {
        (copybookDownloadService as any).downloadCopybookFromMFUsingZowe = jest.fn();
        ZoweVsCodeExtension.getZoweExplorerApi = getZoweExplorerMock();
        const result = await (copybookDownloadService as any).fetchCopybook("HLQ.DSN1", copybookProfile);
        expect(result).toBe(true);
    });
});
describe("Receiving an error from zowe api layer, copybooks are not retrivied and user is correctly notified", () => {
    describe("Suite of tests related to handleCopybook", () => {
        const cbd = new CopybookDownloadService(null);

        it("handleCopybook delete copybook from its internal queue if the copybook is a valid member on MF", async () => {
            (cbd as any).fetchCopybook = jest.fn().mockReturnValue(true);

            const errorQueue: Set<string> = new Set();
            errorQueue.add("copybook");

            await (cbd as any).handleCopybook("DSNAME1", copybookProfile, errorQueue);
            expect(errorQueue.size).toBe(0);
        });
    });

    describe("Suite of tests related to handleQueue", () => {
        const pathGenerator = new CopybooksPathGenerator();
        const cbd = new CopybookDownloadService(pathGenerator);
        pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
        vscode.window.showErrorMessage = jest.fn();

        it("handleQueue handle Invalid credentials ZoweError", async () => {

            const error = new Error("Error");
            (error as any).mDetails = {
                errorCode: 401,
            };
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(error);
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage)
                .toHaveBeenCalledWith("Incorrect credentials in Zowe profile zoweProfile.");
        });
    });
});

describe("Test the creation of folders that contains copybooks downloaded from MF against correct configuration in settings provided by the user", () => {
    function setupScenario() {
        const testFolder = path.join(__dirname, C4Z_FOLDER, COPYBOOKS_FOLDER, "profile", "dataset");
        const copybookURIPath = path.join(testFolder, "copybook" + ".cpy");
        const copybooksDownloadService: CopybookDownloadService = new CopybookDownloadService(new CopybooksPathGenerator());

        (createCopybookPath as any) = jest.fn().mockReturnValue(copybookURIPath);
        (createDatasetPath as any) = jest.fn().mockReturnValue(testFolder);
        return { copybookURIPath, copybooksDownloadService };
    }

    function cleanupScenario() {
        fs.remove(path.join(__dirname, C4Z_FOLDER));
    }

    test("With a valid configuration of dataset, zoweExplorerAPI is invoked with correct params", async () => {
        const copybooksDownloadService = new CopybookDownloadService(new CopybooksPathGenerator());
        ZoweVsCodeExtension.getZoweExplorerApi = getZoweExplorerMock();
        setupScenario();
        await (copybooksDownloadService as any).downloadCopybookFromMFUsingZowe("dataset", "copybook", "profile");
        cleanupScenario();
    });
});

describe("Test downloadCopybook user interaction", () => {
    const pathGenerator = new CopybooksPathGenerator();
    const copybooksDownloadService = new CopybookDownloadService(pathGenerator);
    pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
    const queuePush = jest.fn();

    beforeEach(() => {
        (checkWorkspace as any) = jest.fn().mockReturnValue(true);
        (copybooksDownloadService as any).queue.push = queuePush;
        (copybooksDownloadService as any).lockedProfile = new Set([wrongCredProfile]);
        vscode.window.showErrorMessage = jest.fn().mockResolvedValue(undefined);
    });

    test("check workspace fail", async () => {
        (checkWorkspace as any) = jest.fn().mockReturnValue(false);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).not.toBeCalled();
    });

    test("check profile not found", async () => {
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).not.toBeCalled();
    });

    test("check profile not found with user interaction", async () => {
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"], false);
        expect(vscode.window.showErrorMessage).toBeCalledWith(PROCESS_DOWNLOAD_ERROR_MSG + "copybook", anything());
        expect(queuePush).not.toBeCalled();
    });

    test("check good path", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue("profile"),
        });
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).toBeCalledWith("copybook", "profile", true);
    });

    test("check locked profile", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(wrongCredProfile),
        });
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).not.toBeCalled();
    });

    test("check locked profile and user kept it locked", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(wrongCredProfile),
        });
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"], false);
        expect(vscode.window.showErrorMessage).toBeCalledWith(downloadQueueLockedErrorMsg, anything());
        expect(queuePush).not.toBeCalled();
        expect((copybooksDownloadService as any).lockedProfile).toContain(wrongCredProfile);
    });

    test("queue locked and user unlocked it", async () => {
        vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
            get: jest.fn().mockReturnValue(wrongCredProfile),
        });
        vscode.window.showErrorMessage = jest.fn().mockResolvedValue(UNLOCK_DOWNLOAD_QUEUE_MSG);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"], false);
        expect(vscode.window.showErrorMessage).toBeCalledWith(downloadQueueLockedErrorMsg, anything());
        expect(queuePush).toBeCalledWith("copybook", wrongCredProfile, false);
        expect((copybooksDownloadService as any).lockedProfile).not.toContain(wrongCredProfile);
    });
});
