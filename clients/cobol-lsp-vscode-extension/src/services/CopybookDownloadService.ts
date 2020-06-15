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
    CONN_REFUSED_ERROR_MSG,
    DSN_NOT_FOUND_ERROR_MSG,
    DSN_PLACEHOLDER,
    INVALID_CREDENTIALS_ERROR_MSG,
    NO_PASSWORD_ERROR_MSG,
    PROCESS_DOWNLOAD_ERROR_MSG,
    PROFILE_NAME_PLACEHOLDER,
} from "../constants";
import {CopybookFix} from "./CopybookFix";
import {checkWorkspace, CopybooksPathGenerator, createCopybookPath, createDatasetPath} from "./CopybooksPathGenerator";
import {CopybookProfile, DownloadQueue} from "./DownloadQueue";
import {ProfileService} from "./ProfileService";
import {ZoweApi} from "./ZoweApi";
import {Type, ZoweError} from "./ZoweError";

export class CopybookDownloadService implements vscode.Disposable {
    private queue: DownloadQueue = new DownloadQueue();

    public constructor(
        private resolver: CopybookFix,
        private zoweApi: ZoweApi,
        private profileService: ProfileService,
        private pathGenerator: CopybooksPathGenerator) {
    }

    /**
     * This method is invoked by {@link CopybookURI#resolveCopybookURI} when the target copybbok is not found on
     * local workspaces and should be added in the download queue for copybooks that the LSP client will try
     * to download from MF
     * @param cobolFileName name of the document open in workspace
     * @param copybookName name of the copybook required by the LSP server
     */
    public async downloadCopybook(cobolFileName: string, copybookName: string): Promise<void> {
        if (!checkWorkspace()) {
            return;
        }
        const profile: string = await this.profileService.resolveProfile(cobolFileName);
        if (!profile) {
            this.createErrorMessageForCopybooks(new Set<string>().add(copybookName));
            return;
        }
        await this.resolver.addCopybookInQueue([copybookName], profile);

    }

    public async start() {
        this.resolver.setQueue(this.queue);
        let done = false;
        const errors = new Set<string>();
        while (!done) {
            const element: CopybookProfile | undefined = await this.queue.pop();
            if (!element) {
                done = true;
                continue;
            }
            await vscode.window.withProgress(
                {
                    location: vscode.ProgressLocation.Notification,
                    title: "Fetching copybooks",
                },
                async (progress: vscode.Progress<{ message?: string; increment?: number }>) => {
                    await this.handleQueue(element, errors, progress);
                    if (this.queue.length === 0 && errors.size > 0) {
                        this.createErrorMessageForCopybooks(errors);
                        errors.clear();
                    }
                });
        }
    }

    private createErrorMessageForCopybooks(datasets: Set<string>) {
        this.resolver.processDownloadError(PROCESS_DOWNLOAD_ERROR_MSG + Array.from(datasets));
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
                        break;
                    case Type.ConnRefused:
                        errorMessage = CONN_REFUSED_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, element.profile);
                        break;
                    case Type.NoPassword:
                        errorMessage = NO_PASSWORD_ERROR_MSG.replace(PROFILE_NAME_PLACEHOLDER, element.profile);
                        break;
                    default:
                        break;
                }
            }
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
            await this.resolver.processDownloadError("Can't read members of dataset: " + dataset);
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
