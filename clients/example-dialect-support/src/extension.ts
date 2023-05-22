// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';
import { getV1Api } from "@code4z/cobol-dialect-api";

let unregisterDialect: () => void;


// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
export async function activate(context: vscode.ExtensionContext) {

  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "snippets", "example-snippets.json");
  const jar = vscode.Uri.joinPath(
    extensionUri,
    "server",
    "dialect-example.jar"
  );
  const v1Api = await getV1Api(extensionId);
  if (v1Api instanceof Error) {
    vscode.window.showErrorMessage(v1Api.toString());
    return;
  }
  const unregister = await v1Api.registerDialect({
    name: "example",
    description: "An example to demonstrate dialect support",
    snippets,
    jar,
  });
  if (unregister instanceof Error) {
    vscode.window.showErrorMessage(unregister.toString());
    return;
  }
  unregisterDialect = unregister;
}

// This method is called when your extension is deactivated
export function deactivate() {
	unregisterDialect();
}
