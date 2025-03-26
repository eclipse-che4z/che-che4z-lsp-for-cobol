import * as vscode from "vscode";
export class DownloadDiagnosticsService {
  private diagnosticCollection: vscode.DiagnosticCollection;

  public constructor() {
    this.diagnosticCollection = vscode.languages.createDiagnosticCollection(
      "Download Diagnostics",
    );
  }

  public showDiagnostics(
    documentUri: vscode.Uri,
    diagnostics: vscode.Diagnostic[],
  ) {
    this.diagnosticCollection.set(documentUri, diagnostics);
  }
  public clearDiagnostics() {
    this.diagnosticCollection.clear();
  }
}
