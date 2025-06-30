import CopybookLib from "../../../../services/copybookLibs/CopybookLib";
import * as vscode from "vscode";

export class ErrorLib implements CopybookLib {
  resolveCopybookUri(
    _copybookName: string,
    _documentUri: vscode.Uri,
    _dialect: string,
  ): Promise<vscode.Uri | (() => Promise<vscode.Uri | undefined>) | undefined> {
    return Promise.reject(new Error("Resolve error"));
  }
  listCopybooks(
    _documentUri: vscode.Uri,
    _dialect: string,
    _outputChannel?: vscode.OutputChannel,
  ): Promise<string[]> {
    return Promise.reject(new Error("List error"));
  }
}
