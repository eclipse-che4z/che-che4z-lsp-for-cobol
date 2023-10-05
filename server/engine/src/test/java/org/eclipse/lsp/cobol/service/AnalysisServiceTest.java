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
package org.eclipse.lsp.cobol.service;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.UUID;
import java.util.concurrent.CompletableFuture;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Test for AnalysisService
 */
@ExtendWith(MockitoExtension.class)
class AnalysisServiceTest {
  private AnalysisService service;
  @Mock private LanguageEngineFacade engine;
  @Mock private ConfigurationService configurationService;
  @Mock private SyncProvider syncProvider;
  @Mock private CopybookIdentificationService copybookIdentificationService;
  @Mock private Communications communications;
  @Mock private DocumentModelService documentService;
  @Mock private DocumentContentCache contentCache;
  @Mock private CopybookService copybookService;

  @BeforeEach
  void init() {
    service =
        new AnalysisService(
            communications,
            engine,
            configurationService,
            syncProvider,
            copybookIdentificationService,
                copybookService, documentService,
            contentCache);
    service.setExtensionConfig(ImmutableList.of());
  }

  @Test
  void testIsCopybook() throws InterruptedException {
    service =
        new AnalysisService(
            communications,
            engine,
            configurationService,
            syncProvider,
            copybookIdentificationService,
                copybookService, documentService,
            contentCache);

    CompletableFuture.supplyAsync(() -> service.isCopybook("", ""));

    Thread.sleep(10);
    verify(copybookIdentificationService, times(0)).isCopybook(any(), any(), any());

    service.setExtensionConfig(ImmutableList.of());

    Thread.sleep(10);
    verify(copybookIdentificationService, times(1)).isCopybook(any(), any(), any());
  }

  @Test
  void testAnalyzeDocument_copybook() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(true);

    service.analyzeDocument(uri, text, true);
    verify(documentService, times(1)).openDocument(uri, text);
    verify(communications, times(1)).publishDiagnostics(any());
    verify(communications, times(0)).notifyProgressBegin(uri);
    verify(engine, times(0)).analyze(any(), any(), any());
  }

  @Test
  void testAnalyzeDocument_program() {
    AnalysisResult result = mock(AnalysisResult.class);
    when(result.getRootNode()).thenReturn(new RootNode());

    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(false);
    when(syncProvider.getSync(any())).thenReturn(new Object());
    when(engine.analyze(any(), any(), any())).thenReturn(result);

    service.analyzeDocument(uri, text, true);
    verify(documentService, times(1)).openDocument(uri, text);
    verify(communications, times(1)).publishDiagnostics(any());
    verify(communications, times(1)).notifyProgressBegin(uri);
    verify(engine, times(1)).analyze(any(), any(), any());
  }

  @Test
  void testReanalyzeDocument_copybook() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(true);

    service.analyzeDocument(uri, text, false);
    verify(documentService, times(1)).updateDocument(uri, text);
    verify(communications, times(0)).publishDiagnostics(documentService.getOpenedDiagnostic());
    verify(communications, times(0)).notifyProgressBegin(uri);
    verify(engine, times(0)).analyze(any(), any(), any());
  }

  @Test
  void testReanalyzeDocument_program() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(false);
    when(syncProvider.getSync(any())).thenReturn(new Object());
    when(engine.analyze(any(), any(), any())).thenReturn(prepareAnalysisResult());

    service.analyzeDocument(uri, text, false);
    verify(documentService, times(1)).updateDocument(uri, text);
    verify(communications, times(1)).publishDiagnostics(any());
    verify(communications, times(1)).notifyProgressBegin(uri);
    verify(engine, times(1)).analyze(any(), any(), any());
  }

  @Test
  void testStopAnalysis_copybook() {
    String uri = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(true);
    when(documentService.get(uri)).thenReturn(mock(CobolDocumentModel.class));

    service.stopAnalysis(uri);
    verify(documentService, times(1)).closeDocument(uri);
    verify(communications, times(1)).publishDiagnostics(any());
    verify(documentService, times(0)).removeDocument(uri);
  }

  @Test
  void testStopAnalysis_program() {
    String uri = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(false);
    when(documentService.get(uri)).thenReturn(mock(CobolDocumentModel.class));

    service.stopAnalysis(uri);
    verify(documentService, times(1)).closeDocument(uri);
    verify(communications, times(1)).publishDiagnostics(any());
    verify(documentService, times(1)).removeDocument(uri);
  }

  @Test
  void testRetrieveAnalysis_analyzed() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();

    CobolDocumentModel document = mock(CobolDocumentModel.class);
    when(document.isDocumentSynced()).thenReturn(true);
    when(document.getAnalysisResult()).thenReturn(prepareAnalysisResult());

    when(documentService.get(uri)).thenReturn(document);

    assertNotNull(service.retrieveAnalysis(uri, text));
    verify(engine, times(0)).analyze(any(), any(), any());
  }

  private AnalysisResult prepareAnalysisResult() {
    return AnalysisResult.builder().rootNode(new RootNode()).build();
  }
}
