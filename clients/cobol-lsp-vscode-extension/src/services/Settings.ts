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