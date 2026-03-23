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
import type { Middleware } from "vscode-languageclient";
import { gotoCopybookSettings } from "./commands/OpenSettingsCommand";
import type {
  __ExtensionApi,
  CopyStatementParser,
  V2DialectDetail,
  V2StartProcessingHandler,
} from "@code4z/cobol-dialect-api";
import {
  isV1RuntimeDialectDetail,
  isV2RuntimeDialectDetail,
} from "./dialect/utils";
import {
  EXP_LANGUAGE_ID,
  FAIL_CREATE_COPYBOOK_FOLDER_MSG,
  FAIL_CREATE_GLOBAL_STORAGE_MSG,
  HP_LANGUAGE_ID,
  LANGUAGE_ID,
  ZOWE_FOLDER,
} from "./constants";
import type { ExternalAPIsService } from "./services/ExternalAPIsService";
import {
  deleteDiagnostics,
  initializeExternalAPIs,
} from "./services/ExternalAPIsService";
import { CopybooksCodeActionProvider } from "./services/copybook/CopybooksCodeActionProvider";

import { RunAnalysis } from "./commands/RunAnalysisCLI";

import { clearCache } from "./commands/ClearCopybookCacheCommand";
import { CommentAction, commentCommand } from "./commands/CommentCommand";
import { initSmartTab, RangeTabShiftStore } from "./commands/SmartTabCommand";
import { DialectRegistry } from "./dialect/DialectRegistry";
import { LanguageClientService } from "./services/LanguageClientService";
import { lspConfigHandler, SettingsService } from "./services/Settings";
import {
  pickSnippet,
  SnippetCompletionProvider,
} from "./services/snippetcompletion/SnippetCompletionProvider";
import { resolveSubroutineURI } from "./services/util/SubroutineUtils";
import { ServerRuntimeCodeActionProvider } from "./services/nativeLanguageClient/serverRuntimeCodeActionProvider";
import { ConfigurationWatcher } from "./services/util/ConfigurationWatcher";
import * as path from "node:path";
import { getErrorMessage } from "./services/util/ErrorsUtils";
import {
  initTelemetry,
  telemetryEvent,
  telemetryExceptionEvent,
} from "./services/reporter";
import { CopybooksCompletionProvider } from "./services/copybook/CopybooksCompletionProvider";
import { SubroutinesCompletionsProvider } from "./services/subroutines/SubroutinesCompletionsProvider";
import {
  AnalysisResult,
  ControlFlowAnalysisService,
} from "./services/ControlFlowService";
import {
  readFileContent,
  resolveCopybookURI,
} from "./services/copybook/CopybookMessageHandler";
import { invalidateConfig } from "./services/ProcessorGroupsLoader";
import { outputChannel } from "./services/util/OutputChannel";
import { DialectService } from "./dialect/DialectService";
import { createSampleConfiguration } from "./commands/CreateSampleConfiguration";
import { RENUM_LEFT, RENUM_RIGHT, RenumHandler } from "./commands/RenumCommand";
import { TarCopybookFileSystemProvider } from "./provider/TarCopybookFileSystemProvider";
import { getTarCached } from "./services/util/TarUtil";

interface __AnalysisApi {
  analysis(uri: string, text: string, pos?: vscode.Position): Promise<unknown>;
  getControlFlowAnalysis(documentUri: string): Promise<AnalysisResult>;
}

const API_VERSION: string = "1.0.1";

export async function activate(
  context: vscode.ExtensionContext,
): Promise<__ExtensionApi & __AnalysisApi> {
  await initTelemetry(context);
  telemetryEvent(
    "log",
    ["bootstrap", "experiment-tag"],
    "Extension activation event was triggered",
  );
  telemetryEvent(
    "analysis-mode",
    ["bootstrap", "analysis-mode"],
    `COBOL LS is being used in ${SettingsService.getAnalysisMode()} mode`,
  );

  await createExtensionFolder(context);

  initSmartTab(context);

  let externalApis: ExternalAPIsService | undefined = undefined;
  const { cobolTarFsProvider, tarCache } = initTarFsProvider();
  context.subscriptions.push(
    vscode.workspace.registerFileSystemProvider(
      TarCopybookFileSystemProvider.SCHEME,
      cobolTarFsProvider,
      {
        isReadonly: true,
      },
    ),
  );

  const languageClientService = await initializeLanguageClientService(context, {
    executeCommand: (command, args, next) => {
      if (command == "missing copybook") {
        externalApis?.clearProfiles();
      }
      next(command, args);
    },
  });

  externalApis = await initializeExternalAPIs(
    context.globalStorageUri,
    languageClientService.invalidateConfiguration,
    tarCache,
  );

  const analysisService = new ControlFlowAnalysisService(
    outputChannel,
    vscode.window.createOutputChannel("COBOL Language Support Control Flow", {
      log: true,
    }),
  );
  languageClientService.addNotificationHandler(
    "cfast/ready",
    analysisService.makeControlFlowAstNotificationHandler(),
  );

  DialectRegistry.clear();
  const dialectService = new DialectService(
    languageClientService,
    outputChannel,
  );

  registerCommands(context, externalApis);
  registerEditorCommands(context);
  registerCodeActions(context);
  registerCompletions(context);
  registerEvents(context, analysisService);

  const configurationWatcher = new ConfigurationWatcher();
  configurationWatcher.watchConfigurationChanges();

  await languageClientService.start(context);

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
        return registerNewDialectV1(languageClientService, extensionId, {
          name: dialect.name,
          description: dialect.description,
          jar: vscode.Uri.parse(dialect.jar, true),
          snippets: vscode.Uri.parse(dialect.snippets, true),
          isCopyStatement: dialect.isCopyStatement,
        });
      },
    },
    v2: {
      async registerDialect(
        extensionId: string,
        dialect: V2DialectDetail,
        handler: V2StartProcessingHandler,
      ) {
        if (
          typeof extensionId !== "string" ||
          !isV2RuntimeDialectDetail(dialect)
        ) {
          throw Error("Invalid `dialect` argument" + JSON.stringify(dialect));
        }
        return registerNewDialectV2(
          languageClientService,
          extensionId,
          {
            name: dialect.name,
            description: dialect.description,
            snippets: dialect.snippets,
            isCopyStatement: dialect.isCopyStatement,
          },
          handler,
          dialectService,
        );
      },
    },
    version: API_VERSION,
    analysis(uri: string, text: string, pos?: vscode.Position) {
      return languageClientService.retrieveAnalysis(
        uri,
        text,
        pos || findPosition(uri),
      );
    },
    getControlFlowAnalysis(documentUri: string) {
      return analysisService.getAnalysis(documentUri);
    },
  };
}

async function createExtensionFolder(context: vscode.ExtensionContext) {
  try {
    await vscode.workspace.fs.createDirectory(context.globalStorageUri);
  } catch (error) {
    const message = `${FAIL_CREATE_GLOBAL_STORAGE_MSG}: ${getErrorMessage(
      error,
    )}`;
    outputChannel.appendLine(message);
    telemetryExceptionEvent(
      "GlobalStorageFolderCreationFailed",
      message,
      ["bootstrap", "folder-creation-failure"],
      "The creation of `context.globalStorageUri` folder has failed",
    );
    throw Error(message);
  }
}

async function initializeLanguageClientService(
  context: vscode.ExtensionContext,
  middleware: Middleware,
) {
  const languageClientService = new LanguageClientService(
    outputChannel,
    context.globalStorageUri,
    middleware,
  );
  context.subscriptions.push(languageClientService);

  languageClientService.addRequestHandler(
    "cobol/resolveSubroutine",
    resolveSubroutineURI,
  );
  languageClientService.addRequestHandler(
    "workspace/configuration",
    (r: Parameters<typeof lspConfigHandler>[0]) => lspConfigHandler(r),
  );
  languageClientService.addRequestHandler(
    "copybook/resolve",
    resolveCopybookURI,
  );
  languageClientService.addRequestHandler("file/content", readFileContent);

  try {
    if (SettingsService.serverRuntime() === "NATIVE") {
      languageClientService.enableNativeBuild();
    } else {
      await languageClientService.checkPrerequisites();
    }
  } catch (err) {
    if (err instanceof Error) {
      outputChannel.appendLine(err.toString());
      languageClientService.enableNativeBuild();
      telemetryExceptionEvent(
        "RuntimeException",
        err.toString(),
        ["bootstrap", "experiment-tag"],
        "Client has wrong Java version installed. Native builds activated.",
      );
    }
  }

  return languageClientService;
}

function findPosition(uri: string): vscode.Position {
  for (const e of vscode.window.visibleTextEditors) {
    if (e.document.uri.toString() === uri) {
      return e.selection.start;
    }
  }
  outputChannel.appendLine(
    "Cant find editor for " + uri + " the first program/function will be used.",
  );
  return new vscode.Position(0, 0);
}

export interface DialectDetailV1 {
  name: string;
  description: string;
  jar: vscode.Uri;
  snippets: vscode.Uri;
  isCopyStatement?: CopyStatementParser;
}

export interface DialectDetailV2 {
  name: string;
  description: string;
  snippets: vscode.Uri;
  isCopyStatement?: CopyStatementParser;
}

const registerNewDialectV1 = async (
  languageClientService: LanguageClientService,
  extensionId: string,
  dialect: DialectDetailV1,
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
    return Error(
      `Dialect snippets file ${dialect.snippets.fsPath} does not exist`,
    );
  }

  DialectRegistry.registerV1(
    extensionId,
    dialect.name,
    dialect.jar,
    dialect.description,
    dialect.snippets.fsPath,
    dialect.isCopyStatement,
  );
  outputChannel.appendLine("Restart analysis");
  await languageClientService.invalidateConfiguration();

  const unregisterDialect = async () => {
    DialectRegistry.unregister(dialect.name);
    await languageClientService.invalidateConfiguration();
  };

  return unregisterDialect;
};

const registerNewDialectV2 = async (
  languageClientService: LanguageClientService,
  extensionId: string,
  dialect: DialectDetailV2,
  handler: V2StartProcessingHandler,
  dialectService: DialectService,
) => {
  outputChannel.appendLine(
    "Register new dialect: \r\n" + JSON.stringify(dialect),
  );

  try {
    await vscode.workspace.fs.stat(dialect.snippets);
  } catch (_error) {
    return Error(
      `Dialect snippets file ${dialect.snippets.toString()} does not exist`,
    );
  }
  DialectRegistry.registerV2(
    extensionId,
    dialect.name,
    dialect.description,
    dialect.snippets,
    dialect.isCopyStatement,
  );
  dialectService.registerStartHandler(dialect.name, handler);

  outputChannel.appendLine("Restart analysis");
  await languageClientService.invalidateConfiguration();

  const unregisterDialect: vscode.Disposable = new vscode.Disposable(
    async () => {
      dialectService.unregisterStartHandler(dialect.name);
      DialectRegistry.unregister(dialect.name);
      await languageClientService.invalidateConfiguration();
    },
  );
  return unregisterDialect;
};

function registerCommands(
  context: vscode.ExtensionContext,
  externalApis: ExternalAPIsService,
) {
  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.cpy-manager.goto-settings",
      () => {
        gotoCopybookSettings();
      },
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.clear.downloaded.copybooks",
      async () => {
        await clearCache(context.globalStorageUri);
        externalApis.clearCache();
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
    vscode.commands.registerCommand(
      "cobol-lsp.snippets.insertSnippets",
      async () => {
        await pickSnippet();
      },
    ),
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
          if (
            (await vscode.commands.getCommands()).includes("revealFileInOS")
          ) {
            await vscode.commands.executeCommand(
              "revealFileInOS",
              copybookFolder,
            );
          } else {
            vscode.window.showInformationMessage(
              `Internal copybooks folder: '${copybookFolder.toString()}'`,
            );
          }
        } catch (error) {
          vscode.window.showErrorMessage(FAIL_CREATE_COPYBOOK_FOLDER_MSG);
          outputChannel.appendLine(
            `${FAIL_CREATE_COPYBOOK_FOLDER_MSG} : ${getErrorMessage(error)}`,
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

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.cpy-manager.reenable.failed.zowe.requests",
      () => {
        externalApis.reenableFailedRequests();
      },
    ),
  );

  context.subscriptions.push(
    vscode.commands.registerCommand(
      "cobol-lsp.configuration.create-sample",
      createSampleConfiguration,
    ),
  );
}

function registerEditorCommands(context: vscode.ExtensionContext) {
  context.subscriptions.push(
    vscode.commands.registerTextEditorCommand(
      "cobol-lsp.editor.renumLeft",
      (textEditor: vscode.TextEditor, edit: vscode.TextEditorEdit) =>
        RenumHandler(textEditor, edit, true, RENUM_LEFT),
    ),
  );
  context.subscriptions.push(
    vscode.commands.registerTextEditorCommand(
      "cobol-lsp.editor.renumRight",
      (textEditor: vscode.TextEditor, edit: vscode.TextEditorEdit) =>
        RenumHandler(textEditor, edit, true, RENUM_RIGHT),
    ),
  );
  context.subscriptions.push(
    vscode.commands.registerTextEditorCommand(
      "cobol-lsp.editor.unNumberLeft",
      (textEditor: vscode.TextEditor, edit: vscode.TextEditorEdit) =>
        RenumHandler(textEditor, edit, false, RENUM_LEFT),
    ),
  );
  context.subscriptions.push(
    vscode.commands.registerTextEditorCommand(
      "cobol-lsp.editor.unNumberRight",
      (textEditor: vscode.TextEditor, edit: vscode.TextEditorEdit) =>
        RenumHandler(textEditor, edit, false, RENUM_RIGHT),
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

function registerEvents(
  context: vscode.ExtensionContext,
  analysisService: ControlFlowAnalysisService,
) {
  context.subscriptions.push(
    vscode.window.onDidChangeActiveTextEditor((_e) =>
      RangeTabShiftStore.reset(),
    ),
  );

  context.subscriptions.push(
    vscode.workspace.onDidChangeTextDocument((event) =>
      analysisService.invalidate(event.document.uri.toString(), false),
    ),
  );

  context.subscriptions.push(
    vscode.workspace.onDidCloseTextDocument((document) => {
      void analysisService.invalidate(document.uri.toString(), true);
      invalidateConfig(document.uri);
      deleteDiagnostics(document.uri);
    }),
  );
}

function registerCompletions(context: vscode.ExtensionContext) {
  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      { language: LANGUAGE_ID },
      new SnippetCompletionProvider(context),
    ),
  );

  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      [LANGUAGE_ID, EXP_LANGUAGE_ID, HP_LANGUAGE_ID],
      new CopybooksCompletionProvider(),
    ),
  );

  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      [LANGUAGE_ID, EXP_LANGUAGE_ID, HP_LANGUAGE_ID],
      new SubroutinesCompletionsProvider(),
    ),
  );
}
function initTarFsProvider() {
  const emitter = new vscode.EventEmitter<vscode.FileChangeEvent[]>();
  const tarCache = getTarCached(emitter);
  const cobolTarFsProvider = new TarCopybookFileSystemProvider(
    tarCache,
    emitter,
  );
  return { cobolTarFsProvider, tarCache };
}
