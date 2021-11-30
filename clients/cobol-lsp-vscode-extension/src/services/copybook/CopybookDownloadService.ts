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

import { IZoweLogger, MessageSeverityEnum } from "@zowe/zowe-explorer-api/lib/logger";
import { ZoweVsCodeExtension } from "@zowe/zowe-explorer-api/lib/vscode";
import * as fs from "fs";
import { homedir } from "os";
import * as Path from "path";
import * as vscode from "vscode";
import {
    DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
    INVALID_CREDENTIALS_ERROR_MSG,
    PROCESS_DOWNLOAD_ERROR_MSG,
    PROFILE_NAME_PLACEHOLDER, UNLOCK_DOWNLOAD_QUEUE_MSG,
} from "../../constants";
import { TelemetryService } from "../reporter/TelemetryService";
import { ProfileUtils } from "../util/ProfileUtils";
// tslint:disable-next-line:max-line-length
import { checkWorkspace, CopybooksPathGenerator, createCopybookPath, createDatasetPath } from "./CopybooksPathGenerator";
import { CopybookProfile, DownloadQueue } from "./DownloadQueue";

const experimentTag = "experiment-tag";
export class CopybookDownloadService implements vscode.Disposable {
    private static async showQueueLockedDialog(profileName: string): Promise<boolean> {
        const action = await vscode.window.showErrorMessage(
            DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, profileName),
            UNLOCK_DOWNLOAD_QUEUE_MSG);
        return action === UNLOCK_DOWNLOAD_QUEUE_MSG;
    }

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

    private static isInvalidCredentialsError(error: any) {
        return error?.mDetails?.errorCode === 401;
    }

    private queue: DownloadQueue = new DownloadQueue();
    private lockedProfile: Set<string> = new Set();
    private CobolLSzoweLogger = new IZoweLogger("ZOWE Explorer", `${homedir()}/LSPCobol/logs`);

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
        if (this.lockedProfile.has(profile)) {
            if (quiet) {
                return;
            }
            if (await CopybookDownloadService.showQueueLockedDialog(profile)) {
                this.lockedProfile.delete(profile);
            } else {
                return;
            }
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
            await vscode.window.withProgress(
                {
                    location: vscode.ProgressLocation.Notification,
                    title: "Fetching copybooks",
                },
                async (progress: vscode.Progress<{ message?: string; increment?: number }>) => {
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
                });
        }
    }

    public dispose() {
        this.queue.stop();
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
                await this.handleDataset(dataset, toDownload, errors, progress);
            }
        } catch (e) {
            let errorMessage = e.toString();
            if (CopybookDownloadService.isInvalidCredentialsError(e)) {
                errorMessage = INVALID_CREDENTIALS_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, element.profile);
                this.lockedProfile.add(element.profile);
                this.queue.clean();
                TelemetryService.registerEvent("invalidCredentials", ["copybook", "COBOL", experimentTag], "Zowe credentials is not valid");
            }
            TelemetryService.registerExceptionEvent(undefined, errorMessage, ["copybook", "COBOL", experimentTag], "There is an issue with zowe api layer");
            if (CopybookDownloadService.needsUserNotification(toDownload)) {
                vscode.window.showErrorMessage(errorMessage);
            }
        }
    }

    private async handleDataset(
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
                await this.handleCopybook(dataset, cp, errors);
            }
        } catch (e) {
            if (CopybookDownloadService.isInvalidCredentialsError(e)) {
                throw e;
            }
            if (CopybookDownloadService.needsUserNotification(toDownload)) {
                vscode.window.showErrorMessage(e.toString());
            }
        }
    }

    private async handleCopybook(dataset: string, cp: CopybookProfile, errors: Set<string>) {
        try {
            const fetchResult = await this.fetchCopybook(dataset, cp);
            if (fetchResult) {
                errors.delete(cp.copybook);
            }
        } catch (e) {
            if (CopybookDownloadService.isInvalidCredentialsError(e)) {
                throw e;
            }
            if (!cp.quiet) {
                vscode.window.showErrorMessage(e.toString());
            }
        }
    }

    private async fetchCopybook(dataset: string, copybookProfile: CopybookProfile): Promise<boolean> {
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
            if (CopybookDownloadService.isInvalidCredentialsError(error)) {
                throw error;
            }
            if (!copybookProfile.quiet) {
                CopybookDownloadService.processDownloadError("Can't read members of dataset: " + dataset);
            }
            ZoweVsCodeExtension.showVsCodeMessage(error.message, MessageSeverityEnum.ERROR, this.CobolLSzoweLogger);
            return false;
        }
        if (!members.includes(copybookProfile.copybook)) {
            return false;
        }
        await this.downloadCopybookFromMFUsingZowe(dataset, copybookProfile.copybook, copybookProfile.profile);
        return true;
    }

    private async downloadCopybookFromMFUsingZowe(dataset: string, copybook: string, profileName: string) {
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
                ZoweVsCodeExtension.showVsCodeMessage(err.message, MessageSeverityEnum.ERROR, this.CobolLSzoweLogger);
            }
        }
    }
}
