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

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.HoverHandler;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.HoverParams;

/**
 * `textDocument/hover` language server event
 */
public class HoverLspQuery implements LspQuery<Hover> {
  final CompletableFuture<Hover> result;
  private final HoverParams params;
  private final HoverHandler hoverHandler;

  public HoverLspQuery(HoverParams params, HoverHandler hoverHandler) {
    this.params = params;
    this.hoverHandler = hoverHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return hoverHandler.getDependencies(params);
  }

  @Override
  public CompletableFuture<Hover> getResult() {
    return result;
  }

  @Override
  public Hover query() throws ExecutionException, InterruptedException {
    return hoverHandler.hover(params);
  }
}
