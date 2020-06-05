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
import {C4Z_FOLDER, COPYBOOKS_FOLDER} from "../constants";
import {CopybookDownloadService} from "../services/CopybookDownloadService";
import {CopybookFix} from "../services/CopybookFix";
import {CopybooksPathGenerator, createCopybookPath, createDatasetPath} from "../services/CopybooksPathGenerator";
import {CopybookProfile} from "../services/DownloadQueue";
import {ProfileService} from "../services/ProfileService";
import {ZoweApi} from "../services/ZoweApi";
import {Type, ZoweError} from "../services/ZoweError";

vscode.workspace.workspaceFolders = [{} as any];
vscode.window.showInformationMessage = () => Promise.resolve("Download Copybooks");
const profile = "zoweProfile";
const copybookProfile = new CopybookProfile("copybook", profile);
const zoweGeneralError = new ZoweError("zowe error", Type.General);
const copybookFix: CopybookFix = new CopybookFix();

describe("Test fetchCopybook against bad and correct configurations", () => {
    let zoweApi: ZoweApi;
    let copybookDownloadService: CopybookDownloadService;

    beforeAll(() => {
        zoweApi = new ZoweApi();
        copybookDownloadService = new CopybookDownloadService(copybookFix, zoweApi, null, null);
    });

    test("Given a copybook name that is not a valid member on MF, the copybook is not downloaded", async () => {
        zoweApi.listMembers = jest.fn().mockReturnValue("ANTHMEM");

        const result = await (copybookDownloadService as any).fetchCopybook("HLQ.DSN1", copybookProfile);
        expect(result).toBe(false);
    });

    test("Given a copybook name but a wrong instance of profile, the copybook is not downloaded and exception is thrown", async () => {
        zoweApi.listMembers = jest.fn().mockReturnValue("copybook");
        copybookFix.processDownloadError = jest.fn();
        const result = await (copybookDownloadService as any).fetchCopybook("HLQ.DSN1", undefined);
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
            const cbd = new CopybookDownloadService(null, zoweApi, null, null);
            expect((cbd as any).fetchCopybook(null, null)).rejects.toEqual(zoweGeneralError);
        });
    });

    describe("Suite of tests related to handleCopybook", () => {
        const zoweApi: any = {
            listMembers: jest.fn().mockRejectedValue(zoweGeneralError),
        };
        const cbd = new CopybookDownloadService(null, zoweApi, null, null);

        it("handleCopybook rethrow ZoweError from zoweApi", async () => {
            expect((cbd as any).handleCopybook(null, null, null)).rejects.toEqual(zoweGeneralError);
        });

        it("handleCopybook delete copybook from its internal queue if the copybook is a valid member on MF", async () => {
            // simulate that the copybook required is a valid member name on MF
            (cbd as any).fetchCopybook = jest.fn().mockReturnValue(true);

            // simulate that the a copybook not found is already defined in a queue
            const errorQueue: Set<string> = new Set();
            errorQueue.add("copybook");

            await (cbd as any).handleCopybook("DSNAME1", copybookProfile, errorQueue);

            // after the analysis - since the item in the queue is a valid member on MF it should be removed from the
            // error queue
            expect(errorQueue.size).toBe(0);
        });

    });

    describe("Suite of tests related to handleDataset", () => {

        it("handleDataset rethow non NotFound ZoweErrors", async () => {
            const cbd = new CopybookDownloadService(null, null, null, null);
            (cbd as any).handleCopybook = jest.fn().mockRejectedValue(zoweGeneralError);
            const toDownload = [copybookProfile];
            const progress = {report: jest.fn()};
            expect((cbd as any).handleDataset(null, toDownload, null, progress)).rejects.toEqual(zoweGeneralError);
        });
        it("handleDataset show an error if copybook is not found", async () => {
            const zoweError = new ZoweError("not found", Type.NotFound);
            const cbd = new CopybookDownloadService(null, null, null, null);
            (cbd as any).handleCopybook = jest.fn().mockRejectedValue(zoweError);
            const toDownload = [copybookProfile];
            const progress = {report: jest.fn()};
            vscode.window.showErrorMessage = jest.fn();
            await (cbd as any).handleDataset("DATA.SET", toDownload, null, progress);
            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Dataset DATA.SET not found.");
        });
        it("handleDataset show an error for non ZoweError", async () => {
            const errorMessage = "The error";
            const cbd = new CopybookDownloadService(null, null, null, null);
            (cbd as any).handleCopybook = jest.fn().mockRejectedValue(new Error(errorMessage));
            const toDownload = [copybookProfile];
            const progress = {report: jest.fn()};
            vscode.window.showErrorMessage = jest.fn();
            await (cbd as any).handleDataset("DATA.SET", toDownload, null, progress);
            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Error: " + errorMessage);
        });
    });

    describe("Suite of tests related to handleQueue", () => {
        it("handleQueue show an error for non ZoweError", async () => {
            const errorMessage = "The error";
            const pathGenerator = new CopybooksPathGenerator(null);
            pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
            const cbd = new CopybookDownloadService(null, null, null, pathGenerator);
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new Error(errorMessage));
            vscode.window.showErrorMessage = jest.fn();
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Error: " + errorMessage);
        });
        it("handleQueue handle Invalid credentials ZoweError", async () => {
            const pathGenerator = new CopybooksPathGenerator(null);
            pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
            const cbd = new CopybookDownloadService(null, null, null, pathGenerator);
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.InvalidCredentials));
            vscode.window.showErrorMessage = jest.fn();
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage)
                .toHaveBeenCalledWith("Incorrect credentials in Zowe profile zoweProfile.");
        });
        it("handleQueue handle Connection refused ZoweError", async () => {
            const pathGenerator = new CopybooksPathGenerator(null);
            pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
            const cbd = new CopybookDownloadService(null, null, null, pathGenerator);
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.ConnRefused));
            vscode.window.showErrorMessage = jest.fn();
            await (cbd as any).handleQueue(copybookProfile, new Set(), null);
            expect(vscode.window.showErrorMessage)
                .toHaveBeenCalledWith("Connection to mainframe using Zowe profile zoweProfile failed.");
        });
        it("handleQueue handle No password ZoweError", async () => {
            const pathGenerator = new CopybooksPathGenerator(null);
            pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
            const cbd = new CopybookDownloadService(null, null, null, pathGenerator);
            (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.NoPassword));
            vscode.window.showErrorMessage = jest.fn();
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
        const copybooksDownloadService: CopybookDownloadService = new CopybookDownloadService(undefined, zoweApi, undefined, undefined);

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

        // remove folder and file created to run the scenario
        cleanupScenario();
    });
});

describe("Test the capability to add missing copybooks to the download queue", () => {
    function setupScenario() {
        const profileService: ProfileService = new ProfileService(new ZoweApi());
        profileService.getProfile = jest.fn().mockReturnValue("PROFILE");
        const copybooksDownloader = new CopybookDownloadService(copybookFix, new ZoweApi(), profileService, null);
        return {copybooksDownloader};
    }

    test("When no workspace is open, copybooks are not added to the download queue", async () => {
        const {copybooksDownloader} = setupScenario();

        const spyAddInQueue = jest.spyOn(copybookFix, "addCopybookInQueue");
        await copybooksDownloader.downloadCopybook("copybook", "CBLPRG");
        expect(spyAddInQueue).toBeCalledTimes(1);
    });
});
