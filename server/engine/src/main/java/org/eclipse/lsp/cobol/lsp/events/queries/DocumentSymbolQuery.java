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
package org.eclipse.lsp.cobol.lsp.events.queries;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.lsp.LspEventCancelCondition;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.DocumentSymbolHandler;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.DocumentSymbolParams;
import org.eclipse.lsp4j.SymbolInformation;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * `textDocument/documentSymbol` language server event
 */
public class DocumentSymbolQuery implements LspQuery<List<Either<SymbolInformation, DocumentSymbol>>> {
  final String uri;
  private final DocumentSymbolHandler documentSymbolHandler;
  final CompletableFuture<List<Either<SymbolInformation, DocumentSymbol>>> result;
  private final DocumentSymbolParams params;

  public DocumentSymbolQuery(
          DocumentSymbolParams params, DocumentSymbolHandler documentSymbolHandler, UriDecodeService uriDecodeService) {
    this.params = params;
    uri = uriDecodeService.decode(params.getTextDocument().getUri());
    this.documentSymbolHandler = documentSymbolHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return documentSymbolHandler.getDependencies(params);
  }

  @Override
  public CompletableFuture<List<Either<SymbolInformation, DocumentSymbol>>> getResult() {
    return result;
  }

  @Override
  public List<LspEventCancelCondition> getCancelConditions() {
    return documentSymbolHandler.getCancelDependencies(params);
  }

  @Override
  public List<Either<SymbolInformation, DocumentSymbol>> query() {
    return documentSymbolHandler.documentSymbol(params);
  }
}
