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

import static org.mockito.Mockito.*;

import java.util.concurrent.ExecutionException;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.handlers.text.CompletionHandler;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.junit.jupiter.api.Test;

/**
 * Test Completion Handler sequence.
 */
class CompletionHandlerTest {
  @Test
  void test() throws ExecutionException, InterruptedException {
    String uri = "file:/document.cbl";
    CobolDocumentModel document = mock(CobolDocumentModel.class);
    UriDecodeService urlDecoder = new UriDecodeService();
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);
    Completions completions = mock(Completions.class);
    DocumentModelService documentModelService = mock((DocumentModelService.class));
    when(documentModelService.get(uri)).thenReturn(document);
    CompletionHandler completionHandler = new CompletionHandler(asyncAnalysisService, completions, documentModelService, urlDecoder);
    CompletionParams params = mock(CompletionParams.class);
    TextDocumentIdentifier textDocument = mock(TextDocumentIdentifier.class);
    when(textDocument.getUri()).thenReturn(uri);
    when(params.getTextDocument()).thenReturn(textDocument);

    completionHandler.completion(params);

    verify(documentModelService).get(uri);
    verify(completions).collectFor(document, params);
  }
}
