import * as net from "node:net";

import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  StreamInfo,
} from "vscode-languageclient/node";
import type { SocketServer } from "./ServerSettings";
import { LANGUAGE_ID } from "../../constants";

export async function startNativeServer(
  server: SocketServer,
  clientOptions: LanguageClientOptions,
  handlers: Array<(languageClient: LanguageClient) => void> = [],
): Promise<LanguageClient | Error> {
  const serverOptions: ServerOptions = () => {
    const socket = net.connect({
      host: "localhost",
      port: server.port,
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
      `Failed starting language client with socket server: ${JSON.stringify(server)}`,
    );
  }

  return languageClient;
}
