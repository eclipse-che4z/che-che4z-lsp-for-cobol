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

package org.eclipse.lsp.cobol.service.utils;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.service.DisposableLSPStateService;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executor;
import java.util.function.Supplier;

/**
 * Check for the server state and return response accordingly. <br>
 * <br>
 * If a server receives requests after a shutdown request those requests should error with
 * InvalidRequest. Else send proper response.
 */
@Slf4j
@UtilityClass
public class ShutdownCheckUtil {
  private final String shutdownResponse = "InvalidRequest";
  /**
   * Check server state and returns a completable Future based on the server state. If a server
   * receives requests after a shutdown request those requests should error with InvalidRequest
   *
   * @param disposableLSPStateService
   * @param supplier
   * @param executor
   * @param <U>
   * @return CompletableFuture
   */
  public <U> CompletableFuture<U> supplyAsyncAndCheckShutdown(DisposableLSPStateService disposableLSPStateService,
      Supplier<U> supplier, Executor executor) {
    if (disposableLSPStateService.isServerShutdown())
      return (CompletableFuture<U>) CompletableFuture.completedFuture(shutdownResponse);
    return CompletableFuture.<U>supplyAsync(supplier, executor);
  }

  /**
   * Check server state and returns a completable Future based on the server state. If a server
   * receives requests after a shutdown request those requests should error with InvalidRequest
   *
   * @param disposableLSPStateService
   * @return CompletableFuture
   */
  public static CompletableFuture<Object> checkServerState(DisposableLSPStateService disposableLSPStateService) {
    if (disposableLSPStateService.isServerShutdown())
      return CompletableFuture.completedFuture(shutdownResponse);
    return CompletableFuture.completedFuture(null);
  }
}
