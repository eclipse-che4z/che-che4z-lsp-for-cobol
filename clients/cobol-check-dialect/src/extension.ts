// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from "vscode";
import { registerDialect } from "@code4z/cobol-dialect-api";

let unregisterDialect: () => void;

export async function activate(context: vscode.ExtensionContext) {
  const extensionId = context.extension.id;
  const extensionUri = context.extensionUri;
  const snippets = vscode.Uri.joinPath(extensionUri, "cut-snippets.json");
  const jar = vscode.Uri.joinPath(
    extensionUri,
    "server",
    "jar",
    "dialect-cobol-check.jar"
  );
  unregisterDialect = await registerDialect(extensionId, {
    apiVersion: 1,
    name: "COBOL-CHECK",
    description: "COBOL CHECK dialect support",
    snippets,
    jar,
  });
}

export function deactivate() {
  unregisterDialect();
}
