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

import lombok.SneakyThrows;
import org.eclipse.lsp.cobol.lsp.LspNotification;
import org.eclipse.lsp.cobol.lsp.handlers.server.CancelProgressHandler;

/** `window/workDoneProgress/cancel` language server event */
public class CancelProgressNotification implements LspNotification {
  private final String uri;
  private final CancelProgressHandler cancelProgressHandler;

  public CancelProgressNotification(String uri, CancelProgressHandler cancelProgressHandler) {
    this.uri = uri;
    this.cancelProgressHandler = cancelProgressHandler;
  }

  @SneakyThrows
  @Override
  public void execute() {
    this.cancelProgressHandler.cancel(uri);
  }
}
