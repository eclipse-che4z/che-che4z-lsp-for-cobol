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

/**
 * Clears the downloaded copybook cache folder ({workspace}/.c4z/.copybooks).
 *
 */
export function clearCache() {
    vscode.window.setStatusBarMessage(CLEARING_COPYBOOK_CACHE, Promise.resolve().then(()=>{
        const folderUri = vscode.workspace.workspaceFolders[0].uri;
        const fileUri = folderUri.with({ path: path.join(folderUri.fsPath, C4Z_FOLDER, COPYBOOKS_FOLDER) });
        vscode.workspace.fs.delete(fileUri, { recursive: true});
        vscode.window.showInformationMessage(COPYBOOK_CACHE_CLEARED_INFO);
    }, ()=>vscode.window.showInformationMessage("Encountered problem while clearing copybook cache")))
 }

