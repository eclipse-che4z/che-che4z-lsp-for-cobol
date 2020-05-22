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
import {ProfileService} from "./ProfileService";

export class CopybooksCodeActionProvider implements vscode.CodeActionProvider {

    constructor(private profileService: ProfileService) {
    }

    public async provideCodeActions(doc: vscode.TextDocument,
                                    range: vscode.Range | vscode.Selection,
                                    context: vscode.CodeActionContext,
                                    token: vscode.CancellationToken,
    ): Promise<Array<vscode.Command | vscode.CodeAction>> {
        if (!this.shouldHaveCodeAction(context)) {
            return [];
        }

        const datasetPaths = new vscode.CodeAction("Edit copybook datasets list", vscode.CodeActionKind.QuickFix);
        datasetPaths.command = {
            command: "broadcom-cobol-lsp.cpy-manager.edit-dataset-paths",
            title: "Edit copybook datasets list",
        };

        const changeProfile = new vscode.CodeAction("Change default zowe profile", vscode.CodeActionKind.QuickFix);
        changeProfile.command = {
            command: "broadcom-cobol-lsp.cpy-manager.change-default-zowe-profile",
            title: "Change zowe profile",
        };

        if (await this.profileService.checkMultipleProfiles()) {
            return [datasetPaths, changeProfile];
        }
        return [datasetPaths];
    }

    private extractCopybookName(context: vscode.CodeActionContext) {
        const msg = context.diagnostics[0].message;
        return msg.substring(0, msg.indexOf(":"));
    }

    private extractProgramName(doc: vscode.TextDocument) {
        return path.basename(doc.fileName, path.extname(doc.fileName));
    }

    private shouldHaveCodeAction(context: vscode.CodeActionContext): boolean {
        if (!context.diagnostics || context.diagnostics.length < 1) {
            return false;
        }

        for (const d of context.diagnostics) {
            if (d.code === "MISSING_COPYBOOK") {
                return true;
            }
        }
        return false;
    }
}
