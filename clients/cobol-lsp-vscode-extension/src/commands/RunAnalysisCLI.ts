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

import * as path from "node:path";
import * as vscode from "vscode";
import {FileType, Terminal} from "vscode";

export function runCobolAnalysis() {
    const activeEditor = vscode.window.activeTextEditor;
    if (!activeEditor) {
        return;
    }
    new RunAnalysis().runCobolAnyalsis();
}

export class RunAnalysis {

    public runCobolAnyalsis() {
        const command = this.buildCommand();
        if (command !== "") {
            this.sendToTerminal(command);
        }

    }

    private buildCommand() {
        const currentFileLocation: string = this.getCurrentFileLocation();
        const extensionFolder: (string | undefined) = vscode.extensions.getExtension("broadcommfd.cobol-language-support")?.extensionPath + "/server/jar/server.jar";

        if (extensionFolder && currentFileLocation !== "") {
            return "java -jar \"" + extensionFolder + "\" analysis -s \"" + currentFileLocation + "\" -cf=.";
        }

        return "";
    }

    private sendToTerminal(command: string) {
        const existingTerminal = vscode.window.terminals.find((term: Terminal) => term.name === "Analysis");
        const terminal = (existingTerminal) ? existingTerminal : vscode.window.createTerminal("Analysis");
        terminal.sendText(command);
        terminal.show(true);
    }

    private getCurrentFileLocation() {
        if (vscode.workspace.workspaceFile) {
            if (vscode.workspace.workspaceFile.path.startsWith("untitled")) {
                // Unsaved file, need to save to a temp location to pass to the CLI.
            } else {
                return vscode.workspace.workspaceFile?.path;
            }

        } else if (vscode.window.activeTextEditor) {
            if (vscode.window.activeTextEditor.document.uri.path.startsWith("untitled")) {
                // Unsaved file, need to save to a temp location to pass to the CLI.
            } else {
                return vscode.window.activeTextEditor.document.uri.path;
            }
        }
        return "";
    }
}
