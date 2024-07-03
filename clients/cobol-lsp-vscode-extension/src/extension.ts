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
import { __ExtensionApi } from "@code4z/cobol-dialect-api";
import { isV1RuntimeDialectDetail } from "./dialect/utils";

import { fetchCopybookCommand } from "./commands/FetchCopybookCommand";
import { gotoCopybookSettings } from "./commands/OpenSettingsCommand";
import {
  E4E_INCOMPATIBLE,
  FAIL_CREATE_COPYBOOK_FOLDER_MSG,
  FAIL_CREATE_GLOBAL_STORAGE_MSG,
  LANGUAGE_ID,
  ZOWE_FOLDER,
} from "./constants";
import { CopybookDownloadService } from "./services/copybook/CopybookDownloadService";
import { CopybooksCodeActionProvider } from "./services/copybook/CopybooksCodeActionProvider";

import { RunAnalysis } from "./commands/RunAnalysisCLI";

import { clearCache } from "./commands/ClearCopybookCacheCommand";
import { CommentAction, commentCommand } from "./commands/CommentCommand";
import { initSmartTab, RangeTabShiftStore } from "./commands/SmartTabCommand";
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
import * as path from "node:path";
import { Utils } from "./services/util/Utils";
import { getE4EAPI } from "./services/copybook/E4ECopybookService";

interface __AnalysisApi {
  analysis(uri: string, text: string): Promise<any>;
}

let languageClientService: LanguageClientService;
let outputChannel: vscode.OutputChannel;
const API_VERSION: string = "1.0.0";

async function initialize(context: vscode.ExtensionContext) {
  // We need lazy initialization to be able to mock this for unit testing
  outputChannel = vscode.window.createOutputChannel("COBOL Language Support");
  try {
    await vscode.workspace.fs.createDirectory(context.globalStorageUri);
  } catch (error) {
    const message = `${FAIL_CREATE_GLOBAL_STORAGE_MSG}: ${error}`;
    outputChannel.appendLine(message);
    throw Error(message);
  }
  const maybeE4E = await getE4EAPI();
  const maybeZowe = await Utils.getZoweExplorerAPI();
  const copyBooksDownloader = new CopybookDownloadService(
    context.globalStorageUri.fsPath,
    maybeZowe && "api" in maybeZowe ? maybeZowe.api : undefined,
    maybeE4E && "api" in maybeE4E ? maybeE4E.api : undefined,
    outputChannel,
  );
  if (maybeZowe && "futureApi" in maybeZowe) {
    maybeZowe.futureApi.then((api) => {
      if (api) copyBooksDownloader.explorerAppeared(api.api);
    });
  }

  if (!maybeE4E) outputChannel.appendLine(E4E_INCOMPATIBLE);
  else if ("futureApi" in maybeE4E)
    maybeE4E.futureApi.then((api) => {
      if (api) copyBooksDownloader.e4eAppeared(api.api);
      else outputChannel.appendLine(E4E_INCOMPATIBLE);
    });

  languageClientService = new LanguageClientService(
    outputChannel,
    context.globalStorageUri,
  );
  const configurationWatcher = new ConfigurationWatcher();

  return {
    copyBooksDownloader,
    configurationWatcher,
  };
}

export function getChannel(): vscode.OutputChannel {
  return outputChannel;
}

export async function activate(
  context: vscode.ExtensionContext,
): Promise<__ExtensionApi & __AnalysisApi> {
  DialectRegistry.clear();
  const { copyBooksDownloader, configurationWatcher } = await initialize(
    context,
  );
  initSmartTab(context);

  TelemetryService.registerEvent(
    "log",
    ["bootstrap", "experiment-tag"],
    "Extension activation event was triggered",
  );

  // Register Commands
  registerCommands(context, copyBooksDownloader);

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
  } catch (err: any) {
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
    resolveSubroutineURI.bind(undefined, context.globalStorageUri.fsPath),
  );
  languageClientService.addRequestHandler(
    "copybook/resolve",
    copyBooksDownloader.makeResolveCopybookHandler(),
  );
  languageClientService.addRequestHandler(
    "copybook/download",
    copyBooksDownloader.makeCopybookDownloadHandler(),
  );
  languageClientService.addRequestHandler(
    "workspace/configuration",
    configHandler,
  );

  await languageClientService.start();

  // 'export' public api-surface
  return {
    v1: {
      async registerDialect(extensionId: string, dialect: unknown) {
        if (
          typeof extensionId !== "string" ||
          !isV1RuntimeDialectDetail(dialect)
        ) {
          throw Error("Invalid `dialect` argument" + JSON.stringify(dialect));
        }
        return registerNewDialect(extensionId, {
          name: dialect.name,
          description: dialect.description,
          jar: vscode.Uri.parse(dialect.jar, true),
          snippets: vscode.Uri.parse(dialect.snippets, true),
        });
      },
    },
    version: API_VERSION,
    analysis(uri: string, text: string): Promise<any> {
      return languageClientService.retrieveAnalysis(uri, text);
    },
  };
}

export function deactivate() {
  return languageClientService.stop();
}

export interface DialectDetail {
  name: string;
  description: string;
  jar: vscode.Uri;
  snippets: vscode.Uri;
}

const registerNewDialect = async (
  extensionId: string,
  dialect: DialectDetail,
) => {
  outputChannel.appendLine(
    "Register new dialect: \r\n" + JSON.stringify(dialect),
  );

  try {
    await vscode.workspace.fs.stat(dialect.jar);
  } catch (_error) {
    return Error(`Dialect jar file ${dialect.jar.fsPath} does not exist`);
  }

  try {
    await vscode.workspace.fs.stat(dialect.snippets);
  } catch (_error) {
    return Error(`Dialect snippets file ${dialect.jar.fsPath} does not exist`);
  }

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
        clearCache(context.globalStorageUri);
        copyBooksDownloader.clearCache();
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

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.open.copybook.internalfolder",
      async () => {
        const copybookFolder = vscode.Uri.file(
          path.join(context.globalStorageUri.fsPath, ZOWE_FOLDER),
        );
        try {
          await vscode.workspace.fs.createDirectory(copybookFolder);
          await vscode.commands.executeCommand(
            "revealFileInOS",
            copybookFolder,
          );
        } catch (error) {
          vscode.window.showErrorMessage(FAIL_CREATE_COPYBOOK_FOLDER_MSG);
          outputChannel.appendLine(
            `${FAIL_CREATE_COPYBOOK_FOLDER_MSG} : ${error}`,
          );
        }
      },
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.analysis.runAnalysis",
      async () => {
        const tempAnalysis: RunAnalysis = new RunAnalysis(
          context.globalStorageUri,
          context.extensionUri,
        );
        await tempAnalysis.runCobolAnalysisCommand();
      },
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
