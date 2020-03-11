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
import * as path from "path";
import * as vscode from "vscode";
import { SETTINGS_SECTION } from "./constants";
import { ProfilesMap, ZoweApi } from "./ZoweApi";
import { Disposable } from "vscode-languageclient";

const DEFAULT_STATUS_TEXT = "CPY profile: undefined";

export class ProfileService implements Disposable {
    defaultProfileStatusBarItem: vscode.StatusBarItem;

    constructor(private zoweApi: ZoweApi) {
        this.createStatusBarItem();
    }

    async listProfiles(): Promise<ProfilesMap> {
        return this.zoweApi.listZOSMFProfiles();
    }

    async getProfile(programName?: string): Promise<string | undefined> {
        if (programName) {
            const detectedProfile: string | undefined = (await this.findProfileByDependenciesFile(programName))
                || this.tryGetProfileFromSettings();
            if (detectedProfile) {
                return detectedProfile;
            }
        }

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
            { placeHolder: "Select a zowe profile to search for copybooks", canPickMany: false });
        if (selectedProfile) {
            // TODO Switch to program specific profiles
            await vscode.workspace.getConfiguration().update(SETTINGS_SECTION + ".profiles",
                selectedProfile.label, false);
            return selectedProfile.label;
        }
        return undefined;
    }

    updateStatusBar() {
        const profile: string | undefined = this.tryGetProfileFromSettings();
        if (profile) {
            this.defaultProfileStatusBarItem.text = `CPY profile: ${profile}`;
        } else {
            this.defaultProfileStatusBarItem.text = DEFAULT_STATUS_TEXT;
        }
    }

    dispose(): void {
        this.defaultProfileStatusBarItem.dispose();
    }

    private createStatusBarItem() {
        this.defaultProfileStatusBarItem = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Right);
        this.defaultProfileStatusBarItem.command = "broadcom-cobol-lsp.cpy-manager.change-default-zowe-profile";
        this.updateStatusBar();
        this.defaultProfileStatusBarItem.show();
    }

    private isCobolProgram(fsPath: string) {
        const ext = path.extname(fsPath).toLocaleLowerCase();
        return ext === ".cbl" || ext === ".cob" || ext === ".cobol";
    }

    private async findProfileByDependenciesFile(programName: string): Promise<string | undefined> {
        for (const doc of vscode.workspace.textDocuments) {
            const docPath = doc.fileName;
            if (!this.isCobolProgram(docPath)) {
                continue;
            }
            const openName = path.basename(docPath, path.extname(docPath));
            if (programName === openName) {
                const profile = await this.tryGetProfileFromDocumentPath(docPath);
                if (profile) {
                    return profile;
                }
            }
        }
        return undefined;
    }

    private tryGetProfileFromSettings(): string | undefined {
        // TODO switch from single profile to program specific profile
        return vscode.workspace.getConfiguration(SETTINGS_SECTION).get("profiles");
    }
    private async tryGetProfileFromDocumentPath(docPath: string): Promise<string | undefined> {
        const profiles = Object.keys(await this.zoweApi.listZOSMFProfiles());
        const segments: string[] = docPath.split(path.sep);
        if (segments.length < 2) {
            return undefined;
        }
        const profileName = segments[segments.length - 2];
        if (profiles.indexOf(profileName) >= 0) {
            return profileName;
        }
        return undefined;
    }
}
