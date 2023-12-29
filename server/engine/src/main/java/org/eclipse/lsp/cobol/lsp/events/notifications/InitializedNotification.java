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
import org.eclipse.lsp.cobol.lsp.handlers.server.InitializedHandler;
import org.eclipse.lsp4j.InitializedParams;

/**
 * initialized language server notification
 */
public class InitializedNotification implements LspNotification {
  private final InitializedParams params;
  private final InitializedHandler initializedHandler;

  public InitializedNotification(InitializedParams params, InitializedHandler initializedHandler) {
    this.params = params;
    this.initializedHandler = initializedHandler;
  }

  @Override
  public void execute() {
    initializedHandler.initialized(params);
  }
}
