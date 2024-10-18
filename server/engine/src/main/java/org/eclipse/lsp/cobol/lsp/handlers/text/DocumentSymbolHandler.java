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

import static java.util.stream.Collectors.toList;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.lsp.*;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.DocumentSymbolQuery;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.DocumentSymbolParams;
import org.eclipse.lsp4j.SymbolInformation;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * LSP DocumentSymbol Handler
 */
@Slf4j
public class DocumentSymbolHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final AnalysisService analysisService;
  private final DocumentModelService documentModelService;

  @Inject
  public DocumentSymbolHandler(AsyncAnalysisService asyncAnalysisService, AnalysisService analysisService, DocumentModelService documentModelService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.analysisService = analysisService;
    this.documentModelService = documentModelService;
  }

  /**
   * Handle LSP documentSymbol request.
   *
   * @param params DocumentSymbolParams.
   * @return The list of either SymbolInformation or DocumentSymbols.
   */
  public List<Either<SymbolInformation, DocumentSymbol>> documentSymbol(DocumentSymbolParams params) {
    Uri uri = Uri.fromLsp(params.getTextDocument().getUri());
    return createDocumentSymbols(documentModelService.get(uri).getOutlineResult());
  }

  private List<Either<SymbolInformation, DocumentSymbol>> createDocumentSymbols(List<DocumentSymbol> documentSymbols) {
    return documentSymbols == null
            ? ImmutableList.of()
            : documentSymbols.stream().map(Either::<SymbolInformation, DocumentSymbol>forRight).collect(toList());
  }

  /**
   * Create LSP event for documentSymbol.
   *
   * @param params DocumentSymbolParams.
   * @return LspNotification.
   */
  public LspQuery<List<Either<SymbolInformation, DocumentSymbol>>> createEvent(DocumentSymbolParams params) {
    return new DocumentSymbolQuery(params, this);
  }

  /**
   * Get dependency for this handler
   * @param params
   * @return list of {@link LspEventDependency}
   */
  public List<LspEventDependency> getDependencies(DocumentSymbolParams params) {
    Uri uri = Uri.fromLsp(params.getTextDocument().getUri());
    return ImmutableList.of(
            asyncAnalysisService.createDependencyOn(uri),
            () -> documentModelService.get(uri) != null && ((documentModelService.get(uri).getOutlineResult() != null
                    && !documentModelService.get(uri).getOutlineResult().isEmpty())
                    || analysisService.isCopybook(uri, documentModelService.get(uri).getText())));
  }

  /**
   * get cancel conditions
   * @param params
   * @return list of {@link LspEventCancelCondition
   */
  public List<LspEventCancelCondition> getCancelDependencies(DocumentSymbolParams params) {
    Uri uri = Uri.fromLsp(params.getTextDocument().getUri());
    return ImmutableList.of(
            asyncAnalysisService.createCancelConditionOnClose(uri));
  }
}
