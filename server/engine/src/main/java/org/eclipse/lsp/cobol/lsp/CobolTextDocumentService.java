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
package org.eclipse.lsp.cobol.lsp;

import com.google.gson.JsonObject;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.lsp.handlers.extended.AnalysisHandler;
import org.eclipse.lsp.cobol.lsp.handlers.text.*;
import org.eclipse.lsp.cobol.lsp.jrpc.ExtendedApi;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;

/**
 * This class is a set of end-points to apply text operations for COBOL documents. All the requests
 * that start with "textDocument" go here. The current implementation contains only supported
 * language features. For more details, please, see the specification:
 * <a href="https://microsoft.github.io//language-server-protocol/specifications/specification-3-14/">...</a>
 *
 * <p>For the maintainers: Please, add logging for exceptions if you run any asynchronous operation.
 * Also, you perform any communication with the client, do it a using {@link Communications}
 * instance.
 */
@Slf4j
@Singleton
public class CobolTextDocumentService implements TextDocumentService, ExtendedApi {
  private final LspMessageDispatcher lspMessageDispatcher;
  private final CompletionHandler completionHandler;
  private final CodeActionHandler codeActionHandler;
  private final AnalysisHandler analysisHandler;
  private final FormattingHandler formattingHandler;
  private final DidOpenHandler didOpenHandler;
  private final DidCloseHandler didCloseHandler;
  private final DidChangeHandler didChangeHandler;
  private final DefinitionHandler definitionHandler;
  private final DocumentSymbolHandler documentSymbolHandler;
  private final DocumentHighlightHandler documentHighlightHandler;
  private final ReferencesHandler referencesHandler;
  private final HoverHandler hoverHandler;
  private final FoldingRangeHandler foldingRangeHandler;

  @Inject
  public CobolTextDocumentService(
          LspMessageDispatcher lspMessageDispatcher,
          CompletionHandler completionHandler,
          CodeActionHandler codeActionHandler,
          AnalysisHandler analysisHandler,
          FormattingHandler formattingHandler,
          DidOpenHandler didOpenHandler,
          DidCloseHandler didCloseHandler,
          DidChangeHandler didChangeHandler,
          DefinitionHandler definitionHandler,
          DocumentSymbolHandler documentSymbolHandler,
          DocumentHighlightHandler documentHighlightHandler,
          ReferencesHandler referencesHandler,
          HoverHandler hoverHandler,
          FoldingRangeHandler foldingRangeHandler) {
    this.lspMessageDispatcher = lspMessageDispatcher;
    this.completionHandler = completionHandler;
    this.codeActionHandler = codeActionHandler;
    this.analysisHandler = analysisHandler;
    this.formattingHandler = formattingHandler;
    this.didOpenHandler = didOpenHandler;
    this.didCloseHandler = didCloseHandler;
    this.didChangeHandler = didChangeHandler;
    this.definitionHandler = definitionHandler;
    this.documentSymbolHandler = documentSymbolHandler;
    this.documentHighlightHandler = documentHighlightHandler;
    this.referencesHandler = referencesHandler;
    this.hoverHandler = hoverHandler;
    this.foldingRangeHandler = foldingRangeHandler;
  }

  @Override
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion(
          CompletionParams params) {
    return lspMessageDispatcher.publish(completionHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<Either<List<? extends Location>, List<? extends LocationLink>>>
  definition(DefinitionParams params) {
    return lspMessageDispatcher.publish(definitionHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    return lspMessageDispatcher.publish(referencesHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
          DocumentHighlightParams params) {
    return lspMessageDispatcher.publish(documentHighlightHandler.createEvent(params));

  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> formatting(DocumentFormattingParams params) {
    return lspMessageDispatcher.publish(formattingHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<Either<Command, CodeAction>>> codeAction(CodeActionParams params) {
    return lspMessageDispatcher.publish(() -> codeActionHandler.codeAction(params));
  }

  @Override
  public void didOpen(DidOpenTextDocumentParams params) {
    try {
      didOpenHandler.createEvent(params).execute();
    } catch (ExecutionException | InterruptedException e) {
      LOG.error(e.getMessage(), e);
    }
  }

  @SneakyThrows
  @Override
  public void didChange(DidChangeTextDocumentParams params) {
    lspMessageDispatcher.publish(() -> {
      didChangeHandler.didChange(params);
      return null;
    });
  }

  @Override
  public void didClose(DidCloseTextDocumentParams params) {
    try {
      didCloseHandler.didClose(params);
    } catch (InterruptedException e) {
      LOG.error(e.getMessage(), e);
    }
  }

  @Override
  public void didSave(DidSaveTextDocumentParams params) {
    LOG.info("Document saved...");
  }

  @Override
  public CompletableFuture<ExtendedApiResult> analysis(@NonNull JsonObject json) {
    return lspMessageDispatcher.publish(analysisHandler.createEvent(json));
  }

  @Override
  public CompletableFuture<List<Either<SymbolInformation, DocumentSymbol>>> documentSymbol(
          DocumentSymbolParams params) {
    return lspMessageDispatcher.publish(documentSymbolHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<Hover> hover(HoverParams params) {
    return lspMessageDispatcher.publish(hoverHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<FoldingRange>> foldingRange(FoldingRangeRequestParams params) {
    return lspMessageDispatcher.publish(foldingRangeHandler.createEvent(params));
  }
}
