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
import * as assert from "assert";
import * as vscode from "vscode";
import * as path from "path";
import * as fs from "fs";

export const TEST_TIMEOUT = 150000;

export async function activate() {
  // The extensionId is `publisher.name` from package.json
  const cobol = vscode.extensions.getExtension(
    "BroadcomMFD.cobol-language-support",
  )!;
  if (!cobol.isActive) {
    await cobol.activate();
  }
  const idms = vscode.extensions.getExtension(
    "BroadcomMFD.cobol-language-support-for-idms",
  )!;
  if (!idms.isActive) {
    await idms.activate();
  }
  const daco = vscode.extensions.getExtension(
    "BroadcomMFD.cobol-language-support-for-daco",
  )!;
  if (!daco.isActive) {
    await daco.activate();
  }
}

export function getWorkspacePath(): string {
  if (vscode.workspace.workspaceFolders)
    return vscode.workspace.workspaceFolders[0].uri.fsPath;
  throw new Error("Workspace not found");
}

export function getWorkspace(): vscode.WorkspaceFolder {
  if (vscode.workspace.workspaceFolders)
    return vscode.workspace.workspaceFolders[0];
  throw new Error("Workspace not found");
}

export function get_editor(workspace_file: string): vscode.TextEditor {
  const editor = vscode.window.activeTextEditor!;
  assert.strictEqual(
    editor.document.uri.fsPath,
    path.join(getWorkspacePath(), workspace_file),
  );
  return editor;
}

export function get_active_editor(): vscode.TextEditor {
  const editor = vscode.window.activeTextEditor!;
  return editor;
}

export async function getUri(workspace_file: string): Promise<vscode.Uri> {
  const files = await vscode.workspace.findFiles(workspace_file);

  assert.ok(files && files[0], `Cannot find file ${workspace_file}`);
  return files[0];
}

export async function showDocument(workspace_file: string) {
  const file = await getUri(workspace_file);
  // open and show the file
  const document = await vscode.workspace.openTextDocument(file);
  await vscode.languages.setTextDocumentLanguage(document, "cobol");
  const editor = await vscode.window.showTextDocument(document);

  return editor;
}

export async function closeActiveEditor() {
  const doc = vscode.window.activeTextEditor;
  if (!doc) return;
  while (doc.document.isDirty) {
    await vscode.commands.executeCommand("undo");
    await sleep(100);
  }
  await vscode.languages.setTextDocumentLanguage(doc.document, "json");
  await vscode.commands.executeCommand("workbench.action.closeActiveEditor");
  await sleep(100);
}

export async function closeAllEditors() {
  await waitFor(async () => {
    if (vscode.window.activeTextEditor === undefined) {
      return true;
    }
    await closeActiveEditor();
    return vscode.window.activeTextEditor === undefined;
  });
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

export async function waitForDiagnostics(
  uri: vscode.Uri,
  timeout: number = 50000,
) {
  return waitFor(
    () => vscode.languages.getDiagnostics(uri).length > 0,
    timeout,
    "diagnostics (" + path.basename(uri.fsPath) + ")",
  );
}

export async function waitFor(
  doneFunc: () => boolean | Promise<boolean>,
  timeout: number = 50000,
  label: string = "",
) {
  const startTime = Date.now();
  if (await Promise.resolve(doneFunc())) {
    return true;
  }
  // console.log("waiting" + (label ? label : "") + "...")
  while (!(await Promise.resolve(doneFunc()))) {
    await sleep(100);
    if (Date.now() - startTime > timeout) {
      console.trace((label ? label : "") + "timeout!");
      return false;
    }
  }
  // console.log("done! Time: " + (Date.now() - startTime + "."));
  return true;
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

export function updateConfig(configFileName: string) {
  // update the settings.json with this file content
  const settinsFileLoc = path.join(
    vscode.workspace.workspaceFolders![0].uri.fsPath,
    ".vscode",
    "settings.json",
  );
  const settingvalueLoc = path.join(
    getWorkspacePath(),
    "settings",
    configFileName,
  );
  recursiveCopySync(settingvalueLoc, settinsFileLoc);
}

export function deleteFile(path: string) {
  fs.rmSync(path);
}

export function recursiveCopySync(origin: string, dest: string) {
  if (fs.existsSync(origin)) {
    if (fs.statSync(origin).isDirectory()) {
      fs.mkdirSync(dest, { recursive: true });
      fs.readdirSync(origin).forEach((file) =>
        recursiveCopySync(path.join(origin, file), path.join(dest, file)),
      );
    } else {
      const destFolder = path.dirname(dest);
      if (!fs.existsSync(destFolder))
        fs.mkdirSync(destFolder, { recursive: true });
      fs.copyFileSync(origin, dest);
    }
  }
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

export async function executeCommandMultipleTimes(
  command: string,
  times: number,
) {
  for (let index = 0; index < times; index++) {
    await vscode.commands.executeCommand(command);
  }
}

export async function getWorkspaceFile(workspace_file: string) {
  const files = await vscode.workspace.findFiles(workspace_file);

  assert.ok(files && files[0], workspace_file);

  return files[0];
}

export async function waitForDiagnosticsChange(file: string | vscode.Uri) {
  const fileUri =
    typeof file === "string" ? await getWorkspaceFile(file) : file;

  const initialDiags = vscode.languages
    .getDiagnostics(fileUri)
    .map((x) => JSON.stringify(x))
    .sort();

  const result = new Promise<vscode.Diagnostic[]>((resolve) => {
    let listener: vscode.Disposable | null =
      vscode.languages.onDidChangeDiagnostics((e) => {
        if (!listener) return;
        const forFile = e.uris.find((v) => v.toString() === fileUri.toString());
        if (!forFile) return;
        const diags = vscode.languages.getDiagnostics(forFile);
        if (
          diags.length === initialDiags.length &&
          diags
            .map((x) => JSON.stringify(x))
            .sort()
            .every((x, i) => x === initialDiags[i])
        )
          return;
        listener.dispose();
        listener = null;
        resolve(diags);
      });
  });

  return result;
}
