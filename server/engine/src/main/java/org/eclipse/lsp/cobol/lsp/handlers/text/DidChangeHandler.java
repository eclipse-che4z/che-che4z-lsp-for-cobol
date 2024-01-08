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
import org.eclipse.lsp.cobol.lsp.WorkspaceDocumentGraph;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.handlers.HandlerUtility;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DidChangeTextDocumentParams;

/**
 * LSP DidChange Handler
 */
@Slf4j
public class DidChangeHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final WorkspaceDocumentGraph workspaceDocumentGraph;
  private final UriDecodeService uriDecodeService;

  @Inject
  public DidChangeHandler(
      AsyncAnalysisService asyncAnalysisService, WorkspaceDocumentGraph workspaceDocumentGraph, UriDecodeService uriDecodeService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.workspaceDocumentGraph = workspaceDocumentGraph;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle LSP didChange event.
   *
   * @param params DidChangeTextDocumentParams.
   * @param eventSource
   */
  public void didChange(
      DidChangeTextDocumentParams params, WorkspaceDocumentGraph.EventSource eventSource) {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    if (!HandlerUtility.isUriSupported(uri)) {
      return;
    }
    String text = params.getContentChanges().get(0).getText();
    if (workspaceDocumentGraph.isCopybook(uri)) {
      workspaceDocumentGraph.updateContent(uri, text);
      List<String> allAssociatedFilesForACopybook = workspaceDocumentGraph.getAllAssociatedFilesForACopybook(uri);
      asyncAnalysisService.reanalyseCopybooksAssociatedPrograms(allAssociatedFilesForACopybook, uri, text, WorkspaceDocumentGraph.EventSource.IDE);
      return;
    }
    asyncAnalysisService.scheduleAnalysis(
        uri, text, params.getTextDocument().getVersion(), false, eventSource);
  }
}
