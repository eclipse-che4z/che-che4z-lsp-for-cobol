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
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.HoverParams;

import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * LSP Hover Handler
 */
@Slf4j
public class HoverHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final HoverProvider hoverProvider;
  private final DocumentModelService documentModelService;

  @Inject
  public HoverHandler(AsyncAnalysisService asyncAnalysisService, HoverProvider hoverProvider, DocumentModelService documentModelService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.hoverProvider = hoverProvider;
    this.documentModelService = documentModelService;
  }

  /**
   * Handle LSP hover request.
   *
   * @param params HoverParams.
   * @return Hover data.
   * @throws ExecutionException   forward exception.
   * @throws InterruptedException forward exception.
   */
  public Hover hover(HoverParams params) throws ExecutionException, InterruptedException {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return hoverProvider.getHover(documentModelService.get(uri), params);
  }

  /**
   * Create LSP hover event.
   *
   * @param params HoverParams.
   * @return LspEvent.
   */
  public LspEvent<Hover> createEvent(HoverParams params) {
    final List<LspEventDependency> lspEventDependencies = ImmutableList.of(
            asyncAnalysisService.createDependencyOn(UriHelper.decode(params.getTextDocument().getUri())));
    return new LspEvent<Hover>() {
      @Override
      public List<LspEventDependency> getDependencies() {
        return lspEventDependencies;
      }

      @Override
      public Hover execute() throws ExecutionException, InterruptedException {
        return HoverHandler.this.hover(params);
      }
    };
  }
}
