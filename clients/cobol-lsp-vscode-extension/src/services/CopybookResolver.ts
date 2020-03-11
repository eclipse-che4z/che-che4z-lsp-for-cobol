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
import { DownloadQueue } from "./DownloadQueue";

export class CopybookResolver {
    private queue: DownloadQueue;

    async fixMissingDownloads(reasonMsg: string, missingCopybooks: string[], profile: string, options: { hasPaths: boolean }) {
        const downloadCopybookAction = "Download Copybooks";
        const actionDatasets = "Edit Datasets";
        const actionProfile = "Change zowe profile";
        const actions = [];
        if (options.hasPaths) {
            actions.push(downloadCopybookAction);
        }
        if (reasonMsg !== "Configuration was updated") {
            actions.push(actionDatasets);
            actions.push(actionProfile);
        }
        const action: string = await vscode.window.showInformationMessage(
            reasonMsg,
            ...actions);
        if (action === downloadCopybookAction) {
            missingCopybooks.forEach(copybook => this.queue.push(copybook, profile));
        }
        if (action === actionDatasets) {
            vscode.commands.executeCommand("broadcom-cobol-lsp.cpy-manager.edit-dataset-paths");
        }
        if (action === actionProfile) {
            vscode.commands.executeCommand("workbench.action.openSettings",
                "broadcom-cobol-lsp.cpy-manager.profiles");
        }
    }

    async processDownloadError(title: string) {
        const actionDatasets = "Edit Datasets";
        const actionProfile = "Change zowe profile";
        const action = await vscode.window.showErrorMessage(title,
            actionDatasets, actionProfile);
        if (action === actionDatasets) {
            vscode.commands.executeCommand("broadcom-cobol-lsp.cpy-manager.edit-dataset-paths");
        }
        if (action === actionProfile) {
            vscode.commands.executeCommand("workbench.action.openSettings",
                "broadcom-cobol-lsp.cpy-manager.profiles");
        }
    }

    setQueue(queue: DownloadQueue) {
        this.queue = queue;
    }
}
