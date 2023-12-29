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
import org.eclipse.lsp.cobol.lsp.handlers.workspace.DidChangeConfigurationHandler;
import org.eclipse.lsp4j.DidChangeConfigurationParams;

/** `workspace/didChangeConfiguration` language server event*/
public class ConfigurationChangeNotification implements LspNotification {
  private final DidChangeConfigurationParams params;
  private final DidChangeConfigurationHandler didChangeConfigurationHandler;

  public ConfigurationChangeNotification(
      DidChangeConfigurationParams params,
      DidChangeConfigurationHandler didChangeConfigurationHandler) {
    this.params = params;
    this.didChangeConfigurationHandler = didChangeConfigurationHandler;
  }

  @Override
  public void execute() {
    didChangeConfigurationHandler.didChangeConfiguration(params);
  }
}
