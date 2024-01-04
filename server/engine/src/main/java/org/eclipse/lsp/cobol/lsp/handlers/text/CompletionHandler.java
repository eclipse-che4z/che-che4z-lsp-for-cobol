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
import java.util.List;
import java.util.concurrent.ExecutionException;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.CompletionQuery;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * LSP Completion Handler
 */
@Slf4j
public class CompletionHandler {
  private final Completions completions;
  private final AsyncAnalysisService asyncAnalysisService;
  private final DocumentModelService documentModelService;
  private final UriDecodeService uriDecodeService;

  @Inject
  public CompletionHandler(AsyncAnalysisService asyncAnalysisService, Completions completions, DocumentModelService documentModelService, UriDecodeService uriDecodeService) {
    this.completions = completions;
    this.asyncAnalysisService = asyncAnalysisService;
    this.documentModelService = documentModelService;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle completion LSP request.
   *
   * @param params CompletionParams.
   * @return Either List of CompletionItem, either CompletionList.
   * @throws ExecutionException   forward exception.
   * @throws InterruptedException forward exception.
   */
  public Either<List<CompletionItem>, CompletionList> completion(CompletionParams params) throws ExecutionException, InterruptedException {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    return Either.forRight(completions.collectFor(documentModelService.get(uri), params));
  }

  /**
   * Handle completion LSP request.
   * @param params CompletionParams.
   * @return LspNotification.
   */
  public LspQuery<Either<List<CompletionItem>, CompletionList>> createEvent(CompletionParams params) {
    return new CompletionQuery(params, this);
  }

  /**
   * Document highlight dependency
   * @param params
   * @return List of {@link LspEventDependency}
   */
  public List<LspEventDependency> getDocumentHighlightDependency(CompletionParams params) {
    return ImmutableList.of(
            asyncAnalysisService.createDependencyOn(
                    uriDecodeService.decode(params.getTextDocument().getUri())));
  }
}
