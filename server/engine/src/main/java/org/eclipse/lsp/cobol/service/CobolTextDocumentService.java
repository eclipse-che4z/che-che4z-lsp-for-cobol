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

import com.google.common.eventbus.Subscribe;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.domain.databus.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisResultEvent;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.jrpc.ExtendedApi;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.function.BiConsumer;
import java.util.function.Supplier;

import static java.lang.String.format;
import static java.util.Optional.ofNullable;

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
public class CobolTextDocumentService implements TextDocumentService, ExtendedApi {
  private final CodeActions actions;
  private final CFASTBuilder cfastBuilder;
  private final DisposableLSPStateService disposableLSPStateService;
  private final WatcherService watcherService;
  private final AnalysisService analysisService;
  private final TaskService taskService;

  @Inject
  public CobolTextDocumentService(
      CodeActions actions,
      CFASTBuilder cfastBuilder,
      DisposableLSPStateService disposableLSPStateService,
      WatcherService watcherService,
      AnalysisService analysisService,
      TaskService taskService) {
    this.actions = actions;
    this.cfastBuilder = cfastBuilder;
    this.disposableLSPStateService = disposableLSPStateService;
    this.watcherService = watcherService;
    this.analysisService = analysisService;
    this.taskService = taskService;
  }

  @Override
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion(
      CompletionParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return taskService.runNextTask(uri,
        () -> analysisService.findCompletion(uri, params),
        createDescriptiveErrorMessage("completion lookup", uri));
  }

  @Override
  public CompletableFuture<Either<List<? extends Location>, List<? extends LocationLink>>>
      definition(DefinitionParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Supplier<Either<List<? extends Location>, List<? extends LocationLink>>> supplier =
        () -> analysisService.findDefinition(uri, params);

    return taskService.runNextTask(uri, supplier, createDescriptiveErrorMessage("definitions resolving", uri));
  }

  @Override
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Supplier<List<? extends Location>> supplier =
        () -> analysisService.findReferences(uri, params);
    return taskService.runNextTask(uri, supplier, createDescriptiveErrorMessage("references resolving", uri));
  }

  @Override
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
      DocumentHighlightParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Supplier<List<? extends DocumentHighlight>> supplier = () -> analysisService.findHighlights(uri, params);
    return taskService.runNextTask(uri, supplier, createDescriptiveErrorMessage("document highlighting", uri));
  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> formatting(DocumentFormattingParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return taskService.runTask((Supplier<List<? extends TextEdit>>)
            () -> analysisService.findFormatting(uri))
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("formatting", uri)));
  }

  @Override
  public CompletableFuture<List<Either<Command, CodeAction>>> codeAction(CodeActionParams params) {
    return taskService.runTask(() -> actions.collect(params))
        .whenComplete(
            reportExceptionIfThrown(
                createDescriptiveErrorMessage(
                    "code actions lookup", UriHelper.decode(params.getTextDocument().getUri()))));
  }

  @Override
  public void didOpen(DidOpenTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) {
      return;
    }
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    String text = params.getTextDocument().getText();

    taskService.runTask(uri, () -> {
      analysisService.analyzeDocument(uri, text);
      return null;
    }).whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("did open", uri)));
    watcherService.addRuntimeWatchers(uri);
  }

  @SneakyThrows
  @Override
  public void didChange(DidChangeTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) {
      return;
    }
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    String text = params.getContentChanges().get(0).getText();

    taskService.runTask(uri, () -> {
      analysisService.reanalyzeDocument(uri, text);
      return null;
    }).whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("did change", uri)));
  }

  @Override
  public void didClose(DidCloseTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) return;
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    LOG.info(format("Document closing invoked on URI %s", uri));

    taskService.interrupt(uri);
    taskService.runTask(() -> {
      analysisService.stopAnalysis(uri);
      return null;
    }).whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("did close", uri)));
    watcherService.removeRuntimeWatchers(uri);
  }

  @Override
  public void didSave(DidSaveTextDocumentParams params) {
    LOG.info("Document saved...");
  }

  @Override
  public CompletableFuture<ExtendedApiResult> analysis(@NonNull JsonObject json) {
    AnalysisResultEvent event =
        ofNullable(new Gson().fromJson(json.toString(), AnalysisResultEvent.class))
            .orElseGet(() -> new AnalysisResultEvent("", ""));

    return taskService.runNextTask(UriHelper.decode(event.getUri()), () -> {
      Node node = analysisService.retrieveAnalysis(event.getUri(), event.getText());
      return cfastBuilder.build(node);
    }, "analysis").whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("analysis retrieving", event.getUri())));
  }

  @Override
  public CompletableFuture<List<Either<SymbolInformation, DocumentSymbol>>> documentSymbol(
      DocumentSymbolParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());

    return taskService.runNextTask(uri, () -> analysisService.findDocumentSymbol(uri), "Error symbol analysis")
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("symbol analysis", uri)));
  }

  @Override
  public CompletableFuture<Hover> hover(HoverParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return taskService.runTask(() -> analysisService.findHover(uri, params))
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("getting hover", uri)));
  }

  @Override
  public CompletableFuture<List<FoldingRange>> foldingRange(FoldingRangeRequestParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());

    return taskService.runNextTask(uri, () -> analysisService.findFoldingRange(uri), "Error getting folding")
        .whenComplete(reportExceptionIfThrown(createDescriptiveErrorMessage("getting folding", uri)));
  }

  /**
   * Notifies that config is now available
   *
   * @param config is a config
   */
  public void notifyExtensionConfig(List<String> config) {
    analysisService.setExtensionConfig(config);
  }

  /**
   * Handle RunAnalysisEvent from the DataBus.
   *
   * @param event a RunAnalysisEvent
   */
  @Subscribe
  public void onRunAnalysisEventCallback(@NonNull RunAnalysisEvent event) {
    if (disposableLSPStateService.isServerShutdown()) return;
    taskService.runTask(() -> {
      analysisService.reanalyseOpenedPrograms();
      return null;
    });
  }

  private String createDescriptiveErrorMessage(String action, String uri) {
    return format("An exception thrown while applying %s for %s:", action, uri);
  }

  private BiConsumer<Object, Throwable> reportExceptionIfThrown(String message) {
    return (res, ex) -> ofNullable(ex).ifPresent(it -> LOG.error(message, it));
  }

}
