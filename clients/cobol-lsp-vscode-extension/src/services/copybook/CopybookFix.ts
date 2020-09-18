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
import {DownloadQueue} from "../DownloadQueue";

export class CopybookFix {
    private queue: DownloadQueue = new DownloadQueue();

    /**
     * This method add in the download queue the copybooks that weren't found locally.
     * @param missingCopybooks list of copybooks not found
     * @param profile represent a name of a folder within the .copybooks folder that have the same name as the
     * connection name needed to download copybooks from mainframe.
     */
    public async addCopybookInQueue(missingCopybooks: string[], profile: string) {
        missingCopybooks.forEach(copybook => this.queue.push(copybook, profile));
    }

    async processDownloadError(title: string) {
        const actionSettings = "Change settings";
        const action = await vscode.window.showErrorMessage(title, actionSettings);
        if (action === actionSettings) {
            vscode.commands.executeCommand("broadcom-cobol-lsp.cpy-manager.goto-settings");
        }
    }

    setQueue(queue: DownloadQueue) {
        this.queue = queue;
    }
}
