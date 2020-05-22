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

import * as vscode from "vscode";
import {CopybooksDownloader} from "../services/CopybooksDownloader";
import {CopybooksPathGenerator} from "../services/CopybooksPathGenerator";
import {CopybookProfile} from "../services/DownloadQueue";
import {Type, ZoweError} from "../services/ZoweError";

// tslint:disable: no-unused-expression no-string-literal
describe("Copybook downloader", () => {
    vscode.workspace.workspaceFolders = [{} as any];
    vscode.window.showInformationMessage = () => Promise.resolve("Download Copybooks");
    const profile = "zoweProfile";
    const copybookProfile = new CopybookProfile("copybook", profile);
    const zoweGeneralError = new ZoweError("zowe error", Type.General);
    it("Can download copybook", async () => {
        /* WORK IN PROGRESS
                const zoweApi: any = {
                    listZOSMFProfiles: jest.fn().mockReturnValue(["Something"]),
                };
                const profileService: any = {
                    getProfile: jest.fn().mockReturnValue(profile),
                };
                const cbd: CopybooksDownloader = new CopybooksDownloader(zoweApi, profileService);
                const uri: any = {};
                (cbd as any).listMissingCopybooks = () => ["COPYBVOOK"];
                try {
                    await cbd.downloadDependencies(uri);
                    cbd.start();
                } finally {
                    cbd.dispose();
                }

                expect(zoweApi.listZOSMFProfiles).toBeCalled();
        */

    });
    it("fetchCopybook rethrow ZoweError from zoweApi", async () => {
        const zoweApi: any = {
            listMembers: jest.fn().mockRejectedValue(zoweGeneralError),
        };
        const cbd = new CopybooksDownloader(null, zoweApi, null, null);
        expect((cbd as any).fetchCopybook(null, null)).rejects.toEqual(zoweGeneralError);
    });
    it("handleCopybook rethrow ZoweError from zoweApi", async () => {
        const zoweApi: any = {
            listMembers: jest.fn().mockRejectedValue(zoweGeneralError),
        };
        const cbd = new CopybooksDownloader(null, zoweApi, null, null);
        expect((cbd as any).handleCopybook(null, null, null)).rejects.toEqual(zoweGeneralError);
    });
    it("handleDataset rethow non NotFound ZoweErrors", async () => {
        const cbd = new CopybooksDownloader(null, null, null, null);
        (cbd as any).handleCopybook = jest.fn().mockRejectedValue(zoweGeneralError);
        const toDownload = [copybookProfile];
        const progress = {report: jest.fn()};
        expect((cbd as any).handleDataset(null, toDownload, null, progress)).rejects.toEqual(zoweGeneralError);
    });
    it("handleDataset show an error if copybook is not found", async () => {
        const zoweError = new ZoweError("not found", Type.NotFound);
        const cbd = new CopybooksDownloader(null, null, null, null);
        (cbd as any).handleCopybook = jest.fn().mockRejectedValue(zoweError);
        const toDownload = [copybookProfile];
        const progress = {report: jest.fn()};
        vscode.window.showErrorMessage = jest.fn();
        await (cbd as any).handleDataset("DATA.SET", toDownload, null, progress);
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Dataset DATA.SET not found.");
    });
    it("handleDataset show an error for non ZoweError", async () => {
        const errorMessage = "The error";
        const cbd = new CopybooksDownloader(null, null, null, null);
        (cbd as any).handleCopybook = jest.fn().mockRejectedValue(new Error(errorMessage));
        const toDownload = [copybookProfile];
        const progress = {report: jest.fn()};
        vscode.window.showErrorMessage = jest.fn();
        await (cbd as any).handleDataset("DATA.SET", toDownload, null, progress);
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Error: " + errorMessage);
    });
    it("handleQueue show an error for non ZoweError", async () => {
        const errorMessage = "The error";
        const pathGenerator = new CopybooksPathGenerator(null);
        pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
        const cbd = new CopybooksDownloader(null, null, null, pathGenerator);
        (cbd as any).handleDataset = jest.fn().mockRejectedValue(new Error(errorMessage));
        vscode.window.showErrorMessage = jest.fn();
        await (cbd as any).handleQueue(copybookProfile, new Set(), null);
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("Error: " + errorMessage);
    });
    it("handleQueue handle Invalid credentials ZoweError", async () => {
        const pathGenerator = new CopybooksPathGenerator(null);
        pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
        const cbd = new CopybooksDownloader(null, null, null, pathGenerator);
        (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.InvalidCredentials));
        vscode.window.showErrorMessage = jest.fn();
        await (cbd as any).handleQueue(copybookProfile, new Set(), null);
        expect(vscode.window.showErrorMessage)
            .toHaveBeenCalledWith("Incorrect credentials in Zowe profile zoweProfile.");
    });
    it("handleQueue handle Connection refused ZoweError", async () => {
        const pathGenerator = new CopybooksPathGenerator(null);
        pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
        const cbd = new CopybooksDownloader(null, null, null, pathGenerator);
        (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.ConnRefused));
        vscode.window.showErrorMessage = jest.fn();
        await (cbd as any).handleQueue(copybookProfile, new Set(), null);
        expect(vscode.window.showErrorMessage)
            .toHaveBeenCalledWith("Connection to mainframe using Zowe profile zoweProfile failed.");
    });
    it("handleQueue handle No password ZoweError", async () => {
        const pathGenerator = new CopybooksPathGenerator(null);
        pathGenerator.listDatasets = jest.fn().mockResolvedValue(["dataset"]);
        const cbd = new CopybooksDownloader(null, null, null, pathGenerator);
        (cbd as any).handleDataset = jest.fn().mockRejectedValue(new ZoweError("", Type.NoPassword));
        vscode.window.showErrorMessage = jest.fn();
        await (cbd as any).handleQueue(copybookProfile, new Set(), null);
        expect(vscode.window.showErrorMessage).toHaveBeenCalledWith("No password in Zowe profile zoweProfile.");
    });
});
