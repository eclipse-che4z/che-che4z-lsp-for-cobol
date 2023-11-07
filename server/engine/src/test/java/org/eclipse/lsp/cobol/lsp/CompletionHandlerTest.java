/*
 * Copyright (c) 2023 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.lsp;

import org.eclipse.lsp.cobol.lsp.handlers.text.CompletionHandler;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.junit.jupiter.api.Test;

import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static org.mockito.Mockito.*;

/**
 * Test Completion Handler sequence.
 */
class CompletionHandlerTest {
  @Test
  void test() throws ExecutionException, InterruptedException {
    String uri = "file:/document.cbl";
    CobolDocumentModel document = mock(CobolDocumentModel.class);
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);
    Completions completions = mock(Completions.class);
    CompletionHandler completionHandler = new CompletionHandler(asyncAnalysisService, completions);
    CompletionParams params = mock(CompletionParams.class);
    TextDocumentIdentifier textDocument = mock(TextDocumentIdentifier.class);
    when(textDocument.getUri()).thenReturn(uri);
    when(params.getTextDocument()).thenReturn(textDocument);
    when(asyncAnalysisService.fetchLastResultOrAnalyzeDocument(uri))
            .thenReturn(Optional.of(CompletableFuture.completedFuture(document)));

    completionHandler.completion(params);

    verify(asyncAnalysisService).fetchLastResultOrAnalyzeDocument(uri);
    verify(completions).collectFor(document, params);
  }
}
