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

import type { Server } from "./languageClient/ServerSettings";
import {
  DidChangeConfigurationNotification,
  DidChangeWatchedFilesNotification,
  FileChangeType,
  FileEvent,
  GenericNotificationHandler,
  GenericRequestHandler,
  BaseLanguageClient,
  LanguageClientOptions,
  Middleware,
} from "vscode-languageclient";
import { HP_LANGUAGE_ID, EXP_LANGUAGE_ID, LANGUAGE_ID } from "../constants";
import { localCopybooks } from "./copybookLibs/LocalPathLib";
import { startJavaServer } from "./languageClient/JavaServer";
import { startNativeServer } from "./languageClient/NativeSever";

export class LanguageClientService {
  private languageClient: BaseLanguageClient | undefined;
  private watchers: vscode.FileSystemWatcher[];
  private handlers: Array<(languageClient: BaseLanguageClient) => void> = [];

  constructor(
    private readonly outputChannel: vscode.LogOutputChannel,
    private readonly copybookCacheLocations: vscode.Uri[],
    private readonly middleware: Middleware,
  ) {
    this.watchers = [
      ...this.copybookCacheLocations.map((uri) =>
        vscode.workspace.createFileSystemWatcher(
          new vscode.RelativePattern(uri, "**/*"),
        ),
      ),
      vscode.workspace.createFileSystemWatcher(
        new vscode.RelativePattern(
          vscode.Uri.from({ scheme: "zowe-uss", path: "/" }),
          "**/*",
        ),
      ),
      vscode.workspace.createFileSystemWatcher(
        new vscode.RelativePattern(
          vscode.Uri.from({ scheme: "zowe-ds", path: "/" }),
          "**/*",
        ),
      ),
    ];
    localCopybooks.registerFileChangeWatcher((uri) =>
      this.sendFileChangeNotification(uri),
    );
  }

  public async start(server: Server) {
    const clientOptions = getClientOptions(
      this.outputChannel,
      this.middleware,
      this.watchers,
    );
    if (server.kind === "JAVA") {
      const languageClient = await startJavaServer(
        server,
        clientOptions,
        this.handlers,
      );
      if (languageClient instanceof Error) {
        this.outputChannel.error(
          "Failed to start java language server.",
          languageClient,
        );
        return;
      }
      this.languageClient = languageClient;
    }
    if (server.kind === "NATIVE") {
      const languageClient = await startNativeServer(
        server,
        clientOptions,
        this.handlers,
      );
      if (languageClient instanceof Error) {
        this.outputChannel.error(
          "Failed to start native language server.",
          languageClient,
        );
        return;
      }
      this.languageClient = languageClient;
    }
  }

  public dispose() {
    clearTimeout(this.fileChangeTimer);
    this.fileChanges = [];
    const languageClient = this.languageClient;
    this.languageClient = undefined;
    return languageClient?.dispose();
  }

  public addNotificationHandler(
    method: string,
    handler: GenericNotificationHandler,
  ): void {
    this.handlers.push((languageClient) =>
      languageClient.onNotification(method, handler),
    );
  }

  public addRequestHandler<R, E>(
    method: string,
    handler: GenericRequestHandler<R, E>,
  ): void {
    this.handlers.push((languageClient) =>
      languageClient.onRequest(method, handler),
    );
  }

  public async retrieveAnalysis(
    uri: string,
    text: string,
    position: vscode.Position,
  ) {
    // TODO find out types for analysis retrieval and type APIs properly across extensions
    if (!this.languageClient) {
      return { programs: [] };
    }

    return this.languageClient.sendRequest("extended/analysis", {
      uri,
      text,
      line: position.line,
      character: position.character,
    });
  }

  public invalidateConfiguration = async () => {
    if (!this.languageClient) return;
    await this.languageClient.sendNotification(
      DidChangeConfigurationNotification.type,
      {
        settings: null,
      },
    );
  };

  private fileChanges: FileEvent[] = [];
  private fileChangeTimer: ReturnType<typeof setTimeout> | undefined =
    undefined;
  private sendFileChangeNotification(file: vscode.Uri) {
    if (!this.languageClient) return;
    this.fileChanges.push({
      uri: file.toString(),
      type: FileChangeType.Changed,
    });
    if (this.fileChangeTimer !== undefined) return;
    this.fileChangeTimer = setTimeout(() => {
      const changes = this.fileChanges;
      this.fileChangeTimer = undefined;
      this.fileChanges = [];

      const languageClient = this.languageClient;
      if (!languageClient) return;
      void languageClient.sendNotification(
        DidChangeWatchedFilesNotification.type,
        {
          changes,
        },
      );
    }, 250);
  }
}

function getClientOptions(
  outputChannel: vscode.OutputChannel,
  middleware: Middleware,
  fileEvents: vscode.FileSystemWatcher[],
): LanguageClientOptions {
  return {
    middleware,
    documentSelector: [LANGUAGE_ID, EXP_LANGUAGE_ID, HP_LANGUAGE_ID],
    outputChannel,
    synchronize: {
      fileEvents,
    },
  };
}

// function infoUserAboutRuntimeAbilities(extensionId: string) {
//   const message =
//     SettingsService.serverRuntime() === "NATIVE"
//       ? "Native Server Runtime failed to start. Select Java Server Runtime in the extension settings and reload VS Code"
//       : `Both Java and Native Server Runtimes failed to start. Ensure that the binaries specified in the Java Home setting are version ${SUPPORTED_JAVA_VERSION} or later`;
//   vscode.window
//     .showInformationMessage(message, "Settings")
//     .then((selection) => {
//       if (selection === "Settings") {
//         vscode.commands.executeCommand(
//           "workbench.action.openSettings",
//           `@ext:${extensionId}`,
//         );
//       }
//     });
// }

// async function start() {
//   const languageClient = this.getLanguageClient();
//   try {
//     await languageClient.start();
//   } catch {
//     infoUserAboutRuntimeAbilities(extensionId);
//   }
// }

// async function checkPrerequisites() {
//   const version = await new JavaCheck().getInstalledJavaVersion();
//   if (!SettingsService.getLspPort() && !fs.existsSync(this.executablePath)) {
//     throw new Error("LSP server for " + LANGUAGE_ID + " not found");
//   }
//   telemetryEvent("log", ["bootstrap", "java-version"], `${version}`);
// }
