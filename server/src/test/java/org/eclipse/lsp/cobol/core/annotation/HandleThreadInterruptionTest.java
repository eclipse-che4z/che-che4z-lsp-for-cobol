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
package org.eclipse.lsp.cobol.core.annotation;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Tests {@link org.eclipse.lsp.cobol.core.annotation.HandleThreadInterruption} */
class HandleThreadInterruptionTest {

  @Test
  void whenThreadIsNotInterrupted_thenNoExceptionIsThrown() {
    HandleThreadInterruption handleThreadInterruption = new HandleThreadInterruption();
      JoinPoint mockJoinPoint = mock(JoinPoint.class);
    Assertions.assertDoesNotThrow(() -> handleThreadInterruption.beforeAdvice(mockJoinPoint));
  }

  @Test
  void whenThreadIsInterrupted_ParseExceptionIsThrown() {
    HandleThreadInterruption handleThreadInterruption = new HandleThreadInterruption();
    JoinPoint mockJoinPoint = mock(JoinPoint.class);
    Signature mockSignature = mock(MethodSignature.class);
    when(mockSignature.getName()).thenReturn("DUMMY");
    when(mockJoinPoint.getSignature()).thenReturn(mockSignature);
    Thread.currentThread().interrupt();
    Assertions.assertThrows(
        InterruptedException.class, () -> handleThreadInterruption.beforeAdvice(mockJoinPoint));
  }
}
