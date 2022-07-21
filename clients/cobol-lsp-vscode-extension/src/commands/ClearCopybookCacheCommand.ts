/*
 * Copyright (c) 2022 Broadcom.
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

import * as path from "path";
import * as vscode from "vscode";
import { C4Z_FOLDER, CLEARING_COPYBOOK_CACHE, COPYBOOK_CACHE_CLEARED_INFO, COPYBOOKS_FOLDER } from "../constants";
import { cleanDirectory } from "../services/util/FSUtils";

/**
 * Clears the downloaded copybook cache folder ({workspace}/.c4z/.copybooks).
 *
 */
export function clearCache() {
    vscode.window.setStatusBarMessage(CLEARING_COPYBOOK_CACHE, new Promise((resolve, _reject) => {
        if (!vscode.workspace.workspaceFolders || !vscode.workspace.workspaceFolders[0]) {
            vscode.window.showInformationMessage(COPYBOOK_CACHE_CLEARED_INFO).then(_val => resolve(true));
        }
        const ws = vscode.workspace.workspaceFolders[0];
        const cacheFolder = path.join(ws.uri.fsPath, C4Z_FOLDER, COPYBOOKS_FOLDER);
        cleanDirectory(cacheFolder);
        vscode.window.showInformationMessage(COPYBOOK_CACHE_CLEARED_INFO);
        resolve(true);
    }));
}
