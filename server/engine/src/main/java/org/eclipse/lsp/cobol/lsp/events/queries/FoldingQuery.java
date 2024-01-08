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
import org.eclipse.lsp.cobol.lsp.handlers.text.FoldingRangeHandler;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.FoldingRange;
import org.eclipse.lsp4j.FoldingRangeRequestParams;

/**
 * `textDocument/foldingRange` language server event
 */
public class FoldingQuery implements LspQuery<List<FoldingRange>> {
  final CompletableFuture<List<FoldingRange>> result;
  private final String uri;
  private final FoldingRangeRequestParams params;
  private final FoldingRangeHandler foldingRangeHandler;

  public FoldingQuery(FoldingRangeRequestParams params, FoldingRangeHandler foldingRangeHandler, UriDecodeService uriDecodeService) {
    this.uri = uriDecodeService.decode(params.getTextDocument().getUri());
    this.params = params;
    this.foldingRangeHandler = foldingRangeHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return foldingRangeHandler.getDependencies(uri);
  }

  @Override
  public List<LspEventCancelCondition> getCancelConditions() {
    return foldingRangeHandler.getCancelConditions(uri);
  }

  @Override
  public CompletableFuture<List<FoldingRange>> getResult() {
    return result;
  }

  @Override
  public List<FoldingRange> query() {
    return foldingRangeHandler.foldingRange(params);
  }
}
