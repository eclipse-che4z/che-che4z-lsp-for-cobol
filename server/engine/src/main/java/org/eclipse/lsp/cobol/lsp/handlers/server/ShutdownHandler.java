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
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.LspMessageBroker;

/**
 * LSP Shutdown Handler
 */
@Slf4j
public class ShutdownHandler {
  private final DisposableLSPStateService disposableLSPStateService;
  private final LspMessageBroker lspMessageBroker;

  @Inject
  public ShutdownHandler(DisposableLSPStateService disposableLSPStateService, LspMessageBroker lspMessageBroker) {
    this.disposableLSPStateService = disposableLSPStateService;
    this.lspMessageBroker = lspMessageBroker;
  }

  /**
   * Handle shutdown request.
   * @return ShutdownResponse.
   */
  public ShutdownResponse shutdown() {
    LOG.info("COBOL LS received shutdown request");
    try {
      disposableLSPStateService.shutdown();
      lspMessageBroker.stop();
    } catch (Exception exception) {
      return new ShutdownResponse(null, exception.getMessage());
    }
    int exitCode = disposableLSPStateService.getExitCode();
    return new ShutdownResponse(null, String.valueOf(exitCode));
  }

  /**
   * Represents the JSON RPC response structure for shutdown command as per LSP specification
   */
  @AllArgsConstructor
  public static class ShutdownResponse {
    private final String result;
    private final String error;
  }
}
