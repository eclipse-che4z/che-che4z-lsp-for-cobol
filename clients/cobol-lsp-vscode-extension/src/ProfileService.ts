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

export class ProfileService {
    constructor(private zoweApi: ZoweApi) {
    }

    public async getProfile(depFile: vscode.Uri): Promise<string> {
        const programName = this.getProgramNameFromDepFile(depFile);
        const detectedProfile = (await this.findProfileByDependenciesFile(depFile))
            || this.tryGetProfileFromSettings(programName);
        if (detectedProfile) {
            return detectedProfile;
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
            let settingsProfiles = vscode.workspace.getConfiguration().get(SETTINGS_SECTION + ".profiles");
            settingsProfiles = settingsProfiles ? settingsProfiles : {};
            settingsProfiles[programName] = selectedProfile.label;
            await vscode.workspace.getConfiguration().update(SETTINGS_SECTION + ".profiles", settingsProfiles, false);
            return selectedProfile.label;
        }
        return undefined;
    }

    private async findProfileByDependenciesFile(depFile: vscode.Uri): Promise<string | undefined> {
        const depName = path.basename(depFile.fsPath, ".dep");
        for (const doc of vscode.workspace.textDocuments) {
            const docPath = doc.fileName;
            if (!docPath.toLowerCase().endsWith(".cbl")) {
                continue;
            }
            const programName = path.basename(docPath, path.extname(docPath));
            if (programName === depName) {
                return this.tryGetProfileFromDocumentPath(docPath);
            } else {
                return undefined;
            }
        }
        return undefined;
    }

    private getProgramNameFromDepFile(depFile: vscode.Uri): string {
        return path.basename(depFile.fsPath, ".dep");
    }

    private tryGetProfileFromSettings(programName: string): string | undefined {
        const profiles: {} = vscode.workspace.getConfiguration(SETTINGS_SECTION).get("profiles");
        return profiles ? profiles[programName] : undefined;
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
