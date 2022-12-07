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

package org.eclipse.lsp.cobol.common;

/** {@link RuntimeException} thrown when user interrupts an document analysis. */
public class UserInterruptException extends RuntimeException {
  public UserInterruptException() {}

  public UserInterruptException(String message) {
    super(message);
  }

  public UserInterruptException(String message, Throwable cause) {
    super(message, cause);
  }

  public UserInterruptException(Throwable cause) {
    super(cause);
  }

  public UserInterruptException(
      String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }
}
