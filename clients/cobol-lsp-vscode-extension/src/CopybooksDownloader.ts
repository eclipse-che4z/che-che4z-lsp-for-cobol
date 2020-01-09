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
import { ZOSMFProfile, ZoweApi } from "./ZoweApi";

export const DEPENDENCIES_FOLDER: string = ".cobdeps";
export const COPYBOOKS_FOLDER: string = ".copybooks";

const SETTINGS_ROOT = "cobol-language-support";

export class CopybooksDownloader {
    public constructor(private zoweApi: ZoweApi) { }

    public async downloadCopyBooks(copybooks: string[]) {
        if (vscode.workspace.workspaceFolders.length === 0) {
            vscode.window.showErrorMessage("No workspace folder opened.");
            return;
        }
        const cb: Set<string> = new Set(copybooks);
        const profile = await this.askProfile();
        if (!profile) {
            return;
        }
        for (const ds of await this.listPathDatasets()) {
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
                await vscode.window.showErrorMessage(e.toString());
            }
        }
    }

    private async downloadCopybook(dataset: string, copybook: string, profile: ZOSMFProfile) {
        const rootPath = vscode.workspace.workspaceFolders[0].uri.fsPath;
        const copybookDirPath = path.join(rootPath, COPYBOOKS_FOLDER, dataset);
        const copybookPath = path.join(copybookDirPath, copybook + ".cpy");

        fs.mkdirSync(copybookDirPath, { recursive: true });
        if (!fs.existsSync(copybookPath)) {
            const content = await this.zoweApi.fetchMember(dataset, copybook, profile);
            fs.writeFileSync(copybookPath, content);
        }
    }

    private async listPathDatasets(): Promise<string[]> {
        if (!vscode.workspace.getConfiguration(SETTINGS_ROOT).has("paths")) {
            // TODO may be replace with throw
            await vscode.window.showErrorMessage("Please, specify DATASET paths for copybooks in settings.");
            return [];
        }
        return vscode.workspace.getConfiguration(SETTINGS_ROOT).get("paths");
    }

    private async askProfile(): Promise<ZOSMFProfile> {
        const profiles: ZOSMFProfile[] = this.zoweApi.listZOSMFProfiles();
        if (profiles.length === 0) {
            // TODO mey be replace with throw
            await vscode.window.showErrorMessage("Zowe profile is missing.");
            return undefined;
        }
        if (profiles.length === 1) {
            return profiles[0];
        }
        const items: vscode.QuickPickItem[] = profiles.map(e => {
            return {
                description: e.username + "@" + e.host + ":" + e.port,
                label: e.name,
                picked: e.default,
                value: e,
            }
        });

        // FIXME rewrite without value 'hack'
        // tslint:disable-next-line: no-string-literal
        return (await vscode.window.showQuickPick(items, { placeHolder: items[0].label, canPickMany: false }))["value"];
    }
}
