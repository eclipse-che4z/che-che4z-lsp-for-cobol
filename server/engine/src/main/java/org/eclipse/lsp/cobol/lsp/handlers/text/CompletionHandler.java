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
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * LSP Completion Handler
 */
@Slf4j
public class CompletionHandler {
  private final Completions completions;
  private final AsyncAnalysisService asyncAnalysisService;
  private final DocumentModelService documentModelService;

  @Inject
  public CompletionHandler(AsyncAnalysisService asyncAnalysisService, Completions completions, DocumentModelService documentModelService) {
    this.completions = completions;
    this.asyncAnalysisService = asyncAnalysisService;
    this.documentModelService = documentModelService;
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
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return Either.forRight(completions.collectFor(documentModelService.get(uri), params));
  }

  /**
   * Handle completion LSP request.
   * @param params CompletionParams.
   * @return LspEvent.
   */
  public LspEvent<Either<List<CompletionItem>, CompletionList>> createEvent(CompletionParams params) {
    return new LspEvent<Either<List<CompletionItem>, CompletionList>>() {
      @Override
      public List<LspEventDependency> getDependencies() {
        return ImmutableList.of(asyncAnalysisService.createDependencyOn(UriHelper.decode(params.getTextDocument().getUri())));
      }

      @Override
      public Either<List<CompletionItem>, CompletionList> execute() throws ExecutionException, InterruptedException {
        return completion(params);
      }
    };
  }
}
