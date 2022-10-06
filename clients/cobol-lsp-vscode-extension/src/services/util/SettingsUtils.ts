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

export class SettingsUtils {
    public static isValidJSON(json: string): boolean {
        return (json !== undefined) ? JSON.parse(json) : false;
    }

    /**From a configuration of single/multi workspace folders, their URIs are collected and returned in a util method.
     * @returns list of resolved URI in FS style
     */
    public static getWorkspacesURI(): string[] {
        const result: string[] = [];
        vscode.workspace.workspaceFolders.forEach(workspace => {
            result.push(workspace.uri.scheme + "://" + workspace.uri.path);
        });
        return result;
    }

    public static getWorkspaceFoldersPath(): string[] {
        const result: string[] = [];
        vscode.workspace.workspaceFolders.forEach(workspaceFolder => {
            result.push(workspaceFolder.uri.path);
        });
        return result;
    }

    static findUriScheme(path: string): string {
        return vscode.workspace.workspaceFolders.find(workspaceFolder => {
            return workspaceFolder.uri.path === path;
        }).uri.scheme;
    }

    public static absolutePath(workspaceFolderPath: string, basePath: string): string {
        return this.findUriScheme(workspaceFolderPath) + "://" + basePath;
    }
}
