/*
 * Copyright (c) 2026 Broadcom.
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
import * as assert from "node:assert";
import * as vscode from "vscode";

export const TEST_TIMEOUT = 150000;
export const LANGUAGE_ID = "cobol";

export async function activate() {
  // The extensionId is `publisher.name` from package.json
  const cobol = vscode.extensions.getExtension(
    "BroadcomMFD.cobol-language-support",
  );
  if (cobol && !cobol.isActive) {
    await cobol.activate();
  }
  const idms = vscode.extensions.getExtension(
    "BroadcomMFD.cobol-language-support-for-idms",
  );
  if (idms && !idms.isActive) {
    await idms.activate();
  }
  const daco = vscode.extensions.getExtension(
    "BroadcomMFD.cobol-language-support-for-daco",
  );
  if (daco && !daco.isActive) {
    await daco.activate();
  }
}

export function getWorkspace(): vscode.WorkspaceFolder {
  if (vscode.workspace.workspaceFolders)
    return vscode.workspace.workspaceFolders[0];
  throw new Error("Workspace not found");
}

export async function getUri(workspace_file: string): Promise<vscode.Uri> {
  const files = await vscode.workspace.findFiles(workspace_file);
  assert.ok(files?.[0], `Cannot find file ${workspace_file}`);
  return files[0];
}

export async function showDocument(workspace_file: string) {
  const file = await getUri(workspace_file);
  // open and show the file
  const document = await vscode.workspace.openTextDocument(file);
  await vscode.languages.setTextDocumentLanguage(document, "cobol");
  const editor = await vscode.window.showTextDocument(document, {
    preview: false,
  });

  return editor;
}

export async function openUntitledDocument(languageId = LANGUAGE_ID) {
  const document = await vscode.workspace.openTextDocument({
    language: languageId,
  });

  return await vscode.window.showTextDocument(document, {
    preview: false,
  });
}

const plaintext = "plaintext";

export async function closeActiveEditor() {
  const doc = vscode.window.activeTextEditor;
  if (!doc) return;
  // simulate didClose by changing the languageID
  await vscode.languages.setTextDocumentLanguage(doc.document, plaintext);
  await vscode.commands.executeCommand(
    "workbench.action.revertAndCloseActiveEditor",
  );
}

export async function closeAllEditors() {
  await vscode.commands.executeCommand("workbench.action.files.revert");
  await vscode.commands.executeCommand("workbench.action.closeAllEditors");
  await Promise.all(
    vscode.workspace.textDocuments
      .filter((d) => !d.isClosed && d.languageId != plaintext)
      .map((d) => vscode.languages.setTextDocumentLanguage(d, plaintext)),
  );
}

export function moveCursor(
  editor: vscode.TextEditor,
  position: vscode.Position,
) {
  editor.selection = new vscode.Selection(position, position);
}

export async function deleteLine(
  editor: vscode.TextEditor,
  lineNumber: number,
) {
  await editor.edit((edit) => {
    edit.delete(
      new vscode.Range(
        new vscode.Position(lineNumber, 0),
        new vscode.Position(lineNumber, 80),
      ),
    );
  });
}

export async function insertString(
  editor: vscode.TextEditor,
  position: vscode.Position,
  str: string,
): Promise<vscode.Position> {
  await editor.edit((edit) => {
    edit.insert(position, str);
  });

  // Get number of lines in string and compute the new end position
  const str_split = str.split("\n");
  const lines = str_split.length;

  const movePosition = new vscode.Position(
    position.line + lines - 1,
    lines == 1 ? position.character + str.length : str_split[lines - 1].length,
  );
  editor.selection = new vscode.Selection(movePosition, movePosition);
  await sleep(1000);
  return movePosition;
}

function basename(s: string) {
  return /[^\\/]*$/.exec(s)![0];
}

export async function waitForDiagnostics(
  uri: vscode.Uri,
  timeout: number = 50000,
) {
  let diagnostics: vscode.Diagnostic[] = [];
  await waitFor(
    () => {
      diagnostics = vscode.languages.getDiagnostics(uri);
      return diagnostics.length > 0;
    },
    timeout,
    "diagnostics (" + basename(uri.path) + ")",
  );
  return diagnostics;
}

export async function waitForDiagnosticCount(
  uri: vscode.Uri,
  count: number,
  timeout: number = 50000,
) {
  let diagnostics: vscode.Diagnostic[] = [];
  await waitFor(
    () => {
      diagnostics = vscode.languages.getDiagnostics(uri);
      return diagnostics.length === count;
    },
    timeout,
    "diagnostics (" + basename(uri.path) + ")",
  );
  return diagnostics;
}

export async function waitFor(
  doneFunc: () => boolean | Promise<boolean>,
  timeout: number = 50000,
  label: string = "",
) {
  const startTime = Date.now();
  while (!(await Promise.resolve(doneFunc()))) {
    await sleep(100);
    if (Date.now() - startTime > timeout) {
      console.trace((label ? label : "") + "timeout!");
      throw Error("Timeout");
    }
  }
}

export function sleep(ms: number): Promise<unknown> {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

export function pos(line: number, character: number): vscode.Position {
  return new vscode.Position(line, character);
}
export function range(p0: vscode.Position, p1: vscode.Position): vscode.Range {
  return new vscode.Range(p0, p1);
}

export async function updateConfig(configFileName: string) {
  // update the settings.json with this file content
  if (!vscode.workspace.workspaceFolders) {
    throw new Error("Workspace not found");
  }
  const settingsFileLoc = vscode.Uri.joinPath(
    vscode.workspace.workspaceFolders[0].uri,
    ".vscode",
    "settings.json",
  );
  const settingsValueLoc = vscode.Uri.joinPath(
    vscode.workspace.workspaceFolders[0].uri,
    "settings",
    configFileName,
  );
  await vscode.workspace.fs.copy(settingsValueLoc, settingsFileLoc, {
    overwrite: true,
  });
}

export function assertRangeIsEqual(
  providedRange: vscode.Range,
  expectedRange: vscode.Range,
) {
  assert.strictEqual(
    providedRange.start.line,
    expectedRange.start.line,
    rangesMessage(providedRange, expectedRange),
  );
  assert.strictEqual(
    providedRange.start.character,
    expectedRange.start.character,
    rangesMessage(providedRange, expectedRange),
  );
  assert.strictEqual(
    providedRange.end.line,
    expectedRange.end.line,
    rangesMessage(providedRange, expectedRange),
  );
  assert.strictEqual(
    providedRange.end.character,
    expectedRange.end.character,
    rangesMessage(providedRange, expectedRange),
  );
}

function rangesMessage(
  providedRange: vscode.Range,
  expectedRange: vscode.Range,
): string {
  return (
    "\r\nActual range: " +
    rangeToString(providedRange) +
    "\r\nExpected range: " +
    rangeToString(expectedRange)
  );
}

function rangeToString(range: vscode.Range): string {
  return (
    "(" +
    range.start.line +
    "," +
    range.start.character +
    "), (" +
    range.end.line +
    "," +
    range.end.character +
    ")"
  );
}

export function printDocument(editor: vscode.TextEditor) {
  console.log(
    editor.document.getText(
      new vscode.Range(new vscode.Position(0, 0), new vscode.Position(70, 80)),
    ),
  );
}

export function printAllDiagnostics(diagnostics: vscode.Diagnostic[]) {
  diagnostics.forEach((d) =>
    console.log(
      d.message +
        " " +
        d.range.start.line +
        "." +
        d.range.start.character +
        "_" +
        d.range.end.line +
        "." +
        d.range.end.character,
    ),
  );
}

export type Mutable<T> = { -readonly [P in keyof T]: T[P] };
export const asMutable = <T>(value: T): Mutable<T> => value as Mutable<T>;
