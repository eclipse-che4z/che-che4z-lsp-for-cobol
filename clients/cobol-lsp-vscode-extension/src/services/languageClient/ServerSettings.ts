import * as vscode from "vscode";
import * as os from "node:os";
import { JAVA_HOME, SERVER_PORT, SERVER_RUNTIME } from "../../constants";
import type { ServerState, JavaServer, NativeServer } from "./ServerTypes";

export const make = (extensionUri: vscode.Uri): ServerState => {
  const java: JavaServer = {
    kind: "JAVA",
    command: getJavaCommand(),
    jar: getJavaServerUri(extensionUri),
    dialects: getJavaDialectsUri(extensionUri),
  };
  const native: NativeServer = {
    kind: "NATIVE",
    command: getNativeServerUri(extensionUri),
  };

  return {
    port: getLspPort(),
    preference: getServerRuntime(),
    java,
    native,
  };
};

/**
 * Get Lsp Port from configuration
 * @returns lsp port number
 */
function getLspPort(): number {
  if (vscode.workspace.getConfiguration().get(SERVER_PORT)) {
    return Number(vscode.workspace.getConfiguration().get(SERVER_PORT));
  }
  return 0;
}

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
