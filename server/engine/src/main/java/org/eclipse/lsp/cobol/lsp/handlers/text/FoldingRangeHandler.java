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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.LspEvent;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.DocumentServiceHelper;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.FoldingRange;
import org.eclipse.lsp4j.FoldingRangeRequestParams;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * LSP FoldingRange Handler
 */
@Slf4j
public class FoldingRangeHandler {

  private final DocumentModelService documentService;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public FoldingRangeHandler(DocumentModelService documentService, AsyncAnalysisService asyncAnalysisService) {
    this.documentService = documentService;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Process foldingRange LSP request
   * @param params FoldingRangeRequestParams
   * @return list of FoldingRanges
   */
  public List<FoldingRange> foldingRange(FoldingRangeRequestParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    List<DocumentSymbol> symbols =
            documentService.isDocumentSynced(uri)
                    ? documentService.get(uri).getOutlineResult()
                    : Collections.emptyList();
    return DocumentServiceHelper.getFoldingRangeFromDocumentSymbol(symbols);
  }

  /**
   * Create foldingRange LSP event.
   * @param params FoldingRangeRequestParams
   * @return LspEvent.
   */
  public LspEvent<List<FoldingRange>> createEvent(FoldingRangeRequestParams params) {
    return new LspEvent<List<FoldingRange>>() {
      @Override
      public List<LspEventDependency> getDependencies() {
        return ImmutableList.of(asyncAnalysisService.createDependencyOn(UriHelper.decode(params.getTextDocument().getUri())));
      }

      @Override
      public List<FoldingRange> execute() throws ExecutionException, InterruptedException {
        return FoldingRangeHandler.this.foldingRange(params);
      }
    };
  }
}
