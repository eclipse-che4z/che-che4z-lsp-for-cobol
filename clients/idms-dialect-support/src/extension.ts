// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import { join } from 'path';
import * as vscode from 'vscode';

const extensionId: string = "BroadcomMFD.idms-dialect-for-cobol";

export function activate(context: vscode.ExtensionContext) {

	const ext = vscode.extensions.getExtension(extensionId);
	if (ext === undefined) {
		throw new Error("Cannot find extension");
	}
	const executablePath = join(ext.extensionPath, "server", "jar");
	const snippetPath = join(ext.extensionPath, "snippets.json");
	vscode.commands.executeCommand("cobol-lsp.dialect.register", "IDMS", executablePath, "IDMS dialect support", extensionId, snippetPath);
}

// This method is called when your extension is deactivated
export function deactivate() {
	vscode.commands.executeCommand("cobol-lsp.dialect.unregister", "IDMS", extensionId);
}
