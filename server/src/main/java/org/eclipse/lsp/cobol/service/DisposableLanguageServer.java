/*
 * Copyright (c) 2020 Broadcom.
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

package org.eclipse.lsp.cobol.service;

/**
 * Contract for the server which can have multiple running state. And an exit code would determine
 * the actual status of server.
 */
public interface DisposableLanguageServer {
  int SHUTDOWN_EXIT_CODE = 0;

  /**
   * Return an int, which determine the current state of a server.
   *
   * @return int
   */
  int getExitCode();
}
