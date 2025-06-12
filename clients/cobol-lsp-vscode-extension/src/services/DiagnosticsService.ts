import * as vscode from "vscode";

const diagnosticCollection: vscode.DiagnosticCollection =
  vscode.languages.createDiagnosticCollection("Download Diagnostics");

export function showDiagnostics(
  documentUri: vscode.Uri,
  diagnostics: vscode.Diagnostic[],
) {
  diagnosticCollection.set(documentUri, diagnostics);
}
export function clearDiagnostics() {
  diagnosticCollection.clear();
}
