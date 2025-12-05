import * as vscode from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
} from "vscode-languageclient/node";
import type { NativeServer } from "./ServerTypes";
import { LANGUAGE_ID } from "../../constants";
import { outputChannel } from "../util/OutputChannel";

export async function startNativeServer(
  server: NativeServer,
  clientOptions: LanguageClientOptions,
  handlers: Array<(languageClient: LanguageClient) => void> = [],
): Promise<LanguageClient | undefined> {
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
  clientOptions.errorHandler = languageClient.createDefaultErrorHandler(0);

  handlers.forEach((handler) => handler(languageClient));

  outputChannel.info("Staring language client with NATIVE language server");
  try {
    await languageClient.start();
  } catch (e) {
    outputChannel.error(`Starting language client with NATIVE server FAILED.`);
    if (e instanceof Error) {
      outputChannel.debug(e.message, e.stack);
    } else {
      outputChannel.debug(JSON.stringify(e));
    }
    return;
  }
  if (languageClient.state === State.Stopped) {
    outputChannel.error(
      `Starting language client with NATIVE language server FAILED.`,
    );
    return;
  }
  outputChannel.info("Language client with NATIVE language server STARTED");

  return languageClient;
}
