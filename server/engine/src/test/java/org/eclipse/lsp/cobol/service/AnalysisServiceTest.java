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
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookReferenceRepo;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.eclipse.lsp4j.*;
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
  @Mock private DataBusBroker dataBus;
  @Mock private CopybookReferenceRepo copybookReferenceRepo;
  @Mock private CopybookService copybookService;
  @Mock private Completions completions;
  @Mock private Occurrences occurrences;
  @Mock private Formations formations;
  @Mock private HoverProvider hoverProvider;
  @Mock private DocumentModelService documentService;

  @BeforeEach
  void init() {
    service = new AnalysisService(communications, engine, dataBus, configurationService, syncProvider, copybookIdentificationService,
        copybookReferenceRepo, copybookService, completions, occurrences, formations, hoverProvider, documentService);
    service.setExtensionConfig(ImmutableList.of());
  }

  @Test
  void testIsCopybook() throws InterruptedException {
    service = new AnalysisService(communications, engine, dataBus, configurationService, syncProvider, copybookIdentificationService,
        copybookReferenceRepo, copybookService, completions, occurrences, formations, hoverProvider, documentService);

    CompletableFuture.supplyAsync(() -> service.isCopybook("", ""));

    Thread.sleep(10);
    verify(copybookIdentificationService, times(0)).isCopybook(any(), any(), any());

    service.setExtensionConfig(ImmutableList.of());

    Thread.sleep(10);
    verify(copybookIdentificationService, times(1)).isCopybook(any(), any(), any());
  }

  @Test
  void findCompletion() {
    String uri = UUID.randomUUID().toString();
    service.findCompletion(uri, mock(CompletionParams.class));

    verify(documentService, times(1)).get(uri);
    verify(completions, times(1)).collectFor(any(), any());
  }

  @Test
  void findDefinition() {
    String uri = UUID.randomUUID().toString();
    when(documentService.isDocumentSynced(uri)).thenReturn(true);

    service.findDefinition(uri, mock(DefinitionParams.class));

    verify(documentService, times(1)).isDocumentSynced(uri);
    verify(occurrences, times(1)).findDefinitions(any(), any());
  }

  @Test
  void findReferences() {
    String uri = UUID.randomUUID().toString();
    when(documentService.isDocumentSynced(uri)).thenReturn(true);

    service.findReferences(uri, mock(ReferenceParams.class));
    verify(documentService, times(1)).isDocumentSynced(uri);
    verify(occurrences, times(1)).findReferences(any(), any(), any());
  }

  @Test
  void findHighlights() {
    String uri = UUID.randomUUID().toString();
    when(documentService.isDocumentSynced(uri)).thenReturn(true);

    service.findHighlights(uri, mock(DocumentHighlightParams.class));
    verify(documentService, times(1)).isDocumentSynced(uri);
    verify(occurrences, times(1)).findHighlights(any(), any());
  }

  @Test
  void findFormatting() {
    String uri = UUID.randomUUID().toString();

    service.findFormatting(uri);
    verify(documentService, times(1)).get(uri);
    verify(formations, times(1)).format(any());
  }

  @Test
  void findHover() {
    String uri = UUID.randomUUID().toString();

    service.findHover(uri, mock(HoverParams.class));
    verify(documentService, times(1)).get(uri);
    verify(hoverProvider, times(1)).getHover(any(), any());
  }

  @Test
  void findFoldingRange() {
    String uri = UUID.randomUUID().toString();
    when(documentService.get(uri)).thenReturn(mock(CobolDocumentModel.class));

    service.findFoldingRange(uri);
    verify(documentService, times(1)).get(uri);
  }

  @Test
  void findDocumentSymbol() {
    String uri = UUID.randomUUID().toString();
    when(documentService.get(uri)).thenReturn(mock(CobolDocumentModel.class));

    service.findDocumentSymbol(uri);
    verify(communications, times(1)).notifyProgressEnd(uri);
  }


  @Test
  void testAnalyzeDocument_git() {
    String uri = "gitfs:/" + UUID.randomUUID();
    String text = UUID.randomUUID().toString();

    service.analyzeDocument(uri, text);
    verify(documentService, times(0)).openDocument(uri, text);
  }

  @Test
  void testAnalyzeDocument_copybook() {
    String uri = UUID.randomUUID().toString();
    String text = UUID.randomUUID().toString();
    when(copybookIdentificationService.isCopybook(any(), any(), any())).thenReturn(true);

    service.analyzeDocument(uri, text);
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

    service.analyzeDocument(uri, text);
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

    service.reanalyzeDocument(uri, text);
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

    service.reanalyzeDocument(uri, text);
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
    return AnalysisResult.builder()
        .rootNode(new RootNode())
        .build();
  }
}
