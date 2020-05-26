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
import {CopybookUtil} from "./settings/util/CopybookUtil";

function getURIFrom(folder: string, copybookName: string, extensions?: string[]): URL {
    if (!extensions) {
        return new URL(path.join(folder, copybookName));
    } else {
        for (const extension of extensions) {
            const uri = new URL(path.join(folder, copybookName + "." + extension));
            if (fs.existsSync(uri)) {
                return uri;
            }
        }
    }
}

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
            let uri: URL = getURIFrom(folder, copybookName);

            if (fs.existsSync(uri)) {
                return uri.href;
            } else {
                uri = getURIFrom(folder, copybookName, CopybookUtil.getValidCopybookExtensionList());
                if (fs.existsSync(uri)) {
                    return uri.href;
                }
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
            result = CopybookURI.searchInWorkspace(copybookName, this.getLocalDownloadedCopybooks(await this.profileService.getProfile(cobolProgramName)));
        }
        //COPYBOOK NOT PRESENT LOCALLY..
        if (!result) {
            this.copybooksDownloader.downloadDependency(cobolProgramName, copybookName);
        }
        return result || "";
    }

    /**
     * This method produce an array with element that following the schema
     * "file://[WORKSPACE_FOLDER]/.copybooks/PROFILE/DATASET
     * @param profile
     */
    private getLocalDownloadedCopybooks(profile: string): string[] {
        const result: string[] = Object.assign([], vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_ZOWE));

        result.forEach((value, index) => result[index] = ".copybooks/" + profile + "/" + value);
        return result;
    }

}
