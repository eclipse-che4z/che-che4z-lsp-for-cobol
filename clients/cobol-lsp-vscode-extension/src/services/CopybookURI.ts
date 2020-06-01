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
import { URL } from "url";
import * as vscode from "vscode";
import { C4Z_FOLDER, COPYBOOKS_FOLDER, PATHS_LOCAL_KEY, PATHS_ZOWE, SETTINGS_SECTION } from "../constants";
import { CopybooksDownloader } from "./CopybooksDownloader";
import { ProfileService } from "./ProfileService";
import { CopybookResolver } from "./settings/CopybookResolver";
import { LocalCopybookResolver } from "./settings/LocalCopybookResolver";
import { CopybookUtil } from "./settings/util/CopybookUtil";

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
            let uri: URL = this.getURIFrom(folder, copybookName);

            if (fs.existsSync(uri)) {
                return uri.href;
            } else {
                uri = this.getURIFrom(folder, copybookName, CopybookUtil.getValidCopybookExtensionList());
                if (fs.existsSync(uri)) {
                    return uri.href;
                }
            }
        }
    }

    /**
     * This method is responsible to return an URI without extension if the extension is not provided or an URI
     * that contains an allowed extension.
     * @param folder is the first part of the URI referred to the folder defined in the setting.json
     * @param copybookName is the name of copybook identified by the LSP server that needs to be found locally
     * or downloaded
     * @param extensions an optional parameter to produce an URI of an allowed extension list, verifyng that
     * this URI really exists on FS.
     */
    private static getURIFrom(folder: string, copybookName: string, extensions?: string[]): URL {
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

    constructor(private profileService: ProfileService, private copybooksDownloader: CopybooksDownloader) {
    }

    /**
     * This function will try to resolve a given copybook name applying a two-step search strategy:
     * - search it on folders provided by the user in the setting.json
     * - search in the folder where the extension download copybooks from MF (.copybooks)
     * If is not found in the previous steps than the user is notified and needs to download it from MF
     * or update the setting.json with an additional folder on the workspace where to search this missed copybook.
     * @param copybookName Name of the required copybook
     * @param cobolProgramName name of the cobol file opened in the IDE
     */
    public async resolveCopybookURI(copybookName: string, cobolProgramName: string): Promise<string> {
        // check on local paths provided by the user
        let result: string;
        result = CopybookURI.searchInWorkspace(copybookName, vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY));
        // check in subfolders under .copybooks (copybook downloaded from MF)
        if (!result) {
            result = CopybookURI.searchInWorkspace(copybookName, this.createPathForCopybookDownloaded(await this.profileService.getProfile(cobolProgramName)));
        }
        // copybook is not present on any folders defined by the user and not already downloaded, so is marked
        // a copybook that should be downloaded manually by the user.
        if (!result) {
            this.copybooksDownloader.downloadDependency(cobolProgramName, copybookName);
        }
        return result || "";
    }

    /**
     * This method produce an array with element that following the schema
     * "file://[WORKSPACE_FOLDER]/.c4z/.copybooks/PROFILE/DATASET
     * @param profile represent a name of a folder within the .copybooks folder that have the same name as the
     * connection name needed to download copybooks from mainframe.
     */
    private createPathForCopybookDownloaded(profile: string): string[] {
        let result: string[] = [];
        const datasets: string[] = vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_ZOWE);
        if (profile && datasets) {
            result = Object.assign([], datasets);
            result.forEach((value, index) => result[index] = C4Z_FOLDER + "/" + COPYBOOKS_FOLDER + "/" + profile + "/" + value);
        }
        return result;
    }

}
