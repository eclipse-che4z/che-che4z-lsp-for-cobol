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

import {URL} from "url";
import * as path from "path";
import {readdirSync, existsSync} from "fs";
import {SettingsUtils} from "./SettingsUtils";
import * as fs from "fs";

/**
 * This method is responsible to return a valid URI without extension if the extension is not provided or an URI
 * that contains an allowed extension.
 * @param folder is the first part of the URI referred to the folder defined in the setting.json
 * @param entityName is the name of entity identified by the LSP server that needs to be found locally
 * @param extensions an optional parameter to produce an URI of an allowed extension list, verifying that
 * this URI really exists on FS.
 *
 */
export function getURIFrom(folder: string, entityName: string, extensions?: string[]): URL {
    if (!extensions) {
        const url = new URL(path.join(folder, entityName));
        if (existsSync(url)) {
            return url;
        }
    } else {
        const fileList = readdirSync(new URL(folder));
        for (const extension of extensions) {
            const copybookFileWithExtension = (entityName + extension).toUpperCase();
            const found = fileList.find(filename => filename.toUpperCase() === copybookFileWithExtension.toUpperCase())
            if (found) {
                return new URL(path.join(folder, found));
            }
        }
    }
}

/**
 * This function construct an URI from a valid resource provided from the setting configuration
 * @param resource represent the file to search within the workspace folder list
 * @return an URI representation of the file or undefined if not found
 */
export function getURIFromResource(resource: string): URL {
    for (const workspaceFolder of SettingsUtils.getWorkspacesURI()) {
        const uri: URL = new URL(path.join(workspaceFolder, resource));
        if (fs.existsSync(uri)) {
            return uri;
        }
    }
}

/**
 * This method scans the list of folders as given input and find the required entity name within the folder.
 * If found returns its URI representation
 * @param entityName name of the entity asked by the server
 * @param targetFolders list of folders from where to search the copybook
 * @param extensions list of extensions
 */
export function searchInWorkspace(entityName: string, targetFolders: string[], extensions: string[]): string {
    if (targetFolders) {
        const localFolderList: string[] = targetFolders
            .map(getURIFromResource)
            .filter((url: URL) => url !== undefined)
            .map((url: URL) => url.href);
        for (const folder of localFolderList) {
            let uri: URL = getURIFrom(folder, entityName);
            if (!uri) {
                uri = getURIFrom(folder, entityName, extensions);
            }
            if (uri) {
                return uri.href;
            }
        }
    }
}
