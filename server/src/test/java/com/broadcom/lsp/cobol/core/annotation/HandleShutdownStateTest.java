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
import org.aopalliance.intercept.MethodInvocation;
import org.eclipse.lsp4j.services.LanguageServer;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Method;
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
    MethodInvocation methodInvocation = mock(MethodInvocation.class);
    Method mockMethod = this.getClass().getMethods()[0];
    when(methodInvocation.getMethod()).thenReturn(mockMethod);
    String response =
        (String) ((CompletableFuture) handleShutdownState.invoke(methodInvocation)).get();
    assertEquals("InvalidRequest", response);
  }

  @Test
  void whenNotServerShutdown_thenInvokeProceedsToActualMethodCall() throws Throwable {
    HandleShutdownState handleShutdownState = new HandleShutdownState();
    LanguageServer server =
        mock(LanguageServer.class, withSettings().extraInterfaces(DisposableLanguageServer.class));
    handleShutdownState.setServer(server);
    when(((DisposableLanguageServer) server).getExitCode()).thenReturn(1);
    MethodInvocation methodInvocation = mock(MethodInvocation.class);
    handleShutdownState.invoke(methodInvocation);
    verify(methodInvocation).proceed();
  }

  @Test
  void whenServerNotInstanceOfDisposableLanguageServer_thenInvokeProceedsToActualMethodCall()
      throws Throwable {
    HandleShutdownState handleShutdownState = new HandleShutdownState();
    LanguageServer server = mock(LanguageServer.class);
    handleShutdownState.setServer(server);
    MethodInvocation methodInvocation = mock(MethodInvocation.class);
    handleShutdownState.invoke(methodInvocation);
    verify(methodInvocation).proceed();
  }
}
