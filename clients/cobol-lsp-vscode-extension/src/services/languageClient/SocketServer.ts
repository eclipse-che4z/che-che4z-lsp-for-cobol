import * as net from "node:net";
import { outputChannel } from "../util/OutputChannel";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
  StreamInfo,
} from "vscode-languageclient/node";
import { LANGUAGE_ID } from "../../constants";

export async function startSocketServer(
  port: number,
  clientOptions: LanguageClientOptions,
  handlers: Array<(languageClient: LanguageClient) => void>,
): Promise<LanguageClient | undefined> {
  const serverOptions: ServerOptions = () => {
    const socket = net.connect({
      host: "localhost",
      port,
    });
    const streamInfo: StreamInfo = {
      reader: socket,
      writer: socket,
    };
    return Promise.resolve(streamInfo);
  };

  const languageClient = new LanguageClient(
    LANGUAGE_ID,
    "COBOL Language Support",
    serverOptions,
    clientOptions,
  );
  clientOptions.errorHandler = languageClient.createDefaultErrorHandler(0);

  handlers.forEach((handler) => handler(languageClient));

  outputChannel.info("Staring language client with SOCKET language server");
  try {
    await languageClient.start();
  } catch (e) {
    outputChannel.error(
      `Starting language client with SOCKET server at localhost:${port} FAILED`,
    );
    if (e instanceof Error) {
      outputChannel.debug(e.message, e.stack);
    } else {
      outputChannel.debug(JSON.stringify(e));
    }
    return;
  }
  if (languageClient.state === State.Stopped) {
    outputChannel.error(
      `Starting language client with SOCKET server at localhost:${port} FAILED`,
    );
    return;
  }
  outputChannel.info(
    `Language client with SOCKET language server at localhost:${port} STARTED`,
  );

  return languageClient;
}
