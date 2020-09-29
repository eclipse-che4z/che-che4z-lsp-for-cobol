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

import * as fs from "fs";
import * as vscode from "vscode";
import {
    CONN_REFUSED_ERROR_MSG, DOWNLOAD_QUEUE_LOCKED_ERROR_MSG,
    DSN_NOT_FOUND_ERROR_MSG,
    DSN_PLACEHOLDER,
    INVALID_CREDENTIALS_ERROR_MSG,
    NO_PASSWORD_ERROR_MSG,
    PROCESS_DOWNLOAD_ERROR_MSG,
    PROFILE_NAME_PLACEHOLDER, UNLOCK_DOWNLOAD_QUEUE_MSG,
} from "../../constants";
import {CopybookProfile, DownloadQueue} from "./DownloadQueue";
import {ProfileService} from "../ProfileService";
import {TelemetryService} from "../reporter/TelemetryService";
import {ZoweApi} from "../ZoweApi";
import {Type, ZoweError} from "../ZoweError";
import {checkWorkspace, CopybooksPathGenerator, createCopybookPath, createDatasetPath} from "./CopybooksPathGenerator";

export class CopybookDownloadService implements vscode.Disposable {
    private queue: DownloadQueue = new DownloadQueue();
    private lockedProfile: Set<string> = new Set();

    public constructor(
        private zoweApi: ZoweApi,
        private profileService: ProfileService,
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
    public async downloadCopybooks(cobolFileName: string, copybookNames: string[], quiet: boolean = true): Promise<void> {
        if (!checkWorkspace()) {
            return;
        }
        const profile: string = await this.profileService.resolveProfile(cobolFileName);
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
        copybookNames.forEach(copybook => this.queue.push(copybook, profile));
    }

    private static async showQueueLockedDialog(profileName: string): Promise<boolean> {
        const action = await vscode.window.showErrorMessage(
            DOWNLOAD_QUEUE_LOCKED_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, profileName),
            UNLOCK_DOWNLOAD_QUEUE_MSG);
        return action === UNLOCK_DOWNLOAD_QUEUE_MSG;
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
                        TelemetryService.registerEvent("Download copybooks from MF", ["copybook", "COBOL", "experiment-tag"], "total time to search copybooks on MF", new Map().set("time elapsed", TelemetryService.calculateTimeElapsed(startTime, Date.now())));
                        startTime = null;
                    }
                });
        }
    }

    private static createErrorMessageForCopybooks(datasets: Set<string>) {
        CopybookDownloadService.processDownloadError(PROCESS_DOWNLOAD_ERROR_MSG + Array.from(datasets));
    }

    private static processDownloadError(title: string) {
        const actionSettings = "Change settings";
        vscode.window.showErrorMessage(title, actionSettings).then((action) => {
            if (action === actionSettings) {
                vscode.commands.executeCommand("broadcom-cobol-lsp.cpy-manager.goto-settings");
            }
        });
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
        toDownload.map(cp => cp.copybook).forEach(cb => errors.add(cb));
        try {
            for (const dataset of await this.pathGenerator.listDatasets()) {
                await this.handleDataset(dataset, toDownload, errors, progress);
            }
        } catch (e) {
            let errorMessage = e.toString();
            if (e instanceof ZoweError) {
                switch (e.type) {
                    case Type.InvalidCredentials:
                        errorMessage = INVALID_CREDENTIALS_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, element.profile);
                        this.lockedProfile.add(element.profile);
                        this.queue.clean();
                        TelemetryService.registerEvent("invalidCredentials", ["copybook", "COBOL", "experiment-tag"], "Zowe credentials is not valid");
                        break;
                    case Type.ConnRefused:
                        errorMessage = CONN_REFUSED_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, element.profile);
                        break;
                    case Type.NoPassword:
                        errorMessage = NO_PASSWORD_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, element.profile);
                        break;
                }
            }
            TelemetryService.registerExceptionEvent(undefined, errorMessage, ["copybook", "COBOL", "experiment-tag"], "There is an issue with zowe api layer");
            vscode.window.showErrorMessage(errorMessage);
        }
    }

    private async handleDataset(
        dataset: string,
        toDownload: CopybookProfile[],
        errors: Set<string>,
        progress: vscode.Progress<{ message?: string; increment?: number }>) {
        try {
            progress.report({
                message: "Looking in " + dataset + ". " + toDownload.length +
                    " copybook(s) left.",
            });
            for (const cp of toDownload) {
                await this.handleCopybook(dataset, cp, errors);
            }
        } catch (e) {
            let errorMessage = e.toString();
            if (e instanceof ZoweError) {
                if (e.type === Type.NotFound) {
                    errorMessage = DSN_NOT_FOUND_ERROR_MSG.replace(DSN_PLACEHOLDER, dataset);
                } else {
                    throw e;
                }
            }
            vscode.window.showErrorMessage(errorMessage);
        }
    }

    private async handleCopybook(dataset: string, cp: CopybookProfile, errors: Set<string>) {
        try {
            const fetchResult = await this.fetchCopybook(dataset, cp);
            if (fetchResult) {
                errors.delete(cp.copybook);
            }
        } catch (e) {
            if (e instanceof ZoweError) {
                throw e;
            }
            vscode.window.showErrorMessage(e.toString());
        }
    }

    private async fetchCopybook(dataset: string, copybookProfile: CopybookProfile): Promise<boolean> {
        let members: string[] = [];
        try {
            members = await this.zoweApi.listMembers(dataset, copybookProfile.profile);
        } catch (error) {
            if (error instanceof ZoweError) {
                throw error;
            }
            CopybookDownloadService.processDownloadError("Can't read members of dataset: " + dataset);
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
            const content = await this.zoweApi.fetchMember(dataset, copybook, profileName);
            fs.mkdirSync(createDatasetPath(profileName, dataset), {recursive: true});
            fs.writeFileSync(copybookPath, content);
        }
    }
}
