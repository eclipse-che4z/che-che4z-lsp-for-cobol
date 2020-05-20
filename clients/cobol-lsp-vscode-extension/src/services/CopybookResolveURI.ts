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
import {PATHS_LOCAL_KEY, PATHS_ZOWE, SETTINGS_SECTION} from "../constants";
import {CopybookResolver} from "./settings/CopybookResolver";
import {LocalCopybookResolver} from "./settings/LocalCopybookResolver";
import {URL} from "url";
import * as path from "path";
import * as fs from "fs";
import {Uri} from "vscode";
import {DependenciesDesc, loadDepFile} from "./DependencyService";

function localSettingsAreFound(): boolean {
    const localPaths: string[] = vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY);
    return localPaths !== undefined && localPaths.length > 0;
}

function datasetSettingsAreFound(): boolean {
    const datasets: string[] = vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_ZOWE);
    return datasets !== undefined && datasets.length > 0;
}

export class CopybookResolveURI {
    //TODO: refactor with unit test
    public searchCopybookLocally(copybookName: string, targetFolders: string[]): string {
        const copybookResolver: CopybookResolver = new LocalCopybookResolver();
        const localFolderList: string[] =  copybookResolver.resolve(targetFolders);
        for (const folder of localFolderList) {
            //what about copybook name extension?
            //priority about folders? two file same name but different folders? - add unit test
            const uri: URL = new URL(path.join(folder, copybookName));
            if (fs.existsSync(uri)) {
                return uri.href;
            }
        }
    }

    resolveCopybooksInDepFile(depFileUri: Uri) {
        const depDesc: DependenciesDesc = loadDepFile(depFileUri);
        //try to search them first locally

        depDesc.copybooks.forEach(copybook => {
            console.log(vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY));
            if (localSettingsAreFound()) {
                //TODO: use api to resolve locally and get the uri
                const localCpy: string = this.searchCopybookLocally(copybook, vscode.workspace.getConfiguration(SETTINGS_SECTION).get(PATHS_LOCAL_KEY));
                if (localCpy) {
                    //create delivery object
                    vscode.window.showInformationMessage(JSON.stringify({
                        "cpyName" : copybook,
                        "uri": localCpy,
                        "type": "local",
                    }));
                } else {
                    vscode.window.showInformationMessage("Not found locally " + copybook + " - search it on mf...");
                    //TODO: should be globally defined with all the copybooks not found locally..
                    const items: string[] = new Array();
                    items.push(copybook);
                    //copybooksDownloader.downloadCopybooks(items,"");
                }
            }
        });
    }
}
