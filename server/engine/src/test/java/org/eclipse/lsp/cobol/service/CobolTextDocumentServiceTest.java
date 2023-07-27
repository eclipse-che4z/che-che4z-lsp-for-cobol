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

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonObject;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * This test checks the entry points of the {@link TextDocumentService} implementation.
 */
@ExtendWith(MockitoExtension.class)
class CobolTextDocumentServiceTest {

  @Mock protected Completions completions;
  @Mock protected CodeActions actions;
  @Mock protected CFASTBuilder builder;
  @Mock protected WatcherService watcherService;
  @Mock protected TaskService taskService;
  @Mock protected AnalysisService analysisService;

  private CobolTextDocumentService service;

  /**
   * Give a dummy {@link CobolTextDocumentService} with mocked attributes for testing. All tasks run
   * synchronously.
   */
  @BeforeEach
  void setupService() {
    service = new CobolTextDocumentService(
        actions,
        builder,
        new CobolLSPServerStateService(),
        watcherService,
        analysisService,
        taskService);
  }

  @Test
  void testAnalysis() {
    JsonObject json = new JsonObject();
    json.addProperty("uri", "");
    when(taskService.runNextTask(any(), any(), any())).thenReturn(CompletableFuture.completedFuture(null));

    service.analysis(json);
    Mockito.verify(taskService, times(1)).runNextTask(any(), any(), any());
  }

  @Test
  void testDidChange() {
    VersionedTextDocumentIdentifier doc = mock(VersionedTextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    DidChangeTextDocumentParams params = mock(DidChangeTextDocumentParams.class);
    when(params.getTextDocument()).thenReturn(doc);
    when(params.getContentChanges()).thenReturn(ImmutableList.of(mock(TextDocumentContentChangeEvent.class)));
    when(taskService.runTask(any(), any())).thenReturn(CompletableFuture.completedFuture(null));

    service.didChange(params);
    Mockito.verify(taskService, times(1)).runTask(any(), any());
  }

  @Test
  void testDidClose() {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    DidCloseTextDocumentParams params = mock(DidCloseTextDocumentParams.class);
    when(params.getTextDocument()).thenReturn(doc);
    when(taskService.runTask(any())).thenReturn(CompletableFuture.completedFuture(null));

    service.didClose(params);
    Mockito.verify(taskService, times(1)).runTask(any());
    Mockito.verify(watcherService, times(1)).removeRuntimeWatchers(any());
  }

  @Test
  void testDidOpen() {
    TextDocumentItem textDocument = mock(TextDocumentItem.class);
    when(textDocument.getUri()).thenReturn("");

    DidOpenTextDocumentParams params = mock(DidOpenTextDocumentParams.class);
    when(params.getTextDocument()).thenReturn(textDocument);
    when(taskService.runTask(any(), any())).thenReturn(CompletableFuture.completedFuture(null));

    service.didOpen(params);
    Mockito.verify(taskService, times(1)).runTask(any(), any());
    Mockito.verify(watcherService, times(1)).addRuntimeWatchers(any());
  }

  @Test
  void testCodeAction() {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    CodeActionParams params = mock(CodeActionParams.class);
    when(params.getTextDocument()).thenReturn(doc);
    when(taskService.runTask(any())).thenReturn(CompletableFuture.completedFuture(null));

    service.codeAction(params);
    Mockito.verify(taskService, times(1)).runTask(any());
  }

  @Test
  void testCompletion() {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    CompletionParams params = mock(CompletionParams.class);
    when(params.getTextDocument()).thenReturn(doc);

    service.completion(params);
    Mockito.verify(taskService, times(1)).runNextTask(any(), any(), any());
  }

  @Test
  void testDefinition() {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    DefinitionParams params = mock(DefinitionParams.class);
    when(params.getTextDocument()).thenReturn(doc);

    service.definition(params);
    Mockito.verify(taskService, times(1)).runNextTask(any(), any(), any());
  }

  @Test
  void testDocumentHighlight() {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    DocumentHighlightParams params = mock(DocumentHighlightParams.class);
    when(params.getTextDocument()).thenReturn(doc);

    service.documentHighlight(params);
    Mockito.verify(taskService, times(1)).runNextTask(any(), any(), any());
  }

  @Test
  void testDocumentSymbol() {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    DocumentSymbolParams params = mock(DocumentSymbolParams.class);
    when(params.getTextDocument()).thenReturn(doc);
    when(taskService.runNextTask(any(), any(), any())).thenReturn(CompletableFuture.completedFuture(null));

    service.documentSymbol(params);
    Mockito.verify(taskService, times(1)).runNextTask(any(), any(), any());
  }

  @Test
  void testFoldingRange() {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    FoldingRangeRequestParams params = mock(FoldingRangeRequestParams.class);
    when(params.getTextDocument()).thenReturn(doc);
    when(taskService.runNextTask(any(), any(), any())).thenReturn(CompletableFuture.completedFuture(null));

    service.foldingRange(params);
    Mockito.verify(taskService, times(1)).runNextTask(any(), any(), any());
  }

  @Test
  void testFormatting() throws ExecutionException, InterruptedException {
    TextDocumentIdentifier doc = mock(TextDocumentIdentifier.class);
    when(doc.getUri()).thenReturn("");

    DocumentFormattingParams params = mock(DocumentFormattingParams.class);
    when(params.getTextDocument()).thenReturn(doc);
    when(taskService.runTask(any())).thenReturn(CompletableFuture.completedFuture(null));

    service.formatting(params).get();
    Mockito.verify(taskService, times(1)).runTask(any());
  }

}
