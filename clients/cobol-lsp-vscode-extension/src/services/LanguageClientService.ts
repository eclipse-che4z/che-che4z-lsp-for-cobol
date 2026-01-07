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
  type FileEvent,
  GenericNotificationHandler,
  GenericRequestHandler,
  LanguageClient,
  LanguageClientOptions,
  type Middleware,
  CloseAction,
  ErrorAction,
} from "vscode-languageclient/node";
import { HP_LANGUAGE_ID, EXP_LANGUAGE_ID, LANGUAGE_ID } from "../constants";
import { localCopybooks } from "./copybookLibs/LocalPathLib";
import { startJavaServer } from "./languageClient/JavaServer";
import { startNativeServer } from "./languageClient/NativeServer";
import { Server, ServerInitError } from "./languageClient/ServerTypes";
import { startSocketServer } from "./languageClient/SocketServer";
import { outputChannel } from "./util/OutputChannel";

type Handler = (languageClient: LanguageClient) => void;

export class LanguageClientService {
  private languageClient: LanguageClient | undefined;
  private watchers: vscode.FileSystemWatcher[];
  private handlers: Handler[] = [];

  constructor(
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

  /**
   * @returns client started successfully
   */
  public async start(servers: Server[]): Promise<ServerInitError[]> {
    if (!servers.length) {
      outputChannel.error("No COBOL language server to start.");
      return [
        new ServerInitError(
          "No COBOL language server to start. Check the extension output for warnings and errors.",
          "Server Runtime",
        ),
      ];
    }
    const clientOptions = getClientOptions(this.middleware, this.watchers);
    const errors: ServerInitError[] = [];
    for (const server of servers) {
      const languageClient = await startServer(server, clientOptions);
      if (languageClient instanceof LanguageClient) {
        this.handlers.forEach((handler) => handler(languageClient));
        this.languageClient = languageClient;
        return [];
      }
      errors.push(languageClient);
    }
    return errors;
  }

  public dispose() {
    clearTimeout(this.fileChangeTimer);
    this.fileChanges = [];
    const languageClient = this.languageClient;
    this.languageClient = undefined;
    if (languageClient) {
      return languageClient.dispose();
    }
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

function startServer(
  server: Server,
  clientOptions: LanguageClientOptions,
): Promise<LanguageClient | ServerInitError> {
  switch (server.kind) {
    case "SOCKET":
      return startSocketServer(server.port, clientOptions);
    case "JAVA":
      return startJavaServer(server, clientOptions);
    case "NATIVE":
      return startNativeServer(server, clientOptions);
    default: {
      const exhaustiveCheck: never = server;
      throw new Error(exhaustiveCheck);
    }
  }
}
