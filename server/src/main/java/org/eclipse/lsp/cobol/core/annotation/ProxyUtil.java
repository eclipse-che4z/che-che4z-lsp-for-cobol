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

package org.eclipse.lsp.cobol.core.annotation;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import net.sf.cglib.proxy.Callback;
import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import org.eclipse.lsp.cobol.service.DisposableLanguageServer;
import org.eclipse.lsp4j.services.LanguageServer;

import java.util.concurrent.CompletableFuture;

/**
 * Utility class to provide CGLIB proxy to handle @{@link CheckServerShutdownState} and @{@link
 * CheckThreadInterruption}
 */
@UtilityClass
@Slf4j
public class ProxyUtil {
  private final String shutdownResponse = "InvalidRequest";

  /**
   * Gives CGLIB proxy to handle {@link CheckThreadInterruption} for the passed object details.
   *
   * @param classType proxy object type
   * @param argTypes constructor signature
   * @param constructorArgs compatible wrapped arguments to pass to constructor
   * @param <T>
   * @return a new CGLIB proxy instance
   */
  public <T> T getThreadInterruptionProxyObject(
      Class<T> classType, Class[] argTypes, Object[] constructorArgs) {
    return getProxyObject(
        classType, getThreadInterruptMethodInterceptor(), argTypes, constructorArgs);
  }

  /**
   * Gives CGLIB proxy to handle {@link CheckServerShutdownState} for the passed object details.
   *
   * @param classType proxy object type
   * @param server Language server
   * @param argTypes constructor signature
   * @param constructorArgs compatible wrapped arguments to pass to constructor
   * @param <T>
   * @return a new CGLIB proxy instance
   */
  public <T> T getShutDownProxyObject(
      Class<T> classType, LanguageServer server, Class[] argTypes, Object[] constructorArgs) {
    return getProxyObject(
        classType, getShutdownHandlerMethodInterceptor(server), argTypes, constructorArgs);
  }

  private <T> T getProxyObject(
      Class<T> classType, Callback callback, Class[] argTypes, Object[] constructorArgs) {
    Enhancer enhancer = new Enhancer();
    enhancer.setSuperclass(classType);
    enhancer.setCallback(callback);
    return (T) enhancer.create(argTypes, constructorArgs);
  }

  private MethodInterceptor getShutdownHandlerMethodInterceptor(LanguageServer server) {
    return (obj, method, args, proxy) -> {
      if (method.isAnnotationPresent(CheckServerShutdownState.class)) {
        DisposableLanguageServer languageServer = (DisposableLanguageServer) server;
        if (languageServer.getExitCode() == DisposableLanguageServer.SHUTDOWN_EXIT_CODE) {
          LOG.info(method.getName() + " invoked after shutdown");
          return CompletableFuture.completedFuture(shutdownResponse);
        }
      }
      return proxy.invokeSuper(obj, args);
    };
  }

  private MethodInterceptor getThreadInterruptMethodInterceptor() {
    return (obj, method, args, proxy) -> {
      if (method.isAnnotationPresent(CheckThreadInterruption.class) && Thread.interrupted()) {
        LOG.debug(method.getName() + " is interrupted by user");
        throw new InterruptedException("Parsing interrupted by user.");
      }
      return proxy.invokeSuper(obj, args);
    };
  }
}
