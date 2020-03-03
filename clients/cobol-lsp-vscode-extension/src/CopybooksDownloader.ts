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
import { SETTINGS_SECTION } from "./constants";
import { CopybookProfile, DownloadQueue } from "./DownloadQueue";
import { checkWorkspace, createCopybookPath, createDatasetPath } from "./PathUtils";
import { ProfileService } from "./ProfileService";
import { ZoweApi } from "./ZoweApi";

export class CopybooksDownloader implements vscode.Disposable {
    private queue: DownloadQueue = new DownloadQueue();

    public constructor(
        private zoweApi: ZoweApi,
        private profileService: ProfileService) { }

    public async redownloadDependencies(message: string = "Redownload dependencies requested.") {
        (await vscode.workspace.findFiles(".cobdeps/**/*.dep")).forEach(dep => {
            const errFile = dep.fsPath.substr(0, dep.fsPath.length - 4) + ".err";
            if (fs.existsSync(errFile)) {
                try {
                    fs.unlinkSync(errFile);
                } catch (error) {
                    vscode.window.showErrorMessage(error.toString());
                }
            }
            this.downloadDependencies(dep, message);
        });
    }
    /**
     * @param copybooks array of copybooks names to download
     */
    public async downloadDependencies(uri: vscode.Uri, message: string = ""): Promise<void> {
        if (!checkWorkspace()) {
            return;
        }
        const profile: string = await this.profileService.getProfile(uri);
        if (!profile) {
            return;
        }

        const missingCopybooks: string[] = await this.listMissingCopybooks(uri, profile);

        if (!message.length) {
            missingCopybooks.forEach(copybook => this.queue.push(copybook, profile));
        } else if (missingCopybooks.length > 0) {
            // TODO: refactor: move to external class
            const downloadCopybookAction = "Download Copybooks";
            const actionDatasets = "Edit Datasets";
            const actionProfile = "Change zowe profile";
            const actions = [];
            if ((await this.listPathDatasets()).length > 0) {
                actions.push(downloadCopybookAction);
            }
            if (message !== "Configuration was updated") {
                actions.push(actionDatasets);
                actions.push(actionProfile);
            }
            const action: string = await vscode.window.showInformationMessage(
                message,
                ...actions);
            if (action === downloadCopybookAction) {
                missingCopybooks.forEach(copybook => this.queue.push(copybook, profile));
            }
            if (action === actionDatasets) {
                vscode.commands.executeCommand("workbench.action.openSettings",
                    "broadcom-cobol-lsp.cpy-manager.paths");
            }
            if (action === actionProfile) {
                vscode.commands.executeCommand("workbench.action.openSettings",
                    "broadcom-cobol-lsp.cpy-manager.profiles");
            }
        }

    }

    // tslint:disable-next-line: cognitive-complexity
    public async start() {
        let done = false;
        let errors: string[] = [];
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
                    toDownload.map(cp => cp.copybook).forEach(cb => errors.push(cb));
                    for (const dataset of await this.listPathDatasets()) {
                        progress.report({
                            message: "Looking in " + dataset + ". " + toDownload.length +
                                " copybook(s) left.",
                        });
                        for(const cp of toDownload) {
                            try {
                                const fetchResult = await this.fetchCopybook(dataset, cp);
                                if (fetchResult && errors.includes(cp.copybook)) {
                                    const index = errors.indexOf(cp.copybook);
                                    errors.splice(index, 1);
                                }
                            } catch (e) {
                                vscode.window.showErrorMessage(e.toString());
                            }
                        }
                    }
                    if (this.queue.length === 0 && errors.length > 0) {
                        this.processDownloadError("Can't download copybooks: " + errors);
                        errors = [];
                    }
                });
        }
    }
    public dispose() {
        this.queue.stop();
    }
    public async processDownloadError(title: string) {
        const actionDatasets = "Edit Datasets";
        const actionProfile = "Change zowe profile";
        const action = await vscode.window.showErrorMessage(title,
            actionDatasets, actionProfile);
        if (action === actionDatasets) {
            vscode.commands.executeCommand("workbench.action.openSettings",
                "broadcom-cobol-lsp.cpy-manager.paths");
        }
        if (action === actionProfile) {
            vscode.commands.executeCommand("workbench.action.openSettings",
                "broadcom-cobol-lsp.cpy-manager.profiles");
        }
    }

    private async fetchCopybook(dataset: string, copybookProfile: CopybookProfile): Promise<boolean> {
        let members: string[] = [];
        try {
            members = await this.zoweApi.listMembers(dataset, copybookProfile.profile);
        } catch (error) {
            await this.processDownloadError("Can't read members of " + dataset);
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

    private async listMissingCopybooks(uri: vscode.Uri, profileName: string): Promise<string[]> {
        const copybooks: string[] = fs.readFileSync(uri.fsPath).toString().split("\n")
            .filter(e => e.trim().length > 0)
            .map(e => e.trim());

        const copybooksToDownload: Set<string> = new Set(copybooks);
        (await this.listPathDatasets()).forEach(ds => {
            Array.from(copybooksToDownload.values()).forEach(c => {
                if (fs.existsSync(createCopybookPath(profileName, ds, c))) {
                    copybooksToDownload.delete(c);
                }
            });
        });

        return Array.from(copybooksToDownload.values());
    }

    private async listPathDatasets(): Promise<string[]> {
        if (!vscode.workspace.getConfiguration(SETTINGS_SECTION).has("paths")) {
            await vscode.window.showErrorMessage("Please, specify DATASET paths for copybooks in settings.");
            return [];
        }
        return vscode.workspace.getConfiguration(SETTINGS_SECTION).get("paths");
    }
}
