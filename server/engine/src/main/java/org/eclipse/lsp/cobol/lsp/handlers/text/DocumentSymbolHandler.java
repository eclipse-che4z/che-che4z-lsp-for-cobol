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
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.DocumentSymbolParams;
import org.eclipse.lsp4j.SymbolInformation;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static java.util.stream.Collectors.toList;

/**
 * LSP DocumentSymbol Handler
 */
@Slf4j
public class DocumentSymbolHandler {
  private final Communications communications;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public DocumentSymbolHandler(Communications communications, AsyncAnalysisService asyncAnalysisService) {
    this.communications = communications;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Handle LSP documentSymbol request.
   * @param params DocumentSymbolParams.
   * @return The list of either SymbolInformation or DocumentSymbols.
   */
  public List<Either<SymbolInformation, DocumentSymbol>> documentSymbol(DocumentSymbolParams params) throws ExecutionException, InterruptedException {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Optional<CompletableFuture<CobolDocumentModel>> optional = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(uri);
    if (!optional.isPresent()) {
      return Collections.emptyList();
    }
    try {
      return createDocumentSymbols(optional.get().get().getOutlineResult());
    } finally {
      communications.notifyProgressEnd(uri);
    }
  }

  private List<Either<SymbolInformation, DocumentSymbol>> createDocumentSymbols(List<DocumentSymbol> documentSymbols) {
    return documentSymbols == null ? ImmutableList.of()
            : documentSymbols.stream()
            .map(Either::<SymbolInformation, DocumentSymbol>forRight)
            .collect(toList());
  }
}
