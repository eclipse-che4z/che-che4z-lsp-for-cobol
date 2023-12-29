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
package org.eclipse.lsp.cobol.lsp.events.notifications;

import org.eclipse.lsp.cobol.lsp.LspNotification;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.handlers.text.DidChangeHandler;
import org.eclipse.lsp4j.DidChangeTextDocumentParams;

/** textDocument/didChange language server event */
public class DidChangeNotification implements LspNotification {
  private final DidChangeTextDocumentParams params;
  private final DidChangeHandler didChangeHandler;
  private final SourceUnitGraph.EventSource eventSource;

  public DidChangeNotification(
      DidChangeTextDocumentParams params, DidChangeHandler didChangeHandler) {
    this.params = params;
    this.didChangeHandler = didChangeHandler;
    this.eventSource = SourceUnitGraph.EventSource.IDE;
  }

  public DidChangeNotification(
      DidChangeTextDocumentParams params,
      DidChangeHandler didChangeHandler,
      SourceUnitGraph.EventSource eventSource) {
    this.params = params;
    this.didChangeHandler = didChangeHandler;
    this.eventSource = eventSource;
  }

  @Override
  public void execute() {
    didChangeHandler.didChange(params, eventSource);
  }
}
