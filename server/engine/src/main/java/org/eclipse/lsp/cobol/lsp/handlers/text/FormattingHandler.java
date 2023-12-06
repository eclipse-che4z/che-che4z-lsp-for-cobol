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
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DocumentFormattingParams;
import org.eclipse.lsp4j.TextEdit;

import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * LSP Formatting Handler
 */
@Slf4j
public class FormattingHandler {
  private final DocumentModelService documentService;
  private final Formations formations;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public FormattingHandler(DocumentModelService documentService, Formations formations, AsyncAnalysisService asyncAnalysisService) {
    this.documentService = documentService;
    this.formations = formations;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Handle LSP formatting request.
   *
   * @param params DocumentFormattingParams.
   * @return TextEdit.
   */
  public List<? extends TextEdit> formatting(DocumentFormattingParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return formations.format(documentService.get(uri));
  }

  /**
   * Create LSP formatting event.
   *
   * @param params DocumentFormattingParams.
   * @return LspEvent.
   */
  public LspEvent<List<? extends TextEdit>> createEvent(DocumentFormattingParams params) {
    return new LspEvent<List<? extends TextEdit>>() {
      final List<LspEventDependency> lspEventDependencies = ImmutableList.of(
              asyncAnalysisService.createDependencyOn(UriHelper.decode(params.getTextDocument().getUri())));

      @Override
      public List<LspEventDependency> getDependencies() {
        return lspEventDependencies;
      }

      @Override
      public List<? extends TextEdit> execute() throws ExecutionException, InterruptedException {
        return FormattingHandler.this.formatting(params);
      }
    };
  }
}
