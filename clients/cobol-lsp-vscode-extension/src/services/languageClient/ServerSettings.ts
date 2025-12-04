import * as vscode from "vscode";
import * as os from "node:os";
import { JAVA_HOME, SERVER_RUNTIME } from "../../constants";

export interface NativeServer {
  kind: "NATIVE";
  command: vscode.Uri;
}
export interface JavaServer {
  kind: "JAVA";
  command: string;
  jar: vscode.Uri;
  dialects: vscode.Uri;
}
export interface SocketServer {
  kind: "SOCKET";
  port: number;
}
export type Server = NativeServer | JavaServer | SocketServer;

export const make = (extensionUri: vscode.Uri): Server => {
  const runtime = getServerRuntime();
  switch (runtime) {
    case "JAVA":
      return {
        kind: "JAVA",
        command: getJavaCommand(),
        jar: getJavaServerUri(extensionUri),
        dialects: getJavaDialectsUri(extensionUri),
      };
    case "NATIVE":
      return {
        kind: "NATIVE",
        command: getNativeServerUri(extensionUri),
      };
    default: //Type guard
      const _exhaustiveCheck: never = runtime;
      throw Error(_exhaustiveCheck);
  }
};

/**
 * Gives the configured runtime from settings.
 *
 * @returns returns configured runtime
 */
function getServerRuntime(): "NATIVE" | "JAVA" {
  const runtime = vscode.workspace.getConfiguration().get(SERVER_RUNTIME);
  return runtime === "NATIVE" ? "NATIVE" : "JAVA"; // TODO add tests to make sure default matches package.json declaration
}

function getJavaHome(): string | undefined {
  return vscode.workspace.getConfiguration().get(JAVA_HOME);
}

function getJavaCommand(): string {
  const location = (getJavaHome() ?? "").trim();
  if (location) {
    return vscode.Uri.joinPath(vscode.Uri.file(location), "bin", "java").fsPath;
  }
  return "java";
}

function getNativeServerUri(
  extensionUri: vscode.Uri,
  osType: string = os.type(),
) {
  let fileName: string = "server-unknown";
  switch (osType) {
    case "Windows_NT":
      fileName = "engine.exe";
      break;
    case "Darwin":
      fileName = "server-mac";
      break;
    case "Linux":
      fileName = "server-linux";
      break;
  }

  return vscode.Uri.joinPath(extensionUri, "server", "native", fileName);
}

function getJavaServerUri(extensionUri: vscode.Uri) {
  return vscode.Uri.joinPath(extensionUri, "server", "jar", "server.jar");
}

function getJavaDialectsUri(extensionUri: vscode.Uri) {
  return vscode.Uri.joinPath(extensionUri, "server", "jar", "dialects");
}
