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
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.DocumentHighlightQuery;
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
   * Document highlight dependency
   * @param documentHighlightParams
   * @return list of {@link LspEventDependency}
   */
  public List<LspEventDependency> getDocumentHighlightDependency(DocumentHighlightParams documentHighlightParams) {
    return ImmutableList.of(
            asyncAnalysisService.createDependencyOn(uriDecodeService.decode(documentHighlightParams.getTextDocument().getUri())));
  }

  /**
   * Handle documentHighlight LSP request
   *
   * @param params DocumentHighlightParams.
   * @return List of document highlights.
   */
  public List<DocumentHighlight> documentHighlight(
          DocumentHighlightParams params) {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    return occurrences.findHighlights(documentModelService.get(uri).getLastAnalysisResult(), params);
  }

  /**
   * Creates documentHighlight LSP Event
   *
   * @param params DocumentHighlightParams.
   * @return LspNotification.
   */
  public LspQuery<List<? extends DocumentHighlight>> createEvent(DocumentHighlightParams params) {
    return new DocumentHighlightQuery(params, this);
  }
}
