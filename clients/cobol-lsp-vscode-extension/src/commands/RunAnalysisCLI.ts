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

import temp from "fs-temp";
import * as path from "node:path";
import * as vscode from "vscode";
import { Terminal } from "vscode";

export async function runCobolAnalysisCommand() {
    const activeEditor = vscode.window.activeTextEditor;
    if (!activeEditor) {
        return;
    }

    const typeToRun: (string | undefined) = await getVersionToRun();
    const copybookLocation: (string | undefined) = await getCopybookConfigLocation();

    new RunAnalysis(typeToRun === "Native", copybookLocation).runCobolAnalysis();
}

export async function getVersionToRun() {
    const typeResult = await vscode.window.showQuickPick(["Java", "Native"], {
        placeHolder: "Select Java or Native",
    });
    return typeResult?.toString();
}

export async function getCopybookConfigLocation() {
    const copybookResult = await vscode.window.showInputBox({
        placeHolder: "Enter the folder of the copybook config file. Leave blank if no copybooks are needed.",
        value: "",
    });

    if (copybookResult) {
        if (copybookResult.toString().trim() === "") {
            return "";
        }

        // TODO: Add search for config file within folder given.
    }

    return "";
}

export class RunAnalysis {
    private readonly runNative: boolean;
    private readonly copybookConfigLocation: string;

    constructor(runNative: boolean = false, copybookConfigLocation: string = "") {
        this.runNative = runNative;
        this.copybookConfigLocation = copybookConfigLocation;
    }

    public runCobolAnalysis() {
        const command = this.buildCommand();
        if (command !== "") {
            this.sendToTerminal(command);
        }

    }

    private buildCommand() {
        const currentFileLocation: string = this.getCurrentFileLocation();
        if (currentFileLocation === "") {
            return "";
        }

        if (this.runNative) {
            return this.buildNativeCommand(currentFileLocation);
        }

        return this.buildJavaCommand(currentFileLocation);
    }

    private buildNativeCommand(currentFileLocation: string) {
        let serverPath = this.getExtensionPath() + "/server/native";
        switch (process.platform) {
            case "win32":
                break;
            case "linux":
                serverPath += "/server-linux";
                break;
            case "darwin": // macOS
                serverPath += "/server-mac";
                break;
            default: // Only Windows, Linux and Mac are supported.
                return "";
        }

        return serverPath + " " + this.buildAnalysisCommandPortion(currentFileLocation);
    }

    private buildJavaCommand(currentFileLocation: string) {
        const extensionFolder: (string | undefined) = this.getExtensionPath() + "/server/jar/server.jar";

        if (extensionFolder && currentFileLocation !== "") {
            return "java -jar \"" + extensionFolder + "\" " + this.buildAnalysisCommandPortion(currentFileLocation);
        }

        return "";
    }

    private buildAnalysisCommandPortion(currentFileLocation: string) {

        const copyBookCommand = `-cf=${this.copybookConfigLocation === "" ? "." : "\"" + this.copybookConfigLocation + "\""}`;

        return "analysis -s \"" + currentFileLocation + "\" " + copyBookCommand;
    }

    private sendToTerminal(command: string) {
        const existingTerminal = vscode.window.terminals.find((term: Terminal) => term.name === "Analysis");
        const terminal = (existingTerminal) ? existingTerminal : vscode.window.createTerminal("Analysis");

        if (existingTerminal) {
            terminal.sendText(this.getClearCommand());
        }

        terminal.sendText(command);
        terminal.show(true);
    }

    private getCurrentFileLocation() {
        if (vscode.workspace.workspaceFile) {
            if (vscode.workspace.workspaceFile.path.startsWith("Untitled")) {
                return this.saveTempFile();
            } else {
                return vscode.workspace.workspaceFile?.path;
            }

        } else if (vscode.window.activeTextEditor) {
            if (vscode.window.activeTextEditor.document.uri.path.startsWith("Untitled")) {
                return this.saveTempFile();
            } else {
                return vscode.window.activeTextEditor.document.uri.path;
            }
        }
        return "";
    }

    private saveTempFile() {
        const data = vscode.window.activeTextEditor?.document.getText();
        if (data) {
            return temp.writeFileSync(data);
        }

        return "";
    }

    private getExtensionPath() {
        return vscode.extensions.getExtension("broadcommfd.cobol-language-support")?.extensionPath;
    }

    private getClearCommand() {
        return ((process.platform === "win32") ? "cls" : "clear");
    }
}
