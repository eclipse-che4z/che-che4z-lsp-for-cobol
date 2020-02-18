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
import * as path from "path";
import * as vscode from "vscode";
import { SETTINGS_SECTION } from "./extension";
import { ProfileService } from "./ProfileService";
import { ZoweApi } from "./ZoweApi";

export const DEPENDENCIES_FOLDER: string = ".cobdeps";
export const COPYBOOKS_FOLDER: string = ".copybooks";

export class CopybooksDownloader {

    private static createCopybookPath(profileName: string, dataset: string, copybook: string): string {
        const rootPath = vscode.workspace.workspaceFolders[0].uri.fsPath;
        const copybookDirPath = path.join(rootPath, COPYBOOKS_FOLDER, profileName, dataset);
        return path.join(copybookDirPath, copybook + ".cpy");
    }

    private static createDatasetPath(profileName: string, dataset: string): string {
        const rootPath = vscode.workspace.workspaceFolders[0].uri.fsPath;
        return path.join(rootPath, COPYBOOKS_FOLDER, profileName, dataset);
    }

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
    public async downloadDependencies(uri: vscode.Uri,
        message: string = "Program contains dependencies to missing copybooks.",
    ): Promise<void> {
        // TODO Maybe introduce download queue?
        const missingCopybooksFilePath = uri.fsPath.substr(0, uri.fsPath.length - ".dep".length) + ".err";
        const copybooks: string[] = fs.readFileSync(uri.fsPath).toString().split("\n")
            .filter(e => e.trim().length > 0)
            .map(e => e.trim());
        const missingCopybooks: string[] = this.readMissingCopybooks(missingCopybooksFilePath);
        if (vscode.workspace.workspaceFolders.length === 0) {
            vscode.window.showErrorMessage("No workspace folder opened.");
            return;
        }

        const copybooksToDownload: Set<string> = new Set(copybooks);
        const profile: string = await this.profileService.getProfile(uri);
        if (!profile) {
            return;
        }

        missingCopybooks.forEach(m => copybooksToDownload.delete(m));
        (await this.listPathDatasets()).forEach(ds => {
            Array.from(copybooksToDownload.values()).forEach(c => {
                if (fs.existsSync(CopybooksDownloader.createCopybookPath(profile, ds, c))) {
                    copybooksToDownload.delete(c);
                }
            });
        });
        const downloadCopybookAction = "Download Copybooks";
        if (copybooksToDownload.size > 0) {
            const action: string = await vscode.window.showInformationMessage(
                message,
                downloadCopybookAction);
            if (action !== downloadCopybookAction) {
                return;
            }
        }

        await vscode.window.withProgress(
            {
                location: vscode.ProgressLocation.Notification,
                title: "Fetching copybooks",
            },
            async (progress: vscode.Progress<{ message?: string; increment?: number }>) => {
                for (const dataset of await this.listPathDatasets()) {
                    progress.report({
                        message: "Looking in " + dataset + ". " + copybooksToDownload.size +
                            " copybook(s) left.",
                    });
                    try {
                        await this.fetchCopybooks(dataset, copybooksToDownload, profile);
                    } catch (e) {
                        vscode.window.showErrorMessage(e.toString());
                    }
                }
            });
        let errors: string = "";
        copybooksToDownload.forEach(c => errors += c + "\n");
        if (errors) {
            vscode.window.showErrorMessage("Can't download copybooks: " + errors);
            fs.mkdirSync(path.dirname(missingCopybooksFilePath), { recursive: true });
            fs.writeFileSync(missingCopybooksFilePath, errors);
        }
    }

    private async fetchCopybooks(ds, cb, profile) {
        const members: string[] = await this.zoweApi.listMembers(ds, profile);
        for (const member of members) {
            if (cb.has(member)) {
                await this.downloadCopybook(ds, member, profile);
                cb.delete(member);
                if (cb.size === 0) {
                    return;
                }
            }
        }
    }

    private readMissingCopybooks(missingCopybooksFilePath: string): string[] {
        if (fs.existsSync(missingCopybooksFilePath)) {
            return fs.readFileSync(missingCopybooksFilePath).toString().split("\n")
                .filter(e => e.trim().length > 0)
                .map(e => e.trim());
        }
        return [];
    }

    private async downloadCopybook(dataset: string, copybook: string, profileName: string) {
        const copybookPath = CopybooksDownloader.createCopybookPath(profileName, dataset, copybook);

        if (!fs.existsSync(copybookPath)) {
            const content = await this.zoweApi.fetchMember(dataset, copybook, profileName);
            fs.mkdirSync(CopybooksDownloader.createDatasetPath(profileName, dataset), { recursive: true });
            fs.writeFileSync(copybookPath, content);
        }
    }

    private async listPathDatasets(): Promise<string[]> {
        if (!vscode.workspace.getConfiguration(SETTINGS_SECTION).has("paths")) {
            await vscode.window.showErrorMessage("Please, specify DATASET paths for copybooks in settings.");
            return [];
        }
        return vscode.workspace.getConfiguration(SETTINGS_SECTION).get("paths");
    }
}
