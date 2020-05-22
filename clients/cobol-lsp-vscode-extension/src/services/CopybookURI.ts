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
import {CopybooksDownloader} from "./CopybooksDownloader";
import {ProfileService} from "./ProfileService";
import {CopybookResolver} from "./settings/CopybookResolver";
import {LocalCopybookResolver} from "./settings/LocalCopybookResolver";

/**
 * This class is responsible to identify from which source resolve copybooks required by the server.
 */
export class CopybookURI {
    /**
     * This method scan the list of folders as given input and find the required copybook name within the folder.
     * If found returns its URI representation
     * @param copybookName name of the copybook asked by the server
     * @param targetFolders list of folders from where to search the copybook
     */
    public static searchInWorkspace(copybookName: string, targetFolders: string[]): string {
        const copybookResolver: CopybookResolver = new LocalCopybookResolver();
        const localFolderList: string[] = copybookResolver.resolve(targetFolders);

        for (const folder of localFolderList) {
            const uri: URL = new URL(path.join(folder, copybookName));
            if (fs.existsSync(uri)) {
                return uri.href;
            }
        }
    }

    constructor(private profileService: ProfileService, private copybooksDownloader: CopybooksDownloader) {
    }

    /**
     * This function will try to resolve a given copybook name followind diff
     * @param copybookName Name of the required copybook
     * @param cobolProgramName name of the cobol file opened in the IDE
     */
    public async resolveCopybookURI(copybookName: string, cobolProgramName: string): Promise<string> {
        // check on local paths provided by the user
        let result: string;
        result = CopybookURI.searchInWorkspace(copybookName, vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY));

        if (!result) {
            result = CopybookURI.searchInWorkspace(copybookName + ".cpy", this.getLocalDownloadedCopybooks(await this.profileService.getProfile(cobolProgramName)));
        }

        if (!result) {
            //COPYBOOK NOT PRESENT LOCALLY..
            this.copybooksDownloader.downloadDependency(cobolProgramName, copybookName);
        }
        vscode.window.showInformationMessage(result);
        return result || "";
    }

    private getLocalDownloadedCopybooks(profile: string): string[] {
        const result: string[] = Object.assign([], vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_ZOWE));
        //the URI should be formatted as "file://[WORKSPACE_FOLDER]/.copybooks/PROFILE/DATASET_
        result.forEach((value, index) => result[index] = ".copybooks/" + profile + "/" + value);
        return result;
    }
}
