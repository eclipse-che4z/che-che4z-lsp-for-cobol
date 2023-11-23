import * as vscode from "vscode";

export function getWorkspaceFolders() {
  return vscode.workspace.workspaceFolders;
}

export function getFirstWorkspaceFolder() {
  const workspaceFolders = getWorkspaceFolders();
  if (workspaceFolders) return workspaceFolders[0];
}

export interface SelectionObject {
  selection: vscode.Range;
  text: string;
}
