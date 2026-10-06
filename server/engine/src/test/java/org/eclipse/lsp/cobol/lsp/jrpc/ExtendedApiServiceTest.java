/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.lsp.jrpc;

import static org.junit.jupiter.api.Assertions.assertInstanceOf;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.google.gson.JsonObject;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDto;
import org.eclipse.lsp.cobol.lsp.LspMessageBroker;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.AnalysisQuery;
import org.eclipse.lsp.cobol.lsp.events.queries.AnalysisResultQuery;
import org.eclipse.lsp.cobol.lsp.handlers.extended.AnalysisHandler;
import org.eclipse.lsp.cobol.lsp.handlers.extended.AnalysisResultHandler;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp4j.MessageType;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/** This test checks the entry points of the {@link ExtendedApiService} implementation. */
@ExtendWith(MockitoExtension.class)
class ExtendedApiServiceTest {

  private static final String URI = "file:///workspace/document.cbl";

  @Mock private AsyncAnalysisService asyncAnalysisService;
  @Mock private AnalysisService analysisService;
  @Mock private CFASTBuilder cfastBuilder;
  @Mock private Communications communications;
  @Mock private DocumentModelService documentModelService;
  @Mock private LspMessageBroker lspMessageBroker;
  @Captor private ArgumentCaptor<LspQuery<AnalysisResultDto>> analysisResultQueryCaptor;

  private ExtendedApiService service;

  @BeforeEach
  void setupService() {
    AnalysisHandler analysisHandler =
        new AnalysisHandler(
            asyncAnalysisService,
            analysisService,
            cfastBuilder,
            communications,
            documentModelService);
    AnalysisResultHandler analysisResultHandler =
        new AnalysisResultHandler(documentModelService, asyncAnalysisService, communications);

    service = new ExtendedApiService(analysisHandler, analysisResultHandler, lspMessageBroker);
  }

  @Test
  void testAnalysis() {
    JsonObject json = new JsonObject();
    json.addProperty("uri", "");

    service.analysis(json);
    verify(lspMessageBroker, times(1)).query(any(AnalysisQuery.class));
  }

  @Test
  void testAnalysisResult() {
    service.analysisResult(new TextDocumentIdentifier(URI));

    verify(lspMessageBroker, times(1)).query(any(AnalysisResultQuery.class));
  }

  @Test
  void testAnalysisResultReturnsLastResultOfTheDocument() throws Exception {
    when(documentModelService.get(URI))
        .thenReturn(new CobolDocumentModel(URI, "", AnalysisResult.EMPTY));

    service.analysisResult(new TextDocumentIdentifier(URI));
    verify(lspMessageBroker).query(analysisResultQueryCaptor.capture());
    LspQuery<AnalysisResultDto> query = analysisResultQueryCaptor.getValue();

    assertInstanceOf(AnalysisResultQuery.class, query);
    AnalysisResultDto result = query.query();
    assertTrue(result.getPrograms().isEmpty());
    assertTrue(result.getDiagnostics().isEmpty());
  }

  @Test
  void testAnalysisResultOfUnknownDocument() throws Exception {
    when(documentModelService.get(URI)).thenReturn(null);

    service.analysisResult(new TextDocumentIdentifier(URI));
    verify(lspMessageBroker).query(analysisResultQueryCaptor.capture());

    assertNull(analysisResultQueryCaptor.getValue().query());
    verify(communications).notifyGeneralMessage(eq(MessageType.Info), any(String.class));
  }
}
