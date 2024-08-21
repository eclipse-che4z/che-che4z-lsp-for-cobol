/*
 * Copyright (c) 2024 Broadcom.
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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.LspNotification;
import org.eclipse.lsp.cobol.lsp.handlers.workspace.DidChangeWatchedFilesHandler;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;

/** 'workspace/didChangeWatchedFiles' server event */
@Slf4j
public class DidChangeWatchedFilesNotification implements LspNotification {
  private final DidChangeWatchedFilesParams params;
  private final DidChangeWatchedFilesHandler handler;

  public DidChangeWatchedFilesNotification(
      DidChangeWatchedFilesParams params, DidChangeWatchedFilesHandler handler) {
    this.params = params;
    this.handler = handler;
  }

  @Override
  public void execute() {
    this.handler.didChangeWatchedFiles(params);
  }
}
