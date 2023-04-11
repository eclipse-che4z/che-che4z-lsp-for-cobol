/*
 * Copyright (c) 2023 Broadcom.
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
import { SERVER_RUNTIME } from "../../constants";
import { TelemetryService } from "../reporter/TelemetryService";
import { SettingsService } from "../Settings";

export class ConfigurationWatcher {
  private static async restartVsCode() {
    const selection = await vscode.window.showInformationMessage(
      "Reload vscode for serverRuntime settings change to take effect",
      "Ok",
      "Later",
    );
    if (typeof selection === "undefined" || selection === "Later") {
      return;
    }
    if (selection === "Ok") {
      TelemetryService.registerEvent(
        "serverRuntime modified by user",
        ["COBOL", "serverRuntime", "settings"],
        `Server type modified by user to ${this.getServerRuntime()}`,
      );
      await vscode.commands.executeCommand("workbench.action.reloadWindow");
    }
  }

  private static getServerRuntime() {
    return SettingsService.serverRuntime() === "NATIVE" ? "NATIVE" : "JAVA";
  }
  private prevRuntimeState: string;

  constructor() {
    this.prevRuntimeState = ConfigurationWatcher.getServerRuntime();
  }

  public watchConfigurationChanges() {
    vscode.workspace.onDidChangeConfiguration(async (event) => {
      if (event.affectsConfiguration(SERVER_RUNTIME)) {
        await this.handleServerRuntimeConfigurationChange();
      }
    });
  }

  private async handleServerRuntimeConfigurationChange() {
    const newServerRuntime = ConfigurationWatcher.getServerRuntime();
    if (newServerRuntime !== this.prevRuntimeState) {
      await ConfigurationWatcher.restartVsCode();
    }
  }
}
