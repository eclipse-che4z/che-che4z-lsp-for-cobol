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
import org.eclipse.lsp.cobol.lsp.handlers.text.ReferencesHandler;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.ReferenceParams;

/**
 * `textDocument/references` language server event
 */
public class ReferenceQuery implements LspQuery<List<? extends Location>> {

  final CompletableFuture<List<? extends Location>> result;
  private final ReferenceParams params;
  private final ReferencesHandler referencesHandler;

  public ReferenceQuery(ReferenceParams params, ReferencesHandler referencesHandler) {
    this.params = params;
    this.referencesHandler = referencesHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return referencesHandler.getReferenceDependency(params);
  }

  @Override
  public CompletableFuture<List<? extends Location>> getResult() {
    return result;
  }

  @Override
  public List<? extends Location> query() throws ExecutionException, InterruptedException {
    return this.referencesHandler.references(params);
  }
}
