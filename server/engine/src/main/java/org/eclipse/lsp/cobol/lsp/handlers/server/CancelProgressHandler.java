/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers.server;

import com.google.inject.Inject;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;

/** LSP `window/workDoneProgress/cancel` Handler */
public class CancelProgressHandler {
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public CancelProgressHandler(AsyncAnalysisService asyncAnalysisService) {
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /**
   * Cancel analysis for the passed uri
   * @param uri
   * @throws InterruptedException
   */
  public void cancel(String uri) throws InterruptedException {
    asyncAnalysisService.cancelAnalysis(uri);
  }
}
