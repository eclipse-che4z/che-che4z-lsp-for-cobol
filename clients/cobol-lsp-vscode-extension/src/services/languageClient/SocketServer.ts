import * as net from "node:net";
import { outputChannel } from "../util/OutputChannel";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
  StreamInfo,
} from "vscode-languageclient/node";
import { EXTENSION_NAME, LANGUAGE_ID } from "../../constants";
import { ServerInitError } from "./ServerTypes";

export async function startSocketServer(
  port: number,
  clientOptions: LanguageClientOptions,
): Promise<LanguageClient | ServerInitError> {
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
    EXTENSION_NAME,
    serverOptions,
    clientOptions,
  );
  clientOptions.errorHandler = languageClient.createDefaultErrorHandler(0);
  outputChannel.info("Staring language client with SOCKET language server.");
  const initError = `Failed connecting to language server through socket on localhost:${port}.`;
  try {
    await languageClient.start();
  } catch (e) {
    if (e instanceof Error) {
      outputChannel.error(e);
    } else {
      outputChannel.error(JSON.stringify(e));
    }
    outputChannel.error(
      `Starting language client with SOCKET server at localhost:${port} FAILED`,
    );
    return new ServerInitError(initError);
  }
  if (languageClient.state === State.Stopped) {
    outputChannel.error(
      `Starting language client with SOCKET server at localhost:${port} FAILED`,
    );
    return new ServerInitError(initError);
  }
  outputChannel.info(
    `Language client with SOCKET language server at localhost:${port} STARTED`,
  );

  return languageClient;
}
