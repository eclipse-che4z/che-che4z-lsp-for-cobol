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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.FormattingQuery;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp4j.DocumentFormattingParams;
import org.eclipse.lsp4j.TextEdit;

/**
 * LSP Formatting Handler
 */
@Slf4j
public class FormattingHandler {
  private final DocumentModelService documentService;
  private final Formations formations;
  private final AsyncAnalysisService asyncAnalysisService;
  private final UriDecodeService uriDecodeService;

  @Inject
  public FormattingHandler(DocumentModelService documentService, Formations formations, AsyncAnalysisService asyncAnalysisService, UriDecodeService uriDecodeService) {
    this.documentService = documentService;
    this.formations = formations;
    this.asyncAnalysisService = asyncAnalysisService;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle LSP formatting request.
   *
   * @param params DocumentFormattingParams.
   * @return TextEdit.
   */
  public List<? extends TextEdit> formatting(DocumentFormattingParams params) {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    return formations.format(documentService.get(uri));
  }

  /**
   * Create LSP formatting event.
   *
   * @param params DocumentFormattingParams.
   * @return LspNotification.
   */
  public LspQuery<List<? extends TextEdit>> createEvent(DocumentFormattingParams params) {
    return new FormattingQuery(params, this);
  }

  /**
   * Get dependency for this handler
   * @param params
   * @return list of {@link LspEventDependency
   */
  public List<LspEventDependency> getDependencies(DocumentFormattingParams params) {
    return ImmutableList.of(
            asyncAnalysisService.createDependencyOn(uriDecodeService.decode(params.getTextDocument().getUri())));
  }
}
