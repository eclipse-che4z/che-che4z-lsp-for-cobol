/*
 * Copyright (c) 2020 Broadcom.
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

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.google.gson.JsonObject;
import java.util.Set;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.lsp.*;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.notifications.DidChangeNotification;
import org.eclipse.lsp.cobol.lsp.events.queries.CompletionQuery;
import org.eclipse.lsp.cobol.lsp.events.queries.DefinitionQuery;
import org.eclipse.lsp.cobol.lsp.events.queries.DocumentHighlightQuery;
import org.eclipse.lsp.cobol.lsp.events.queries.FormattingQuery;
import org.eclipse.lsp.cobol.lsp.handlers.extended.AnalysisHandler;
import org.eclipse.lsp.cobol.lsp.handlers.text.*;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 * This test checks the entry points of the {@link TextDocumentService} implementation.
 */
@ExtendWith(MockitoExtension.class)
class CobolTextDocumentServiceTest {

  public static final String URI = "file://document.cbl";
  @Mock
  protected Completions completions;
  @Mock
  protected CodeActions actions;
  @Mock
  protected CFASTBuilder builder;
  @Mock
  protected WatcherService watcherService;
  @Mock
  protected AnalysisService analysisService;
  @Mock
  protected DocumentModelService documentModelService;
  @Mock
  protected Communications communications;
  @Mock
  protected Occurrences occurrences;
  @Mock
  protected Formations formations;

  @Mock
  protected Set<HoverProvider> hoverProvider;

  @Mock
  protected SourceUnitGraph documentGraph;

  @Mock
  LspMessageBroker lspMessageBroker;

  @Mock
  UriDecodeService uriDecodeService;

  private CobolTextDocumentService service;

  /**
   * Give a dummy {@link CobolTextDocumentService} with mocked attributes for testing. All tasks run
   * synchronously.
   */
  @BeforeEach
  void setupService() {
    DisposableLSPStateService disposableLSPStateService = new CobolLSPServerStateService();
    CopybookService copybookService = mock(CopybookService.class);
    SubroutineService subroutineService = mock(SubroutineService.class);
    AsyncAnalysisService asyncAnalysisService = new AsyncAnalysisService(documentModelService, analysisService, copybookService, subroutineService, communications);

    CompletionHandler completionHandler = new CompletionHandler(asyncAnalysisService, completions, documentModelService, uriDecodeService);
    FormattingHandler formattingHandler = new FormattingHandler(documentModelService, formations, asyncAnalysisService, uriDecodeService);

    CodeActionHandler codeActionHandler = new CodeActionHandler(actions);
    AnalysisHandler analysisHandler = new AnalysisHandler(asyncAnalysisService, analysisService, builder, communications, documentModelService, uriDecodeService);

    DidOpenHandler didOpenHandler = new DidOpenHandler(asyncAnalysisService, watcherService, uriDecodeService);
    DidCloseHandler didCloseHandler = new DidCloseHandler(disposableLSPStateService, asyncAnalysisService, documentModelService, watcherService, copybookService, documentGraph, uriDecodeService);
    DidChangeHandler didChangeHandler = new DidChangeHandler(asyncAnalysisService, documentGraph, uriDecodeService);
    DefinitionHandler definitionHandler = new DefinitionHandler(asyncAnalysisService, documentModelService, occurrences, uriDecodeService);
    DocumentSymbolHandler documentSymbolHandler = new DocumentSymbolHandler(asyncAnalysisService, analysisService, documentModelService, uriDecodeService);
    DocumentHighlightHandler documentHighlightHandler = new DocumentHighlightHandler(asyncAnalysisService, occurrences, documentModelService, uriDecodeService);
    ReferencesHandler referencesHandler = new ReferencesHandler(asyncAnalysisService, occurrences, documentModelService, uriDecodeService);
    HoverHandler hoverHandler = new HoverHandler(asyncAnalysisService, hoverProvider, documentModelService, documentGraph, uriDecodeService);
    FoldingRangeHandler foldingRangeHandler = new FoldingRangeHandler(documentModelService, asyncAnalysisService, uriDecodeService, analysisService);

    service = new CobolTextDocumentService(
            lspMessageBroker,
            completionHandler,
            codeActionHandler,
            analysisHandler,
            formattingHandler,
            didOpenHandler,
            didCloseHandler,
            didChangeHandler,
            definitionHandler,
            documentSymbolHandler,
            documentHighlightHandler,
            referencesHandler,
            hoverHandler,
            foldingRangeHandler);
  }

  @AfterEach
  void tearDown() throws InterruptedException {
    lspMessageBroker.stop();
  }

  @Test
  void testAnalysis() {
    JsonObject json = new JsonObject();
    json.addProperty("uri", "");

    service.analysis(json);
    Mockito.verify(lspMessageBroker, times(1)).query(any());
  }

  @Test
  void testDidChange() {
    DidChangeTextDocumentParams params = mock(DidChangeTextDocumentParams.class);
    service.didChange(params);
    Mockito.verify(lspMessageBroker, times(1)).notify(any(DidChangeNotification.class));
  }

  @Test
  void testDidClose() {
    DidCloseTextDocumentParams params = mock(DidCloseTextDocumentParams.class);
    TextDocumentIdentifier textDocumentIdentifier = mock(TextDocumentIdentifier.class);
    when(textDocumentIdentifier.getUri()).thenReturn(URI);
    when(params.getTextDocument()).thenReturn(textDocumentIdentifier);
    service.didClose(params);
    Mockito.verify(lspMessageBroker, times(0)).query(any());
  }

  @Test
  void testDidOpen() {
    DidOpenTextDocumentParams params = mock(DidOpenTextDocumentParams.class);
    TextDocumentItem textDocumentItem = mock(TextDocumentItem.class);
    when(params.getTextDocument()).thenReturn(textDocumentItem);
    when(textDocumentItem.getUri()).thenReturn(URI);
    when(uriDecodeService.decode(URI)).thenReturn(URI);
    service.didOpen(params);
    Mockito.verify(lspMessageBroker, times(0)).query(any());
  }

  @Test
  void testCodeAction() {
    CodeActionParams params = mock(CodeActionParams.class);
    service.codeAction(params);
    Mockito.verify(lspMessageBroker, times(1)).query(any());
  }

  @Test
  void testCompletion() {
    CompletionParams params = mock(CompletionParams.class);
    service.completion(params);
    Mockito.verify(lspMessageBroker, times(1)).query(any(CompletionQuery.class));
  }

  @Test
  void testDefinition() {
    DefinitionParams params = mock(DefinitionParams.class);
    service.definition(params);
    Mockito.verify(lspMessageBroker, times(1)).query(any(DefinitionQuery.class));
  }

  @Test
  void testDocumentHighlight() {
    DocumentHighlightParams params = mock(DocumentHighlightParams.class);
    service.documentHighlight(params);
    Mockito.verify(lspMessageBroker, times(1)).query(any(DocumentHighlightQuery.class));
  }

  @Test
  void testDocumentSymbol() {
    DocumentSymbolParams params = mock(DocumentSymbolParams.class);
    TextDocumentIdentifier textDocumentIdentifier = mock(TextDocumentIdentifier.class);
    when(textDocumentIdentifier.getUri()).thenReturn(URI);
    when(params.getTextDocument()).thenReturn(textDocumentIdentifier);

    service.documentSymbol(params);
    Mockito.verify(lspMessageBroker, times(1)).query(any());
  }

  @Test
  void testFoldingRange() {
    FoldingRangeRequestParams params = mock(FoldingRangeRequestParams.class);
    TextDocumentIdentifier textDocumentIdentifier = mock(TextDocumentIdentifier.class);
    when(textDocumentIdentifier.getUri()).thenReturn(URI);
    when(params.getTextDocument()).thenReturn(textDocumentIdentifier);
    service.foldingRange(params);
    Mockito.verify(lspMessageBroker, times(1)).query(any());
  }

  @Test
  void testFormatting() {
    DocumentFormattingParams params = mock(DocumentFormattingParams.class);
    service.formatting(params);
    Mockito.verify(lspMessageBroker, times(1)).query(any(FormattingQuery.class));
  }
}
