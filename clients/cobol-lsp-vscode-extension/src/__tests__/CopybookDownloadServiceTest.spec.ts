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
import * as Path from "path";
import * as vscode from "vscode";
import {
    C4Z_FOLDER,
    COPYBOOKS_FOLDER,
    PROCESS_DOWNLOAD_ERROR_MSG,
} from "../constants";
import { CopybookDownloadService } from "../services/copybook/CopybookDownloadService";
import {
    checkWorkspace,
    CopybooksPathGenerator,
    createCopybookPath,
    createDatasetPath,
} from "../services/copybook/CopybooksPathGenerator";
import { CopybookProfile } from "../services/copybook/DownloadQueue";
import { TelemetryService } from "../services/reporter/TelemetryService";
import { ProfileUtils } from "../services/util/ProfileUtils";

const profile = "zoweProfile";
const wrongCredProfile = "wrongCredProfile";
const copybookProfile = new CopybookProfile("copybook", profile, false);

(vscode.workspace.workspaceFolders as any) = [{ uri: { fsPath: "/projects" } } as any];
vscode.window.showInformationMessage = () => Promise.resolve("Download Copybooks");
vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
    get: jest.fn().mockReturnValue(undefined),
});
(vscode.ProgressLocation as any) = { Notification: "notify" };

const getContentMock = jest.fn();
const getZoweExplorerMock = (forError: boolean = false, mentionedError?: any) => {
    const error = new Error("Error");
    (error as any).mDetails = {
        errorCode: 401,
    };
    const allMemberMock = forError ? jest.fn().mockRejectedValue(mentionedError ? mentionedError : error)
        : jest.fn().mockReturnValue({
            apiResponse: {
                items: [{
                    member: "copybook",
                }, { member: "DATASET2" }],
            },
        });
    return jest.fn().mockReturnValue({
        getExplorerExtenderApi: jest.fn().mockReturnValue({
            getProfilesCache: jest.fn().mockReturnValue({
                loadNamedProfile: jest.fn().mockReturnValue({ profile: { encoding: undefined, name: "profile" } }),
            }),
        }),
        getMvsApi: jest.fn().mockReturnValue({
            allMembers: allMemberMock,
            getContents: getContentMock,
        }),
    },
    );
};
beforeEach(() => {
    jest.clearAllMocks();
});

jest.mock("../services/reporter/TelemetryService");

describe("Test fetchCopybook against bad and correct configurations", () => {
    it("downloadCopybookFromMFUsingZowe is correctly invoked", async () => {
        ZoweVsCodeExtension.getZoweExplorerApi = getZoweExplorerMock();
        await (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe("HLQ.DSN1", "copybook", profile);
        expect(getContentMock).toBeCalledWith(`HLQ.DSN1(copybook)`, {
            encoding: undefined,
            file: Path.join(createDatasetPath(profile, "HLQ.DSN1"), "copybook"),
            returnEtag: true,
        });
    });

    it("Given a copybook name that is a valid member on MF, the fetchCopybook correctly invoke download from MF",
        async () => {
            (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe = jest.fn();
            ZoweVsCodeExtension.getZoweExplorerApi = getZoweExplorerMock();
            const result = await (CopybookDownloadService as any).fetchCopybook("HLQ.DSN1", copybookProfile);
            expect(result).toBe(true);
        });

    it("checks if handleCopybook can't find copybook, it shows a popup to update settings", async () => {
        const err = new Error("Error");
        ZoweVsCodeExtension.getZoweExplorerApi = getZoweExplorerMock(true, err);
        vscode.window.showErrorMessage = jest.fn();
        const spyOnErrorMessage = jest.spyOn(vscode.window, "showErrorMessage");
        spyOnErrorMessage.mockResolvedValue("Change settings" as any);
        const result = await (CopybookDownloadService as any).fetchCopybook("TEST", copybookProfile);
        expect(result).toBeFalsy();
        expect(spyOnErrorMessage).toBeCalledWith("Can't read members of dataset: TEST", "Change settings");
        expect(vscode.window.showErrorMessage).toBeCalledWith("Error");
    });
});
describe("Receiving an error from zowe api layer, copybooks are not retrivied and user is correctly notified", () => {
    describe("Suite of tests related to handleCopybook", () => {
        it("handleCopybook delete copybook from its internal queue if the copybook is a valid member on MF",
            async () => {
                (CopybookDownloadService as any).fetchCopybook = jest.fn().mockReturnValue(true);

                const errorQueue: Set<string> = new Set();
                errorQueue.add("copybook");

                await (CopybookDownloadService as any).handleCopybook("DSNAME1", copybookProfile, errorQueue);
                expect(errorQueue.size).toBe(0);
            });
    });

    describe("Suite of tests related to handleDataset", () => {
        const progress = { report: jest.fn() };
        vscode.window.showErrorMessage = jest.fn();

        it("handleDataset shows progress report", async () => {
            (CopybookDownloadService as any).needsUserNotification = jest.fn().mockReturnValue(true);
            const handleCopybook = (CopybookDownloadService as any).handleCopybook = jest.fn();
            await (CopybookDownloadService as any).handleDataset("dataset", [copybookProfile], new Set(), progress);
            expect(progress.report).toBeCalledWith(
                {
                    message: "Looking in dataset. 1 copybook(s) left.",
                });

            expect(handleCopybook).toBeCalledWith("dataset", copybookProfile, new Set());
        });

        it("handleDataset throws error incase download fails", async () => {
            (CopybookDownloadService as any).needsUserNotification = jest.fn().mockReturnValue(true);
            (CopybookDownloadService as any).handleCopybook = jest.fn().mockRejectedValue(new Error("error"));
            await (CopybookDownloadService as any).handleDataset("dataset", [copybookProfile], new Set(), progress);
            expect(vscode.window.showErrorMessage).toBeCalledWith("Error: error");
        });
    });

    describe("Suite of tests related to handleQueue", () => {
        const pathGenerator = new CopybooksPathGenerator();
        const cbd = new CopybookDownloadService(pathGenerator);
        pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
        vscode.window.showErrorMessage = jest.fn();

        it("handleQueue popup ZoweError", async () => {
            const error = new Error("Error");
            (CopybookDownloadService as any).handleDataset = jest.fn().mockRejectedValue(error);
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage)
                .toHaveBeenCalledWith("Error: Error");
        });
    });
});

describe("Test the creation of folders that contains copybooks downloaded from MF against correct configuration in settings provided by the user", () => {
    function setupScenario() {
        const testFolder = path.join(__dirname, C4Z_FOLDER, COPYBOOKS_FOLDER, "profile", "dataset");
        const copybookURIPath = path.join(testFolder, "copybook" + ".cpy");
        const copybooksDownloadService: CopybookDownloadService =
            new CopybookDownloadService(new CopybooksPathGenerator());

        (createCopybookPath as any) = jest.fn().mockReturnValue(copybookURIPath);
        (createDatasetPath as any) = jest.fn().mockReturnValue(testFolder);
        return { copybookURIPath, copybooksDownloadService };
    }

    function cleanupScenario() {
        fs.remove(path.join(__dirname, C4Z_FOLDER));
    }

    test("With a valid configuration of dataset, zoweExplorerAPI is invoked with correct params", async () => {
        ZoweVsCodeExtension.getZoweExplorerApi = getZoweExplorerMock();
        setupScenario();
        await (CopybookDownloadService as any).downloadCopybookFromMFUsingZowe("dataset", "copybook", "profile");
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
        ProfileUtils.getProfileNameForCopybook = jest.fn().mockReturnValue(undefined);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).not.toBeCalled();
    });

    test("check profile not found with user interaction", async () => {
        ProfileUtils.getProfileNameForCopybook = jest.fn().mockReturnValue(undefined);
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"], false);
        expect(vscode.window.showErrorMessage).toBeCalledWith(PROCESS_DOWNLOAD_ERROR_MSG + "copybook", anything());
        expect(queuePush).not.toBeCalled();
    });

    test("check good path", async () => {
        ProfileUtils.getProfileNameForCopybook = jest.fn().mockReturnValue("profile");
        await copybooksDownloadService.downloadCopybooks("fileName", ["copybook"]);
        expect(vscode.window.showErrorMessage).not.toBeCalled();
        expect(queuePush).toBeCalledWith("copybook", "profile", true);
    });
});

describe("Test copybook download process", () => {
    it("checks copybook download Service is called within the scope of vscode progress bar", async () => {
        const cbd = new CopybookDownloadService(new CopybooksPathGenerator());
        vscode.window.withProgress = jest.fn();
        (vscode.ProgressLocation as any) = { Notification: "notify" };
        await (cbd as any).run(copybookProfile, new Set(), 1234);
        expect(vscode.window.withProgress).toBeCalled();

    });

    it("checks copybook download Service calls the handle queue to resolve copybook", async () => {
        const cbd = new CopybookDownloadService(new CopybooksPathGenerator());
        const createErrorMessageForCopybooks =
            (CopybookDownloadService as any).createErrorMessageForCopybooks = jest.fn();
        const handleQueue = (cbd as any).handleQueue = jest.fn();
        const telementryRegisterEvent = (TelemetryService as any).registerEvent = jest.fn();
        const telemetryMessage = TelemetryService.calculateTimeElapsed = jest.fn().mockReturnValue("1234");
        (cbd as any).queue.push = jest.fn();
        const progress = { report: jest.fn() };
        const errors = new Set();
        errors.add("test");
        await (cbd as any).process(progress, copybookProfile, errors, 1234);
        expect(handleQueue).toBeCalledWith(copybookProfile, errors, progress);
        expect(createErrorMessageForCopybooks).toBeCalledWith(errors);
        expect(telemetryMessage).toBeCalled();
        expect(telementryRegisterEvent).toBeCalledWith("Download copybooks from MF", ["copybook",
            "COBOL", "experiment-tag"], "total time to search copybooks on MF", new Map().set("time elapsed", "1234"),
        );
    });
});
