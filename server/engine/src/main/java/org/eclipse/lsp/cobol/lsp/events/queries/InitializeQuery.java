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
import org.eclipse.lsp.cobol.lsp.handlers.server.InitializeHandler;
import org.eclipse.lsp4j.InitializeParams;
import org.eclipse.lsp4j.InitializeResult;

/**
 * initialize language server event
 */
public class InitializeQuery implements LspQuery<InitializeResult> {
  private final CompletableFuture<InitializeResult> result;
  private final @NonNull InitializeParams params;
  private final InitializeHandler initializeHandler;

  public InitializeQuery(@NonNull InitializeParams params, InitializeHandler initializeHandler) {
    this.params = params;
    this.initializeHandler = initializeHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public InitializeResult query() {
    return initializeHandler.initialize(params);
  }

  @Override
  public CompletableFuture<InitializeResult> getResult() {
    return result;
  }
}
