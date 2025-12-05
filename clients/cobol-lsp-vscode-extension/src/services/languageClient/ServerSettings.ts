import * as vscode from "vscode";
import * as os from "node:os";
import { SERVER_PORT } from "../../constants";
import type { ServerState, JavaServer, NativeServer } from "./ServerTypes";
import { SettingsService } from "../Settings";

export const getServerState = (extensionUri: vscode.Uri): ServerState => {
  const java: JavaServer = {
    kind: "JAVA",
    command: SettingsService.getJavaCommand(),
    jar: getJavaServerUri(extensionUri),
    dialects: getJavaDialectsUri(extensionUri),
  };
  const native: NativeServer = {
    kind: "NATIVE",
    command: getNativeServerUri(extensionUri),
  };

  return {
    port: getLspPort(),
    preference: SettingsService.getServerRuntime(),
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
