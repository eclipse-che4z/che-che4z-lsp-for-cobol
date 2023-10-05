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
package org.eclipse.lsp.cobol.lsp.handlers.server;

import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;

/**
 * LSP Exit Handler
 */
@Slf4j
public class ExitHandler {
  private final DisposableLSPStateService disposableLSPStateService;

  @Inject
  public ExitHandler(DisposableLSPStateService disposableLSPStateService) {
    this.disposableLSPStateService = disposableLSPStateService;
  }

  /**
   * Handle exit LSP request.
   */
  public void exit() {
    int exitCode = disposableLSPStateService.getExitCode();
    LOG.info("COBOL LS server exits with code: " + exitCode);
    System.exit(exitCode);
  }
}
