import * as vscode from "vscode";
import * as os from "node:os";
import { SERVER_PORT } from "../../constants";
import type { Server } from "./ServerTypes";
import { SettingsService } from "../Settings";
import { outputChannel } from "../util/OutputChannel";

export const getServers = async (
  extensionUri: vscode.Uri,
): Promise<Server[]> => {
  const preferedRuntime = SettingsService.getServerRuntime();
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
  outputChannel.info(`Server Runtime setting "${preferedRuntime}" selected.`);
  if (preferedRuntime == "JAVA") {
    const command = getJavaCommand();
    const jar = await getJavaServerUri(extensionUri);
    const dialects = await getJavaDialectsUri(extensionUri);
    if (jar && dialects) {
      servers.push({
        kind: "JAVA",
        command,
        jar,
        dialects,
      });
    }
  }
  const command = await getNativeServerUri(extensionUri);
  if (command) {
    servers.push({
      kind: "NATIVE",
      command,
    });
  }
  return servers;
};

function getLspPort(): number {
  if (vscode.workspace.getConfiguration().get(SERVER_PORT)) {
    return Number(vscode.workspace.getConfiguration().get(SERVER_PORT));
  }
  return 0;
}

function getJavaCommand() {
  return SettingsService.getJavaCommand();
}

async function getJavaServerUri(
  extensionUri: vscode.Uri,
): Promise<vscode.Uri | undefined> {
  const uri = vscode.Uri.joinPath(extensionUri, "server", "jar", "server.jar");
  const exists = await fileExists(uri, "Java server jar file not found");
  return exists ? uri : undefined;
}

async function getJavaDialectsUri(
  extensionUri: vscode.Uri,
): Promise<vscode.Uri | undefined> {
  const uri = vscode.Uri.joinPath(extensionUri, "server", "jar", "dialects");
  const exists = await fileExists(uri, "Java dialects folder not found");
  return exists ? uri : undefined;
}

async function getNativeServerUri(
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

  const uri = vscode.Uri.joinPath(extensionUri, "server", "native", fileName);
  const exists = await fileExists(uri, "Native server executable not found");
  return exists ? uri : undefined;
}

async function fileExists(uri: vscode.Uri, message: string): Promise<boolean> {
  try {
    await vscode.workspace.fs.stat(uri);
    return true;
  } catch (error) {
    if (
      error instanceof vscode.FileSystemError &&
      error.code === "FileNotFound"
    ) {
      outputChannel.warn(`${message}: "${uri.toString()}".`);
      return false;
    }
    outputChannel.warn(
      `Exception raised while checking existence of file ${uri.toString()}: "${JSON.stringify(error)}".`,
    );
    return false;
  }
}
