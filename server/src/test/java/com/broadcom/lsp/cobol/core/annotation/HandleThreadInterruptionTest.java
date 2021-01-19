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
package com.broadcom.lsp.cobol.core.annotation;

import org.aopalliance.intercept.MethodInvocation;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Method;

import static org.mockito.Mockito.*;

/** Tests {@link com.broadcom.lsp.cobol.core.annotation.HandleThreadInterruption} */
class HandleThreadInterruptionTest {

  @Test
  void whenThreadIsNotInterrupted_thenMethodInvocationProceeds() throws Throwable {
    HandleThreadInterruption handleThreadInterruption = new HandleThreadInterruption();
    MethodInvocation methodInvocation = mock(MethodInvocation.class);
    handleThreadInterruption.invoke(methodInvocation);
    verify(methodInvocation).proceed();
  }

  @Test
  void whenThreadIsInterrupted_ParseExceptionIsThrown() {
    HandleThreadInterruption handleThreadInterruption = new HandleThreadInterruption();
    MethodInvocation methodInvocation = mock(MethodInvocation.class);
    Method mockMethod = this.getClass().getMethods()[0];
    when(methodInvocation.getMethod()).thenReturn(mockMethod);
    Thread.currentThread().interrupt();
    Assertions.assertThrows(
        InterruptedException.class, () -> handleThreadInterruption.invoke(methodInvocation));
  }
}
