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
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.LspEvent;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp4j.DocumentHighlight;
import org.eclipse.lsp4j.DocumentHighlightParams;

/**
 * LSP DocumentHighlight Handler
 */
public class DocumentHighlightHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final Occurrences occurrences;
  private final DocumentModelService documentModelService;
  private final UriDecodeService uriDecodeService;

  @Inject
  public DocumentHighlightHandler(AsyncAnalysisService asyncAnalysisService, Occurrences occurrences, DocumentModelService documentModelService, UriDecodeService uriDecodeService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.occurrences = occurrences;
    this.documentModelService = documentModelService;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle documentHighlight LSP request
   *
   * @param params DocumentHighlightParams.
   * @return List of document highlights.
   * @throws ExecutionException   forward exception.
   * @throws InterruptedException forward exception.
   */
  public List<DocumentHighlight> documentHighlight(
          DocumentHighlightParams params) throws ExecutionException, InterruptedException {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    return occurrences.findHighlights(documentModelService.get(uri).getLastAnalysisResult(), params);
  }

  /**
   * Creates documentHighlight LSP Event
   *
   * @param params DocumentHighlightParams.
   * @return LspEvent.
   */
  public LspEvent<List<? extends DocumentHighlight>> createEvent(DocumentHighlightParams params) {
    return new LspEvent<List<? extends DocumentHighlight>>() {
      final List<LspEventDependency> lspEventDependencies = ImmutableList.of(
              asyncAnalysisService.createDependencyOn(uriDecodeService.decode(params.getTextDocument().getUri())));

      @Override
      public List<LspEventDependency> getDependencies() {
        return lspEventDependencies;
      }

      @Override
      public List<? extends DocumentHighlight> execute() throws ExecutionException, InterruptedException {
        return DocumentHighlightHandler.this.documentHighlight(params);
      }
    };
  }
}
