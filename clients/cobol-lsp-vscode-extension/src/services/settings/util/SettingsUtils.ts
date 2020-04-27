import * as vscode from "vscode";
import {URL} from "url";
import * as fs from "fs";
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
export class SettingsUtils {
    public static isValidJSON(json: string): boolean {
        return (json !== undefined && json.trim().length > 0);
    }

    // TODO: Is necessary add unit test? vsc call will be mocked..
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
}
