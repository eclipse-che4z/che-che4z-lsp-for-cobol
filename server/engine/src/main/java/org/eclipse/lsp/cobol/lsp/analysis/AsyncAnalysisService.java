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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.lsp.LspEventCancelCondition;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.WorkspaceDocumentGraph;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookServiceImpl;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;

/**
 * Asynchronous analysis
 */
@Slf4j
@Singleton
public class AsyncAnalysisService implements AnalysisStateNotifier {
  private static final ExecutorService SINGLE_THREAD_EXECUTOR = Executors.newSingleThreadExecutor(r -> new Thread(r, "LSP workspace service"));
  private final DocumentModelService documentModelService;
  private final AnalysisService analysisService;
  private final CopybookService copybookService;
  private final SubroutineService subroutineService;
  private final Communications communications;

  private final Map<String, CompletableFuture<CobolDocumentModel>> analysisResults = Collections.synchronizedMap(new HashMap<>());
  private final Map<String, Integer> analysisResultsRevisions = Collections.synchronizedMap(new HashMap<>());
  private final Map<String, ExecutorService> analysisExecutors = Collections.synchronizedMap(new HashMap<>());

  private final List<AnalysisStateListener> analysisStateListeners;

  private static final ThreadFactory THREAD_FACTORY = new ThreadFactory() {
    private int counter = 0;

    public Thread newThread(Runnable r) {
      return new Thread(r, "Analysis thread #" + counter++);
    }
  };


  @Inject
  public AsyncAnalysisService(DocumentModelService documentModelService,
                              AnalysisService analysisService,
                              CopybookService copybookService,
                              SubroutineService subroutineService,
                              Communications communications) {
    this.documentModelService = documentModelService;
    this.analysisService = analysisService;
    this.copybookService = copybookService;
    this.subroutineService = subroutineService;
    this.communications = communications;
    analysisStateListeners = new ArrayList<>();
  }

  /**
   * Schedule an analysis last known revision of the file will be assumed or 0 if none
   *
   * @param uri  source URI
   * @param text content
   * @param open Is document just opened, or it's reanalyse request
   * @return document model with analysis result
   */
  public synchronized CompletableFuture<CobolDocumentModel> scheduleAnalysis(String uri, String text, boolean open) {
    return scheduleAnalysis(uri, text, analysisResultsRevisions.getOrDefault(uri, 0), open, WorkspaceDocumentGraph.EventSource.IDE);
  }

  /**
   * Schedule an analysis last known revision of the file will be assumed or 0 if none
   *
   * @param uri  source URI
   * @param text content
   * @param currentRevision the document currentRevision
   * @param open Is document just opened, or it's reanalyse request
   * @param eventSource source of the event
   * @return document model with analysis result
   */
  public synchronized CompletableFuture<CobolDocumentModel> scheduleAnalysis(String uri, String text, Integer currentRevision, boolean open, WorkspaceDocumentGraph.EventSource eventSource) {
    return scheduleAnalysis(uri, text, currentRevision, open, false, eventSource);
  }

  /**
   * Schedule an analysis
   *
   * @param uri             source URI
   * @param text            content
   * @param currentRevision the document currentRevision
   * @param open            Is document just opened, or it's reanalyse request
   * @param force           forcefully schedule the analysis
   * @param eventSource source of the event
   * @return document model with analysis result
   */
  public synchronized CompletableFuture<CobolDocumentModel> scheduleAnalysis(String uri, String text, Integer currentRevision, boolean open, boolean force, WorkspaceDocumentGraph.EventSource eventSource) {
    notifyAllListeners(AnalysisState.SCHEDULED, documentModelService.get(uri), eventSource);
    String id = makeId(uri, currentRevision);
    Integer prevId = analysisResultsRevisions.put(uri, currentRevision);
    if (currentRevision.equals(prevId) && !force) {
      notifyAllListeners(AnalysisState.SKIPPED, documentModelService.get(uri), eventSource);
      return analysisResults.get(id);
    }
    handleRelatedDocuments(uri, text, open, force);
    Executor analysisExecutor = getExecutor(uri);
    CompletableFuture<CobolDocumentModel> value = CompletableFuture.supplyAsync(() -> {
      if (currentRevision < analysisResultsRevisions.get(uri) && !force) {
        notifyAllListeners(AnalysisState.SKIPPED, documentModelService.get(uri), eventSource);
        LOG.debug("[scheduleAnalysis] skip revision: " + currentRevision + " latest: " + analysisResultsRevisions.get(uri));
        return null;
      }
      LOG.debug("[scheduleAnalysis] Start analysis: " + uri);
      notifyAllListeners(AnalysisState.STARTED, documentModelService.get(uri), eventSource);
      try {
        communications.notifyProgressBegin(uri);
        analysisService.analyzeDocument(uri, text, open, getProcessingMode(force));
        CobolDocumentModel documentModel = documentModelService.get(uri);
        analysisResults.remove(id).complete(documentModel);
        notifyAllListeners(AnalysisState.COMPLETED, documentModel, eventSource);
        return documentModel;
      } finally {
        if (Objects.equals(analysisResultsRevisions.get(uri), currentRevision) || force) {
          communications.publishDiagnostics(documentModelService.getOpenedDiagnostic());
        }
        communications.notifyProgressEnd(uri);
      }
    }, analysisExecutor);
    analysisResults.put(id, value);
    if (prevId != null && !force) {
      Optional.ofNullable(analysisResults.get(makeId(uri, prevId))).ifPresent(cf -> cf.cancel(true));
    }
    return value;
  }

  private CopybookProcessingMode getProcessingMode(boolean force) {
    if (force) {
      return CopybookProcessingMode.ENABLED_VERBOSE;
    }
    return null;
  }

  private void handleRelatedDocuments(String uri, String text, boolean isNew, boolean force) {
    if (!force) analysisService.updateCache(uri, text, isNew);
    Set<String> affectedDocumentsForCopybook = documentModelService.findAffectedDocumentsForCopybook(uri, d -> !d.getUri().equals(uri) && d.isOpened());
    if (!affectedDocumentsForCopybook.isEmpty() && !isNew) {
      List<CobolDocumentModel> affectedCobolDocumentModels = documentModelService.getAllOpened().stream()
              .filter(d -> affectedDocumentsForCopybook.contains(d.getUri()) && !analysisService.isCopybook(d.getUri(), d.getText()))
              .collect(Collectors.toList());

      affectedCobolDocumentModels.forEach(
          doc -> {
            LOG.debug("[reanalyzeDocument] Document " + doc.getUri());
            scheduleAnalysis(
                doc.getUri(), doc.getText(), analysisResultsRevisions.get(doc.getUri()), false, true, WorkspaceDocumentGraph.EventSource.IDE);
          });
    }
  }

  private Executor getExecutor(String uri) {
    synchronized (analysisExecutors) {
      ExecutorService analysisExecutor = analysisExecutors.computeIfAbsent(uri, u -> Executors.newSingleThreadExecutor(THREAD_FACTORY));
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
   * Trigger reanalyse of opened programs.
   */
  public void reanalyseOpenedPrograms() {
    copybookService.invalidateCache();
    subroutineService.invalidateCache();
    LOG.info("Cache invalidated");
    documentModelService.getAllOpened()
            .stream().filter(d -> !analysisService.isCopybook(d.getUri(), d.getText()))
            .forEach(doc -> scheduleAnalysis(doc.getUri(), doc.getText(), analysisResultsRevisions.get(doc.getUri()), false, true, WorkspaceDocumentGraph.EventSource.IDE));
  }

  /**
   * Trigger reanalyse for the passed document uri's.
   * @param uris
   * @param copybookUri
   * @param eventSource
   */
  public void reanalyseOpenedPrograms(List<String> uris, String copybookUri, WorkspaceDocumentGraph.EventSource eventSource) {
    for (String uri : uris) {
      //TODO: update cache directly from workspace document graph
      if (copybookService instanceof CopybookServiceImpl) {
        CopybookServiceImpl copybookServiceImpl = (CopybookServiceImpl) copybookService;
        copybookServiceImpl.getCopybookUsage(uri).stream()
                .filter(model -> model.getUri().equals(copybookUri))
                .forEach(
                        copybookModel -> copybookServiceImpl.invalidateCache(copybookModel.getCopybookId()));
      }
      subroutineService.invalidateCache();
      LOG.info("Cache invalidated");
      CobolDocumentModel model = documentModelService.get(uri);
      scheduleAnalysis(uri, model.getText(), analysisResultsRevisions.get(model.getUri()), false, true, eventSource);
    }
  }

  /**
   * Stop code analysis.
   *
   * @param uri source URI
   */
  public void cancelAnalysis(String uri) throws InterruptedException {
    analysisResultsRevisions.remove(uri);
    synchronized (analysisExecutors) {
      ExecutorService service = analysisExecutors.remove(uri);
      if (service != null) {
        service.shutdownNow();
        service.awaitTermination(1, TimeUnit.SECONDS);
      }
    }
    LOG.debug("[stopAnalysis] Document " + uri + " publish diagnostic: " + documentModelService.getOpenedDiagnostic());
    communications.publishDiagnostics(documentModelService.getOpenedDiagnostic());
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
      return doc.getLastAnalysisResult() != null;
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
      if (doc == null) {
        return true;
      }
      return !doc.isOpened();
    };
  }

  /**
   * Mark document as opened
   *
   * @param uri  of document
   * @param text content od document.
   */
  public void openDocument(String uri, String text) {
    documentModelService.openDocument(uri, text);
  }

  @Override
  public void register(List<AnalysisStateListener> analysisStateListeners) {
    this.analysisStateListeners.addAll(analysisStateListeners);
  }

  @Override
  public void notifyAllListeners(AnalysisState state, CobolDocumentModel model, WorkspaceDocumentGraph.EventSource eventSource) {
    SINGLE_THREAD_EXECUTOR
            .execute(() -> this.analysisStateListeners.forEach(lis -> lis.notifyState(state, model, eventSource)));
  }
}
