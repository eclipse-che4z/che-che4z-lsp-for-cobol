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
import * as path from "path";
import * as vscode from "vscode";
import { COPYBOOKS_FOLDER } from "../constants";

export function createCopybookPath(profileName: string, dataset: string, copybook: string): string {
    const rootPath = vscode.workspace.workspaceFolders[0].uri.fsPath;
    const copybookDirPath = path.join(rootPath, COPYBOOKS_FOLDER, profileName, dataset);
    return path.join(copybookDirPath, copybook + ".cpy");
}

export function  createDatasetPath(profileName: string, dataset: string): string {
    const rootPath = vscode.workspace.workspaceFolders[0].uri.fsPath;
    return path.join(rootPath, COPYBOOKS_FOLDER, profileName, dataset);
}

export function checkWorkspace(): boolean {
    if (vscode.workspace.workspaceFolders.length === 0) {
        vscode.window.showErrorMessage("No workspace folder opened.");
        return false;
    }
    return true;
}
