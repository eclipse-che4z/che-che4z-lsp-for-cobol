import { outputChannel } from "../util/OutputChannel";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
} from "vscode-languageclient/node";
import type { JavaServer } from "./ServerTypes";
import { EXTENSION_NAME, LANGUAGE_ID } from "../../constants";

export async function startJavaServer(
  server: JavaServer,
  clientOptions: LanguageClientOptions,
): Promise<LanguageClient | undefined> {
  const serverOptions: ServerOptions = {
    command: server.command,
    args: [
      "-Dline.separator=\r\n",
      `-Ddialect.path=${server.dialects.fsPath}`,
      "-Xmx768M",
      "-jar",
      server.jar.fsPath,
      "pipeEnabled",
    ],
    options: { detached: false },
  };
  const languageClient = new LanguageClient(
    LANGUAGE_ID,
    EXTENSION_NAME,
    serverOptions,
    clientOptions,
  );
  clientOptions.errorHandler = languageClient.createDefaultErrorHandler(0);
  outputChannel.info("Staring language client with JAVA language server.");
  try {
    await languageClient.start();
  } catch (e) {
    outputChannel.error(`Starting language client with JAVA server FAILED.`);
    if (e instanceof Error) {
      outputChannel.error(e);
    } else {
      outputChannel.error(JSON.stringify(e));
    }
    return;
  }
  if (languageClient.state === State.Stopped) {
    outputChannel.error(
      `Starting language client with JAVA language server FAILED.`,
    );
    return;
  }
  outputChannel.info("Language client with JAVA language server STARTED");

  return languageClient;
}
