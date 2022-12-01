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

package org.eclipse.lsp.cobol.lsp;

import com.google.common.annotations.VisibleForTesting;

/**
 * Contract for the server which can have multiple running state. And an exit code would determine
 * the actual status of server.
 */
public interface DisposableLSPStateService {
  int SHUTDOWN_EXIT_CODE = 0;

  /**
   * Return an int, which determine the current state of a server.
   *
   * @return int
   */
  int getExitCode();

  /** Signals the server to shut down by updating the server state to SHUTDOWN_EXIT_CODE */
  void shutdown();

  /** Revoke shutdown for testing purpose. */
  @VisibleForTesting
  void revokeShutdown();

  default boolean isServerShutdown() {
    return this.getExitCode() == DisposableLSPStateService.SHUTDOWN_EXIT_CODE;
  }
}
