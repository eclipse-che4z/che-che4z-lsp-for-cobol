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

import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.eclipse.lsp.cobol.service.DisposableLanguageServer;
import org.eclipse.lsp4j.services.LanguageServer;

import java.util.concurrent.CompletableFuture;

/**
 * Intercept method call annotated with {@link CheckServerShutdownState}. Checks if server is in
 * shutdown state, if yes, it always return SHUTDOWN_RESPONSE.
 */
@Slf4j
@Aspect
public class HandleShutdownState {
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
   * @param joinPoint {@link ProceedingJoinPoint}
   * @return a fixed string (SHUTDOWN_RESPONSE) if server is in shutdown state. Else, proceeds with
   *     actual method call.
   * @throws Throwable
   */
  @Around("@annotation(CheckServerShutdownState) && execution(* *(..))")
  public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
    if (server instanceof DisposableLanguageServer) {
      DisposableLanguageServer languageServer = (DisposableLanguageServer) server;
      if (languageServer.getExitCode() == DisposableLanguageServer.SHUTDOWN_EXIT_CODE) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        LOG.info(signature.getMethod().getName() + " invoked after shutdown");
        return CompletableFuture.completedFuture(SHUTDOWN_RESPONSE);
      }
    }
    return joinPoint.proceed();
  }
}
