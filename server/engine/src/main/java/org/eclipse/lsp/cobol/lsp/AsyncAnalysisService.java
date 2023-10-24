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
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

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
  private final Map<String, Long> analysisResultsRevisions = Collections.synchronizedMap(new HashMap<>());

  private final Executor analysisExecutor = Executors.newSingleThreadExecutor();

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
   * @param uri URI of the source
   * @return DocumentModel with analysis result or Option.empty() if analysis was not
   * triggered at the time of method call.
   */
  public Optional<CompletableFuture<CobolDocumentModel>> fetchLastResultOrAnalyzeDocument(String uri) {
    CobolDocumentModel documentModel = documentModelService.get(uri);
    if (documentModel == null || documentModel.getLastAnalysisResult() == null) {
      return Optional.ofNullable(analysisResults.get(makeId(uri, analysisResultsRevisions.get(uri))));
    }
    return Optional.of(CompletableFuture.completedFuture(documentModel));
  }

  /**
   * Schedule an analysis
   *
   * @param uri  source URI
   * @param text content
   * @param open Is document just opened, or it's reanalyse request
   * @return document model with analysis result
   */
  public synchronized CompletableFuture<CobolDocumentModel> scheduleAnalysis(String uri, String text, boolean open) {
    Long currentRevision = analysisResultsRevisions.compute(uri, (k, v) -> (v == null ? 0 : v) + 1);
    String id = makeId(uri, currentRevision);
    return analysisResults.computeIfAbsent(id, u -> CompletableFuture.supplyAsync(() -> {
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

  private static String makeId(String uri, Long revision) {
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
            .forEach(doc -> scheduleAnalysis(doc.getUri(), doc.getText(), false));
  }

  /**
   * Stop code analysis.
   *
   * @param uri source URI
   */
  public void cancelAnalysis(String uri) {
    analysisService.stopAnalysis(uri);
    communications.notifyProgressEnd(uri);
    LOG.debug("[stopAnalysis] Document " + uri + " publish diagnostic: " + documentModelService.getOpenedDiagnostic());
    communications.publishDiagnostics(documentModelService.getOpenedDiagnostic());
  }
}
