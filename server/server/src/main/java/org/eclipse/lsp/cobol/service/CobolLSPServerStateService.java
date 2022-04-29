/*
 * Copyright (c) 2021 Broadcom.
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

import com.google.common.annotations.VisibleForTesting;

/** Manages the server shutdown states. */
public class CobolLSPServerStateService implements DisposableLSPStateService {
  private int exitCode = 1;

  /**
   * Returns the server's exitcode.
   *
   * @return Returns the server's exitcode
   */
  @Override
  public int getExitCode() {
    return this.exitCode;
  }

  /** Update shutdown status */
  public void shutdown() {
    synchronized (this) {
      this.exitCode = SHUTDOWN_EXIT_CODE;
    }
  }

  /** Revoke shutdown for testing purpose. */
  @VisibleForTesting
  public void revokeShutdown() {
    this.exitCode = 1;
  }
}
