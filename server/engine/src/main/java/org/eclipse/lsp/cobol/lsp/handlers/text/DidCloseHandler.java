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
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.DidCloseTextDocumentParams;

import java.util.Collections;

import static java.lang.String.format;

/**
 * LSP DidClose Handler
 */
@Slf4j
public class DidCloseHandler {
  private final DisposableLSPStateService disposableLSPStateService;
  private final AsyncAnalysisService asyncAnalysisService;
  private final WatcherService watcherService;
  private final Communications communications;

  @Inject
  public DidCloseHandler(DisposableLSPStateService disposableLSPStateService,
                         AsyncAnalysisService asyncAnalysisService, WatcherService watcherService, Communications communications) {
    this.disposableLSPStateService = disposableLSPStateService;
    this.asyncAnalysisService = asyncAnalysisService;
    this.watcherService = watcherService;
    this.communications = communications;
  }

  /**
   * Handle LSP didClose request.
   * @param params DidCloseTextDocumentParams.
   */
  public void didClose(DidCloseTextDocumentParams params) {
    if (disposableLSPStateService.isServerShutdown()) {
      return;
    }
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    LOG.info(format("Document closing invoked on URI %s", uri));
    communications.publishDiagnostics(Collections.singletonMap(uri, Collections.emptyList()));
    asyncAnalysisService.cancelAnalysis(uri);
    watcherService.removeRuntimeWatchers(uri);
  }
}
