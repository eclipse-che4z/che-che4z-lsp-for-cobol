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

const profile = "zoweProfile";
const errorMessage = "The error";
const copybookProfile = new CopybookProfile("copybook", profile);
const zoweGeneralError = new ZoweError("zowe error", Type.General);
const copybookFix: CopybookFix = new CopybookFix();

vscode.workspace.workspaceFolders = [{} as any];
vscode.window.showInformationMessage = () => Promise.resolve("Download Copybooks");
vscode.workspace.getConfiguration = jest.fn().mockReturnValue({
    get: jest.fn().mockReturnValue(undefined),
});

describe("Test fetchCopybook against bad and correct configurations", () => {
    const zoweApi: ZoweApi = new ZoweApi();
    const copybookDownloadService: CopybookDownloadService = new CopybookDownloadService(copybookFix, zoweApi, null, null);

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
            await expect((cbd as any).fetchCopybook(null, {profile: null})).rejects.toEqual(zoweGeneralError);
        });
    });

    describe("Suite of tests related to handleCopybook", () => {
        const zoweApi: any = {
            listMembers: jest.fn().mockRejectedValue(zoweGeneralError),
        };
        const cbd = new CopybookDownloadService(null, zoweApi, null, null);

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
        const cbd = new CopybookDownloadService(null, null, null, null);
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
        const cbd = new CopybookDownloadService(null, null, null, pathGenerator);
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

        cleanupScenario();
    });
});

describe("Test the capability to add missing copybooks to the download queue", () => {
    function setupScenario() {
        const profileService: ProfileService = new ProfileService(new ZoweApi());
        profileService.getProfileFromDocument = jest.fn().mockReturnValue("PROFILE");
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
