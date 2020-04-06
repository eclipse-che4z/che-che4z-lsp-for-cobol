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
import { DEPENDENCIES_FOLDER } from "./constants";
import { ProfileService } from "./ProfileService";
import { DependenciesDesc, loadDepFile } from "./services/DependencyService";
import { CopybookProfile, DownloadQueue } from "./services/DownloadQueue";
import { checkWorkspace, createCopybookPath, createDatasetPath } from "./services/PathUtils";
import { ZoweApi } from "./ZoweApi";
import { CopybookResolver } from "./services/CopybookResolver";
import { PathsService } from "./services/PathsService";

export class CopybooksDownloader implements vscode.Disposable {
    private queue: DownloadQueue = new DownloadQueue();

    public constructor(
        private resolver: CopybookResolver,
        private zoweApi: ZoweApi,
        private profileService: ProfileService,
        private pathsService: PathsService) { }

    public async redownloadDependencies(message: string = "Redownload dependencies requested.") {
        (await vscode.workspace.findFiles(DEPENDENCIES_FOLDER + "/**/*.dep")).forEach(dep => {
            this.downloadDependencies(dep, message);
        });
    }

    /**
     * @param copybooks array of copybooks names to download
     */
    async downloadCopybooks(copybooks: string[], programName: string): Promise<void> {
        // TODO do it right
        const profile: string = await this.profileService.getProfile(programName);
        if (!profile) {
            return;
        }
        copybooks.forEach(copybook => this.queue.push(copybook, profile));
    }

    public async downloadDependencies(depFileUri: vscode.Uri, message: string = ""): Promise<void> {
        if (!checkWorkspace()) {
            return;
        }
        const depDesc: DependenciesDesc = loadDepFile(depFileUri);
        const profile: string = await this.profileService.getProfile(depDesc.programName);
        if (!profile) {
            return;
        }

        const missingCopybooks: string[] = await this.listMissingCopybooks(depDesc.copybooks, profile);

        if (!message.length) {
            missingCopybooks.forEach(copybook => this.queue.push(copybook, profile));
        } else if (missingCopybooks.length > 0) {
            this.resolver.fixMissingDownloads(message, missingCopybooks, profile, {
                hasPaths: (await this.pathsService.listPathDatasets()).length > 0,
                hasProfiles: Object.keys(await this.profileService.listProfiles()).length > 1,
            });
        }

    }

    public async start() {
        this.resolver.setQueue(this.queue);
        let done = false;
        const errors = new Set();
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
                    const toDownload: CopybookProfile[] = [element];
                    while (this.queue.length > 0) {
                        toDownload.push(await this.queue.pop());
                    }
                    toDownload.map(cp => cp.copybook).forEach(cb => errors.add(cb));
                    for (const dataset of await this.pathsService.listPathDatasets()) {
                        progress.report({
                            message: "Looking in " + dataset + ". " + toDownload.length +
                                " copybook(s) left.",
                        });
                        for (const cp of toDownload) {
                            try {
                                const fetchResult = await this.fetchCopybook(dataset, cp);
                                if (fetchResult) {
                                    errors.delete(cp.copybook);
                                }
                            } catch (e) {
                                vscode.window.showErrorMessage(e.toString());
                            }
                        }
                    }
                    if (this.queue.length === 0 && errors.size > 0) {
                        this.resolver.processDownloadError("Can't download copybooks: " + Array.from(errors));
                        errors.clear();
                    }
                });
        }
    }

    public dispose() {
        this.queue.stop();
    }

    private async fetchCopybook(dataset: string, copybookProfile: CopybookProfile): Promise<boolean> {
        let members: string[] = [];
        try {
            members = await this.zoweApi.listMembers(dataset, copybookProfile.profile);
        } catch (error) {
            await this.resolver.processDownloadError("Can't read members of " + dataset);
            return false;
        }
        if (!members.includes(copybookProfile.copybook)) {
            return false;
        }
        await this.downloadCopybook(dataset, copybookProfile.copybook, copybookProfile.profile);
        return true;
    }

    private async downloadCopybook(dataset: string, copybook: string, profileName: string) {
        const copybookPath = createCopybookPath(profileName, dataset, copybook);
        if (!fs.existsSync(copybookPath)) {
            const content = await this.zoweApi.fetchMember(dataset, copybook, profileName);
            fs.mkdirSync(createDatasetPath(profileName, dataset), { recursive: true });
            fs.writeFileSync(copybookPath, content);
        }
    }

    private async listMissingCopybooks(copybooks: string[], profileName: string): Promise<string[]> {
        const copybooksToDownload: Set<string> = new Set(copybooks);
        (await this.pathsService.listPathDatasets()).forEach(ds => {
            Array.from(copybooksToDownload.values()).forEach(c => {
                if (fs.existsSync(createCopybookPath(profileName, ds, c))) {
                    copybooksToDownload.delete(c);
                }
            });
        });

        return Array.from(copybooksToDownload.values());
    }
}
