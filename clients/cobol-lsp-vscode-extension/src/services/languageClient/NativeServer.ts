import * as vscode from "vscode";
import { outputChannel } from "../util/OutputChannel";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
} from "vscode-languageclient/node";
import type { NativeServer } from "./ServerTypes";
import { EXTENSION_NAME, LANGUAGE_ID } from "../../constants";

export async function startNativeServer(
  server: NativeServer,
  clientOptions: LanguageClientOptions,
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
    EXTENSION_NAME,
    serverOptions,
    clientOptions,
  );
  clientOptions.errorHandler = languageClient.createDefaultErrorHandler(0);
  outputChannel.info("Staring language client with NATIVE language server.");
  try {
    await languageClient.start();
  } catch (_e) {
    // language client prints actual command and error to output as info message
    outputChannel.error(`Starting language client with NATIVE server FAILED.`);
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
