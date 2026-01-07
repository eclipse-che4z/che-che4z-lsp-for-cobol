import * as vscode from "vscode";
import { outputChannel } from "../util/OutputChannel";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
} from "vscode-languageclient/node";
import { NativeServer, ServerInitError } from "./ServerTypes";
import { EXTENSION_NAME, LANGUAGE_ID } from "../../constants";

export async function startNativeServer(
  server: NativeServer,
  clientOptions: LanguageClientOptions,
): Promise<LanguageClient | ServerInitError> {
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
  const initError = `Native language server ${server.command.fsPath} failed to start. Make sure the server binary is executable and not being blocked by your security software. To use a Java server select Server Runtime "JAVA" in the extension settings and reload VS Code.`;
  try {
    await languageClient.start();
  } catch (e) {
    if (e instanceof Error) {
      outputChannel.error(e);
    } else {
      outputChannel.error(JSON.stringify(e));
    }
    outputChannel.error(`Starting language client with NATIVE server FAILED.`);
    return new ServerInitError(initError);
  }
  if (languageClient.state === State.Stopped) {
    outputChannel.error(
      `Starting language client with NATIVE language server FAILED.`,
    );
    return new ServerInitError(initError);
  }
  outputChannel.info("Language client with NATIVE language server STARTED");

  return languageClient;
}
