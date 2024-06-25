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
import * as vscode from "vscode";
import {QuickPickItem, Terminal} from "vscode";
import {MultiStepInput} from "../services/util/MultiStepInputUtil";

/**
 * Starts the process to gather input from the user to create the COBOL CLI analysis command.
 */
export async function runCobolAnalysisCommand() {
    const activeEditor = vscode.window.activeTextEditor;
    if (!activeEditor) {
        return;
    }

    const result = {} as Partial<AnalysisResults>;
    await MultiStepInput.run(input => getVersionToRun(input, result));

    if (result.typeToRun === undefined || result.copybookLocation === undefined) {
        return;
    }

    new RunAnalysis(result.typeToRun === "Native", result.copybookLocation).runCobolAnalysis();
}

interface AnalysisResults {
    typeToRun: string;
    copybookLocation: string;
}

/**
 *  Prompt the user for whether to run the Java or Native version.
 */
async function getVersionToRun(input: MultiStepInput, state: Partial<AnalysisResults>) {
    const inputItems: QuickPickItem[] = ["Java", "Native"].map(label => ({ label }));
    const result = await input.showQuickPick({
        activeItem: typeof state.typeToRun !== "string" ? state.typeToRun : undefined,
        items: inputItems,
        placeholder: "Select Java or Native",
        shouldResume,
        step: 1,
        title: "Run COBOL analysis from CLI",
        totalSteps: 2,
    });

    state.typeToRun = result.label;
    return getCopybookConfigLocation(input, state); // Chain steps
}

/**
 * Prompt the user for the location of the copybook config file.
 */
async function getCopybookConfigLocation(input: MultiStepInput, state: Partial<AnalysisResults>) {
    state.copybookLocation = await input.showInputBox({
        preserveFocus: true,
        prompt: "Enter the folder containing the copybooks. Leave blank if no copybooks are needed.",
        shouldResume,
        step: 2,
        title: "Run COBOL analysis from CLI",
        totalSteps: 2,
        validate: validatePath,
        value: "",
    });
}

/**
 * Dummy function to satisfy the requirement of validating the text input in the config location.
 */
function validatePath(value: string) {
    return Promise.resolve(undefined);
}

/**
 * Dummy function to satisfy the requirement of the pick/input box needing a way to resume.
 */
function shouldResume() {
    return new Promise<boolean>(resolve => {
        //
    });
}

/**
 * Class containing functions used to create the command needed to run the analysis from the command line
 * Handles Java or Native builds with or without copybook support
 */
export class RunAnalysis {
    private readonly runNative: boolean;
    private readonly copybookConfigLocation: string;

    constructor(runNative: boolean = false, copybookConfigLocation: string = "") {
        this.runNative = runNative;
        this.copybookConfigLocation = copybookConfigLocation;
    }

    /**
     * Main entrypoint to the class
     */
    public runCobolAnalysis() {
        const command = this.buildCommand();
        if (command !== "") {
            this.sendToTerminal(command);
        }

    }

    /**
     * Encapsulates the handling of building the command
     * @private
     */
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

    /**
     * Creates the command to run using the native build.
     * @param currentFileLocation - Location of the main cobol file being analyzed.
     * @private
     */
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

    /**
     * Creates the command to run using the java build.
     * @param currentFileLocation - Location of the main cobol file being analyzed.
     * @private
     */
    private buildJavaCommand(currentFileLocation: string) {
        const extensionFolder: (string | undefined) = this.getExtensionPath() + "/server/jar/server.jar";

        if (extensionFolder && currentFileLocation !== "") {
            return "java -jar \"" + extensionFolder + "\" " + this.buildAnalysisCommandPortion(currentFileLocation);
        }

        return "";
    }

    /**
     * Provides the portion of the command from "analysis" onwards.
     * Is the same for both the Java and Native builds.
     * @param currentFileLocation - Location of the main cobol file being analyzed.
     * @private
     */
    private buildAnalysisCommandPortion(currentFileLocation: string) {

        const copyBookCommand = `-cf=${this.copybookConfigLocation === "" ? "." : "\"" + this.copybookConfigLocation + "\""}`;

        return "analysis -s \"" + currentFileLocation + "\" " + copyBookCommand;
    }

    /**
     * Sends a given command to a terminal.
     * Checks to see if one named "Analysis" is already created, if so clear and reuse it.
     * @param command - The command to run from the terminal.
     * @private
     */
    private sendToTerminal(command: string) {
        const existingTerminal = vscode.window.terminals.find((term: Terminal) => term.name === "Analysis");
        const terminal = (existingTerminal) ? existingTerminal : vscode.window.createTerminal("Analysis");

        if (existingTerminal) {
            terminal.sendText(this.getClearCommand());
        }

        terminal.sendText(command);
        terminal.show(true);
    }

    /**
     * Retrieves the location of the currently open file.
     * If it is not saved, creates a temporary one on the disk to send to the command line with a copy of the contents.
     *    - Does not result in the actual file being saved to the end user.
     * @private
     */
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

    /**
     * Creates a temporary one on the disk to send to the command line with a copy of the contents.
     *    - Does not result in the actual file being saved to the end user.
     * @private
     */
    private saveTempFile() {
        const data = vscode.window.activeTextEditor?.document.getText();
        if (data) {
            return temp.writeFileSync(data); // Returns the path to the temporary file.
        }

        return "";
    }

    /**
     * Returns the location of the extension.
     * @private
     */
    private getExtensionPath() {
        return vscode.extensions.getExtension("broadcommfd.cobol-language-support")?.extensionPath;
    }

    /**
     * Returns the command for the current OS that will clear the terminal.
     * @private
     */
    private getClearCommand() {
        return ((process.platform === "win32") ? "cls" : "clear");
    }
}
