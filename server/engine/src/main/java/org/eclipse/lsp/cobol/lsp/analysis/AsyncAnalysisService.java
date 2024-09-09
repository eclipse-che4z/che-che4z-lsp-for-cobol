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
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.TrueDialectService;
import org.eclipse.lsp.cobol.lsp.LspEventCancelCondition;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;

/**
 * Asynchronous analysis
 */
@Slf4j
@Singleton
public class AsyncAnalysisService implements AnalysisStateNotifier {
  private static final ExecutorService SINGLE_THREAD_EXECUTOR = Executors.newSingleThreadExecutor(r -> new Thread(r, "LSP workspace service"));
  private final TrueDialectService dialectService;
  private final DocumentModelService documentModelService;
  private final AnalysisService analysisService;
  private final CopybookService copybookService;
  private final SubroutineService subroutineService;
  private final Communications communications;

  private final Map<String, FutureTask<CobolDocumentModel>> analysisResults = Collections.synchronizedMap(new HashMap<>());
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
  public AsyncAnalysisService(TrueDialectService dialectService,
                              DocumentModelService documentModelService,
                              AnalysisService analysisService,
                              CopybookService copybookService,
                              SubroutineService subroutineService,
                              Communications communications) {
    this.dialectService = dialectService;
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
  public synchronized FutureTask<CobolDocumentModel> scheduleAnalysis(String uri, String text, boolean open) {
    return scheduleAnalysis(uri, text, analysisResultsRevisions.getOrDefault(uri, 0), open, SourceUnitGraph.EventSource.IDE);
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
  public synchronized FutureTask<CobolDocumentModel> scheduleAnalysis(String uri, String text, Integer currentRevision, boolean open, SourceUnitGraph.EventSource eventSource) {
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
  public synchronized FutureTask<CobolDocumentModel> scheduleAnalysis(String uri, String text, Integer currentRevision, boolean open, boolean force, SourceUnitGraph.EventSource eventSource) {
    notifyAllListeners(AnalysisState.SCHEDULED, documentModelService.get(uri), eventSource);
    String id = makeId(uri, currentRevision);
    Integer prevId = analysisResultsRevisions.put(uri, currentRevision);
    if (currentRevision.equals(prevId) && !force) {
      notifyAllListeners(AnalysisState.SKIPPED, documentModelService.get(uri), eventSource);
      return analysisResults.get(id);
    }
    ExecutorService analysisExecutor = getExecutor(uri);
    CobolDocumentModel documentModel = documentModelService.get(uri);
    documentModel.updateLastAnalysisNotCancelled();
    FutureTask<CobolDocumentModel> futureTask = new FutureTask<>(scheduleAnalysis(uri, documentModel, text, currentRevision, open, force, eventSource, id));
    analysisResults.put(id, futureTask);
    analysisExecutor.submit(futureTask);
    if (prevId != null && !force) {
      Optional.ofNullable(analysisResults.get(makeId(uri, prevId))).ifPresent(cf -> cf.cancel(true));
    }
    return futureTask;
  }

  private Callable<CobolDocumentModel> scheduleAnalysis(String uri, CobolDocumentModel documentModel, String text, Integer currentRevision, boolean open, boolean force, SourceUnitGraph.EventSource eventSource, String id) {
    return () -> {
      if (currentRevision < analysisResultsRevisions.get(uri) && !force) {
        notifyAllListeners(
                AnalysisState.SKIPPED, documentModelService.get(uri), eventSource);
        LOG.debug(
                "[scheduleAnalysis] skip revision: "
                        + currentRevision
                        + " latest: "
                        + analysisResultsRevisions.get(uri));
        return null;
      }
      LOG.debug("[scheduleAnalysis] Start analysis: " + uri);
      notifyAllListeners(AnalysisState.STARTED, documentModelService.get(uri), eventSource);
      try {
        communications.notifyProgressBegin(uri);
        documentModelService.get(uri).setOutlineResult(null);
        analysisService.analyzeDocument(uri, text, open);
        analysisResults.remove(id);
        notifyAllListeners(AnalysisState.COMPLETED, documentModel, eventSource);
        return documentModel;
      } catch (Exception genericException) { // Ideally we should not do this, but a safer catch might help to remove unknown issues
        LOG.error("Encountered Exception {} , while analysing uri : {}", genericException, documentModel.getUri(), genericException);
        // set the analysis as cancelled due to exception
        documentModel.updateLastAnalysisCancelled();
        return documentModel;
      } finally {
        if (Objects.equals(analysisResultsRevisions.get(uri), currentRevision) || force) {
          communications.publishDiagnostics(documentModelService.getOpenedDiagnostic());
        }
        communications.notifyProgressEnd(uri);
      }
    };
  }


  private ExecutorService getExecutor(String uri) {
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
  public void reanalyseOpenedPrograms() throws InterruptedException {
    List<CobolDocumentModel> openDocuments = documentModelService.getAllOpened()
            .stream().filter(d -> !analysisService.isCopybook(d.getUri(), d.getText())).collect(Collectors.toList());
    waitForPreviousAnalysisToBeCompleted(openDocuments);
    copybookService.invalidateCache(true);
    subroutineService.invalidateCache();
    LOG.info("Cache invalidated");
    openDocuments
            .forEach(doc -> scheduleAnalysis(doc.getUri(), doc.getText(), analysisResultsRevisions.getOrDefault(doc.getUri(), 0), false, true, SourceUnitGraph.EventSource.IDE));
  }

  private void waitForPreviousAnalysisToBeCompleted(List<CobolDocumentModel> openDocuments) {
    boolean analysisInProgress;
    do {
      analysisInProgress = openDocuments.stream().anyMatch(model -> isAnalysisInProgress(model.getUri()));
      if (analysisInProgress) {
        cancelRunningAnalysis(openDocuments);
      } else {
        break;
      }
      LOG.debug(" re-analysis is waiting for prev analysis to finish");
        try {
            TimeUnit.MILLISECONDS.sleep(100);
        } catch (InterruptedException e) {
            LOG.error("re-analysis sleep interrupted", e);
            Thread.currentThread().interrupt();
        }
    } while (analysisInProgress);
  }

  private void cancelRunningAnalysis(List<CobolDocumentModel> openDocuments) {
    openDocuments.stream()
            .filter(model -> model.getLastAnalysisResult() != null)
            .map(model -> makeId(model.getUri(), analysisResultsRevisions.get(model.getUri())))
            .filter(analysisResults::containsKey)
            .map(analysisResults::get)
            .forEach(future -> future.cancel(true));
  }

  /**
   * Trigger reanalyse for the passed document uri's.
   * @param uris
   * @param copybookUri
   * @param copybookContent
   * @param eventSource
   */
  public void reanalyseCopybooksAssociatedPrograms(List<String> uris, String copybookUri, String copybookContent, SourceUnitGraph.EventSource eventSource) {
    documentModelService.removeDocumentDiagnostics(copybookUri);
    Optional.ofNullable(documentModelService.get(copybookUri)).ifPresent(model -> model.update(copybookContent));
    List<String> openedUris =
        documentModelService.getAllOpened().stream()
            .filter(model -> uris.contains(model.getUri()))
            .filter(model -> !analysisService.isCopybook(model.getUri(), model.getText()))
            .map(CobolDocumentModel::getUri)
            .collect(Collectors.toList());
    for (String uri : openedUris) {
        String languageId = documentModelService.get(uri).getLanguageId();
      //   waitForPreviousAnalysisToBeCompleted(ImmutableList.of(documentModelService.get(uri)));
      //TODO: update cache directly from workspace document graph
      copybookService.getCopybookUsage(uri).stream()
          .filter(model -> Objects.nonNull(model.getUri()))
          .filter(model -> model.getUri().equals(copybookUri))
          .forEach(
              copybookModel -> {
                copybookService.invalidateCache(copybookModel.getCopybookId());
                if (copybookContent != null) {
                  copybookModel.setContent(copybookContent);
                  copybookService.store(copybookModel, dialectService.getPreprocessor(CobolLanguageId.MAPPER.get(languageId)));
                }
              });

      subroutineService.invalidateCache();
      LOG.info("Cache invalidated");
      CobolDocumentModel document = documentModelService.get(uri);
      scheduleAnalysis(uri, document.getText(), analysisResultsRevisions.get(document.getUri()), false, true, eventSource);
    }
  }

  private boolean isAnalysisInProgress(String uri) {
    CobolDocumentModel document = documentModelService.get(uri);
    if (document.getLastAnalysisResult() == null) return false;
    String id = makeId(document.getUri(), analysisResultsRevisions.get(document.getUri()));
    boolean analysisInProgress = analysisResults.containsKey(id);
    if (!analysisInProgress) {
      return false;
    }
    return !document.getIsLastAnalysisCancelled().get();
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
//        service.awaitTermination(1, TimeUnit.SECONDS);
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
   * @param uri        of document
   * @param text       content od document.
   * @param languageId
   */
  public void openDocument(String uri, String text, String languageId) {
    documentModelService.openDocument(uri, text, languageId);
  }

  @Override
  public void register(List<AnalysisStateListener> analysisStateListeners) {
    this.analysisStateListeners.addAll(analysisStateListeners);
  }

  @Override
  public void notifyAllListeners(AnalysisState state, CobolDocumentModel model, SourceUnitGraph.EventSource eventSource) {
    SINGLE_THREAD_EXECUTOR
            .execute(() -> this.analysisStateListeners.forEach(lis -> lis.notifyState(state, model, eventSource)));
  }
}
