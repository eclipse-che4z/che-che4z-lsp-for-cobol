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
import com.google.common.eventbus.Subscribe;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.Builder;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.domain.databus.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisResultEvent;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.jrpc.ExtendedApi;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookReferenceRepo;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.eclipse.lsp.cobol.service.utils.BuildOutlineTreeFromSyntaxTree;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp.cobol.service.utils.ShutdownCheckUtil;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.DefinitionParams;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DidChangeTextDocumentParams;
import org.eclipse.lsp4j.DidCloseTextDocumentParams;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;
import org.eclipse.lsp4j.DidSaveTextDocumentParams;
import org.eclipse.lsp4j.DocumentFormattingParams;
import org.eclipse.lsp4j.DocumentHighlight;
import org.eclipse.lsp4j.DocumentHighlightParams;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.DocumentSymbolParams;
import org.eclipse.lsp4j.FoldingRange;
import org.eclipse.lsp4j.FoldingRangeRequestParams;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.HoverParams;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.LocationLink;
import org.eclipse.lsp4j.ReferenceParams;
import org.eclipse.lsp4j.SymbolInformation;
import org.eclipse.lsp4j.TextDocumentItem;
import org.eclipse.lsp4j.TextEdit;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.BiConsumer;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.lang.String.format;
import static java.net.URLDecoder.decode;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.model.NodeType.COPY;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

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
  private static final String GIT_URI = "git:/";
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
  private final ConfigurationService configurationService;
  private DisposableLSPStateService disposableLSPStateService;
  private final CopybookIdentificationService copybookIdentificationService;
  private final CopybookService copybookService;
  private final CopybookReferenceRepo copybookReferenceRepo;
  private final Map<String, Map<String, List<Diagnostic>>> errorsByFileForEachProgram;
  private final SyncProvider syncProvider;
  private final WatcherService watcherService;

  @VisibleForTesting
  CountDownLatch getWaitConfig() {
    return waitConfig;
  }

  private final CountDownLatch waitConfig = new CountDownLatch(1);

  private List<String> copybookExtensions;

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
      @Named("combinedStrategy") CopybookIdentificationService copybookIdentificationService,
      ConfigurationService configurationService,
      CopybookService copybookService,
      CopybookReferenceRepo copybookReferenceRepo,
      SyncProvider syncProvider,
      WatcherService watcherService) {
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
    this.disposableLSPStateService = disposableLSPStateService;
    this.configurationService = configurationService;
    this.copybookIdentificationService = copybookIdentificationService;
    this.errorsByFileForEachProgram = new ConcurrentHashMap<>();
    this.copybookService = copybookService;
    this.copybookReferenceRepo = copybookReferenceRepo;
    this.syncProvider = syncProvider;
    this.watcherService = watcherService;
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
  public CompletableFuture<Either<List<? extends Location>, List<? extends LocationLink>>>
      definition(DefinitionParams params) {
    String uri = params.getTextDocument().getUri();
    List<Location> definitions =
        docs.containsKey(uri)
            ? occurrences.findDefinitions(docs.get(uri), params)
            : Collections.emptyList();
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            (Supplier<Either<List<? extends Location>, List<? extends LocationLink>>>)
                () -> Either.forLeft(definitions),
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("definitions resolving", uri)));
  }

  @Override
  @SuppressWarnings("cast")
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    String uri = params.getTextDocument().getUri();
    List<Location> references =
        docs.containsKey(uri)
            ? occurrences.findReferences(docs.get(uri), params, params.getContext())
            : Collections.emptyList();
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService,
            (Supplier<List<? extends Location>>) () -> references,
            executors.getThreadPoolExecutor())
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("references resolving", uri)));
  }

  @Override
  @SuppressWarnings("cast")
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
      DocumentHighlightParams params) {
    String uri = params.getTextDocument().getUri();
    Supplier<List<? extends DocumentHighlight>> listSupplier =
        () ->
            docs.containsKey(uri)
                ? occurrences.findHighlights(docs.getOrDefault(uri, new CobolDocumentModel("")), params)
                : Collections.emptyList();
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
            disposableLSPStateService, listSupplier, executors.getThreadPoolExecutor())
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
    String text = params.getTextDocument().getText();
    outlineMap.put(uri, new CompletableFuture<>());
    cfAstMap.put(uri, new CompletableFuture<>());
    // git FS URIs are not currently supported
    if (uri.startsWith(GIT_FS_URI) || uri.startsWith(GIT_URI)) {
      LOG.warn(String.join(" ", GITFS_URI_NOT_SUPPORTED, uri));
      return;
    }
    if (!isCopybook(uri, text, copybookExtensions)) {
      registerDocument(uri, new CobolDocumentModel(text));
    }
    analyzeDocumentFirstTime(uri, text, false);
  }

  private boolean isCopybook(String uri, String text, List<String> copybookExtensions) {
    return copybookIdentificationService.isCopybook(uri, text, copybookExtensions);
  }

  @SneakyThrows
  @Override
  public void didChange(DidChangeTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) {
      return;
    }
    String uri = params.getTextDocument().getUri();
    String text = params.getContentChanges().get(0).getText();
    docs.computeIfPresent(uri, (k, v) -> new CobolDocumentModel(uri, text, v.getAnalysisResult()));
    outlineMap.put(uri, new CompletableFuture<>());
    cfAstMap.put(uri, new CompletableFuture<>());
    TextDocumentItem docIdentifier = new TextDocumentItem();
    docIdentifier.setText(text);
    docIdentifier.setUri(uri);
    if (isCopybook(docIdentifier.getUri(), docIdentifier.getText(), copybookExtensions)) {
      reanalyseOpenedPrograms(params, uri);
      return;
    }
    interruptAnalysis(uri);
    communications.notifyProgressBegin(uri);
    analyzeChanges(uri, text);
  }

  private void reanalyseOpenedPrograms(DidChangeTextDocumentParams params, String uri)
      throws UnsupportedEncodingException {
    copybookReferenceRepo
        .getCopybookUsageReference(decode(uri, StandardCharsets.UTF_8.name()))
        .forEach(
            val -> {
              CopybookModel copybookModel =
                  new CopybookModel(
                      val.getCopybookId(),
                      val.getCopybookName(),
                      uri,
                      params.getContentChanges().get(0).getText());
              this.copybookService.store(copybookModel, true);
            });
    dataBus.postData(new RunAnalysisEvent(false));
  }

  @Override
  public void didClose(DidCloseTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) return;
    String uri = params.getTextDocument().getUri();
    communications.notifyProgressEnd(uri);
    String docText = ofNullable(docs.remove(uri)).map(CobolDocumentModel::getText).orElse("");
    LOG.info(format("Document closing invoked on URI %s", uri));
    interruptAnalysis(uri);
    if (isCopybook(uri, docText, copybookExtensions)) {
      return;
    }

    Optional.ofNullable(errorsByFileForEachProgram.get(uri))
        .ifPresent(
            diagnosticMap ->
                diagnosticMap.forEach(
                    (k, v) ->
                        diagnosticMap.computeIfPresent(k, (k1, v1) -> Collections.emptyList())));

    communications.publishDiagnostics(collectAllDiagnostics());
    clearAnalysedFutureObject(uri);
    watcherService.removeRuntimeWatchers(uri);
    syncProvider.remove(uri);
  }

  Map<String, List<Diagnostic>> collectAllDiagnostics() {
    return errorsByFileForEachProgram.values().stream()
        .flatMap(map -> map.entrySet().stream())
        .collect(
            Collectors.toMap(
                Entry::getKey,
                Entry::getValue,
                (o, n) -> Stream.concat(o.stream(), n.stream()).collect(toList())));
  }

  private void interruptAnalysis(String uri) {
    synchronized (futureMap) {
      Future<?> future = futureMap.get(uri);
      if (future != null) {
        LOG.debug("Analysis for uri: " + uri + " is interrupted.");
        future.cancel(true);
      }
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
    FutureTask<Void> task =
        registerToFutureMap(
            uri,
            () -> {
              doAnalysis(uri, text, userRequest, true);
              return null;
            });
    if (!isCopybook(uri, text, copybookExtensions)) {
      communications.notifyProgressBegin(uri);
    }
    executors.getThreadPoolExecutor().submit(task);
  }

  private void doAnalysis(String uri, String text, boolean userRequest, boolean firstTime) {
    synchronized (syncProvider.getSync(uri)) {
      try {
        CopybookProcessingMode copybookProcessingMode = userRequest
                ? CopybookProcessingMode.ENABLED_VERBOSE
                : CopybookProcessingMode.ENABLED;

        CopybookProcessingMode processingMode =
            CopybookProcessingMode.getCopybookProcessingMode(uri,
                    firstTime
                            ? copybookProcessingMode
                            : CopybookProcessingMode.SKIP);

        if (firstTime && isCopybook(uri, text, waitExtensionConfig())) {
            outlineMap.get(uri).complete(Collections.emptyList());
            return;
        }
        AnalysisConfig config = configurationService.getConfig(uri, processingMode);
        AnalysisResult result = engine.analyze(uri, text, config);
        ThreadInterruptionUtil.checkThreadInterrupted();
        ofNullable(docs.get(uri)).ifPresent(doc -> doc.setAnalysisResult(result));
        notifyAnalysisFinished(uri, extractCopybookUris(result), processingMode);
        if (!docs.containsKey(uri)) {
          return;
        }
        errorsByFileForEachProgram.put(uri, result.getDiagnostics());
        communications.publishDiagnostics(collectAllDiagnostics());
        if (firstTime) {
          outlineMap
              .get(uri)
              .complete(BuildOutlineTreeFromSyntaxTree.convert(result.getRootNode(), uri));
        } else {
          if (result.getDiagnostics().isEmpty()) {
            communications.notifyThatDocumentAnalysed(uri);
          }
          outlineMap.computeIfPresent(
              uri,
              (key, value) -> {
                value.complete(BuildOutlineTreeFromSyntaxTree.convert(result.getRootNode(), uri));
                return value;
              });
        }
        cfAstMap.get(uri).complete(result.getRootNode());
      } catch (Exception ex) {
        cfAstMap.get(uri).completeExceptionally(ex);
        LOG.error(createDescriptiveErrorMessage("analysis", uri), ex);
        throw ex;
      } finally {
        clearAnalysedFutureObject(uri);
      }
    }
  }

  private FutureTask<Void> registerToFutureMap(String uri, Callable<Void> task) {
    synchronized (futureMap) {
      Optional.ofNullable(futureMap.get(uri)).ifPresent(f -> f.cancel(true));
      FutureTask<Void> future = new FutureTask<>(task);
      futureMap.put(uri, future);
      return future;
    }
  }

  void analyzeChanges(String uri, String text) {
    FutureTask<Void> task =
        registerToFutureMap(
            uri,
            () -> {
              doAnalysis(uri, text, false, false);
              return null;
            });
    executors.getThreadPoolExecutor().submit(task);
  }

  private void notifyAnalysisFinished(
      String uri, List<String> copybooks, CopybookProcessingMode copybookProcessingMode) {
    communications.notifyProgressEnd(uri);
    dataBus.postData(
        AnalysisFinishedEvent.builder()
            .documentUri(uri)
            .copybookUris(copybooks)
            .copybookProcessingMode(copybookProcessingMode)
            .build());
  }

  private List<String> extractCopybookUris(AnalysisResult result) {
    return result
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(COPY))
        .map(CopyNode.class::cast)
        .map(CopyNode::getUri)
        .filter(def -> !StringUtils.isEmpty(def))
        .collect(toList());
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
            reportExceptionIfThrown(createDescriptiveErrorMessage("symbol analysis", uri)))
            .whenComplete((res, ex) -> communications.notifyProgressEnd(uri));
  }

  @Override
  public CompletableFuture<Hover> hover(HoverParams params) {
    String uri = params.getTextDocument().getUri();
    return CompletableFuture.supplyAsync(
            () -> hoverProvider.getHover(docs.get(uri), params), executors.getThreadPoolExecutor())
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("getting hover", uri)));
  }

  @Override
  public CompletableFuture<List<FoldingRange>> foldingRange(FoldingRangeRequestParams params) {
    String uri = params.getTextDocument().getUri();
    if (outlineMap.isEmpty()) return CompletableFuture.completedFuture(Collections.emptyList());
    return outlineMap
        .get(uri)
        .thenApply(this::getFoldingRangeFromDocumentSymbol)
        .whenComplete(
            reportExceptionIfThrown(createDescriptiveErrorMessage("getting folding", uri)));
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

  private List<FoldingRange> getFoldingRangeFromDocumentSymbol(
      List<DocumentSymbol> documentSymbols) {
    List<FoldingRange> foldingRanges = new ArrayList<>();
    for (DocumentSymbol documentSymbol : documentSymbols) {
      foldingRanges.add(
          new FoldingRange(
              documentSymbol.getSelectionRange().getStart().getLine(),
              documentSymbol.getSelectionRange().getEnd().getLine()));
      foldingRanges.addAll(getFoldingRangeFromDocumentSymbol(documentSymbol.getChildren()));
    }
    return foldingRanges;
  }

  /**
   * Notifies that config is now available
   *
   * @param config is a config
   */
  public void notifyExtensionConfig(List<String> config) {
    this.copybookExtensions = Collections.unmodifiableList(config);
    this.waitConfig.countDown();
  }

  @SneakyThrows
  private List<String> waitExtensionConfig() {
    waitConfig.await();
    return this.copybookExtensions;
  }
}
