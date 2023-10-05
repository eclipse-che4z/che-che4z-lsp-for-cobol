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
import org.eclipse.lsp4j.DocumentHighlight;
import org.eclipse.lsp4j.DocumentHighlightParams;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * LSP DocumentHighlight Handler
 */
public class DocumentHighlightHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final Occurrences occurrences;

  @Inject
  public DocumentHighlightHandler(AsyncAnalysisService asyncAnalysisService, Occurrences occurrences) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.occurrences = occurrences;
  }

  /**
   * Handle documentHighlight LSP request
   * @param params DocumentHighlightParams.
   * @return List of document highlights.
   * @throws ExecutionException forward exception.
   * @throws InterruptedException forward exception.
   */
  public List<DocumentHighlight> documentHighlight(
          DocumentHighlightParams params) throws ExecutionException, InterruptedException {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Optional<CompletableFuture<CobolDocumentModel>> optional = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(uri);
    if (!optional.isPresent()) {
      return Collections.emptyList();
    }
    CobolDocumentModel doc = optional.get().get();
    return occurrences.findHighlights(doc.getAnalysisResult(), params);
  }
}
