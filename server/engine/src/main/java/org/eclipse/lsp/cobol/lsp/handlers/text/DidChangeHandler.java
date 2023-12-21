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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.handlers.HandlerUtility;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.DidChangeTextDocumentParams;

/**
 * LSP DidChange Handler
 */
@Slf4j
public class DidChangeHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final UriDecodeService uriDecodeService;

  @Inject
  public DidChangeHandler(AsyncAnalysisService asyncAnalysisService, UriDecodeService uriDecodeService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle LSP didChange event.
   * @param params DidChangeTextDocumentParams.
   */
  public void didChange(DidChangeTextDocumentParams params) {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    if (!HandlerUtility.isUriSupported(uri)) {
      return;
    }
    String text = params.getContentChanges().get(0).getText();
    asyncAnalysisService.scheduleAnalysis(uri, text, params.getTextDocument().getVersion(), false);
  }
}
