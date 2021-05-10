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

import com.google.common.annotations.VisibleForTesting;
import com.google.common.collect.ImmutableMap;
import com.google.common.eventbus.Subscribe;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Builder;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.annotation.CheckServerShutdownState;
import org.eclipse.lsp.cobol.core.annotation.DisposableService;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.domain.databus.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisResultEvent;
import org.eclipse.lsp.cobol.jrpc.ExtendedApi;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.function.BiConsumer;

import static java.lang.String.format;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.concurrent.CompletableFuture.supplyAsync;
import static java.util.stream.Collectors.toList;

/**
 * This class is a set of end-points to apply text operations for COBOL documents. All the requests
 * that start with "textDocument" go here. The current implementation contains only supported
 * language features. For more details, please, see the specification:
 * https://microsoft.github.io//language-server-protocol/specifications/specification-3-14/
 *
 * <p>For the maintainers: Please, add logging for exceptions if you run any asynchronous operation.
 * Also, you perform any communication with the client, do it a using {@link Communications}
 * instance.
 */
@Slf4j
@Singleton
public class CobolTextDocumentService
    implements TextDocumentService, DisposableService, ExtendedApi {
  private static final String GIT_FS_URI = "gitfs:/";
  private static final String GITFS_URI_NOT_SUPPORTED = "GITFS URI not supported";
  private final Map<String, CobolDocumentModel> docs = new ConcurrentHashMap<>();
  private final Map<String, CompletableFuture<List<DocumentSymbol>>> outlineMap =
          new ConcurrentHashMap<>();
  private final Map<String, CompletableFuture<Node>> cfAstMap = new ConcurrentHashMap<>();
  private final Map<String, Future<?>> futureMap = new ConcurrentHashMap<>();
  private Communications communications;
  private LanguageEngineFacade engine;
  private Formations formations;
  private Completions completions;
  private Occurrences occurrences;
  private CodeActions actions;
  private DataBusBroker dataBus;
  private CustomThreadPoolExecutor executors;
  private HoverProvider hoverProvider;
  private CFASTBuilder cfastBuilder;

  @Inject
  @Builder
  CobolTextDocumentService(
      Communications communications,
      LanguageEngineFacade engine,
      Formations formations,
      Completions completions,
      Occurrences occurrences,
      DataBusBroker dataBus,
      CodeActions actions,
      CustomThreadPoolExecutor executors,
      HoverProvider hoverProvider,
      CFASTBuilder cfastBuilder) {
    this.communications = communications;
    this.engine = engine;
    this.formations = formations;
    this.completions = completions;
    this.occurrences = occurrences;
    this.actions = actions;
    this.dataBus = dataBus;
    this.executors = executors;
    this.hoverProvider = hoverProvider;
    this.cfastBuilder = cfastBuilder;

    dataBus.subscribe(this);
  }

  @VisibleForTesting
  Map<String, CobolDocumentModel> getDocs() {
    return new HashMap<>(docs);
  }

  @VisibleForTesting
  Map<String, Future<?>> getFutureMap() {
    return new HashMap<>(futureMap);
  }

  @VisibleForTesting
  public Map<String, CompletableFuture<List<DocumentSymbol>>> getOutlineMap() {
    return outlineMap;
  }

  @Override
  @CheckServerShutdownState
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion(
      CompletionParams params) {
    String uri = params.getTextDocument().getUri();
    return CompletableFuture.<Either<List<CompletionItem>, CompletionList>>supplyAsync(
            () -> Either.forRight(completions.collectFor(docs.get(uri), params)),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("completion lookup", uri)));
  }

  @Override
  @CheckServerShutdownState
  public CompletableFuture<List<? extends Location>> definition(
      TextDocumentPositionParams position) {
    String uri = position.getTextDocument().getUri();
    return CompletableFuture.<List<? extends Location>>supplyAsync(
            () -> occurrences.findDefinitions(docs.get(uri), position),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("definitions resolving", uri)));
  }

  @Override
  @CheckServerShutdownState
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    String uri = params.getTextDocument().getUri();
    return CompletableFuture.<List<? extends Location>>supplyAsync(
            () -> occurrences.findReferences(docs.get(uri), params, params.getContext()),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("references resolving", uri)));
  }

  @Override
  @CheckServerShutdownState
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
      TextDocumentPositionParams position) {
    String uri = position.getTextDocument().getUri();
    return CompletableFuture.<List<? extends DocumentHighlight>>supplyAsync(
            () -> occurrences.findHighlights(docs.get(uri), position),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("document highlighting", uri)));
  }

  @Override
  @CheckServerShutdownState
  public CompletableFuture<List<? extends TextEdit>> formatting(DocumentFormattingParams params) {
    String uri = params.getTextDocument().getUri();
    CobolDocumentModel model = docs.get(uri);
    return CompletableFuture.<List<? extends TextEdit>>supplyAsync(
            () -> formations.format(model), executors.getThreadPoolExecutor())
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("formatting", uri)));
  }

  @Override
  @CheckServerShutdownState
  public CompletableFuture<List<Either<Command, CodeAction>>> codeAction(CodeActionParams params) {
    return supplyAsync(() -> actions.collect(params), executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(
                createDescriptiveErrorMessage(
                    "code actions lookup", params.getTextDocument().getUri())));
  }

  @Override
  @CheckServerShutdownState
  public void didOpen(DidOpenTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    outlineMap.put(uri, new CompletableFuture<>());
    cfAstMap.put(uri, new CompletableFuture<>());
    // git FS URIs are not currently supported
    if (uri.startsWith(GIT_FS_URI)) {
      LOG.warn(String.join(" ", GITFS_URI_NOT_SUPPORTED, uri));
    }

    String text = params.getTextDocument().getText();
    communications.notifyThatLoadingInProgress(uri);
    analyzeDocumentFirstTime(uri, text, false);
  }

  @Override
  @CheckServerShutdownState
  public void didChange(DidChangeTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    outlineMap.put(uri, new CompletableFuture<>());
    cfAstMap.put(uri, new CompletableFuture<>());
    String text = params.getContentChanges().get(0).getText();
    interruptAnalysis(uri);
    analyzeChanges(uri, text);
  }

  @Override
  @CheckServerShutdownState
  public void didClose(DidCloseTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    LOG.info(format("Document closing invoked on URI %s", uri));
    interruptAnalysis(uri);
    communications.publishDiagnostics(ImmutableMap.of(uri, Collections.emptyList()));
    communications.cancelProgressNotification(uri);
    docs.remove(uri);
    clearAnalysedFutureObject(uri);
  }

  private void interruptAnalysis(String uri) {
    if (futureMap.containsKey(uri)) {
      LOG.debug("Analysis for uri: " + uri + " is interrupted.");
      futureMap.get(uri).cancel(true);
    }
  }

  @Override
  @CheckServerShutdownState
  public void didSave(DidSaveTextDocumentParams params) {
    LOG.info("Document saved...");
  }

  /**
   * Handle RunAnalysisEvent from the DataBus.
   *
   * @param event a RunAnalysisEvent
   */
  @Subscribe
  @CheckServerShutdownState
  public void onRunAnalysisEventCallback(@NonNull RunAnalysisEvent event) {
    docs.forEach((key, value) -> analyzeDocumentFirstTime(key, value.getText(), event.isVerbose()));
  }

  @Override
  @CheckServerShutdownState
  public CompletableFuture<ExtendedApiResult> analysis(@NonNull JsonObject json) {
    AnalysisResultEvent event = new Gson().fromJson(json.toString(), AnalysisResultEvent.class);
    String uri = Optional.ofNullable(event).map(AnalysisResultEvent::getUri).orElse("");
    cfAstMap.computeIfAbsent(uri, (a) -> {
      analyzeDocumentFirstTime(event.getUri(), event.getText(), false);
      return new CompletableFuture<>();
    });

    return cfAstMap
            .get(uri).thenApply(cfastBuilder::build)
            .whenComplete(
                    reportExceptionIfThrown(createDescriptiveErrorMessage("analysis retrieving", uri)));
  }

  private void clearAnalysedFutureObject(String uri) {
    futureMap.remove(uri);
  }

  private void analyzeDocumentFirstTime(String uri, String text, boolean userRequest) {
    registerDocument(uri, new CobolDocumentModel(text, AnalysisResult.empty()));
    Future<?> docAnalysisFuture =
        executors
            .getThreadPoolExecutor()
            .submit(
                () -> {
                  try {
                    CopybookProcessingMode copybookProcessingMode =
                        CopybookProcessingMode.getCopybookProcessingMode(
                            uri,
                            userRequest
                                ? CopybookProcessingMode.ENABLED_VERBOSE
                                : CopybookProcessingMode.ENABLED);
                    AnalysisResult result = engine.analyze(uri, text, copybookProcessingMode);
                    ofNullable(docs.get(uri)).ifPresent(doc -> doc.setAnalysisResult(result));
                    publishResult(uri, result, copybookProcessingMode);
                    outlineMap.get(uri).complete(result.getOutlineTree());
                    cfAstMap.get(uri).complete(result.getRootNode());
                  } catch (Exception e) {
                    LOG.error(createDescriptiveErrorMessage("analysis", uri), e);
                  } finally {
                    clearAnalysedFutureObject(uri);
                  }
                });
    registerToFutureMap(uri, docAnalysisFuture);
  }

  private void registerToFutureMap(String uri, Future<?> docAnalysisFuture) {
    futureMap.put(uri, docAnalysisFuture);
  }

  void analyzeChanges(String uri, String text) {
    Future<?> analyseSubmitFuture =
        executors
            .getThreadPoolExecutor()
            .submit(
                () -> {
                  try {
                    AnalysisResult result =
                        engine.analyze(
                            uri,
                            text,
                            CopybookProcessingMode.getCopybookProcessingMode(
                                uri, CopybookProcessingMode.SKIP));
                    registerDocument(uri, new CobolDocumentModel(text, result));
                    communications.publishDiagnostics(result.getDiagnostics());
                    outlineMap.get(uri).complete(result.getOutlineTree());
                    cfAstMap.get(uri).complete(result.getRootNode());
                  } catch (Exception ex) {
                    LOG.error(createDescriptiveErrorMessage("analysis", uri), ex);
                  } finally {
                    clearAnalysedFutureObject(uri);
                  }
                });
    registerToFutureMap(uri, analyseSubmitFuture);
  }

  private void publishResult(
      String uri, AnalysisResult result, CopybookProcessingMode copybookProcessingMode) {
    notifyAnalysisFinished(uri, result.getCopybookUsages(), copybookProcessingMode);
    communications.cancelProgressNotification(uri);
    communications.publishDiagnostics(result.getDiagnostics());
    if (result.getDiagnostics().isEmpty()) communications.notifyThatDocumentAnalysed(uri);
  }

  private void notifyAnalysisFinished(
      String uri,
      Map<String, List<Location>> copybooks,
      CopybookProcessingMode copybookProcessingMode) {
    dataBus.postData(
        AnalysisFinishedEvent.builder()
            .documentUri(uri)
            .copybookUris(
                ofNullable(copybooks).map(Map::values).orElse(emptyList()).stream()
                    .flatMap(List::stream)
                    .map(Location::getUri)
                    .distinct()
                    .collect(toList()))
            .copybookProcessingMode(copybookProcessingMode)
            .build());
  }

  @Override
  public CompletableFuture<List<Either<SymbolInformation, DocumentSymbol>>> documentSymbol(
      DocumentSymbolParams params) {
    String uri = params.getTextDocument().getUri();
    return outlineMap
        .get(uri)
        .<List<Either<SymbolInformation, DocumentSymbol>>>thenApply(
            documentSymbols ->
                documentSymbols.stream()
                    .map(Either::<SymbolInformation, DocumentSymbol>forRight)
                    .collect(toList()))
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("symbol analysis", uri)));
  }

  @Override
  public CompletableFuture<Hover> hover(TextDocumentPositionParams position) {
    String uri = position.getTextDocument().getUri();
    return CompletableFuture.<Hover>supplyAsync(
            () -> hoverProvider.getHover(docs.get(uri), position),
            executors.getThreadPoolExecutor())
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("getting hover", uri)));
  }

  private void registerDocument(String uri, CobolDocumentModel document) {
    docs.put(uri, document);
  }

  private String createDescriptiveErrorMessage(String action, String uri) {
    return format("An exception thrown while applying %s for %s:", action, uri);
  }

  private BiConsumer<Object, Throwable> reportExceptionIfThrown(String message) {
    return (res, ex) -> ofNullable(ex).ifPresent(it -> LOG.error(message, it));
  }
}
