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
import * as vscode from "vscode";
import { C4Z_FOLDER, COPYBOOK_EXT_ARRAY, COPYBOOKS_FOLDER, PATHS_LOCAL_KEY, PATHS_USS, PATHS_ZOWE, SETTINGS_CPY_SECTION } from "../../constants";
import { searchInWorkspace } from "../util/FSUtils";
import { ProfileUtils } from "../util/ProfileUtils";

/**
 * This class is responsible to identify from which source resolve copybooks required by the server.
 */
export class CopybookURI {

    /**
     * This function will try to resolve a given copybook name applying a two-step search strategy:
     * - search it on folders provided by the user in the setting.json
     * - search in the folder where the extension download copybooks from MF (.copybooks)
     * If it's not found in the previous steps than the user is notified and needs to download it from MF
     * or update the setting.json with an additional folder on the workspace where to search this missed copybook.
     * @param copybookName Name of the required copybook
     * @param cobolProgramName name of the cobol file opened in the IDE
     */
    public async resolveCopybookURI(copybookName: string, cobolProgramName: string): Promise<string> {
        // check on local paths provided by the user
        let result: string;
        result = searchInWorkspace(copybookName,
            vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(PATHS_LOCAL_KEY),
            COPYBOOK_EXT_ARRAY);
        // check in subfolders under .copybooks (copybook downloaded from MF)
        if (!result) {
            result = searchInWorkspace(copybookName,
                this.createPathForCopybookDownloaded(ProfileUtils.getProfileNameForCopybook(cobolProgramName)),
                COPYBOOK_EXT_ARRAY);
        }
        return result || "";
    }

    /**
     * This method produce an array with element that following the schema
     * "file://[WORKSPACE_FOLDER]/.c4z/.copybooks/PROFILE/DATASET" or
     * "file://[WORKSPACE_FOLDER]/.c4z/.copybooks/PROFILE/USS"
     * @param profile represent a name of a folder within the .copybooks folder that have the same name as the
     * connection name needed to download copybooks from mainframe.
     */
    private createPathForCopybookDownloaded(profile: string): string[] {
        let result: string[] = [];
        const datasets: string[] = vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(PATHS_ZOWE);
        if (profile && datasets) {
            result = Object.assign([], datasets);
            result.forEach((value, index) => result[index] = C4Z_FOLDER + "/" + COPYBOOKS_FOLDER + "/" +
                profile + "/" + value);
        }

        const ussPaths: string[] = vscode.workspace.getConfiguration(SETTINGS_CPY_SECTION).get(PATHS_USS);
        const baseIndex = result.length;
        if (profile && ussPaths) {
            Object.assign([], ussPaths).forEach((value, index) => result[index + baseIndex] = C4Z_FOLDER + "/" + COPYBOOKS_FOLDER + "/" +
                profile + "/" + value);
        }
        return result;
    }

}
