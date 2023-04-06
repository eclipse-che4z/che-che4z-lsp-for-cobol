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
import {
  QUICKFIX_UPDATE_DIALECTSSETTINGS,
  QUICKFIX_UPDATE_SERVER_TO_JAVA,
} from "../../constants";
import { TelemetryService } from "../reporter/TelemetryService";

export class ServerRuntimeCodeActionProvider
  implements vscode.CodeActionProvider
{
  public async provideCodeActions(
    _doc: vscode.TextDocument,
    _range: vscode.Range | vscode.Selection,
    context: vscode.CodeActionContext,
    _token: vscode.CancellationToken,
  ): Promise<Array<vscode.Command | vscode.CodeAction>> {
    if (!this.shouldHaveCodeAction(context)) {
      return [];
    }
    // Telemetry should be collected only if shouldHaveCodeAction is true
    TelemetryService.registerEvent(
      "QuickFix for server type",
      ["COBOL", "native server", "server type", "quickfix"],
      "User is trying to fix in compatible server type and dialects",
    );

    const goToDialectsSettings = new vscode.CodeAction(
      QUICKFIX_UPDATE_DIALECTSSETTINGS,
      vscode.CodeActionKind.QuickFix,
    );
    const goToServerTypeSettings = new vscode.CodeAction(
      QUICKFIX_UPDATE_SERVER_TO_JAVA,
      vscode.CodeActionKind.QuickFix,
    );

    goToDialectsSettings.command = {
      command: "cobol-lsp.dialects.goto-settings",
      title: QUICKFIX_UPDATE_DIALECTSSETTINGS,
    };

    goToServerTypeSettings.command = {
      command: "cobol-lsp.serverRuntime.goto-settings",
      title: QUICKFIX_UPDATE_SERVER_TO_JAVA,
    };
    return [goToDialectsSettings, goToServerTypeSettings];
  }

  private shouldHaveCodeAction(context: vscode.CodeActionContext): boolean {
    if (!context.diagnostics || context.diagnostics.length < 1) {
      return false;
    }

    for (const d of context.diagnostics) {
      if (d.code === "incompatible server type") {
        return true;
      }
    }
    return false;
  }
}
