import * as net from "node:net";

import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  StreamInfo,
} from "vscode-languageclient/node";
import { LANGUAGE_ID } from "../../constants";

export async function startSocketServer(
  port: number,
  clientOptions: LanguageClientOptions,
  handlers: Array<(languageClient: LanguageClient) => void> = [],
): Promise<LanguageClient | Error> {
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

  handlers.forEach((handler) => handler(languageClient));

  try {
    await languageClient.start();
  } catch (e) {
    await languageClient.dispose();
    return new AggregateError(
      [e],
      `Failed starting language client with socket server at localhost:${port}`,
    );
  }

  return languageClient;
}
