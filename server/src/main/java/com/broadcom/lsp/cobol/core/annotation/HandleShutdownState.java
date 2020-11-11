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

import com.broadcom.lsp.cobol.service.DisposableLanguageServer;
import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.eclipse.lsp4j.services.LanguageServer;

import java.util.concurrent.CompletableFuture;

/**
 * Intercept method call annotated with {@link CheckServerShutdownState}. Checks if server is in
 * shutdown state, if yes, it always return SHUTDOWN_RESPONSE.
 */
@Slf4j
public class HandleShutdownState implements MethodInterceptor {
  private static final String SHUTDOWN_RESPONSE = "InvalidRequest";
  private LanguageServer server;

  @Inject
  public void setServer(LanguageServer server) {
    this.server = server;
  }

  /**
   * Check if server is in shutdown state, if yes, it always return SHUTDOWN_RESPONSE. Else,
   * proceeds with actual method call.
   *
   * @param invocation {@link MethodInvocation}
   * @return a fixed string (SHUTDOWN_RESPONSE) if server is in shutdown state. Else, proceeds with
   *     actual method call.
   * @throws Throwable
   */
  @Override
  public Object invoke(MethodInvocation invocation) throws Throwable {
    if (server instanceof DisposableLanguageServer) {
      DisposableLanguageServer languageServer = (DisposableLanguageServer) server;
      if (languageServer.getExitCode() == DisposableLanguageServer.SHUTDOWN_EXIT_CODE) {
        LOG.info(invocation.getMethod().getName() + " invoked after shutdown");
        return CompletableFuture.completedFuture(SHUTDOWN_RESPONSE);
      }
    }
    return invocation.proceed();
  }
}
