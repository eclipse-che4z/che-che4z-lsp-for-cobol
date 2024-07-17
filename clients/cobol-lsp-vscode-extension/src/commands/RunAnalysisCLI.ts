/*
 * Copyright (c) 2024 Broadcom.
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
import { Terminal } from "vscode";
import show = Mocha.reporters.Base.cursor.show;

export interface AnalysisResults {
  typeToRun: string;
  copybookLocation: string;
}

/**
 * Class containing functions used to create the command needed to run the analysis from the command line
 * Handles Java or Native builds with or without copybook support
 */
export class RunAnalysis {
  protected runNative: boolean;
  protected copybookConfigLocation: string;
  protected globalStorageUri: vscode.Uri;
  protected extensionUri: vscode.Uri;

  constructor(globalStorageUri: vscode.Uri, extensionPath: vscode.Uri) {
    this.runNative = false;
    this.copybookConfigLocation = "";
    this.globalStorageUri = globalStorageUri;
    this.extensionUri = extensionPath;
  }

  /**
   * Starts the process to gather input from the user to create the COBOL CLI analysis command.
   */
  public async runCobolAnalysisCommand() {
    const activeEditor = vscode.window.activeTextEditor;
    if (!activeEditor) {
      return;
    }

    const result = {} as Partial<AnalysisResults>;
    await this.getVersionToRun(result);
    await this.getCopybookConfigLocation(result);
    const showDiagnosticsResult = await this.getShowDiagnosticsChoice();

    if (
      result.typeToRun === undefined ||
      result.copybookLocation === undefined ||
      showDiagnosticsResult === undefined
    ) {
      return;
    }

    this.runNative = result.typeToRun === "Native";
    this.copybookConfigLocation = result.copybookLocation;
    const showDiagnostics: boolean = showDiagnosticsResult === "Show";

    const command = await this.buildCommand(showDiagnostics);
    if (command !== "") {
      this.sendToTerminal(command);
    }
  }

  /**
   *  Prompt the user for whether to run the Java or Native version.
   */
  public async getVersionToRun(result: Partial<AnalysisResults>) {
    result.typeToRun = await vscode.window.showQuickPick(["Java", "Native"], {
      placeHolder: "Select Java or Native",
    });
  }

  /**
   * Prompt the user for the location of the copybook config file.
   */
  public async getCopybookConfigLocation(result: Partial<AnalysisResults>) {
    result.copybookLocation = "";
  }

  public async getShowDiagnosticsChoice() {
    return await vscode.window.showQuickPick(["Show", "Hide"], {
      placeHolder: "Show diagnostics?",
    });
  }

  /**
   * Encapsulates the handling of building the command
   * @param showDiagnostics - Option to show/hide diagnostics
   * @protected
   */
  protected async buildCommand(showDiagnostics: boolean) {
    const currentFileLocation = await this.getCurrentFileLocation();
    if (!currentFileLocation || currentFileLocation === "") {
      return "";
    }

    if (this.runNative) {
      return this.buildNativeCommand(
        currentFileLocation,
        process.platform,
        showDiagnostics,
      );
    }

    return this.buildJavaCommand(currentFileLocation, showDiagnostics);
  }

  /**
   * Creates the command to run using the native build.
   * @param currentFileLocation - Location of the main cobol file being analyzed.
   * @param platform - Result from Node.js' "process.platform".
   * @param showDiagnostics - Option to show/hide diagnostics
   * @protected
   */
  protected buildNativeCommand(
    currentFileLocation: string,
    platform: string,
    showDiagnostics: boolean,
  ) {
    const serverPath = this.extensionUri.fsPath + "/server/native";
    const result = this.getServerPath(serverPath, platform);

    if (result === "") {
      return "";
    }

    return (
      result +
      " " +
      this.buildAnalysisCommandPortion(currentFileLocation, showDiagnostics)
    );
  }

  protected getServerPath(serverPath: string, platform: string) {
    switch (platform) {
      case "win32":
        return serverPath;
      case "linux":
        return (serverPath += "/server-linux");
      case "darwin": // macOS
        return (serverPath += "/server-mac");
      default: // Only Windows, Linux and Mac are supported.
        return "";
    }
  }

  /**
   * Creates the command to run using the java build.
   * @param currentFileLocation - Location of the main cobol file being analyzed.
   * @param showDiagnostics - Option to show/hide diagnostics
   * @protected
   */
  protected buildJavaCommand(
    currentFileLocation: string,
    showDiagnostics: boolean,
  ) {
    const extensionFolder: string | undefined =
      this.extensionUri.fsPath + "/server/jar/server.jar";

    if (extensionFolder && currentFileLocation !== "") {
      return (
        'java -jar "' +
        extensionFolder +
        '" ' +
        this.buildAnalysisCommandPortion(currentFileLocation, showDiagnostics)
      );
    }

    return "";
  }

  /**
   * Provides the portion of the command from "analysis" onwards.
   * Is the same for both the Java and Native builds.
   * @param currentFileLocation - Location of the main cobol file being analyzed.
   * @param showDiagnostics - Option to show/hide diagnostics
   * @protected
   */
  protected buildAnalysisCommandPortion(
    currentFileLocation: string,
    showDiagnostics: boolean,
  ) {
    const copyBookCommand = `-cf=${
      this.copybookConfigLocation === ""
        ? "."
        : '"' + this.copybookConfigLocation + '"'
    }`;

    return (
      'analysis -s "' +
      currentFileLocation +
      '" ' +
      copyBookCommand +
      (showDiagnostics ? "" : " -nd")
    );
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

    terminal.sendText(command);
    terminal.show(true);
  }

  /**
   * Retrieves the location of the currently open file.
   * If it is not saved, creates a temporary one on the disk to send to the command line with a copy of the contents.
   *    - Does not result in the actual file being saved to the end user.
   * @protected
   */
  protected async getCurrentFileLocation() {
    if (vscode.window.activeTextEditor) {
      if (vscode.window.activeTextEditor.document.uri.scheme !== "file") {
        return this.saveTempFile();
      } else {
        return vscode.window.activeTextEditor.document.uri.fsPath;
      }
    }
    return "";
  }

  /**
   * Creates a temporary one on the disk to send to the command line with a copy of the contents.
   *    - Does not result in the actual file being saved to the end user.
   * @protected
   */
  protected async saveTempFile() {
    const data = vscode.window.activeTextEditor?.document.getText();

    if (data) {
      const tempFolderUri = vscode.Uri.joinPath(
        this.globalStorageUri,
        "tempAnalysisFiles",
      );
      await vscode.workspace.fs.createDirectory(tempFolderUri);
      const tempFolderResult = await vscode.workspace.fs.readDirectory(
        tempFolderUri,
      );
      await Promise.all(
        tempFolderResult.map(async (value) => {
          await vscode.workspace.fs.delete(
            vscode.Uri.joinPath(tempFolderUri, value[0]),
          );
        }),
      );

      const newFileName = Date.now() + ".cbl";
      const newUri = vscode.Uri.joinPath(tempFolderUri, newFileName);
      await vscode.workspace.fs.writeFile(newUri, Buffer.from(data));
      return newUri.fsPath;
    }

    return "";
  }
}
