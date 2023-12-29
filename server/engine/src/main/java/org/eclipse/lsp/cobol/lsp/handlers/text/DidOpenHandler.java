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
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;

/**
 * LSP DidOpen Handler
 */
@Slf4j
public class DidOpenHandler {

  private final AsyncAnalysisService asyncAnalysisService;
  private final WatcherService watcherService;
  private final UriDecodeService uriDecodeService;

  @Inject
  public DidOpenHandler(AsyncAnalysisService asyncAnalysisService, WatcherService watcherService, UriDecodeService uriDecodeService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.watcherService = watcherService;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle didOpen LSP request.
   *
   * @param params didOpen parameters.
   * @param eventSource
   */
  public void didOpen(DidOpenTextDocumentParams params, SourceUnitGraph.EventSource eventSource) {
    String uri = uriDecodeService.decode(params.getTextDocument().getUri());
    if (!HandlerUtility.isUriSupported(uri)) {
      return;
    }
    watcherService.addRuntimeWatchers(uri);
    asyncAnalysisService.openDocument(uri, params.getTextDocument().getText());
    asyncAnalysisService.scheduleAnalysis(uri, params.getTextDocument().getText(), params.getTextDocument().getVersion(), true, eventSource);
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
