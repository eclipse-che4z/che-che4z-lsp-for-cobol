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
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Streams;
import com.google.common.eventbus.Subscribe;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Builder;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.core.model.tree.EmbeddedCodeNode;
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
import org.eclipse.lsp.cobol.service.utils.BuildOutlineTreeFromSyntaxTree;
import org.eclipse.lsp.cobol.service.utils.ShutdownCheckUtil;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.BiConsumer;
import java.util.function.Supplier;

import static java.lang.String.format;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.*;

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
@SuppressWarnings("UnstableApiUsage")
public class CobolTextDocumentService implements TextDocumentService, ExtendedApi {
  private static final String GIT_FS_URI = "gitfs:/";
  private static final String GITFS_URI_NOT_SUPPORTED = "GITFS URI not supported";
  private final Map<String, CobolDocumentModel> docs = new ConcurrentHashMap<>();
  private final Map<String, CompletableFuture<List<DocumentSymbol>>> outlineMap =
      new ConcurrentHashMap<>();
  private final Map<String, CompletableFuture<Node>> cfAstMap = new ConcurrentHashMap<>();
  private final Map<String, Future<?>> futureMap = new ConcurrentHashMap<>();
  private final Communications communications;
  private final LanguageEngineFacade engine;
  private final Formations formations;
  private final Completions completions;
  private final Occurrences occurrences;
  private final CodeActions actions;
  private final DataBusBroker dataBus;
  private final CustomThreadPoolExecutor executors;
  private final HoverProvider hoverProvider;
  private final CFASTBuilder cfastBuilder;
  private final SettingsService settingsService;
  private DisposableLSPStateService disposableLSPStateService;

  @Inject
  @Builder
  @SuppressWarnings("squid:S107")
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
      CFASTBuilder cfastBuilder,
      DisposableLSPStateService disposableLSPStateService,
      SettingsService settingsService) {
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
    this.settingsService = settingsService;
    this.disposableLSPStateService = disposableLSPStateService;

    dataBus.subscribe(this);
  }

  @VisibleForTesting
  public void setDisposableLSPStateService(DisposableLSPStateService disposableLSPStateService) {
    this.disposableLSPStateService = disposableLSPStateService;
  }

  @VisibleForTesting
  Map<String, CobolDocumentModel> getDocs() {
    return new HashMap<>(docs);
  }

  @SuppressWarnings("squid:S1452")
  @VisibleForTesting
  Map<String, Future<?>> getFutureMap() {
    return new HashMap<>(futureMap);
  }

  @VisibleForTesting
  public Map<String, CompletableFuture<List<DocumentSymbol>>> getOutlineMap() {
    return outlineMap;
  }

  @Override
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion(
      CompletionParams params) {
    String uri = params.getTextDocument().getUri();
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            () ->
                Either.<List<CompletionItem>, CompletionList>forRight(
                    completions.collectFor(docs.get(uri), params)),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("completion lookup", uri)));
  }

  @Override
  @SuppressWarnings("cast")
  public CompletableFuture<List<? extends Location>> definition(
      TextDocumentPositionParams position) {
    String uri = position.getTextDocument().getUri();
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            (Supplier<List<? extends Location>>)
                () -> occurrences.findDefinitions(docs.get(uri), position),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("definitions resolving", uri)));
  }

  @Override
  @SuppressWarnings("cast")
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    String uri = params.getTextDocument().getUri();
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            (Supplier<List<? extends Location>>)
                () -> occurrences.findReferences(docs.get(uri), params, params.getContext()),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("references resolving", uri)));
  }

  @Override
  @SuppressWarnings("cast")
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
      TextDocumentPositionParams position) {
    String uri = position.getTextDocument().getUri();
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            (Supplier<List<? extends DocumentHighlight>>)
                () -> occurrences.findHighlights(docs.get(uri), position),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("document highlighting", uri)));
  }

  @Override
  @SuppressWarnings("cast")
  public CompletableFuture<List<? extends TextEdit>> formatting(DocumentFormattingParams params) {
    String uri = params.getTextDocument().getUri();
    CobolDocumentModel model = docs.get(uri);
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            (Supplier<List<? extends TextEdit>>) () -> formations.format(model),
            executors.getThreadPoolExecutor())
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("formatting", uri)));
  }

  @Override
  public CompletableFuture<List<Either<Command, CodeAction>>> codeAction(CodeActionParams params) {
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            () -> actions.collect(params),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(
                createDescriptiveErrorMessage(
                    "code actions lookup", params.getTextDocument().getUri())));
  }

  @Override
  public void didOpen(DidOpenTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) return;
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
  public void didChange(DidChangeTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) return;
    String uri = params.getTextDocument().getUri();
    outlineMap.put(uri, new CompletableFuture<>());
    cfAstMap.put(uri, new CompletableFuture<>());
    String text = params.getContentChanges().get(0).getText();
    interruptAnalysis(uri);
    analyzeChanges(uri, text);
  }

  @Override
  public void didClose(DidCloseTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) return;
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
  public void didSave(DidSaveTextDocumentParams params) {
    LOG.info("Document saved...");
  }

  /**
   * Handle RunAnalysisEvent from the DataBus.
   *
   * @param event a RunAnalysisEvent
   */
  @Subscribe
  public void onRunAnalysisEventCallback(@NonNull RunAnalysisEvent event) {
    if (disposableLSPStateService.isServerShutdown()) return;
    docs.forEach((key, value) -> analyzeDocumentFirstTime(key, value.getText(), event.isVerbose()));
  }

  @Override
  public CompletableFuture<ExtendedApiResult> analysis(@NonNull JsonObject json) {
    AnalysisResultEvent event =
        ofNullable(new Gson().fromJson(json.toString(), AnalysisResultEvent.class))
            .orElseGet(() -> new AnalysisResultEvent("", ""));
    AtomicBoolean triggerAnalyze = new AtomicBoolean();
    cfAstMap.computeIfAbsent(
        event.getUri(),
        ignore -> {
          triggerAnalyze.set(true);
          return new CompletableFuture<>();
        });
    if (triggerAnalyze.get()) {
      analyzeDocumentFirstTime(event.getUri(), event.getText(), false);
    }
    CompletableFuture<Node> nodeCompletableFuture = cfAstMap.get(event.getUri());
    nodeCompletableFuture.thenApply(ignore -> cfAstMap.remove(event.getUri()));
    return nodeCompletableFuture
        .thenApply(cfastBuilder::build)
        .whenComplete(
            reportExceptionIfThrown(
                createDescriptiveErrorMessage("analysis retrieving", event.getUri())));
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

                    AnalysisConfig config = requestConfigs(copybookProcessingMode);
                    AnalysisResult result = engine.analyze(uri, text, config);
                    ofNullable(docs.get(uri)).ifPresent(doc -> doc.setAnalysisResult(result));
                    publishResult(uri, result, copybookProcessingMode);
                    outlineMap.computeIfPresent(
                        uri,
                        (key, value) -> {
                          value.complete(
                              BuildOutlineTreeFromSyntaxTree.convert(result.getRootNode(), uri));
                          return value;
                        });
                    cfAstMap.get(uri).complete(result.getRootNode());
                  } catch (Exception e) {
                    cfAstMap.get(uri).completeExceptionally(e);
                    LOG.error(createDescriptiveErrorMessage("analysis", uri), e);
                  } finally {
                    clearAnalysedFutureObject(uri);
                  }
                });
    registerToFutureMap(uri, docAnalysisFuture);
  }

  private AnalysisConfig requestConfigs(CopybookProcessingMode processingMode) {
    CopybookConfig copybookConfig = new CopybookConfig(processingMode, SQLBackend.DB2_SERVER);
    try {
      List<Object> objects =
          settingsService
              .getConfigurations(Arrays.asList(TARGET_SQL_BACKEND.label, ANALYSIS_FEATURES.label, FLAVORS.label))
              .get();

      SQLBackend sqlBackend =
          SettingsService.getValueAsString(objects.subList(0, 1))
              .map(SQLBackend::valueOf)
              .orElse(SQLBackend.DB2_SERVER);

      copybookConfig = new CopybookConfig(processingMode, sqlBackend);

      Set<EmbeddedCodeNode.Language> features = new HashSet<>();
      JsonArray jsonArray = (JsonArray) objects.get(1);
      for (JsonElement element : jsonArray) {
        String feature = element.getAsString();
        features.add(EmbeddedCodeNode.Language.valueOf(feature));
      }
      List<String> flavors = ImmutableList.of();
      JsonElement flavorsSettings = (JsonElement) objects.get(2);
      if (flavorsSettings.isJsonArray())
        flavors = Streams.stream((JsonArray) flavorsSettings)
          .map(JsonElement::getAsString).collect(toList());
      return new AnalysisConfig(features, copybookConfig, flavors);
    } catch (InterruptedException e) {
      LOG.error("InterruptedException when getting settings", e);
      Thread.currentThread().interrupt();
    } catch (Exception e) {
      LOG.warn("Can't get config-data, default config will be used instead");
    }
    return AnalysisConfig.defaultConfig(copybookConfig);
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
                    CopybookProcessingMode processingMode =
                        CopybookProcessingMode.getCopybookProcessingMode(
                            uri, CopybookProcessingMode.SKIP);
                    AnalysisConfig config = requestConfigs(processingMode);
                    AnalysisResult result = engine.analyze(uri, text, config);
                    registerDocument(uri, new CobolDocumentModel(text, result));
                    communications.publishDiagnostics(result.getDiagnostics());
                    outlineMap
                        .get(uri)
                        .complete(
                            BuildOutlineTreeFromSyntaxTree.convert(result.getRootNode(), uri));
                    cfAstMap.get(uri).complete(result.getRootNode());
                  } catch (Exception ex) {
                    cfAstMap.get(uri).completeExceptionally(ex);
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
        .thenApply(
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
    return CompletableFuture.supplyAsync(
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
