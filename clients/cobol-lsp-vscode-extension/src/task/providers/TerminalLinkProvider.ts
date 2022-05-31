/*
 * Copyright (c) 2022 Broadcom.
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
import { CompileTaskProvider } from "./CompileTaskProvider";

export default class TerminalLinkProvider implements vscode.TerminalLinkProvider<CobolTerminalLink> {
    private ddTerminalLinkRegex = /^(\d+)\s*(\w+)\s+.*$/;
    private fileLinkRegex = /((\w+:?)?[\\\/].*(\.[\w:]+)?)(:\d+:\d+)/;
    constructor(private taskprovider: CompileTaskProvider) {
    }

    provideTerminalLinks(context: vscode.TerminalLinkContext, token: vscode.CancellationToken): vscode.ProviderResult<CobolTerminalLink[]> {
        const ddMatches = context.line.match(this.ddTerminalLinkRegex);
        const fileMatches = context.line.match(this.fileLinkRegex);
        if (fileMatches && fileMatches?.length !== 0) {
            return [{
                startIndex: context.line.indexOf(fileMatches[1]),
                length: fileMatches[1].length + fileMatches[4].length,
                tooltip: "Click to open",
                data: {link: fileMatches[1], position: fileMatches[4]},
                type: "fileLink",
            }];
        }

        if (ddMatches && ddMatches?.length !== 0) {
            return  [
                {
                    startIndex: context.line.indexOf(ddMatches[2]),
                    length: ddMatches[2].length,
                    tooltip: "Click to open",
                    data: {link: ddMatches[2], spoolId: +ddMatches[1]},
                    type: "ddLink",
                },
                {
                    startIndex: context.line.indexOf(ddMatches[1]),
                    length: ddMatches[1].length,
                    tooltip: "Click to open",
                    data: {link: ddMatches[2], spoolId: +ddMatches[1]},
                    type: "ddLink",
                },
            ];
        }
        return [];
    }

    handleTerminalLink(terminalLink: CobolTerminalLink): vscode.ProviderResult<void> {
        if (terminalLink.type === "fileLink") {
            const lineNumber = +terminalLink.data.position.split(":")[1];
            const range = new vscode.Range(
                new vscode.Position(+terminalLink.data.position.split(":")[1] - 1, 7),
                new vscode.Position(lineNumber - 1, 72));
            vscode.workspace.openTextDocument(vscode.Uri.file(terminalLink.data.link))
            .then(_doc => {
                vscode.window.activeTextEditor.selection = new vscode.Selection(range.start, range.start);
                vscode.window.activeTextEditor.revealRange(range, vscode.TextEditorRevealType.InCenter);
            });
        } else {
            vscode.workspace.openTextDocument(this.taskprovider.generateUri(terminalLink))
                .then(doc => vscode.window.showTextDocument(doc));

        }
    }

}

export interface CobolTerminalLink extends vscode.TerminalLink {
    data: {link: string, position?: string, spoolId?: number};
    length: number;
    startIndex: number;
    tooltip: string;
    type: "fileLink" | "ddLink";
}
