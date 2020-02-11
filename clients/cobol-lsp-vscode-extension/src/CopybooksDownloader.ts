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

import { IProfile } from "@zowe/imperative";
import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";
import { ProfilesMap, ZoweApi } from "./ZoweApi";

export const DEPENDENCIES_FOLDER: string = ".cobdeps";
export const COPYBOOKS_FOLDER: string = ".copybooks";

const SETTINGS_ROOT = "cobol-language-support";

export class CopybooksDownloader {
    public constructor(private zoweApi: ZoweApi) { }

    /**
     * @param copybooks array of copybooks names to download
     */
    // tslint:disable-next-line: cognitive-complexity
    public async downloadDependencies(uri: vscode.Uri): Promise<void> {
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

        const cb: Set<string> = new Set(copybooks);
        missingCopybooks.forEach(m => cb.delete(m));
        const profile: string = await this.askProfile();
        if (!profile) {
            return;
        }
        await vscode.window.withProgress(
            {
                location: vscode.ProgressLocation.Notification,
                title: "Fetching copybooks",
            },
            async (progress: vscode.Progress<{ message?: string; increment?: number }>) => {
                for (const ds of await this.listPathDatasets()) {
                    progress.report({ message: "Looking in " + ds + ". " + cb.size + " copybook(s) left." });
                    try {
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
                    } catch (e) {
                        vscode.window.showErrorMessage(e.toString());
                    }
                }
            });
        let errors: string = "";
        cb.forEach(c => errors += c + "\n");
        if (errors) {
            vscode.window.showErrorMessage("Can't download copybooks: " + errors);
            fs.mkdirSync(path.dirname(missingCopybooksFilePath), { recursive: true });
            fs.writeFileSync(missingCopybooksFilePath, errors);
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
    private createCopybookPath(profileName: string, dataset: string, copybook: string): string {
        const rootPath = vscode.workspace.workspaceFolders[0].uri.fsPath;
        const copybookDirPath = path.join(rootPath, COPYBOOKS_FOLDER, profileName, dataset);
        fs.mkdirSync(copybookDirPath, { recursive: true });
        return path.join(copybookDirPath, copybook + ".cpy");
    }
    private async downloadCopybook(dataset: string, copybook: string, profileName: string) {
        const copybookPath = this.createCopybookPath(profileName, dataset, copybook);

        if (!fs.existsSync(copybookPath)) {
            const content = await this.zoweApi.fetchMember(dataset, copybook, profileName);
            fs.writeFileSync(copybookPath, content);
        }
    }

    private async listPathDatasets(): Promise<string[]> {
        if (!vscode.workspace.getConfiguration(SETTINGS_ROOT).has("paths")) {
            await vscode.window.showErrorMessage("Please, specify DATASET paths for copybooks in settings.");
            return [];
        }
        return vscode.workspace.getConfiguration(SETTINGS_ROOT).get("paths");
    }

    private async askProfile(): Promise<string> {
        const profiles: ProfilesMap = await this.zoweApi.listZOSMFProfiles();
        if (Object.keys(profiles).length === 0) {
            await vscode.window.showErrorMessage("Zowe profile is missing.");
            return undefined;
        }
        if (Object.keys(profiles).length === 1) {
            return Object.keys(profiles)[0];
        }
        const defaultName = this.zoweApi.getDefaultProfileName();
        let items: vscode.QuickPickItem[] = [];
        Object.keys(profiles).forEach(name => {
            const profile: IProfile = profiles[name];
            const item: vscode.QuickPickItem = {
                description: profile.username + "@" + profile.host + ":" + profile.port,
                label: name,
            };
            if (defaultName === name) {
                items = [item].concat(items);
            } else {
                items.push(item);
            }
        });

        const selectedProfile = await vscode.window.showQuickPick(items,
            { placeHolder: defaultName, canPickMany: false });
        if (selectedProfile) {
            return selectedProfile.label;
        }
        return undefined;
    }
}
