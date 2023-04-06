// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import { join } from "path";
import * as vscode from "vscode";

const extensionId: string = "BroadcomMFD.idms-dialect-for-cobol";
const mainExtension: string = "BroadcomMFD.cobol-language-support";

const dialectName = "IDMS";
let unregisterDialect: () => void;

export async function activate(context: vscode.ExtensionContext) {
  const extensionUri = context.extensionUri;
  const executablePath = join(extensionUri.path, "server", "jar");
  const snippetPath = join(extensionUri.path, "snippets.json");

  const main = vscode.extensions.getExtension(mainExtension);
  if (main === undefined) {
    throw new Error("Cannot find COBOL LS extension");
  }

  const mainApi = await main.activate();
  if (mainApi === undefined) {
    throw new Error("COBOL LS API is invalid");
  }

  unregisterDialect = mainApi.dialectAPI_1_0().registerDialect({
    extensionId: extensionId,
    name: dialectName,
    path: executablePath,
    description: "IDMS dialect support",
    snippetPath: snippetPath,
  });
}

export function deactivate() {
  unregisterDialect();
}
