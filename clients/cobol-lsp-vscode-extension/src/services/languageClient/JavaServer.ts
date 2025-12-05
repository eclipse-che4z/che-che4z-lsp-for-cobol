import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
} from "vscode-languageclient/node";
import type { JavaServer } from "./ServerTypes";
import { LANGUAGE_ID } from "../../constants";
import { getJavaVersion } from "../JavaCheck";
import { MINIMUM_JAVA_VERSION } from "../../constants";
import { telemetryEvent } from "../reporter";

export async function startJavaServer(
  server: JavaServer,
  clientOptions: LanguageClientOptions,
  handlers: Array<(languageClient: LanguageClient) => void> = [],
): Promise<LanguageClient | Error> {
  let major: number;
  try {
    major = await getJavaVersion(server.command);
  } catch (e) {
    return new AggregateError([e], `Java version check failed.`);
  }
  telemetryEvent("log", ["bootstrap", "java-version"], `${major}`);
  if (major < MINIMUM_JAVA_VERSION) {
    return new Error(
      `Unsupported Java version ${major} detected. Minimum required version is ${MINIMUM_JAVA_VERSION}.`,
    );
  }

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
      `Failed starting language client with java server: ${JSON.stringify(server)}`,
    );
  }

  return languageClient;
}
