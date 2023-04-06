// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from "vscode";

const mainExtension = "BroadcomMFD.cobol-language-support";

let unregisterDialect: () => void;

export async function activate(context: vscode.ExtensionContext) {
  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets.json");
  const jar = vscode.Uri.joinPath(
    extensionUri,
    "server",
    "jar",
    /* TODO: "dialect-jar.jar" */
  );

  const main = vscode.extensions.getExtension(mainExtension);
  if (main === undefined) {
    throw new Error("Cannot find COBOL LS extension");
  }

  const mainApi = await main.activate();
  if (mainApi === undefined) {
    throw new Error("COBOL LS API is invalid");
  }

  unregisterDialect = mainApi.dialectAPI_1_0().registerDialect({
    name: "IDMS",
    description: "IDMS dialect support",
    jar: jar,
    snippets: snippets,
    extensionId: extensionId,
  });
}

export function deactivate() {
  unregisterDialect();
}
