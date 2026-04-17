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
package org.eclipse.lsp.cobol.lsp.analysis;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;
import javax.annotation.Nullable;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.TrueDialectService;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.core.model.extendedapi.Program;
import org.eclipse.lsp.cobol.lsp.LspEventCancelCondition;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp4j.Diagnostic;

/** Asynchronous analysis */
@Slf4j
@Singleton
public class AsyncAnalysisService implements AnalysisStateNotifier {
  private static final ExecutorService SINGLE_THREAD_EXECUTOR =
      Executors.newSingleThreadExecutor(r -> new Thread(r, "LSP workspace service"));
  private final TrueDialectService dialectService;
  private final DocumentModelService documentModelService;
  private final AnalysisService analysisService;
  private final CopybookService copybookService;
  private final SubroutineService subroutineService;
  private final Communications communications;
  private final SourceUnitGraph sourceUnitGraph;

  private final CFASTBuilder cfastBuilder;
  private final Provider<CobolLanguageClient> clientProvider;

  private final Map<String, FutureTask<CobolDocumentModel>> analysisResults =
      Collections.synchronizedMap(new HashMap<>());
  private final Map<String, Integer> analysisResultsRevisions =
      Collections.synchronizedMap(new HashMap<>());
  private final Map<String, ExecutorService> analysisExecutors =
      Collections.synchronizedMap(new HashMap<>());

  private final List<AnalysisStateListener> analysisStateListeners;

  private static final ThreadFactory THREAD_FACTORY =
      new ThreadFactory() {
        private int counter = 0;

        public Thread newThread(Runnable r) {
          return new Thread(r, "Analysis thread #" + counter++);
        }
      };

  @Inject
  public AsyncAnalysisService(
      TrueDialectService dialectService,
      DocumentModelService documentModelService,
      SourceUnitGraph sourceUnitGraph,
      AnalysisService analysisService,
      CopybookService copybookService,
      SubroutineService subroutineService,
      Communications communications,
      @Nullable CFASTBuilder cfastBuilder,
      Provider<CobolLanguageClient> clientProvider) {
    this.dialectService = dialectService;
    this.documentModelService = documentModelService;
    this.analysisService = analysisService;
    this.copybookService = copybookService;
    this.subroutineService = subroutineService;
    this.communications = communications;
    analysisStateListeners = new ArrayList<>();
    this.sourceUnitGraph = sourceUnitGraph;
    this.analysisStateListeners.add(sourceUnitGraph);
    this.cfastBuilder = cfastBuilder;
    this.clientProvider = clientProvider;
  }

  /**
   * Schedule an analysis
   *
   * @param documentModel document model
   * @param currentRevision the document currentRevision
   * @param open Is document just opened, or it's reanalyse request
   * @param force forcefully schedule the analysis
   * @return document model with analysis result
   */
  public synchronized FutureTask<CobolDocumentModel> scheduleAnalysis(
      CobolDocumentModel documentModel, Integer currentRevision, boolean open, boolean force) {
    final String uri = documentModel.getUri();
    notifyAllListeners(AnalysisState.SCHEDULED, documentModel);
    String id = makeId(uri, currentRevision);
    Integer prevId = analysisResultsRevisions.put(uri, currentRevision);
    if (currentRevision.equals(prevId) && !force) {
      notifyAllListeners(AnalysisState.SKIPPED, documentModel);
      return analysisResults.get(id);
    }
    ExecutorService analysisExecutor = getExecutor(uri);
    if (documentModel.getLastAnalysisResult() != null) {
      cancelRunningAnalysis(ImmutableList.of(documentModel));
    }
    FutureTask<CobolDocumentModel> futureTask =
        new FutureTask<>(scheduleAnalysis(documentModel, currentRevision, open, force, id));

    analysisResults.put(id, futureTask);
    analysisExecutor.submit(futureTask);
    if (prevId != null && !force) {
      Optional.ofNullable(analysisResults.get(makeId(uri, prevId)))
          .ifPresent(cf -> cf.cancel(true));
    }
    return futureTask;
  }

  private void postCFASTResults(String uri, AnalysisResult result) {
    if (cfastBuilder == null) return;

    List<Program> astList =
        result.getRootNode().findPrograms().stream()
            .map(cfastBuilder::build)
            .flatMap(m -> m.getControlFlowAST().stream())
            .collect(Collectors.toList());

    this.clientProvider.get().cfastReady(new ExtendedApiResult(astList, uri));
  }

  private Callable<CobolDocumentModel> scheduleAnalysis(
      CobolDocumentModel documentModel,
      Integer currentRevision,
      boolean open,
      boolean force,
      String id) {
    final String uri = documentModel.getUri();
    final String text = documentModel.getText();
    final String langId = documentModel.getLanguageId();
    return () -> {
      if (currentRevision < analysisResultsRevisions.get(uri) && !force) {
        notifyAllListeners(AnalysisState.SKIPPED, documentModel);
        LOG.debug(
            "[scheduleAnalysis] skip revision: "
                + currentRevision
                + " latest: "
                + analysisResultsRevisions.get(uri));
        return null;
      }
      LOG.debug("[scheduleAnalysis] waiting for previous analysis of {} to finish", uri);
      try {
        LOG.debug("[scheduleAnalysis] Start analysis: " + uri);
        notifyAllListeners(AnalysisState.STARTED, documentModel);
        communications.notifyProgressBegin(uri);
        documentModel.setOutlineResult(null);

        AnalysisResult result = analysisService.analyzeDocument(uri, text, open, langId);
        CobolDocumentModel newDocumentModel = documentModel;

        if (result != null) {
          newDocumentModel = documentModelService.processAnalysisResult(uri, result, text);
          postCFASTResults(uri, result);
        }

        notifyAllListeners(AnalysisState.COMPLETED, newDocumentModel);
        analysisResults.remove(id);
        return newDocumentModel;
      } catch (
          Exception
              genericException) { // Ideally we should not do this, but a safer catch might help to
        // remove unknown issues
        LOG.error(
            "Encountered Exception {} , while analysing uri : {}",
            genericException,
            uri,
            genericException);
        CobolDocumentModel newDocumentModel =
            documentModelService.processAnalysisResult(uri, AnalysisResult.EMPTY, text);
        notifyAllListeners(AnalysisState.EXCEPTIONALLY_FINISHED, newDocumentModel);
        return newDocumentModel;
      } finally {
        if (Objects.equals(analysisResultsRevisions.get(uri), currentRevision) || force) {
          communications.publishDiagnostics(documentModelService.getOpenedDiagnostic());
        }
        communications.notifyProgressEnd(uri);
      }
    };
  }

  /** Publishes diagnostics */
  public void republishDiagnostics() {
    communications.publishDiagnostics(documentModelService.getOpenedDiagnostic());
  }

  /**
   * IMPORTANT: 1. Never shutdown or terminate Executor service as we rely on this for
   * synchronization 2. Each uri will always have a singleThreadExecutor and should not be modified
   * as we rely on this for synchronization
   *
   * @param uri
   * @return
   */
  private ExecutorService getExecutor(String uri) {
    synchronized (analysisExecutors) {
      ExecutorService analysisExecutor =
          analysisExecutors.computeIfAbsent(
              uri, u -> Executors.newSingleThreadExecutor(THREAD_FACTORY));
      if (analysisExecutor.isShutdown()) {
        analysisExecutor = Executors.newSingleThreadExecutor(THREAD_FACTORY);
        analysisExecutors.put(uri, analysisExecutor);
      }
      return analysisExecutor;
    }
  }

  private static String makeId(String uri, Integer revision) {
    return revision + "#" + uri;
  }

  /**
   * Trigger reanalyse of passed programs based on source event (IDE or FILE_SYSTEM).
   *
   * @param cobolDocUri document URI to be analyzed
   * @param invalidCopybookUris List of copybook uri which has affected this analysis
   */
  public void reanalyseProgram(String cobolDocUri, Set<String> invalidCopybookUris) {
    copybookService.getCopybookUsage(cobolDocUri).stream()
        .filter(model -> Objects.nonNull(model.getUri()))
        .filter(model -> invalidCopybookUris.contains(model.getUri()))
        .forEach(copybookService::invalidateCache);
    LOG.info("Copybook cache for uris {} is cleared", invalidCopybookUris);

    subroutineService.invalidateCache();
    LOG.info("subroutine cache cleared!");

    CobolDocumentModel document = documentModelService.get(cobolDocUri);
    if (document != null)
      scheduleAnalysis(document, analysisResultsRevisions.get(document.getUri()), false, true);
  }

  /** Trigger reanalyse of opened programs based on source event (IDE or FILE_SYSTEM). */
  public void reanalyseOpenedPrograms() throws InterruptedException {
    List<CobolDocumentModel> openDocuments =
        documentModelService.getAllOpened().stream()
            .filter(d -> !analysisService.isCopybook(d.getUri(), d.getText()))
            .collect(Collectors.toList());
    copybookService.invalidateCache(true);
    subroutineService.invalidateCache();
    LOG.info("Cache invalidated - reanalysing opened programs");
    openDocuments.forEach(
        doc ->
            scheduleAnalysis(
                doc, analysisResultsRevisions.getOrDefault(doc.getUri(), 0), false, true));
  }

  private void cancelRunningAnalysis(List<CobolDocumentModel> openDocuments) {
    openDocuments.stream()
        .map(model -> makeId(model.getUri(), analysisResultsRevisions.get(model.getUri())))
        .filter(analysisResults::containsKey)
        .map(analysisResults::get)
        .forEach(future -> future.cancel(true));
  }

  /**
   * Trigger reanalyse for the passed document uri's.
   *
   * @param uris
   * @param copybookUri
   * @param copybookContent
   */
  public void reanalyseCopybooksAssociatedPrograms(
      List<String> uris, String copybookUri, String copybookContent) {
    documentModelService.removeDocumentDiagnostics(copybookUri);
    Optional.ofNullable(documentModelService.get(copybookUri))
        .ifPresent(model -> model.update(copybookContent));
    List<CobolDocumentModel> openedModels =
        documentModelService.getAllOpened().stream()
            .filter(model -> uris.contains(model.getUri()))
            .filter(model -> !analysisService.isCopybook(model.getUri(), model.getText()))
            .collect(Collectors.toList());
    for (CobolDocumentModel documentModel : openedModels) {
      final String uri = documentModel.getUri();
      final String languageId = documentModel.getLanguageId();
      copybookService.getCopybookUsage(uri).stream()
          .filter(model -> Objects.nonNull(model.getUri()))
          .filter(model -> model.getUri().equals(copybookUri))
          .forEach(
              copybookModel -> {
                copybookService.invalidateCache(copybookModel);
                if (copybookContent != null) {
                  copybookModel.setContent(copybookContent);
                  copybookService.store(
                      copybookModel,
                      dialectService.getPreprocessor(CobolLanguageId.MAPPER.get(languageId)));
                }
              });

      subroutineService.invalidateCache();
      LOG.info("Cache invalidated - reanalysing program: {}", uri);
      scheduleAnalysis(documentModel, analysisResultsRevisions.getOrDefault(uri, 0), false, true);
    }
  }

  /**
   * Stop code analysis.
   *
   * @param uri source URI
   */
  public void cancelAnalysis(String uri) throws InterruptedException {
    String analysisID = makeId(uri, analysisResultsRevisions.get(uri));
    analysisResultsRevisions.remove(uri);
    Map<String, List<Diagnostic>> openedDiagnostic = documentModelService.getOpenedDiagnostic();
    LOG.debug("[stopAnalysis] Document " + uri + " publish diagnostic: " + openedDiagnostic);
    openedDiagnostic.putIfAbsent(uri, Collections.emptyList());
    communications.publishDiagnostics(openedDiagnostic);
    if (analysisResults.containsKey(analysisID)) {
      analysisResults.get(analysisID).cancel(true);
    }
  }

  /**
   * Creates LSP Event dependency
   *
   * @param uri url of document to wait
   * @return LspEventDependency object
   */
  public LspEventDependency createDependencyOn(String uri) {
    return () -> {
      CobolDocumentModel doc = documentModelService.get(uri);
      if (doc == null) {
        return false;
      }
      if (analysisService.isCopybook(uri, doc.getText())) {
        return true;
      }
      if (sourceUnitGraph.isUserSuppliedCopybook(uri)) {
        return documentModelService.findMainSource(uri).stream()
            .map(
                documentModel ->
                    documentModel.getLastAnalysisResult() != null
                        && documentModel.getLastAnalysisResult() != AnalysisResult.EMPTY)
            .reduce(Boolean.TRUE, Boolean::logicalAnd);
      }
      return doc.getLastAnalysisResult() != null
          && doc.getLastAnalysisResult() != AnalysisResult.EMPTY;
    };
  }

  /**
   * Creates LSP Event cancel condition: cancel on document close.
   *
   * @param uri url of document to wait
   * @return LspEventCancelCondition object
   */
  public LspEventCancelCondition createCancelConditionOnClose(String uri) {
    return () -> {
      CobolDocumentModel doc = documentModelService.get(uri);
      return doc == null;
    };
  }

  /**
   * Mark document as opened
   *
   * @param uri of document
   * @param text content od document.
   * @param languageId
   * @return document model
   */
  public CobolDocumentModel openDocument(String uri, String text, String languageId) {
    return documentModelService.openDocument(uri, text, languageId);
  }

  @Override
  public void notifyAllListeners(AnalysisState state, CobolDocumentModel model) {
    SINGLE_THREAD_EXECUTOR.execute(
        () -> this.analysisStateListeners.forEach(lis -> lis.notifyState(state, model)));
  }

  /**
   * Check if given document is copybook or not
   *
   * @param uri - document uri
   * @param text - document text
   * @return true for copybook and false otherwise
   */
  public boolean isCopybook(String uri, String text) {
    return this.analysisService.isCopybook(uri, text);
  }
}
