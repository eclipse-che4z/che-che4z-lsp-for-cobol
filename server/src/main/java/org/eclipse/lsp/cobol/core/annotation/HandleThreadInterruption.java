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
import org.aopalliance.intercept.Joinpoint;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

/**
 * Intercepts calls on an {@link ThreadInterruptAspect} on its way to the target.
 *
 * <p>NOTE: Guice dynamically creates a subclass that applies interceptors by overriding methods.
 */
@Slf4j
public class HandleThreadInterruption implements MethodInterceptor {

  /**
   * Implement this method to perform extra treatments before and after the invocation. Polite
   * implementations would certainly like to invoke {@link Joinpoint#proceed()}.
   *
   * @param invocation the method invocation joinpoint
   * @return the result of the call to {@link Joinpoint#proceed()}, might be intercepted by the
   *     interceptor.
   * @throws Throwable if the interceptors or the target-object throws an exception.
   */
  @Override
  public Object invoke(MethodInvocation invocation) throws Throwable {
    if (Thread.interrupted()) {
      LOG.debug(invocation.getMethod().getName() + " is interrupted by user");
      throw new InterruptedException("Parsing interrupted by user.");
    }
    return invocation.proceed();
  }
}
