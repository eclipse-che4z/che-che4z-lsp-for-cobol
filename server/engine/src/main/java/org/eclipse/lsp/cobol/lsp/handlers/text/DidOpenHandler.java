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
import org.eclipse.lsp.cobol.lsp.LspNotification;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.notifications.DidOpenNotification;
import org.eclipse.lsp.cobol.lsp.handlers.HandlerUtility;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;

/** LSP DidOpen Handler */
@Slf4j
public class DidOpenHandler {

  private final AsyncAnalysisService asyncAnalysisService;
  private final SourceUnitGraph sourceUnitGraph;

  @Inject
  public DidOpenHandler(
      AsyncAnalysisService asyncAnalysisService, SourceUnitGraph sourceUnitGraph) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.sourceUnitGraph = sourceUnitGraph;
  }

  /**
   * Handle didOpen LSP request.
   *
   * @param params didOpen parameters.
   */
  public void didOpen(DidOpenTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    if (!HandlerUtility.isUriSupported(uri)) {
      return;
    }
    final CobolDocumentModel model =
        asyncAnalysisService.openDocument(
            uri, params.getTextDocument().getText(), params.getTextDocument().getLanguageId());

    if (this.asyncAnalysisService.isCopybook(uri, params.getTextDocument().getText())
        || this.sourceUnitGraph.isUserSuppliedCopybook(uri)) {
      asyncAnalysisService.republishDiagnostics();
      return;
    }

    asyncAnalysisService.scheduleAnalysis(
        model, params.getTextDocument().getVersion(), true, false);
  }

  /**
   * Creates didOpen LSP Event
   *
   * @param params DidOpenTextDocumentParams.
   * @return LspNotification.
   */
  public LspNotification createEvent(DidOpenTextDocumentParams params) {
    return new DidOpenNotification(params, this);
  }
}
