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
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.handlers.HandlerUtility;
import org.eclipse.lsp4j.DidChangeTextDocumentParams;

/**
 * LSP DidChange Handler
 */
@Slf4j
public class DidChangeHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final SourceUnitGraph sourceUnitGraph;

  @Inject
  public DidChangeHandler(
          AsyncAnalysisService asyncAnalysisService, SourceUnitGraph sourceUnitGraph) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.sourceUnitGraph = sourceUnitGraph;
  }

  /**
   * Handle LSP didChange event.
   *
   * @param params DidChangeTextDocumentParams.
   * @param eventSource
   */
  public void didChange(
      DidChangeTextDocumentParams params, SourceUnitGraph.EventSource eventSource) {
    Uri uri = Uri.fromLsp(params.getTextDocument().getUri());
    if (!HandlerUtility.isUriSupported(uri)) {
      return;
    }
    String text = params.getContentChanges().get(0).getText();
    if (sourceUnitGraph.isUserSuppliedCopybook(uri)) {
      sourceUnitGraph.updateContent(uri, text);
      List<Uri> allAssociatedFilesForACopybook = sourceUnitGraph.getAllAssociatedFilesForACopybook(uri);
      asyncAnalysisService.reanalyseCopybooksAssociatedPrograms(allAssociatedFilesForACopybook, uri, text, SourceUnitGraph.EventSource.IDE);
      return;
    }
    asyncAnalysisService.scheduleAnalysis(
        uri, text, params.getTextDocument().getVersion(), false, eventSource);
  }
}
