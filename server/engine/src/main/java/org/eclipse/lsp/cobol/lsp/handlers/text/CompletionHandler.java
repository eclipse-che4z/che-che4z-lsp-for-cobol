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

import com.google.inject.Inject;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * LSP Completion Handler
 */
public class CompletionHandler {
  private final Completions completions;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public CompletionHandler(AsyncAnalysisService asyncAnalysisService, Completions completions) {
    this.completions = completions;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Handle completion LSP request.
   * @param params CompletionParams.
   * @return Either List of CompletionItem, either CompletionList.
   * @throws ExecutionException forward exception.
   * @throws InterruptedException forward exception.
   */
  public Either<List<CompletionItem>, CompletionList> completion(CompletionParams params) throws ExecutionException, InterruptedException {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Optional<CompletableFuture<CobolDocumentModel>> optional = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(uri);
    if (!optional.isPresent()) {
      return Either.forLeft(Collections.emptyList());
    }
    CobolDocumentModel document = optional.get().get();
    return Either.forRight(completions.collectFor(document, params));
  }
}
