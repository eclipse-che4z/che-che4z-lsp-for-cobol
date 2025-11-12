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
import { ExtensionContext } from "vscode";
import {
  pickSnippet,
  SnippetCompletionProvider,
} from "../services/snippetcompletion/SnippetCompletionProvider";
import { LANGUAGE_ID } from "../constants";
import { initSmartTab, RangeTabShiftStore } from "../commands/SmartTabCommand";
import { initTelemetry, telemetryEvent } from "../services/reporter";
import { SubroutinesCompletionsProvider } from "../services/subroutines/SubroutinesCompletionsProvider";
import { CopybooksCompletionProvider } from "../services/copybook/CopybooksCompletionProvider";
import { initializeExternalAPIs } from "../services/ExternalAPIsService";
import { outputChannel } from "../services/util/OutputChannel";
import { createSampleConfiguration } from "../commands/CreateSampleConfiguration";

export async function activate(context: ExtensionContext) {
  await initTelemetry(context);
  telemetryEvent(
    "log",
    ["bootstrap", "experiment-tag"],
    "Web extension activation event was triggered",
  );

  outputChannel.appendLine("Activating COBOL Language Support Web Extension");

  await initializeExternalAPIs(context.globalStorageUri);

  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      { language: LANGUAGE_ID },
      new SnippetCompletionProvider(context),
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.snippets.insertSnippets",
      async () => {
        outputChannel.appendLine("Executing Insert Cobol Snippet command");
        await pickSnippet();
      },
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.configuration.create-sample",
      createSampleConfiguration,
    ),
  );

  initSmartTab(context);

  context.subscriptions.push(
    vscode.window.onDidChangeActiveTextEditor((_e) =>
      RangeTabShiftStore.reset(),
    ),
  );

  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      { language: LANGUAGE_ID },
      new SubroutinesCompletionsProvider(),
    ),
  );

  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      { language: LANGUAGE_ID },
      new CopybooksCompletionProvider(),
    ),
  );
}

// This method is called when your extension is deactivated
export function deactivate() {}
