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
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DefinitionParams;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.LocationLink;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * LSP Definition Handler
 */
public class DefinitionHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final Occurrences occurrences;

  @Inject
  public DefinitionHandler(AsyncAnalysisService asyncAnalysisService, Occurrences occurrences) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.occurrences = occurrences;
  }

  /**
   * Handle definition LSP }request.
   * @param params DefinitionParams.
   * @return Either list of locations or list of location links.
   * @throws ExecutionException forward exception.
   * @throws InterruptedException forward exception.
   */
  public Either<List<? extends Location>, List<? extends LocationLink>> definition(DefinitionParams params) throws ExecutionException, InterruptedException {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Optional<CompletableFuture<CobolDocumentModel>> optional = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(uri);
    if (!optional.isPresent()) {
      return Either.forLeft(Collections.emptyList());
    }
    CobolDocumentModel doc = optional.get().get();
    List<Location> definitions = occurrences.findDefinitions(doc, params);
    return Either.forLeft(definitions);
  }
}
