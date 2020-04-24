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
import {SETTINGS_SECTION} from "../constants";
import {CopybookResolver} from "../services/settings/CopybookResolver";

export async function resolveLocalCopybooks(copybookResolver: CopybookResolver) {
    if (!vscode.workspace.getConfiguration(SETTINGS_SECTION).has("local")) {
        await vscode.window.showErrorMessage("Please, specify LOCAL paths for copybooks in settings.");
        return [];
    }

    const result: string[] = copybookResolver.resolve(vscode.workspace.getConfiguration(SETTINGS_SECTION).get("local"));
    if (result.length === 0) {
        vscode.window.showInformationMessage("No resource found");
    } else {
        vscode.window.showInformationMessage(result.toString());
    }
}
