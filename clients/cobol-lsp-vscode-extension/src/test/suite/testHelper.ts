/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
import * as assert from 'assert';
import * as vscode from "vscode";
import * as path from 'path';
import * as fs from 'fs';

export async function activate() {
	// The extensionId is `publisher.name` from package.json
	const ext = vscode.extensions.getExtension('BroadcomMFD.cobol-language-support')!;
	await ext.activate();
}

export function getWorkspacePath(): string {
    return vscode.workspace.workspaceFolders[0].uri.fsPath;
}

export function get_editor(workspace_file: string): vscode.TextEditor {
    const editor = vscode.window.activeTextEditor;
    assert.equal(editor.document.uri.fsPath, path.join(getWorkspacePath(), workspace_file));

    return editor;
}

export async function showDocument(workspace_file: string) {
    const files = await vscode.workspace.findFiles(workspace_file);

    assert.ok(files && files[0]);
    const file = files[0];

    // open and show the file
    const document = await vscode.workspace.openTextDocument(file);

    await vscode.window.showTextDocument(document);
}

export async function closeActiveEditor(){
    await vscode.commands.executeCommand('workbench.action.closeActiveEditor');
    await sleep(500);
}

export async function closeAllEditors() {
    while (vscode.window.activeTextEditor !== undefined) {
        await vscode.commands.executeCommand('workbench.action.closeActiveEditor');
        await sleep(500);
    }
}

export function moveCursor(editor: vscode.TextEditor, position: vscode.Position) {
    editor.selection = new vscode.Selection(position, position);
}

export async function deleteLine(editor: vscode.TextEditor, lineNumber: number) {
    await editor.edit(edit => {
        edit.delete(new vscode.Range(new vscode.Position(lineNumber, 0), new vscode.Position(lineNumber, 80)));
    });
}

export async function insertString(editor: vscode.TextEditor, position: vscode.Position, str: string): Promise<vscode.Position> {
    await editor.edit(edit => {
        edit.insert(position, str);
    });

    // Get number of lines in string and compute the new end position
    const str_split = str.split("\n");
    const lines = str_split.length;

    const movePosition = new vscode.Position(position.line + lines - 1, lines == 1 ? position.character + str.length : str_split[lines-1].length);
    editor.selection = new vscode.Selection(movePosition, movePosition);

    return movePosition;
}

export function sleep(ms: number): Promise<unknown> {
    return new Promise((resolve) => { setTimeout(resolve, ms); });
}

export function updateConfig(configFileName: string) {
    // update the settings.json with this file content
    const settinsFileLoc = path.join(getWorkspacePath(), ".vscode", "settings.json");
    const settingvalueLoc = path.join(getWorkspacePath(), "settings", configFileName);
    recursiveCopySync(settingvalueLoc, settinsFileLoc);
}

export function deleteFile(path: string){
    fs.rmSync(path);
}

export function recursiveCopySync(origin, dest) {
    if (fs.existsSync(origin)) {
        if (fs.statSync(origin).isDirectory()) {
            fs.mkdirSync(dest);
            fs.readdirSync(origin).forEach(file =>
                recursiveCopySync(path.join(origin, file), path.join(dest, file)));
        }
        else {
            const destFolder = path.dirname(dest);
            if(!fs.existsSync(destFolder)) fs.mkdirSync(destFolder);
            fs.copyFileSync(origin, dest);
        }
    }
}

export function assertRangeIsEqual(providedRange: vscode.Range, expectedRange: vscode.Range) {
   assert.strictEqual(providedRange.start.line, expectedRange.start.line);
   assert.strictEqual(providedRange.start.character, expectedRange.start.character);
   assert.strictEqual(providedRange.end.line, expectedRange.end.line);
   assert.strictEqual(providedRange.end.character, expectedRange.end.character);
}

export function printDocument(editor : vscode.TextEditor) {
    console.log(
        editor.document.getText(
            (new vscode.Range(new vscode.Position(0, 0), new vscode.Position(70, 80)))))
}

export function printAllDiagnostics(diagnostics: vscode.Diagnostic[]){
    diagnostics.forEach(d => console.log(d.message + " " + d.range.start.line + "." + d.range.start.character + "_" + d.range.end.line + "." + d.range.end.character));
}

export async function executeCommandMultipleTimes(command: string, times: number) {
    for (let index = 0; index < times; index++) {
        await vscode.commands.executeCommand(command);
    }
}

