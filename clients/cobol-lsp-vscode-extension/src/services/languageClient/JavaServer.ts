import { outputChannel } from "../util/OutputChannel";
import { checkJavaVersion } from "../JavaCheck";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
} from "vscode-languageclient/node";
import { ServerInitError, type JavaServer } from "./ServerTypes";
import {
  EXTENSION_NAME,
  LANGUAGE_ID,
  MINIMUM_JAVA_VERSION,
} from "../../constants";

export async function startJavaServer(
  server: JavaServer,
  clientOptions: LanguageClientOptions,
): Promise<LanguageClient | ServerInitError> {
  const result = await checkJavaVersion(server.command, MINIMUM_JAVA_VERSION);
  if (result instanceof ServerInitError) {
    return result;
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
    EXTENSION_NAME,
    serverOptions,
    clientOptions,
  );
  clientOptions.errorHandler = languageClient.createDefaultErrorHandler(0);
  outputChannel.info("Staring language client with JAVA language server.");
  const initError = `Java language server ${server.jar.fsPath} failed to start. Ensure that the default Java installation or Java runtime specified in the Java Home setting is version ${MINIMUM_JAVA_VERSION} or newer.`;
  try {
    await languageClient.start();
  } catch (e) {
    if (e instanceof Error) {
      outputChannel.error(e);
    } else {
      outputChannel.error(JSON.stringify(e));
    }
    outputChannel.error(`Starting language client with JAVA server FAILED.`);
    return new ServerInitError(initError, "Java Home");
  }
  if (languageClient.state === State.Stopped) {
    outputChannel.error(`Starting language client with JAVA server FAILED.`);
    return new ServerInitError(initError, "Java Home");
  }
  outputChannel.info("Language client with JAVA language server STARTED");

  return languageClient;
}
