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

package org.eclipse.lsp.cobol.common.utils;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.UserInterruptException;

/**
 * Utility class to check if a current running thread is interrupted. Throws {@link
 * UserInterruptException} in case thread is interrupted.
 */
@UtilityClass
@Slf4j
public class ThreadInterruptionUtil {

  /**
   * Provides utility method to check if a current running thread is interrupted.
   *
   * @throws UserInterruptException in case thread is interrupted.
   */
  public void checkThreadInterrupted() {
    if (Thread.currentThread().isInterrupted()) {
      throw new UserInterruptException("Parsing interrupted by user.");
    }
  }
}
