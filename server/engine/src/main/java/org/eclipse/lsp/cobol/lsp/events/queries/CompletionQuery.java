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
import java.util.concurrent.ExecutionException;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.CompletionHandler;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * Completion Language server event
 */
public class CompletionQuery implements LspQuery<Either<List<CompletionItem>, CompletionList>> {
  final CompletableFuture<Either<List<CompletionItem>, CompletionList>> result;
  private final CompletionParams params;
  private final CompletionHandler completionHandler;

  public CompletionQuery(
      CompletionParams params,
      CompletionHandler completionHandler) {
    this.completionHandler = completionHandler;
    this.params = params;
    result = new CompletableFuture<>();
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return completionHandler.getDocumentHighlightDependency(params);
  }

  @Override
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> getResult() {
    return result;
  }

  @Override
  public Either<List<CompletionItem>, CompletionList> query()
      throws ExecutionException, InterruptedException {
    return completionHandler.completion(params);
  }
}
