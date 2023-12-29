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
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.server.ShutdownHandler;

/**
 * ‘shutdown’ language server event
 */
public class ShutdownQuery implements LspQuery<Object> {
  private final CompletableFuture<Object> result = new CompletableFuture<>();
  private final ShutdownHandler shutdownHandler;

  public ShutdownQuery(ShutdownHandler shutdownHandler) {
    this.shutdownHandler = shutdownHandler;
  }

  @Override
  public Object query() {
    return shutdownHandler.shutdown();
  }

  @Override
  public CompletableFuture<Object> getResult() {
    return result;
  }
}
