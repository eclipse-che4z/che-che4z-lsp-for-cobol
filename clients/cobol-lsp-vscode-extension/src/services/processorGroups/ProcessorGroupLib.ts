import * as vscode from "vscode";

export default interface ProcessorGroupLib {
  resolveCopybookUri(
    copybookName: string,
    documentUri: vscode.Uri,
  ): Promise<vscode.Uri | undefined>;
}
