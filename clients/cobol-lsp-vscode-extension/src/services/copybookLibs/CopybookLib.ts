import * as vscode from "vscode";

export default interface CopybookLib {
  resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
  ): Promise<vscode.Uri | (() => Promise<vscode.Uri | undefined>) | undefined>;

  listCopybooks(
    documentUri: vscode.Uri,
    outputChannel?: vscode.OutputChannel,
  ): Promise<string[]>;
}
