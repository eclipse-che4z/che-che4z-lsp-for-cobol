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
import {TelemetryService} from "../services/reporter/TelemetryService";

export function gotoCopybookSettings(): void {
    TelemetryService.registerEvent("Open copybook settings", ["COBOL", "copybook", "settings"], "The user invokes the open settings quick fix to see the copybook locations stored in the settings file");
    vscode.commands.executeCommand("workbench.action.openSettings", "cobol-lsp.cpy-manager");
}
