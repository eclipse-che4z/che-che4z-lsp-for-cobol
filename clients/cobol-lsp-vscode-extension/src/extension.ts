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
import { ExtensionApi } from "@code4z/cobol-dialect-api";

import { fetchCopybookCommand } from "./commands/FetchCopybookCommand";
import { gotoCopybookSettings } from "./commands/OpenSettingsCommand";
import { LANGUAGE_ID } from "./constants";
import { CopybookDownloadService } from "./services/copybook/CopybookDownloadService";
import { CopybooksCodeActionProvider } from "./services/copybook/CopybooksCodeActionProvider";

import { clearCache } from "./commands/ClearCopybookCacheCommand";
import { CommentAction, commentCommand } from "./commands/CommentCommand";
import { initSmartTab, RangeTabShiftStore } from "./commands/SmartTabCommand";
import {
  downloadCopybookHandler,
  resolveCopybookHandler,
} from "./services/copybook/CopybookMessageHandler";
import { DialectRegistry } from "./services/DialectRegistry";
import { LanguageClientService } from "./services/LanguageClientService";
import { TelemetryService } from "./services/reporter/TelemetryService";
import { configHandler, SettingsService } from "./services/Settings";
import {
  pickSnippet,
  SnippetCompletionProvider,
} from "./services/snippetcompletion/SnippetCompletionProvider";
import { resolveSubroutineURI } from "./services/util/SubroutineUtils";
import { ServerRuntimeCodeActionProvider } from "./services/nativeLanguageClient/serverRuntimeCodeActionProvider";
import { ConfigurationWatcher } from "./services/util/ConfigurationWatcher";

let languageClientService: LanguageClientService;
let outputChannel: vscode.OutputChannel;
const API_VERSION: string = "1.0.0";

function initialize() {
  // We need lazy initialization to be able to mock this for unit testing
  const copyBooksDownloader = new CopybookDownloadService();
  outputChannel = vscode.window.createOutputChannel("COBOL Language Support");
  languageClientService = new LanguageClientService(outputChannel);
  const configurationWatcher = new ConfigurationWatcher();
  return { copyBooksDownloader, configurationWatcher };
}

export async function activate(
  context: vscode.ExtensionContext,
): Promise<ExtensionApi> {
  DialectRegistry.clear();
  const { copyBooksDownloader, configurationWatcher } = initialize();
  initSmartTab(context);

  TelemetryService.registerEvent(
    "log",
    ["bootstrap", "experiment-tag"],
    "Extension activation event was triggered",
  );
  copyBooksDownloader.start();

  // Register Commands
  registerCommands(context, copyBooksDownloader);

  context.subscriptions.push(copyBooksDownloader);

  registerCodeActions(context);

  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      { language: LANGUAGE_ID },
      new SnippetCompletionProvider(),
    ),
  );

  configurationWatcher.watchConfigurationChanges();

  try {
    if (SettingsService.serverRuntime() === "NATIVE") {
      languageClientService.enableNativeBuild();
    } else {
      await languageClientService.checkPrerequisites();
    }
  } catch (err) {
    outputChannel.appendLine(err.toString());
    languageClientService.enableNativeBuild();
    TelemetryService.registerExceptionEvent(
      "RuntimeException",
      err.toString(),
      ["bootstrap", "experiment-tag"],
      "Client has wrong Java version installed. Native builds activated.",
    );
  }

  // Custom client handlers
  languageClientService.addRequestHandler(
    "cobol/resolveSubroutine",
    resolveSubroutineURI,
  );
  languageClientService.addRequestHandler(
    "copybook/resolve",
    resolveCopybookHandler,
  );
  languageClientService.addRequestHandler(
    "copybook/download",
    downloadCopybookHandler.bind(copyBooksDownloader),
  );
  languageClientService.addRequestHandler(
    "workspace/configuration",
    configHandler,
  );

  await languageClientService.start();

  // 'export' public api-surface
  return {
    v1: {
      registerDialect,
    },
    version: API_VERSION,
  };
}

export function deactivate() {
  return languageClientService.stop();
}

interface DialectDetailV1 {
  name: string;
  description: string;
  jar: vscode.Uri;
  snippets: vscode.Uri;
}

const registerDialect = (extensionId: string, dialect: DialectDetailV1) => {
  outputChannel.appendLine(
    "Register new dialect: \r\n" + JSON.stringify(dialect),
  );

  DialectRegistry.register(
    extensionId,
    dialect.name,
    dialect.jar,
    dialect.description,
    dialect.snippets.fsPath,
  );
  outputChannel.appendLine("Restart analysis");
  languageClientService.invalidateConfiguration();

  const unregisterDialect = () => {
    DialectRegistry.unregister(dialect.name);
    languageClientService.invalidateConfiguration();
  };

  return unregisterDialect;
};

function registerCommands(
  context: vscode.ExtensionContext,
  copyBooksDownloader: CopybookDownloadService,
) {
  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.cpy-manager.fetch-copybook",
      (copybook, programName) => {
        fetchCopybookCommand(copybook, copyBooksDownloader, programName);
      },
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.cpy-manager.goto-settings",
      () => {
        gotoCopybookSettings();
      },
    ),
  );
  context.subscriptions.push(
    vscode.window.onDidChangeActiveTextEditor((_e) =>
      RangeTabShiftStore.reset(),
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.clear.downloaded.copybooks",
      () => {
        clearCache();
      },
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand("cobol-lsp.commentLine.toggle", () => {
      commentCommand(CommentAction.TOGGLE);
    }),
  );
  context.subscriptions.push(
    vscode.commands.registerCommand("cobol-lsp.commentLine.comment", () => {
      commentCommand(CommentAction.COMMENT);
    }),
  );
  context.subscriptions.push(
    vscode.commands.registerCommand("cobol-lsp.commentLine.uncomment", () => {
      commentCommand(CommentAction.UNCOMMENT);
    }),
  );
  context.subscriptions.push(
    vscode.commands.registerCommand("cobol-lsp.snippets.insertSnippets", () => {
      pickSnippet();
    }),
  );
  context.subscriptions.push(
    vscode.commands.registerCommand("cobol-lsp.dialects.goto-settings", () =>
      vscode.commands.executeCommand(
        "workbench.action.openSettings",
        "cobol-lsp.dialects",
      ),
    ),
  );
  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.serverRuntime.goto-settings",
      () =>
        vscode.commands.executeCommand(
          "workbench.action.openSettings",
          "cobol-lsp.serverRuntime",
        ),
    ),
  );
}

function registerCodeActions(context: vscode.ExtensionContext) {
  context.subscriptions.push(
    vscode.languages.registerCodeActionsProvider(
      { language: LANGUAGE_ID },
      new CopybooksCodeActionProvider(),
    ),
  );
  context.subscriptions.push(
    vscode.languages.registerCodeActionsProvider(
      { language: LANGUAGE_ID },
      new ServerRuntimeCodeActionProvider(),
    ),
  );
}
