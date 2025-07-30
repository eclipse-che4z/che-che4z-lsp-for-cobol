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
package org.eclipse.lsp.cobol.lsp.handlers.text;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import java.util.ArrayList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.lsp.LspEventCancelCondition;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.FoldingQuery;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.DocumentServiceHelper;
import org.eclipse.lsp4j.FoldingRange;
import org.eclipse.lsp4j.FoldingRangeRequestParams;

/** LSP FoldingRange Handler */
@Slf4j
public class FoldingRangeHandler {

  private final DocumentModelService documentService;
  private final AsyncAnalysisService asyncAnalysisService;
  private final AnalysisService analysisService;

  @Inject
  public FoldingRangeHandler(
      DocumentModelService documentService,
      AsyncAnalysisService asyncAnalysisService,
      AnalysisService analysisService) {
    this.documentService = documentService;
    this.asyncAnalysisService = asyncAnalysisService;
    this.analysisService = analysisService;
  }

  /**
   * Process foldingRange LSP request
   *
   * @param params FoldingRangeRequestParams
   * @return list of FoldingRanges
   */
  public List<FoldingRange> foldingRange(FoldingRangeRequestParams params) {
    String uri = params.getTextDocument().getUri();
    final CobolDocumentModel documentModel = documentService.get(uri);
    if (documentModel == null || !documentModel.isDocumentSynced()) return ImmutableList.of();
    final AnalysisResult results = documentModel.getAnalysisResult();
    if (results == null) return ImmutableList.of();
    return new ArrayList<>(DocumentServiceHelper.getFoldingRange(results.getRootNode(), uri));
  }

  /**
   * Create foldingRange LSP event.
   *
   * @param params FoldingRangeRequestParams
   * @return LspNotification.
   */
  public LspQuery<List<FoldingRange>> createEvent(FoldingRangeRequestParams params) {
    return new FoldingQuery(params, this);
  }

  /**
   * Get dependency for this handler
   * @param uri
   * @return list of {@link LspEventDependency
   */
  public List<LspEventDependency> getDependencies(String uri) {
    return ImmutableList.of(
        asyncAnalysisService.createDependencyOn(uri), () -> documentService.isDocumentSynced(uri));
  }

  /**
   * Gives cancel condition
   *
   * @param uri
   * @return list of {@link LspEventCancelCondition}
   */
  public List<LspEventCancelCondition> getCancelConditions(String uri) {
    return ImmutableList.of(
        asyncAnalysisService.createCancelConditionOnClose(uri),
        () -> {
          final CobolDocumentModel documentModel = documentService.get(uri);
          return documentModel == null || analysisService.isCopybook(uri, documentModel.getText());
        });
  }
}
