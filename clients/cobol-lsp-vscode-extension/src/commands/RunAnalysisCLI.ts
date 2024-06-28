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
import {ExtensionContext, QuickPickItem, Terminal} from "vscode";
import { MultiStepInput } from "../services/util/MultiStepInputUtil";

/**
 * Starts the process to gather input from the user to create the COBOL CLI analysis command.
 */
export async function runCobolAnalysisCommand(context: vscode.Uri) {
  const activeEditor = vscode.window.activeTextEditor;
  if (!activeEditor) {
    return;
  }

  const result = {} as Partial<AnalysisResults>;
  await MultiStepInput.run(input => getVersionToRun(input, result));

  if (result.typeToRun === undefined || result.copybookLocation === undefined) {
    return;
  }

  new RunAnalysis(
    result.typeToRun === "Native",
    result.copybookLocation,
    context,
  ).runCobolAnalysis();
}

interface AnalysisResults {
  typeToRun: string;
  copybookLocation: string;
}

/**
 *  Prompt the user for whether to run the Java or Native version.
 */
async function getVersionToRun(
  input: MultiStepInput,
  result: Partial<AnalysisResults>,
) {
  const inputItems: QuickPickItem[] = ["Java", "Native"].map(label => ({
    label,
  }));
  const output = await input.showQuickPick({
    activeItem:
      typeof result.typeToRun !== "string" ? result.typeToRun : undefined,
    items: inputItems,
    placeholder: "Select Java or Native",
    shouldResume,
    step: 1,
    title: "Run COBOL analysis from CLI",
    totalSteps: 1,
  });

  result.typeToRun = output.label;
  return getCopybookConfigLocation(input, result); // Chain steps
}

/**
 * Prompt the user for the location of the copybook config file.
 */
async function getCopybookConfigLocation(
  input: MultiStepInput,
  result: Partial<AnalysisResults>,
) {
  /* result.copybookLocation = await input.showInputBox({
        preserveFocus: true,
        prompt: "Enter the folder containing the copybooks. Leave blank if no copybooks are needed.",
        shouldResume,
        step: 2,
        title: "Run COBOL analysis from CLI",
        totalSteps: 2,
        validate: validatePath,
        value: "",
    }); */

  result.copybookLocation = "";
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
  protected readonly runNative: boolean;
  protected readonly copybookConfigLocation: string;
  protected readonly globalStorageUri: vscode.Uri;

  constructor(runNative: boolean = false, copybookConfigLocation: string = "", globalStorageUri: vscode.Uri) {
    this.runNative = runNative;
    this.copybookConfigLocation = copybookConfigLocation;
    this.globalStorageUri = globalStorageUri;
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
   * @protected
   */
  protected buildCommand() {
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
   * @protected
   */
  protected buildNativeCommand(currentFileLocation: string) {
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

    return (
      serverPath + " " + this.buildAnalysisCommandPortion(currentFileLocation)
    );
  }

  /**
   * Creates the command to run using the java build.
   * @param currentFileLocation - Location of the main cobol file being analyzed.
   * @protected
   */
  protected buildJavaCommand(currentFileLocation: string) {
    const extensionFolder: string | undefined =
      this.getExtensionPath() + "/server/jar/server.jar";

    if (extensionFolder && currentFileLocation !== "") {
      return (
        'java -jar "' +
        extensionFolder +
        '" ' +
        this.buildAnalysisCommandPortion(currentFileLocation)
      );
    }

    return "";
  }

  /**
   * Provides the portion of the command from "analysis" onwards.
   * Is the same for both the Java and Native builds.
   * @param currentFileLocation - Location of the main cobol file being analyzed.
   * @protected
   */
  protected buildAnalysisCommandPortion(currentFileLocation: string) {
    const copyBookCommand = `-cf=${
      this.copybookConfigLocation === ""
        ? "."
        : '"' + this.copybookConfigLocation + '"'
    }`;

    return 'analysis -s "' + currentFileLocation + '" ' + copyBookCommand;
  }

  /**
   * Sends a given command to a terminal.
   * Checks to see if one named "Analysis" is already created, if so clear and reuse it.
   * @param command - The command to run from the terminal.
   * @protected
   */
  protected sendToTerminal(command: string) {
    const existingTerminal = vscode.window.terminals.find(
      (term: Terminal) => term.name === "Analysis",
    );
    const terminal = existingTerminal
      ? existingTerminal
      : vscode.window.createTerminal("Analysis");

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
   * @protected
   */
  protected getCurrentFileLocation() {
    if (vscode.workspace.workspaceFile) {
      if (vscode.workspace.workspaceFile.path.startsWith("Untitled")) {
        return this.saveTempFile();
      } else {
        return vscode.workspace.workspaceFile?.path;
      }
    } else if (vscode.window.activeTextEditor) {
      if (
        vscode.window.activeTextEditor.document.uri.path.startsWith("Untitled")
      ) {
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
   * @protected
   */
  protected saveTempFile() {
    const data = vscode.window.activeTextEditor?.document.getText();

    if (data) {
      try {
        vscode.workspace.fs.stat(this.globalStorageUri).then(fileStatResult => {
          if (fileStatResult.type === vscode.FileType.Directory) {
            const newFileName = Date.now() + ".cbl";
            const newUri = vscode.Uri.parse(this.globalStorageUri.path + "/" + newFileName);
            vscode.workspace.fs.writeFile(newUri, Buffer.from(data));
            return newUri.path;
          }
        });
      } catch {
        return "";
      }
    }

    return "";
  }

  /**
   * Returns the location of the extension.
   * @protected
   */
  protected getExtensionPath() {
    return vscode.extensions.getExtension("broadcommfd.cobol-language-support")
      ?.extensionPath;
  }

  /**
   * Returns the command for the current OS that will clear the terminal.
   * @protected
   */
  protected getClearCommand() {
    return process.platform === "win32" ? "cls" : "clear";
  }
}
