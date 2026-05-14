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
import { SettingsService } from "../services/Settings";

export interface AnalysisConfiguration {
  typeToRun?: string;
  copybookLocation?: string;
  showDiagnosticsResult?: string;
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
  protected showDiagnostics: boolean;

  constructor(globalStorageUri: vscode.Uri, extensionPath: vscode.Uri) {
    this.runNative = false;
    this.copybookConfigLocation = "";
    this.globalStorageUri = globalStorageUri;
    this.extensionUri = extensionPath;
    this.showDiagnostics = false;
  }

  /**
   * Starts the process to gather input from the user to create the COBOL CLI analysis command.
   */
  public async runCobolAnalysisCommand() {
    const activeEditor = vscode.window.activeTextEditor;
    if (!activeEditor) {
      return;
    }

    const result: AnalysisConfiguration = {
      typeToRun: await this.getVersionToRun(),
      copybookLocation: this.getCopybookConfigLocation(),
      showDiagnosticsResult: await this.getShowDiagnosticsChoice(),
    };

    if (
      result.typeToRun === undefined ||
      result.copybookLocation === undefined ||
      result.showDiagnosticsResult === undefined
    ) {
      return;
    }

    this.runNative = result.typeToRun === "Native";
    this.copybookConfigLocation = result.copybookLocation;
    this.showDiagnostics = result.showDiagnosticsResult === "Show";

    const command = await this.buildCommand();
    if (command !== "") {
      this.sendToTerminal(command);
    }
  }

  /**
   *  Prompt the user for whether to run the Java or Native version.
   */
  public async getVersionToRun() {
    return await vscode.window.showQuickPick(["Java", "Native"], {
      placeHolder: "Select Java or Native",
    });
  }

  /**
   * Prompt the user for the location of the copybook config file.
   */
  public getCopybookConfigLocation() {
    return "";
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
  protected async buildCommand() {
    const currentFileLocation = await this.getCurrentFileLocation();
    if (!currentFileLocation || currentFileLocation === "") {
      return "";
    }

    if (this.runNative) {
      return this.buildNativeCommand(currentFileLocation, process.platform);
    }

    return this.buildJavaCommand(currentFileLocation);
  }

  /**
   * Creates the command to run using the native build.
   * @param currentFileLocation - Location of the main cobol file being analyzed.
   * @param platform - Result from Node.js' "process.platform".
   * @param showDiagnostics - Option to show/hide diagnostics
   * @protected
   */
  protected buildNativeCommand(currentFileLocation: string, platform: string) {
    const serverPath = this.extensionUri.fsPath + "/server/native";
    const result = this.getServerPath(serverPath, platform);

    if (result === "") {
      return "";
    }

    return result + " " + this.buildAnalysisCommandPortion(currentFileLocation);
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
  protected buildJavaCommand(currentFileLocation: string) {
    const extensionFolder: string | undefined = vscode.Uri.joinPath(
      this.extensionUri,
      "/server/jar/server.jar",
    ).fsPath;

    if (extensionFolder && currentFileLocation !== "") {
      return (
        `${SettingsService.getJavaCommand()} -jar "` +
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
   * @param showDiagnostics - Option to show/hide diagnostics
   * @protected
   */
  protected buildAnalysisCommandPortion(currentFileLocation: string) {
    const copyBookCommand = `-cf=${
      this.copybookConfigLocation === ""
        ? "."
        : '"' + this.copybookConfigLocation + '"'
    }`;

    return (
      "analysis -s " +
      currentFileLocation +
      " " +
      copyBookCommand +
      (this.showDiagnostics ? "" : " -nd")
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

    if (this.checkIfPowerShell()) {
      command = `& '${command}'`;
    }
    terminal.sendText(command);
    terminal.show(true);
  }

  private checkIfPowerShell() {
    const isWindows = process.platform === "win32";
    const isMac = process.platform === "darwin";
    const osKey = isWindows ? "windows" : isMac ? "osx" : "linux";

    const config = vscode.workspace.getConfiguration("terminal.integrated");
    const defaultProfile = config.get<string>(`defaultProfile.${osKey}`);

    if (defaultProfile) {
      const profileLower = defaultProfile.toLowerCase();
      if (
        profileLower.includes("powershell") ||
        profileLower.includes("pwsh")
      ) {
        return true;
      }
      return false;
    }
    const shellPath = vscode.env.shell?.toLowerCase() || "";
    return shellPath.includes("powershell") || shellPath.includes("pwsh");
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
        return this.getQuotedPath(
          vscode.window.activeTextEditor.document.uri.fsPath,
        );
      }
    }
    return "";
  }

  /**
   * Safely quotes a file path for terminal execution.
   * @param fsPath The raw file path from the VS Code URI
   * @returns The safely quoted path string
   */
  private getQuotedPath(fsPath: string): string {
    if (this.checkIfPowerShell()) {
      // Double quotes are dangerous because they allow variable expansion in PowerShell.
      if (fsPath.includes('"')) {
        throw new Error(
          "Paths containing quote characters cannot be safely executed in PowerShell.",
        );
      }
      // Escape single quotes by doubling them up (' -> '')
      const escapedPath = fsPath.replace(/'/g, "''");
      return `'${escapedPath}'`;
    } else {
      // POSIX: Escape embedded single quotes by closing the string,
      // adding an escaped single quote, and reopening the string.
      const escapedPath = fsPath.replace(/'/g, "'\\''");
      // Wrap the entire path in single quotes
      return `'${escapedPath}'`;
    }
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
      const tempFolderResult =
        await vscode.workspace.fs.readDirectory(tempFolderUri);
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
