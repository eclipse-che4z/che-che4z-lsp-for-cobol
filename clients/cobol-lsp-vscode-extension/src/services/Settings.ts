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

import { SETTINGS_SECTION } from "../constants";
import * as vscode from "vscode";
import * as fs from "fs";
import * as path from "path";

export function initializeSettings() {
    let configuration = vscode.workspace.getConfiguration(SETTINGS_SECTION);
    let properties = Object.keys(vscode.workspace.getConfiguration().get(SETTINGS_SECTION));

    if (properties.every(isUndefinedInWorkspace)) {
        properties.forEach((property) => {
            configuration.update(property, configuration.get(property), vscode.ConfigurationTarget.Workspace);
        });
    }
}

function isUndefinedInWorkspace(property: string, index: number, array: string[]): boolean {
    return vscode.workspace.getConfiguration(SETTINGS_SECTION).inspect(property).workspaceValue == undefined;
}


/**
 * New file (e.g .gitignore) will be created or edited if exits, under project folder (e.g. workspace/.c4z) with given  pattern
 * 
 * @param path 
 * @param fileName 
 * @param pattern 
 */
export function createFileWithGivenPath(folderPath: string, fileName: string, pattern: string): void {

    const ch4zPath = path.join(vscode.workspace.workspaceFolders[0].uri.fsPath, folderPath);
    const filePath = path.join(ch4zPath, fileName);
    try {
        if (fs.existsSync(filePath)) {
            const notFound = fs.readFileSync(filePath).toString().split("\n")
                .filter(e => e.trim().length > 0)
                .map(e => e.trim()).every(v => !v.startsWith(pattern));
            if (notFound) {
                fs.appendFileSync(filePath, "\n" + pattern);
            }
        } else {
            fs.mkdirSync(ch4zPath, { recursive: true });
            fs.writeFileSync(filePath, pattern);
        }
    } catch (e) {
        vscode.window.showErrorMessage("File error: " + e.toString());
    }
}