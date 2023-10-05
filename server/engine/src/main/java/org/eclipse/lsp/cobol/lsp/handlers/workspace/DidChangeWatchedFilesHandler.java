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
package org.eclipse.lsp.cobol.lsp.handlers.workspace;

import com.google.inject.Inject;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;

/**
 * LSP DidChangeWatchedFiles Handler
 */
@Slf4j
public class DidChangeWatchedFilesHandler {
  private final DisposableLSPStateService disposableLSPStateService;
  private final CopybookNameService copybookNameService;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public DidChangeWatchedFilesHandler(DisposableLSPStateService disposableLSPStateService,
                                      CopybookNameService copybookNameService, AsyncAnalysisService asyncAnalysisService) {
    this.disposableLSPStateService = disposableLSPStateService;
    this.copybookNameService = copybookNameService;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Handle didChangeWatchedFiles LSP event.
   * @param params DidChangeWatchedFilesParams
   */
  public void didChangeWatchedFiles(@NonNull DidChangeWatchedFilesParams params) {
    if (disposableLSPStateService.isServerShutdown()) return;
    copybookNameService.collectLocalCopybookNames();
    asyncAnalysisService.reanalyseOpenedPrograms();
  }
}
