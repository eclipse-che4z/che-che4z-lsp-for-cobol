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

import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.junit.jupiter.api.Test;

import java.util.Optional;
import java.util.concurrent.*;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

/**
 * Test Async Analysis logic
 */
class AsyncAnalysisServiceTest {
    private static final String URI = "file:/doc.cbl";

    // case 1: it is possible that we don't have the content of the document with provided uri
    @Test
    void testNoData() {
        DocumentModelService documentModelService = mock(DocumentModelService.class);
        AnalysisService analysisService = mock(AnalysisService.class);
        CopybookService copybookService = mock(CopybookService.class);
        SubroutineService subroutineService = mock(SubroutineService.class);
        Communications communications = mock(Communications.class);
        AsyncAnalysisService asyncAnalysisService = new AsyncAnalysisService(documentModelService, analysisService, copybookService, subroutineService, communications);
        Optional<CompletableFuture<CobolDocumentModel>> result = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(URI);
        assertFalse(result.isPresent());
    }

    // case 2: document open, analysis is in progress
    @Test
    void testAnalysisInProgress() throws ExecutionException, InterruptedException, TimeoutException {
        CountDownLatch latch = new CountDownLatch(1);
        DocumentModelService documentModelService = mock(DocumentModelService.class);
        CopybookService copybookService = mock(CopybookService.class);
        SubroutineService subroutineService = mock(SubroutineService.class);
        AnalysisService analysisService = mock(AnalysisService.class);
        doAnswer(invocation -> {
            latch.await();
            return null;
        }).when(analysisService).analyzeDocument(eq(URI), anyString(), eq(true));
        Communications communications = mock(Communications.class);
        AsyncAnalysisService asyncAnalysisService = new AsyncAnalysisService(documentModelService, analysisService, copybookService, subroutineService, communications);
        asyncAnalysisService.scheduleAnalysis(URI, "text", true);
        CompletableFuture<CobolDocumentModel> result = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(URI).get();
        assertFalse(result.isDone());
        latch.countDown();
        result.get(1, TimeUnit.SECONDS);
        assertTrue(result.isDone());
        verify(communications).publishDiagnostics(any());
        verify(communications).notifyProgressBegin(URI);
    }

    // case 3: document open, analysis is done
    @Test
    void testAnalysisDone() {
        DocumentModelService documentModelService = mock(DocumentModelService.class);
        CopybookService copybookService = mock(CopybookService.class);
        SubroutineService subroutineService = mock(SubroutineService.class);
        CobolDocumentModel doc = mock(CobolDocumentModel.class);
        when(doc.getLastAnalysisResult()).thenReturn(mock(AnalysisResult.class));
        Communications communications = mock(Communications.class);
        when(documentModelService.get(URI)).thenReturn(doc);
        AnalysisService analysisService = mock(AnalysisService.class);
        AsyncAnalysisService asyncAnalysisService = new AsyncAnalysisService(documentModelService, analysisService, copybookService, subroutineService, communications);
        asyncAnalysisService.scheduleAnalysis(URI, "text", true).join();
        CompletableFuture<CobolDocumentModel> result = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(URI).get();
        verify(communications).publishDiagnostics(documentModelService.getOpenedDiagnostic());
        verify(communications).notifyProgressBegin(URI);
        assertTrue(result.isDone());
    }
}
