import * as vscode from "vscode";
export class DiagnosticsService {
  private diagnosticCollection: vscode.DiagnosticCollection;

  public constructor() {
    this.diagnosticCollection = vscode.languages.createDiagnosticCollection(
      "COBOL Language Support",
    );
  }

  public showDiagnostics(
    documentUri: vscode.Uri,
    diagnostics: vscode.Diagnostic[],
  ) {
    this.diagnosticCollection.set(documentUri, diagnostics);
  }
}
