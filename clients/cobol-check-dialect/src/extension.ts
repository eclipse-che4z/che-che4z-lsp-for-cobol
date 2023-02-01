// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import { join } from 'path';
import * as vscode from 'vscode';

const extensionId: string = "BroadcomMFD.cobol-check-dialect";
const mainExtension: string = "BroadcomMFD.cobol-language-support";

let mainApi: any = undefined;

export async function activate(context: vscode.ExtensionContext) {

	const ext = vscode.extensions.getExtension(extensionId);
	if (ext === undefined) {
		throw new Error("Cannot find extension");
	}

    const main = vscode.extensions.getExtension(mainExtension);
	if (main === undefined) {
		throw new Error("Cannot find COBOL LS extension");
	}

    mainApi = await main.activate();	
	if (mainApi === undefined) {
		throw new Error("COBOL LS API is invalid");
	}

	const executablePath = join(ext.extensionPath, "server", "jar");
	const snippetPath = join(ext.extensionPath, "cut-snippets.json");

	mainApi.registerDialect({
		extensionId: extensionId, 
		name: "COBOL-CHECK", 
		path: executablePath, 
		description: "COBOL CHECK dialect support", 
		snippetPath: snippetPath
	});
}

export async function deactivate() {
	if (mainApi !== undefined) {
		mainApi.unregister(extensionId, "COBOL-CHECK");
	}
}
