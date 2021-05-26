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

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;

/** Intercepts calls on an {@link CheckThreadInterruption} annotation on its way to the target. */
@Slf4j
@Aspect
public class HandleThreadInterruption {

  /**
   * Implement this method to perform extra treatments before the invocation. Checks for the thread
   * interruption and throws an {@link InterruptedException} in case current thread is interrupted.
   * Else proceed normally.
   *
   * @param joinPoint joinPoint for aspect
   * @throws Throwable if the interceptors or the target-object throws an exception.
   */
  @Before("@annotation(CheckThreadInterruption) && execution(* *(..))")
  public void beforeAdvice(JoinPoint joinPoint) throws Throwable {
    if (Thread.interrupted()) {
      MethodSignature signature = (MethodSignature) joinPoint.getSignature();
      LOG.debug(signature.getName() + " is interrupted by user");
      throw new InterruptedException("Parsing interrupted by user.");
    }
  }
}
