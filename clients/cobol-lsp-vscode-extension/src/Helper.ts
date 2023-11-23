import * as vscode from "vscode";

export function getWorkspaceFolders() {
  return vscode.workspace.workspaceFolders;
}

export function getFirstWorkspaceFolder() {
  return this.getWorkspaceFolders()[0];
}

export interface SelectionObject {
  selection: vscode.Range;
  text: string;
}
