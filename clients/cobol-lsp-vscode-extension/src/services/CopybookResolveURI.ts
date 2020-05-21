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
import {URL} from "url";
import * as vscode from "vscode";
import {PATHS_LOCAL_KEY, PATHS_ZOWE, SETTINGS_SECTION} from "../constants";
import {ProfileService} from "./ProfileService";
import {CopybookResolver} from "./settings/CopybookResolver";
import {LocalCopybookResolver} from "./settings/LocalCopybookResolver";
import {CopybooksDownloader} from "./CopybooksDownloader";

function localSettingsAreFound(): boolean {
    const localPaths: string[] = vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY);
    return localPaths !== undefined && localPaths.length > 0;
}

export class CopybookResolveURI {

    public static searchCopybookLocally(copybookName: string, targetFolders: string[]): string {
        const copybookResolver: CopybookResolver = new LocalCopybookResolver();
        const localFolderList: string[] =  copybookResolver.resolve(targetFolders);
        for (const folder of localFolderList) {
            const uri: URL = new URL(path.join(folder, copybookName));
            if (fs.existsSync(uri)) {
                return uri.href;
            }
        }
    }
    constructor(private profileService: ProfileService, private copybooksDownloader: CopybooksDownloader) {
    }
    public  async resolveCopybooksInDepFile(copybookName: string, cobolProgramName: string): Promise<string> {
        let result: string;
        if (localSettingsAreFound()) {
            result = CopybookResolveURI.searchCopybookLocally(copybookName, vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY));
        }

        if (!result) {
            const profile = await this.profileService.getProfile(cobolProgramName);

            const dsnList: string[] = vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_ZOWE);

            outer: for (const dsnPath of dsnList ) {
                for (const wsFolder of vscode.workspace.workspaceFolders) {
                    const uri: URL = new URL(path.join(wsFolder.uri.scheme + "://" + wsFolder.uri.path, ".copybooks", profile, dsnPath, copybookName + ".cpy"));
                    if (fs.existsSync(uri)) {
                       result = uri.toString();
                       break outer;
                   }

                }

            }


            // get profile --> profileServ.get
            // concatenate copub + profi. +
        }
        if (!result) {
            this.copybooksDownloader.downloadDependency(cobolProgramName, copybookName);

        }

        // TODO: handle situation when copybookName is found on .copybook folder..
        return result || "";
    }
}
