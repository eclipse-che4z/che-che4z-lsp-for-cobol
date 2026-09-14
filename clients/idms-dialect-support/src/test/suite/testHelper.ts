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
 *   Broadcom - initial API and implementation
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
}

export function getWorkspace(): vscode.WorkspaceFolder {
  if (vscode.workspace.workspaceFolders)
    return vscode.workspace.workspaceFolders[0];
  throw new Error("Workspace not found");
}

export function pos(line: number, character: number): vscode.Position {
  return new vscode.Position(line, character);
}

export function range(p0: vscode.Position, p1: vscode.Position): vscode.Range {
  return new vscode.Range(p0, p1);
}

const plaintext = "plaintext";

export async function closeAllEditors() {
  await vscode.commands.executeCommand("workbench.action.files.revert");
  await vscode.commands.executeCommand("workbench.action.closeAllEditors");
  await Promise.all(
    vscode.workspace.textDocuments
      .filter((d) => !d.isClosed && d.languageId != plaintext)
      .map((d) => vscode.languages.setTextDocumentLanguage(d, plaintext)),
  );
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

function basename(s: string) {
  return /[^\\/]*$/.exec(s)![0];
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

export function printAllDiagnostics(diagnostics: vscode.Diagnostic[]) {
  console.log("Diagnostics:");
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

export function checkDiagnostic(
  diagnostics: vscode.Diagnostic[],
  message: string,
  range: vscode.Range,
  severity: vscode.DiagnosticSeverity = vscode.DiagnosticSeverity.Error,
) {
  assert.ok(
    diagnostics.some(
      (d) =>
        d.message === message &&
        d.range.isEqual(range) &&
        d.severity == severity,
    ),
    `Expected '${message}' not found at range ${range.start.line}:${range.start.character}-${range.end.line}:${range.end.character}`,
  );
}
