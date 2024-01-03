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
package org.eclipse.lsp.cobol.lsp.events.queries;

import java.util.concurrent.CompletableFuture;
import lombok.NonNull;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.ExecuteCommandHandler;
import org.eclipse.lsp4j.ExecuteCommandParams;

/**
 * Execute command handler
 */
public class ExecuteCommandQuery implements LspQuery<Object> {
  private final CompletableFuture<Object> result;
  private final @NonNull ExecuteCommandParams params;
  private final ExecuteCommandHandler executeCommandHandler;

  /**
   * workspace/executeCommand language server event
   * @param params
   * @param executeCommandHandler
   */
  public ExecuteCommandQuery(
      @NonNull ExecuteCommandParams params, ExecuteCommandHandler executeCommandHandler) {
    this.params = params;
    this.executeCommandHandler = executeCommandHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public Object query() {
    return executeCommandHandler.executeCommand(params);
  }

  @Override
  public CompletableFuture<Object> getResult() {
    return result;
  }
}
