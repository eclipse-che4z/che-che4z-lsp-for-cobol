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

import { ZoweVsCodeExtension } from "@zowe/zowe-explorer-api/lib/vscode";
import * as fs from "fs";
import * as Path from "path";
import * as vscode from "vscode";
import { PROCESS_DOWNLOAD_ERROR_MSG } from "../../constants";
import { TelemetryService } from "../reporter/TelemetryService";
import { ProfileUtils } from "../util/ProfileUtils";
import { checkWorkspace, CopybooksPathGenerator, createCopybookPath, createDatasetPath } from "./CopybooksPathGenerator";
import { CopybookProfile, DownloadQueue } from "./DownloadQueue";

const experimentTag = "experiment-tag";
export class CopybookDownloadService implements vscode.Disposable {
    private static createErrorMessageForCopybooks(datasets: Set<string>) {
        CopybookDownloadService.processDownloadError(PROCESS_DOWNLOAD_ERROR_MSG + Array.from(datasets));
    }

    private static processDownloadError(title: string) {
        const actionSettings = "Change settings";
        vscode.window.showErrorMessage(title, actionSettings).then(action => {
            if (action === actionSettings) {
                vscode.commands.executeCommand("cobol-lsp.cpy-manager.goto-settings");
            }
        });
    }

    private static needsUserNotification(queue: CopybookProfile[]): boolean {
        return queue.find(profile => !profile.quiet) !== undefined;
    }

    private static async fetchCopybook(dataset: string, copybookProfile: CopybookProfile): Promise<boolean> {
        let members: string[] = [];
        try {
            const zoweExplorerApi = ZoweVsCodeExtension.getZoweExplorerApi();
            const loadedProfile = zoweExplorerApi
                .getExplorerExtenderApi()
                .getProfilesCache()
                .loadNamedProfile(copybookProfile.profile);
            const response = await zoweExplorerApi.getMvsApi(loadedProfile).allMembers(dataset);
            members = response.apiResponse.items.map(el => el.member);
        } catch (error) {
            if (!copybookProfile.quiet) {
                CopybookDownloadService.processDownloadError("Can't read members of dataset: " + dataset);
            }
            vscode.window.showErrorMessage(error.message);
            return false;
        }
        if (!members.includes(copybookProfile.copybook)) {
            return false;
        }
        await CopybookDownloadService.downloadCopybookFromMFUsingZowe(dataset, copybookProfile.copybook,
            copybookProfile.profile);
        return true;
    }

    private static async downloadCopybookFromMFUsingZowe(dataset: string, copybook: string, profileName: string) {
        const copybookPath = createCopybookPath(profileName, dataset, copybook);
        if (!fs.existsSync(copybookPath)) {
            try {
                const zoweExplorerApi = ZoweVsCodeExtension.getZoweExplorerApi();
                const loadedProfile = zoweExplorerApi
                    .getExplorerExtenderApi()
                    .getProfilesCache()
                    .loadNamedProfile(profileName);
                await zoweExplorerApi.getMvsApi(loadedProfile).getContents(`${dataset}(${copybook})`, {
                    encoding: loadedProfile.profile.encoding,
                    file: Path.join(createDatasetPath(profileName, dataset), copybook),
                    returnEtag: true,
                });
            } catch (err) {
                vscode.window.showErrorMessage(err.message);
            }
        }
    }

    private static async handleDataset(
        dataset: string,
        toDownload: CopybookProfile[],
        errors: Set<string>,
        progress: vscode.Progress<{ message?: string; increment?: number }>) {
        try {
            if (CopybookDownloadService.needsUserNotification(toDownload)) {
                progress.report({
                    message: "Looking in " + dataset + ". " + toDownload.length +
                        " copybook(s) left.",
                });
            }
            for (const cp of toDownload) {
                await CopybookDownloadService.handleCopybook(dataset, cp, errors);
            }
        } catch (e) {
            if (CopybookDownloadService.needsUserNotification(toDownload)) {
                vscode.window.showErrorMessage(e.toString());
            }
        }
    }

    private static async handleCopybook(dataset: string, cp: CopybookProfile, errors: Set<string>) {
        try {
            const fetchResult = await CopybookDownloadService.fetchCopybook(dataset, cp);
            if (fetchResult) {
                errors.delete(cp.copybook);
            }
        } catch (e) {
            if (!cp.quiet) {
                vscode.window.showErrorMessage(e.toString());
            }
        }
    }

    private queue: DownloadQueue = new DownloadQueue();

    public constructor(
        private pathGenerator: CopybooksPathGenerator) {
    }

    /**
     * This method is invoked by {@link CopybookURI#resolveCopybookURI} when the target copybbok is not found on
     * local workspaces and should be added in the download queue for copybooks that the LSP client will try
     * to download from MF
     * @param cobolFileName name of the document open in workspace
     * @param copybookNames list of names of the copybooks required by the LSP server
     * @param quiet flag described that interaction with a user is not allowed
     */
    public async downloadCopybooks(cobolFileName: string, copybookNames: string[], quiet: boolean = true)
        : Promise<void> {
        if (!checkWorkspace()) {
            return;
        }
        const profile = ProfileUtils.getProfileNameForCopybook(cobolFileName);

        if (!profile) {
            if (!quiet) {
                CopybookDownloadService.createErrorMessageForCopybooks(new Set<string>(copybookNames));
            }
            return;
        }
        copybookNames.forEach(copybook => this.queue.push(copybook, profile, quiet));
    }

    public async start() {
        let startTime: number | null = null;
        const errors = new Set<string>();
        while (true) {
            const element: CopybookProfile | undefined = await this.queue.pop();
            if (!element) {
                // undefined element means that service is disposed
                return;
            }
            if (startTime === null) {
                startTime = Date.now();
            }
            startTime = await this.run(element, errors, startTime);
        }
    }

    public dispose() {
        this.queue.stop();
    }

    private async process(progress: vscode.Progress<{ message?: string; increment?: number }>,
                          element: CopybookProfile, errors: Set<string>, startTime: number) {
        {
            await this.handleQueue(element, errors, progress);

            if (this.queue.length === 0 && errors.size > 0) {
                CopybookDownloadService.createErrorMessageForCopybooks(errors);
                errors.clear();
            }

            if (this.queue.length === 0) {
                TelemetryService.registerEvent("Download copybooks from MF", ["copybook",
                    "COBOL", experimentTag], "total time to search copybooks on MF",
                    new Map().set("time elapsed",
                        TelemetryService.calculateTimeElapsed(startTime, Date.now())));
                startTime = null;
            }
        }
    }

    private async run(element: CopybookProfile, errors: Set<string>, startTime: number) {
        await vscode.window.withProgress(
            {
                location: vscode.ProgressLocation.Notification,
                title: "Fetching copybooks",
            },
            async (progress: vscode.Progress<{ message?: string; increment?: number }>) =>
                this.process(progress, element, errors, startTime));
        return startTime;
    }

    private async handleQueue(
        element: CopybookProfile,
        errors: Set<string>,
        progress: vscode.Progress<{ message?: string; increment?: number }>) {
        const toDownload: CopybookProfile[] = [element];
        while (this.queue.length > 0) {
            toDownload.push(await this.queue.pop());
        }
        toDownload.filter(cp => !cp.quiet).map(cp => cp.copybook).forEach(cb => errors.add(cb));
        try {
            for (const dataset of await this.pathGenerator.listDatasets()) {
                await CopybookDownloadService.handleDataset(dataset, toDownload, errors, progress);
            }
        } catch (e) {
            const errorMessage = e.toString();
            TelemetryService.registerExceptionEvent(undefined, errorMessage, ["copybook", "COBOL", experimentTag], "There is an issue with zowe api layer");
            if (CopybookDownloadService.needsUserNotification(toDownload)) {
                vscode.window.showErrorMessage(errorMessage);
            }
        }
    }
}
