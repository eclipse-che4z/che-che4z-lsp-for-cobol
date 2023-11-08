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
package org.eclipse.lsp.cobol.lsp;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;

import java.util.*;
import java.util.concurrent.*;

/**
 * Asynchronous analysis
 */
@Slf4j
@Singleton
public class AsyncAnalysisService {
  private final DocumentModelService documentModelService;
  private final AnalysisService analysisService;
  private final CopybookService copybookService;
  private final SubroutineService subroutineService;
  private final Communications communications;

  private final Map<String, CompletableFuture<CobolDocumentModel>> analysisResults = Collections.synchronizedMap(new HashMap<>());
  private final Map<String, Integer> analysisResultsRevisions = Collections.synchronizedMap(new HashMap<>());
  private final Map<String, CompletableFuture<CobolDocumentModel>> lastResults = new ConcurrentHashMap<>();

  private final Executor analysisExecutor = Executors.newCachedThreadPool();

  @Inject
  public AsyncAnalysisService(DocumentModelService documentModelService,
                              AnalysisService analysisService,
                              CopybookService copybookService,
                              SubroutineService subroutineService, Communications communications) {
    this.documentModelService = documentModelService;
    this.analysisService = analysisService;
    this.copybookService = copybookService;
    this.subroutineService = subroutineService;
    this.communications = communications;
  }

  /**
   * Fetch last analysis result or wait for it if analysis is in progress.
   *
   * @param documentUri URI of the source
   * @return DocumentModel with analysis result or Option.empty() if analysis was not
   * triggered at the time of method call.
   */
  public Optional<CompletableFuture<CobolDocumentModel>> fetchLastResultOrAnalyzeDocument(String documentUri) {
    return Optional.ofNullable(lastResults.computeIfAbsent(documentUri, uri -> {
      CobolDocumentModel documentModel = documentModelService.get(uri);
      return documentModel == null || documentModel.getLastAnalysisResult() == null
              ? analysisResults.get(makeId(uri, analysisResultsRevisions.get(uri)))
              : CompletableFuture.completedFuture(documentModel);
    }));
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
    return scheduleAnalysis(uri, text, analysisResultsRevisions.getOrDefault(uri, 0), open);
  }

  /**
   * Schedule an analysis
   *
   * @param uri             source URI
   * @param text            content
   * @param currentRevision the document currentRevision
   * @param open            Is document just opened, or it's reanalyse request
   * @return document model with analysis result
   */
  public synchronized CompletableFuture<CobolDocumentModel> scheduleAnalysis(String uri, String text, Integer currentRevision, boolean open) {
    String id = makeId(uri, currentRevision);
    analysisResultsRevisions.put(uri, currentRevision);
    return analysisResults.computeIfAbsent(id, u -> CompletableFuture.supplyAsync(() -> {
      if (currentRevision < analysisResultsRevisions.get(uri)) {
        return null;
      }
      LOG.debug("[analyzeDocumentWithCopybooks] Start analysis: " + uri);

      try {
        communications.notifyProgressBegin(uri);
        analysisService.analyzeDocument(uri, text, open);
        analysisResults.remove(u);
        return documentModelService.get(uri);
      } finally {
        if (Objects.equals(analysisResultsRevisions.get(uri), currentRevision)) {
          communications.publishDiagnostics(documentModelService.getOpenedDiagnostic());
        }
        communications.notifyProgressEnd(uri);
      }
    }, analysisExecutor));
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
            .forEach(doc -> scheduleAnalysis(doc.getUri(), doc.getText(), analysisResultsRevisions.get(doc.getUri()), false));
  }

  /**
   * Stop code analysis.
   *
   * @param uri source URI
   */
  public void cancelAnalysis(String uri) {
    analysisService.stopAnalysis(uri);
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

}
