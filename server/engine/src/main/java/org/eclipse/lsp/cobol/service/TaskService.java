/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp.cobol.service.utils.ShutdownCheckUtil;

import java.util.Map;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BiConsumer;
import java.util.function.Supplier;

import static java.util.Optional.ofNullable;

/**
 * Provides task management functionality
 */
@Slf4j
@Singleton
class TaskService {
  private final Map<String, CompletableFuture<Void>> futureMap = new ConcurrentHashMap<>();
  private final CustomThreadPoolExecutor executors;
  private final DisposableLSPStateService disposableLSPStateService;

  @Inject
  TaskService(CustomThreadPoolExecutor executors, DisposableLSPStateService disposableLSPStateService) {
    this.executors = executors;
    this.disposableLSPStateService = disposableLSPStateService;
  }

  /**
   * Interrupt analysis for the document
   * @param uri - document uri
   */
  public void interrupt(String uri) {
    synchronized (futureMap) {
      CompletableFuture<Void> future = futureMap.get(uri);
      if (future != null) {
        LOG.debug("Analysis for uri: " + uri + " was interrupted.");
        future.cancel(true);
      }
    }
  }

  /**
   * Run tasks for the
   * @param uri - document uri
   * @param task - supplier to run asynchronously
   * @return completable future object
   */
  public CompletableFuture<Void> runTask(String uri, Supplier<Void> task) {
    synchronized (futureMap) {
      Optional.ofNullable(futureMap.get(uri)).ifPresent(f -> f.cancel(true));
      CompletableFuture<Void> future = CompletableFuture.supplyAsync(task, executors.getThreadPoolExecutor());
      futureMap.put(uri, future);

      return future.handle(
              (result, error) -> {
                if (error != null) {
                  future.completeExceptionally(error);
                } else {
                  future.complete(null);
                }
                return null;
              });
    }
  }

  /**
   * Creates completable future on top of document analysis future (if any)
   * @param uri - document uri
   * @param task - supplier to run asynchronously
   * @param exceptionMessage - message for exception
   * @return completable future object
   */
  public <U> CompletableFuture<U> runNextTask(String uri, Supplier<U> task, String exceptionMessage) {
    return futureMap
        .getOrDefault(uri, CompletableFuture.completedFuture(null))
        .handle(
            (result, error) -> {
              if (error != null) {
                return new CompletableFuture<>().completeExceptionally(error);
              } else {
                return new CompletableFuture<>().complete(result);
              }
            })
        .thenCompose(
            res ->
                ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
                    disposableLSPStateService, task, executors.getThreadPoolExecutor()))
        .whenComplete(reportExceptionIfThrown(exceptionMessage));
  }

  /**
   * Creates completable future with given supplier
   * @param supplier - supplier to run asynchronously
   * @return completable future object
   */
  public <T> CompletableFuture<T> runTask(Supplier<T> supplier) {
    return ShutdownCheckUtil.supplyAsyncAndCheckShutdown(
        disposableLSPStateService,
        supplier,
        executors.getThreadPoolExecutor());
  }

  private BiConsumer<Object, Throwable> reportExceptionIfThrown(String message) {
    return (res, ex) -> ofNullable(ex).ifPresent(it -> LOG.error(message, it));
  }

}
