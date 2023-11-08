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
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;

/**
 * LSP DidOpen Handler
 */
@Slf4j
public class DidOpenHandler {

  private final AsyncAnalysisService asyncAnalysisService;
  private final WatcherService watcherService;

  @Inject
  public DidOpenHandler(AsyncAnalysisService asyncAnalysisService, WatcherService watcherService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.watcherService = watcherService;
  }

  /**
   * Handle didOpen LSP request.
   * @param params didOpen parameters.
   */
  public void didOpen(DidOpenTextDocumentParams params) {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    if (!HandlerUtility.isUriSupported(uri)) {
      return;
    }
    watcherService.addRuntimeWatchers(uri);
    asyncAnalysisService.scheduleAnalysis(uri, params.getTextDocument().getText(), params.getTextDocument().getVersion(), true);
  }
}
