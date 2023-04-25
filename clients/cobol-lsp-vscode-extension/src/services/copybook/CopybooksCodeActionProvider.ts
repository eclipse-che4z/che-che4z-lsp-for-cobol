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
import { QUICKFIX_GOTOSETTINGS } from "../../constants";
import { TelemetryService } from "../reporter/TelemetryService";

export class CopybooksCodeActionProvider implements vscode.CodeActionProvider {
  public async provideCodeActions(
    doc: vscode.TextDocument,
    range: vscode.Range | vscode.Selection,
    context: vscode.CodeActionContext,
    token: vscode.CancellationToken,
  ): Promise<Array<vscode.Command | vscode.CodeAction>> {
    if (!this.shouldHaveCodeAction(context)) {
      return [];
    }
    // Telemetry should be collected only if shouldHaveCodeAction is true
    TelemetryService.registerEvent(
      "QuickFix for copybook activation",
      ["COBOL", "hover", "copybook", "quickfix"],
      "User try to understand the syntax error for a missing copybook",
    );

    const goToSettings = new vscode.CodeAction(
      QUICKFIX_GOTOSETTINGS,
      vscode.CodeActionKind.QuickFix,
    );

    goToSettings.command = {
      command: "cobol-lsp.cpy-manager.goto-settings",
      title: QUICKFIX_GOTOSETTINGS,
    };
    return [goToSettings];
  }

  private shouldHaveCodeAction(context: vscode.CodeActionContext): boolean {
    if (!context.diagnostics || context.diagnostics.length < 1) {
      return false;
    }

    for (const d of context.diagnostics) {
      if (d.code === "missing copybook") {
        return true;
      }
    }
    return false;
  }
}
