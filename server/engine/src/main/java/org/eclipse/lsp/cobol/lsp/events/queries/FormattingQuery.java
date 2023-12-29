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
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.FormattingHandler;
import org.eclipse.lsp4j.DocumentFormattingParams;
import org.eclipse.lsp4j.TextEdit;

/**
 * `textDocument/formatting`  language server event
 */
public class FormattingQuery implements LspQuery<List<? extends TextEdit>> {
  final CompletableFuture<List<? extends TextEdit>> result;
  private final DocumentFormattingParams params;
  private final FormattingHandler formattingHandler;

  public FormattingQuery(DocumentFormattingParams params, FormattingHandler formattingHandler) {
    this.params = params;
    this.formattingHandler = formattingHandler;
    result = new CompletableFuture<>();
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return formattingHandler.getDependencies(params);
  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> getResult() {
    return result;
  }

  @Override
  public List<? extends TextEdit> query() {
    return formattingHandler.formatting(params);
  }
}
