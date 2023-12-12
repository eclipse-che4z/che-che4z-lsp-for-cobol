import * as vscode from "vscode";
export interface SelectionObject {
  selection: vscode.Range;
  text: string;
}
