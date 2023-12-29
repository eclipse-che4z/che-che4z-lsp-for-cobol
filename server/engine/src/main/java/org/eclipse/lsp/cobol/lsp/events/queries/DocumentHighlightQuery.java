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
import org.eclipse.lsp.cobol.lsp.handlers.text.DocumentHighlightHandler;
import org.eclipse.lsp4j.DocumentHighlight;
import org.eclipse.lsp4j.DocumentHighlightParams;

/**
 * `textDocument/documentHighlight` Language server event
 */
public class DocumentHighlightQuery implements LspQuery<List<? extends DocumentHighlight>> {
  final CompletableFuture<List<? extends DocumentHighlight>> result;
  private final DocumentHighlightParams params;
  private final DocumentHighlightHandler documentHighlightHandler;

  public DocumentHighlightQuery(
      DocumentHighlightParams params, DocumentHighlightHandler documentHighlightHandler) {
    this.params = params;
    result = new CompletableFuture<>();
    this.documentHighlightHandler = documentHighlightHandler;
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return documentHighlightHandler.getDocumentHighlightDependency(params);
  }

  @Override
  public CompletableFuture<List<? extends DocumentHighlight>> getResult() {
    return result;
  }

  @Override
  public List<? extends DocumentHighlight> query() {
    return this.documentHighlightHandler.documentHighlight(params);
  }
}
