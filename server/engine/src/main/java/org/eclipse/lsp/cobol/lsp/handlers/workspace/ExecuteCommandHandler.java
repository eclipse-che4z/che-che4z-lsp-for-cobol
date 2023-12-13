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
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.handlers.text.DirtyCacheHandlerService;
import org.eclipse.lsp.cobol.service.utils.ShutdownCheckUtil;
import org.eclipse.lsp4j.ExecuteCommandParams;

/**
 * LSP ExecuteCommand Handler.
 * Handles the resolve copybook command triggred by {@link org.eclipse.lsp.cobol.service.delegates.actions.FindCopybookCommand}
 */
@Slf4j
public class ExecuteCommandHandler {
  private final DisposableLSPStateService disposableLSPStateService;
  private final DirtyCacheHandlerService dirtyCacheHandlerService;

  @Inject
  public ExecuteCommandHandler(DisposableLSPStateService disposableLSPStateService,
                               DirtyCacheHandlerService dirtyCacheHandlerService) {
    this.disposableLSPStateService = disposableLSPStateService;
    this.dirtyCacheHandlerService = dirtyCacheHandlerService;
  }

  /**
   * Process execute command request
   * @param params ExecuteCommandParams
   * @return server state check result
   */
  public Object executeCommand(@NonNull ExecuteCommandParams params) {
    if (!disposableLSPStateService.isServerShutdown()) {
      try {
        if (ErrorCodes.MISSING_COPYBOOK.getLabel().equals(params.getCommand())) {
          rerunAnalysis();
        }
        return ShutdownCheckUtil.checkServerState(disposableLSPStateService).get();
      } catch (Exception e) {
        LOG.error("Cannot execute command " + params.getCommand() + ": " + params, e);
      }
    }
    return null;
  }

  private void rerunAnalysis() {
    dirtyCacheHandlerService.handleDirtyCache();
  }
}
