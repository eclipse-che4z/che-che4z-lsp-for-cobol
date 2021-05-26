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

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.eclipse.lsp.cobol.service.DisposableLanguageServer;
import org.eclipse.lsp4j.services.LanguageServer;
import org.junit.jupiter.api.Test;

import java.util.concurrent.CompletableFuture;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

/** Tests {@link HandleShutdownState} */
class HandleShutdownStateTest {

  @Test
  void whenServerShutdown_thenInvokeReturnSameMessage() throws Throwable {
    HandleShutdownState handleShutdownState = new HandleShutdownState();
    LanguageServer server =
        mock(LanguageServer.class, withSettings().extraInterfaces(DisposableLanguageServer.class));
    handleShutdownState.setServer(server);
    when(((DisposableLanguageServer) server).getExitCode()).thenReturn(0);
    ProceedingJoinPoint mockPJP = mock(ProceedingJoinPoint.class);
    MethodSignature mockMethodSignature = mock(MethodSignature.class);

    when(mockMethodSignature.getMethod())
        .thenReturn(this.getClass().getMethods()[0]);
    when(mockPJP.getSignature()).thenReturn(mockMethodSignature);
    handleShutdownState.aroundAdvice(mockPJP);
    String response =
            (String) ((CompletableFuture<Object>) handleShutdownState.aroundAdvice(mockPJP)).get();
    assertEquals("InvalidRequest", response);
  }

  @Test
  void whenNotServerShutdown_thenInvokeProceedsToActualMethodCall() throws Throwable {
    HandleShutdownState handleShutdownState = new HandleShutdownState();
    LanguageServer server =
        mock(LanguageServer.class, withSettings().extraInterfaces(DisposableLanguageServer.class));
    handleShutdownState.setServer(server);
    when(((DisposableLanguageServer) server).getExitCode()).thenReturn(1);
    ProceedingJoinPoint mockPJP = mock(ProceedingJoinPoint.class);
    handleShutdownState.aroundAdvice(mockPJP);
    verify(mockPJP).proceed();
  }

  @Test
  void whenServerNotInstanceOfDisposableLanguageServer_thenInvokeProceedsToActualMethodCall()
      throws Throwable {
    HandleShutdownState handleShutdownState = new HandleShutdownState();
    LanguageServer server = mock(LanguageServer.class);
    handleShutdownState.setServer(server);
    ProceedingJoinPoint mockPJP = mock(ProceedingJoinPoint.class);
    handleShutdownState.aroundAdvice(mockPJP);
    verify(mockPJP).proceed();
  }
}
