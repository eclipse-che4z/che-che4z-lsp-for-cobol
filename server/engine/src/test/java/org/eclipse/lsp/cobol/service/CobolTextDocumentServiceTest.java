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

import com.google.gson.JsonObject;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.CobolTextDocumentService;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.LspMessageDispatcher;
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

import java.util.concurrent.ExecutionException;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * This test checks the entry points of the {@link TextDocumentService} implementation.
 */
@ExtendWith(MockitoExtension.class)
class CobolTextDocumentServiceTest {

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
  protected HoverProvider hoverProvider;
  @Mock
  LspMessageDispatcher lspMessageDispatcher;

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
    AsyncAnalysisService asyncAnalysisService = new AsyncAnalysisService(documentModelService, analysisService, copybookService, subroutineService);

    CompletionHandler completionHandler = new CompletionHandler(asyncAnalysisService, completions);
    FormattingHandler formattingHandler = new FormattingHandler(documentModelService, formations);

    CodeActionHandler codeActionHandler = new CodeActionHandler(actions);
    AnalysisHandler analysisHandler = new AnalysisHandler(asyncAnalysisService, builder);

    DidOpenHandler didOpenHandler = new DidOpenHandler(asyncAnalysisService, watcherService);
    DidCloseHandler didCloseHandler = new DidCloseHandler(disposableLSPStateService, analysisService, watcherService);
    DidChangeHandler didChangeHandler = new DidChangeHandler(asyncAnalysisService);
    DefinitionHandler definitionHandler = new DefinitionHandler(asyncAnalysisService, occurrences);
    DocumentSymbolHandler documentSymbolHandler = new DocumentSymbolHandler(communications, asyncAnalysisService);
    DocumentHighlightHandler documentHighlightHandler = new DocumentHighlightHandler(asyncAnalysisService, occurrences);
    ReferencesHandler referencesHandler = new ReferencesHandler(asyncAnalysisService, occurrences);
    HoverHandler hoverHandler = new HoverHandler(asyncAnalysisService, hoverProvider);
    FoldingRangeHandler foldingRangeHandler = new FoldingRangeHandler(documentModelService);


    lspMessageDispatcher.startEventLoop();
    service = new CobolTextDocumentService(
            lspMessageDispatcher,
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
    lspMessageDispatcher.stop();
  }

  @Test
  void testAnalysis() {
    JsonObject json = new JsonObject();
    json.addProperty("uri", "");

    service.analysis(json);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testDidChange() {
    DidChangeTextDocumentParams params = mock(DidChangeTextDocumentParams.class);
    service.didChange(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testDidClose() {
    DidCloseTextDocumentParams params = mock(DidCloseTextDocumentParams.class);
    service.didClose(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testDidOpen() {
    DidOpenTextDocumentParams params = mock(DidOpenTextDocumentParams.class);
    service.didOpen(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testCodeAction() {
    CodeActionParams params = mock(CodeActionParams.class);
    service.codeAction(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testCompletion() {
    CompletionParams params = mock(CompletionParams.class);
    service.completion(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testDefinition() {
    DefinitionParams params = mock(DefinitionParams.class);
    service.definition(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testDocumentHighlight() {
    DocumentHighlightParams params = mock(DocumentHighlightParams.class);
    service.documentHighlight(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testDocumentSymbol() {
    DocumentSymbolParams params = mock(DocumentSymbolParams.class);
    service.documentSymbol(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testFoldingRange() {
    FoldingRangeRequestParams params = mock(FoldingRangeRequestParams.class);
    service.foldingRange(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }

  @Test
  void testFormatting() throws ExecutionException, InterruptedException {
    DocumentFormattingParams params = mock(DocumentFormattingParams.class);
    service.formatting(params);
    Mockito.verify(lspMessageDispatcher, times(1)).publish(any());
  }
}
