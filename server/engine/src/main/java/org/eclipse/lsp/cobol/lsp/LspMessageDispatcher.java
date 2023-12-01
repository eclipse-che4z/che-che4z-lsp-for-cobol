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

import com.google.inject.Singleton;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.*;
import lombok.extern.slf4j.Slf4j;

/**
 * Queue LSP messages and handle the order of messages execution.
 */
@Slf4j
@Singleton
public class LspMessageDispatcher {
  private static final LspEvent<Void> POISON_PILL = () -> null;

  private final BlockingDeque<LspEvent<?>> eventQueue = new LinkedBlockingDeque<>();
  private final Map<LspEvent<?>, CompletableFuture<?>> eventResults = Collections.synchronizedMap(new HashMap<>());

  private final ExecutorService singleThreadExecutor =
          Executors.newSingleThreadExecutor(r -> new Thread(r, "LSP Event Loop"));


  /**
   * Return queue size
   * @return queue size
   */
  public int queueSize() {
    return eventQueue.size();
  }

  /**
   * Return count of an object type in the queue
   * @param clazz expected Class in the queue
   * @return queue size
   */
  public int queueSizeForType(Class<?> clazz) {
      return (int) eventQueue.stream().filter(next -> next.getClass().equals(clazz)).count();
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

  private void handleEvent(CompletableFuture<Object> future, LspEvent<?> nextEvent) {
    if (future.isCancelled()) {
      LOG.info(nextEvent + " was canceled.");
      return;
    }
    try {
      if (!nextEvent.getDependencies().stream().allMatch(LspEventDependency::isSatisfied)) {
        boolean isCanceled = nextEvent.getCancelConditions().stream().anyMatch(LspEventCancelCondition::shouldBeCanceled);
        if (isCanceled) {
          LOG.debug("cancel event: " + nextEvent);
          future.cancel(true);
        } else {
          putBack(nextEvent, future);
        }
        return;
      }
      future.complete(nextEvent.execute());
    } catch (Exception e) {
      future.completeExceptionally(e);
    }
  }

  private void loop() throws InterruptedException {
    LspEvent<?> nextEvent = eventQueue.take();
    while (nextEvent != POISON_PILL) {
      try {
        handleEvent((CompletableFuture<Object>) eventResults.remove(nextEvent), nextEvent);
      } catch (Exception e) {
        // something terrible
        LOG.error(e.getMessage(), e);
      } finally {
        nextEvent = eventQueue.take();
      }
    }
  }

  private void putBack(LspEvent<?> nextEven, CompletableFuture<Object> future) throws InterruptedException {
    eventResults.put(nextEven, future);
    LOG.debug("putBack: " + nextEven);
    if (!eventQueue.offer(nextEven)) {
      LOG.warn("Event " + nextEven + " dropped");
    }
    // save the CPU
    TimeUnit.MILLISECONDS.sleep(100);
  }

  /**
   * Publish LSP event into event loop
   *
   * @param event the event
   * @param <R>   type of the event result
   * @return future object for the event
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
   *
   * @throws InterruptedException can be interrupted
   */
  public void stop() throws InterruptedException {
    eventQueue.put(POISON_PILL);
  }
}
