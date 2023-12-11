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

import org.eclipse.lsp.cobol.common.UserInterruptException;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/** This tests the logic of {@link ThreadInterruptionUtil} */
class ThreadInterruptionUtilTest {

  @Test
  void whenThreadNotInterruptedDoNothing() {
    Assertions.assertDoesNotThrow(ThreadInterruptionUtil::checkThreadInterrupted);
  }

  @Test
  void whenThreadInterruptedThrowException() {
    Assertions.assertThrows(
        UserInterruptException.class,
        () -> {
          Thread.currentThread().interrupt();
          ThreadInterruptionUtil.checkThreadInterrupted();
        });
  }
}
