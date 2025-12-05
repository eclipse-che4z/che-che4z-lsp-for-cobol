import * as vscode from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
} from "vscode-languageclient/node";
import type { NativeServer } from "./ServerTypes";
import { LANGUAGE_ID } from "../../constants";

export async function startNativeServer(
  server: NativeServer,
  clientOptions: LanguageClientOptions,
  handlers: Array<(languageClient: LanguageClient) => void> = [],
): Promise<LanguageClient | Error> {
  const serverOptions: ServerOptions = {
    command: server.command.fsPath,
    args: [
      "pipeEnabled",
      "-Dline.separator=\r\n",
      "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener",
      "-DserverType=NATIVE",
    ],
    options: {
      detached: false,
      cwd: vscode.Uri.joinPath(server.command, "..").fsPath,
    },
  };

  const languageClient = new LanguageClient(
    LANGUAGE_ID,
    "COBOL Language Support",
    serverOptions,
    clientOptions,
  );

  handlers.forEach((handler) => handler(languageClient));

  try {
    await languageClient.start();
  } catch (e) {
    return new AggregateError(
      [e],
      `Failed starting language client with native server: ${JSON.stringify(server)}`,
    );
  }

  return languageClient;
}
