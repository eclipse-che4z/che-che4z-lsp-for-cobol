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
  CloseAction,
  ErrorAction,
} from "vscode-languageclient";
import {
  HP_LANGUAGE_ID,
  EXP_LANGUAGE_ID,
  LANGUAGE_ID,
  MINIMUM_JAVA_VERSION,
} from "../constants";
import { localCopybooks } from "./copybookLibs/LocalPathLib";
import { startJavaServer } from "./languageClient/JavaServer";
import { startNativeServer } from "./languageClient/NativeSever";
import { ServerState } from "./languageClient/ServerTypes";
import { startSocketServer } from "./languageClient/SocketServer";
import { CodeAction } from "../__mocks__/vscode";

export class LanguageClientService {
  private languageClient: BaseLanguageClient | undefined;
  private watchers: vscode.FileSystemWatcher[];
  private handlers: Array<(languageClient: BaseLanguageClient) => void> = [];

  constructor(
    private readonly extensionId: string,
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

  public async start(state: ServerState) {
    const clientOptions = getClientOptions(
      this.outputChannel,
      this.middleware,
      this.watchers,
    );
    if (state.port) {
      const languageClient = await startSocketServer(
        this.outputChannel,
        state.port,
        clientOptions,
        this.handlers,
      );
      if (languageClient) {
        this.languageClient = languageClient;
        return;
      }
    } else {
      if (state.preference === "JAVA") {
        const languageClient = await startJavaServer(
          this.outputChannel,
          state.java,
          clientOptions,
          this.handlers,
        );
        if (languageClient) {
          this.languageClient = languageClient;
          return;
        }
      }
      const languageClient = await startNativeServer(
        state.native,
        clientOptions,
        this.handlers,
      );
      if (languageClient) {
        this.languageClient = languageClient;
        return;
      }
    }
    showInfo(state.preference, this.extensionId, state.port);
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
  outputChannel: vscode.LogOutputChannel,
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
    errorHandler: {
      error: () => ({ action: ErrorAction.Shutdown }),
      closed: () => ({ action: CloseAction.DoNotRestart }),
    },
  };
}

function showInfo(
  serverType: "SOCKET" | "JAVA" | "NATIVE",
  extensionId: string,
  port: number,
) {
  const message =
    serverType === "NATIVE"
      ? "Native Server Runtime failed to start. Select Java Server Runtime in the extension settings and reload VS Code"
      : serverType === "JAVA"
        ? `Both Java and Native Server Runtimes failed to start. Ensure that the Java runtime specified in the Java Home setting is version ${MINIMUM_JAVA_VERSION} or later`
        : `Failed connecting to language server through socket on localhost:${port}`;
  vscode.window
    .showInformationMessage(message, "Settings")
    .then((selection) => {
      if (selection === "Settings") {
        vscode.commands.executeCommand(
          "workbench.action.openSettings",
          `@ext:${extensionId}`,
        );
      }
    });
}
