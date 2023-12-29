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
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.CodeActionHandler;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * Code Action Language Server event
 */
public class CodeActionQuery implements LspQuery<List<Either<Command, CodeAction>>> {
  final CompletableFuture<List<Either<Command, CodeAction>>> result;
  private final CodeActionParams params;
  private final CodeActionHandler codeActionHandler;

  public CodeActionQuery(
      CodeActionParams params,
      CodeActionHandler codeActionHandler) {
    this.params = params;
    this.codeActionHandler = codeActionHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public List<Either<Command, CodeAction>> query() {
    return codeActionHandler.codeAction(params);
  }

  @Override
  public CompletableFuture<List<Either<Command, CodeAction>>> getResult() {
    return result;
  }
}
