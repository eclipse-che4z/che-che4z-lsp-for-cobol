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
import org.eclipse.lsp.cobol.lsp.handlers.text.DidOpenHandler;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;

/**
 * textDocument/didOpen language server event
 */
public class DidOpenNotification implements LspNotification {
  private final DidOpenTextDocumentParams params;
  private final DidOpenHandler didOpenHandler;

  public DidOpenNotification(DidOpenTextDocumentParams params, DidOpenHandler didOpenHandler) {
    this.params = params;
    this.didOpenHandler = didOpenHandler;
  }

  @Override
  public void execute() {
    didOpenHandler.didOpen(params, SourceUnitGraph.EventSource.IDE);
  }
}
