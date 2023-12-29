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
import org.eclipse.lsp.cobol.lsp.handlers.text.DefinitionHandler;
import org.eclipse.lsp4j.DefinitionParams;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.LocationLink;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * textDocument/definition Langauge server event
 */
public class DefinitionQuery
    implements LspQuery<Either<List<? extends Location>, List<? extends LocationLink>>> {
  private final DefinitionParams params;
  private final DefinitionHandler definitionHandler;
  private CompletableFuture<Either<List<? extends Location>, List<? extends LocationLink>>> result;

  public DefinitionQuery(DefinitionParams params, DefinitionHandler definitionHandler) {
    this.params = params;
    this.definitionHandler = definitionHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return definitionHandler.getDefinitionEventDependencies(params);
  }

  @Override
  public CompletableFuture<Either<List<? extends Location>, List<? extends LocationLink>>>
      getResult() {
    return result;
  }

  @Override
  public Either<List<? extends Location>, List<? extends LocationLink>> query()
      throws ExecutionException, InterruptedException {
    return definitionHandler.definition(params);
  }
}
