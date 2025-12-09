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
  type LanguageClient,
  LanguageClientOptions,
  type Middleware,
  CloseAction,
  ErrorAction,
} from "vscode-languageclient/node";
import {
  HP_LANGUAGE_ID,
  EXP_LANGUAGE_ID,
  LANGUAGE_ID,
  MINIMUM_JAVA_VERSION,
} from "../constants";
import { localCopybooks } from "./copybookLibs/LocalPathLib";
import { startJavaServer } from "./languageClient/JavaServer";
import { startNativeServer } from "./languageClient/NativeSever";
import { Server } from "./languageClient/ServerTypes";
import { startSocketServer } from "./languageClient/SocketServer";
import { outputChannel } from "./util/OutputChannel";

type Handler = (languageClient: LanguageClient) => void;

export class LanguageClientService {
  private languageClient: LanguageClient | undefined;
  private watchers: vscode.FileSystemWatcher[];
  private handlers: Handler[] = [];

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

  public async start(servers: Server[]) {
    if (!servers.length) {
      this.outputChannel.error("No server to start");
      return;
    }
    const clientOptions = getClientOptions(
      this.outputChannel,
      this.middleware,
      this.watchers,
    );
    for (const server of servers) {
      const languageClient = await startServer(
        this.outputChannel,
        server,
        clientOptions,
        this.handlers,
      );
      if (languageClient) {
        this.languageClient = languageClient;
        return;
      }
    }
    void showInfo(servers, this.extensionId);
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

async function startServer(
  outputChannel: vscode.LogOutputChannel,
  server: Server,
  clientOptions: LanguageClientOptions,
  handlers: Handler[],
): Promise<LanguageClient | undefined> {
  switch (server.kind) {
    case "SOCKET":
      return await startSocketServer(server.port, clientOptions, handlers);
    case "JAVA":
      return await startJavaServer(server, clientOptions, handlers);
    case "NATIVE":
      return startNativeServer(server, clientOptions, handlers);
    default: {
      const exhaustiveCheck: never = server;
      throw new Error(exhaustiveCheck);
    }
  }
}

async function showInfo(failed: Server[], extensionId: string) {
  const messages = failed.map((server) => {
    switch (server.kind) {
      case "SOCKET":
        return `Failed connecting to language server through socket on localhost:${server.port}.`;
      case "JAVA":
        return `Java language server failed to start.`;
      case "NATIVE":
        return `Native language server failed to start.`;
      default: {
        const exhaustiveCheck: never = server;
        throw new Error(exhaustiveCheck);
      }
    }
  });
  if (failed.some((server) => server.kind == "JAVA")) {
    messages.push(
      `Ensure that the Java runtime specified in the Java Home setting is version ${MINIMUM_JAVA_VERSION} or later.`,
    );
  } else if (failed.some((server) => server.kind == "NATIVE")) {
    messages.push(
      "Select Java Server Runtime in the extension settings and reload VS Code.",
    );
  }
  const selection = await vscode.window.showInformationMessage(
    messages.join("\n"),
    "Settings",
    "Go to output",
  );
  switch (selection) {
    case "Settings":
      vscode.commands.executeCommand(
        "workbench.action.openSettings",
        `@ext:${extensionId}`,
      );
      break;
    case "Go to output":
      outputChannel.show();
      break;
  }
}
