import * as vscode from "vscode";
import * as os from "node:os";
import { SERVER_PORT } from "../../constants";
import type { Server } from "./ServerTypes";
import { SettingsService } from "../Settings";

export const getServers = (extensionUri: vscode.Uri): Server[] => {
  const port = getLspPort();
  if (port) {
    return [
      {
        kind: "SOCKET",
        port,
      },
    ];
  }
  const servers: Server[] = [];
  {
    const command = getJavaCommand();
    const jar = getJavaServerUri(extensionUri);
    const dialects = getJavaDialectsUri(extensionUri);
    if (command && jar && dialects) {
      servers.push({
        kind: "JAVA",
        command,
        jar,
        dialects,
      });
    }
  }
  {
    const command = getNativeServerUri(extensionUri);
    if (command) {
      servers.push({
        kind: "NATIVE",
        command,
      });
    }
  }
  return servers;
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
  let fileName: string;
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
    default:
      fileName = "server-unknown";
  }

  return vscode.Uri.joinPath(extensionUri, "server", "native", fileName);
}

function getJavaServerUri(extensionUri: vscode.Uri) {
  return vscode.Uri.joinPath(extensionUri, "server", "jar", "server.jar");
}

function getJavaDialectsUri(extensionUri: vscode.Uri) {
  return vscode.Uri.joinPath(extensionUri, "server", "jar", "dialects");
}

function getJavaCommand() {
  return SettingsService.getJavaCommand();
}
