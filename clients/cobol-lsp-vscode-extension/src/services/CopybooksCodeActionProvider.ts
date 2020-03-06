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

export class CopybooksCodeActionProvider implements vscode.CodeActionProvider {
    public provideCodeActions(doc: vscode.TextDocument, range: vscode.Range | vscode.Selection,
        // tslint:disable-next-line: align
        context: vscode.CodeActionContext, token: vscode.CancellationToken,
    ): vscode.ProviderResult<Array<vscode.Command | vscode.CodeAction>> {
        if (!this.shouldHaveCodeAction(context)) {
            return [];
        }
        return [{
            arguments: ["broadcom-cobol-lsp.cpy-manager.paths"],
            command: "workbench.action.openSettings",
            title: "Setup copybook datasets list",
        },
        {
            arguments: ["broadcom-cobol-lsp.cpy-manager.profiles"],
            command: "workbench.action.openSettings",
            title: "Change default zowe profile",
        }];
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
