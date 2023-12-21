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
import java.util.Collections;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.LspEvent;
import org.eclipse.lsp.cobol.lsp.LspEventCancelCondition;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.DocumentServiceHelper;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.FoldingRange;
import org.eclipse.lsp4j.FoldingRangeRequestParams;

/**
 * LSP FoldingRange Handler
 */
@Slf4j
public class FoldingRangeHandler {

  private final DocumentModelService documentService;
  private final AsyncAnalysisService asyncAnalysisService;
  private final UriDecodeService uriDecodeService;

  @Inject
  public FoldingRangeHandler(DocumentModelService documentService, AsyncAnalysisService asyncAnalysisService, UriDecodeService uriDecodeService) {
    this.documentService = documentService;
    this.asyncAnalysisService = asyncAnalysisService;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Process foldingRange LSP request
   *
   * @param params FoldingRangeRequestParams
   * @return list of FoldingRanges
   */
  public List<FoldingRange> foldingRange(FoldingRangeRequestParams params) {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    List<DocumentSymbol> symbols =
            documentService.isDocumentSynced(uri)
                    ? documentService.get(uri).getOutlineResult()
                    : Collections.emptyList();
    return DocumentServiceHelper.getFoldingRangeFromDocumentSymbol(symbols);
  }

  /**
   * Create foldingRange LSP event.
   *
   * @param params FoldingRangeRequestParams
   * @return LspEvent.
   */
  public LspEvent<List<FoldingRange>> createEvent(FoldingRangeRequestParams params) {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    return new LspEvent<List<FoldingRange>>() {
      final List<LspEventDependency> lspEventDependencies = ImmutableList.of(
              asyncAnalysisService.createDependencyOn(uri));
      final ImmutableList<LspEventCancelCondition> lspEventCancelConditions = ImmutableList.of(
              asyncAnalysisService.createCancelConditionOnClose(uri));

      @Override
      public List<LspEventDependency> getDependencies() {
        return lspEventDependencies;
      }

      @Override
      public List<FoldingRange> execute() {
        return FoldingRangeHandler.this.foldingRange(params);
      }
    };
  }
}
