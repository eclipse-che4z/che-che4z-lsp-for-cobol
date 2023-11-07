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
package org.eclipse.lsp.cobol.lsp;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.*;

/**
 * Queue LSP messages and handle the order of messages execution.
 */
@Slf4j
@Singleton
public class LspMessageDispatcher {
  private static final LspEvent<Void> POISON_PILL = () -> null;

  private final BlockingDeque<LspEvent<?>> eventQueue = new LinkedBlockingDeque<>();
  private final Map<LspEvent<?>, CompletableFuture<?>> eventResults = Collections.synchronizedMap(new HashMap<>());

  private final ExecutorService singleThreadExecutor = Executors.newSingleThreadExecutor();

  @Inject
  public LspMessageDispatcher() {
  }

  /**
   * Starts event loop
   *
   * @return return a future, one sill be resolved at the stop of the loop.
   */
  public CompletableFuture<Void> startEventLoop() {
    return CompletableFuture.supplyAsync(() -> {
      try {
        loop();
      } catch (InterruptedException e) {
        throw new RuntimeException(e);
      } finally {
        singleThreadExecutor.shutdown();
      }
      return null;
    }, singleThreadExecutor);
  }

  private void loop() throws InterruptedException {
    LspEvent<?> nextEven = eventQueue.take();
    while (nextEven != POISON_PILL) {
      try {
        CompletableFuture<Object> future = (CompletableFuture<Object>) eventResults.remove(nextEven);
        if (future.isCancelled()) {
          LOG.info(nextEven + " was canceled.");
          continue;
        }
        try {
          future.complete(nextEven.execute());
        } catch (Exception e) {
          future.completeExceptionally(e);
        }
      } catch (Exception e) {
        // something terrible
        LOG.error(e.getMessage(), e);
      } finally {
        nextEven = eventQueue.take();
      }
    }
  }

  /**
   * Publish LSP event into event loop
   * @param event the event
   * @return future object for the event
   * @param <R> type of the event result
   */
  public <R> CompletableFuture<R> publish(LspEvent<R> event) {
    CompletableFuture<R> future = new CompletableFuture<>();
    synchronized (eventResults) {
      eventResults.put(event, future);
      if (!eventQueue.offer(event)) {
        LOG.warn("Event " + event + " skipped");
      }
    }
    return future;
  }

  /**
   * Stop the event loop
   * @throws InterruptedException can be interrupted
   */
  public void stop() throws InterruptedException {
    eventQueue.put(POISON_PILL);
  }

}
