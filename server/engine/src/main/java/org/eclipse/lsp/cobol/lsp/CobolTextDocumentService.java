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
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.lsp.events.notifications.DidChangeNotification;
import org.eclipse.lsp.cobol.lsp.events.queries.CodeActionQuery;
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
  private final LspMessageBroker lspMessageBroker;
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
          LspMessageBroker lspMessageBroker,
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
    this.lspMessageBroker = lspMessageBroker;
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
    return lspMessageBroker.query(completionHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<Either<List<? extends Location>, List<? extends LocationLink>>>
  definition(DefinitionParams params) {
    return lspMessageBroker.query(definitionHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    return lspMessageBroker.query(referencesHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
          DocumentHighlightParams params) {
    return lspMessageBroker.query(documentHighlightHandler.createEvent(params));

  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> formatting(DocumentFormattingParams params) {
    return lspMessageBroker.query(formattingHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<Either<Command, CodeAction>>> codeAction(CodeActionParams params) {
    return lspMessageBroker.query(new CodeActionQuery(params, codeActionHandler));
  }

  @Override
  public void didOpen(DidOpenTextDocumentParams params) {
    didOpenHandler.createEvent(params).execute();
  }

  @SneakyThrows
  @Override
  public void didChange(DidChangeTextDocumentParams params) {
    lspMessageBroker.notify(new DidChangeNotification(params, didChangeHandler));
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
    return lspMessageBroker.query(analysisHandler.createEvent(json));
  }

  @Override
  public CompletableFuture<List<Either<SymbolInformation, DocumentSymbol>>> documentSymbol(
          DocumentSymbolParams params) {
    return lspMessageBroker.query(documentSymbolHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<Hover> hover(HoverParams params) {
    return lspMessageBroker.query(hoverHandler.createEvent(params));
  }

  @Override
  public CompletableFuture<List<FoldingRange>> foldingRange(FoldingRangeRequestParams params) {
    return lspMessageBroker.query(foldingRangeHandler.createEvent(params));
  }
}
