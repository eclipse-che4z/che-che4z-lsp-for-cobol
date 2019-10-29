package com.ca.lsp.cobol.service.delegates;

import org.eclipse.lsp4j.Diagnostic;

import java.util.List;

public interface Communications {
    void notifyThatLoadingInProgress(String uri);

    void notifyThatEngineNotFound(String languageType);

    void publishDiagnostics(String uri, List<Diagnostic> diagnostics);

    void cancelProgressNotification(String uri);

    void notifyThatDocumentAnalysed(String uri);

}
