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
import java.util.concurrent.*;
import lombok.extern.slf4j.Slf4j;

/**
 * Queue LSP messages.
 */
@Slf4j
@Singleton
public class LspMessageBroker {
  public static final LspNotification POISON_PILL = () -> {};
  private final BlockingDeque<LspEvent> eventQueue = new LinkedBlockingDeque<>();


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
   * Put backs an event to the end of queue
   * @param nextEven
   * @param <Q>
   * @throws InterruptedException
   */
  public <Q> void putBack(LspQuery<Q> nextEven) throws InterruptedException {
    LOG.debug("putBack: " + nextEven);
    if (!eventQueue.offer(nextEven)) {
      LOG.warn("Event " + nextEven + " dropped");
    }
    // save the CPU
    TimeUnit.MILLISECONDS.sleep(100);
  }

  /**
   * Retrieves and removes the head of the queue.
   *
   * @return LspEvent
   * @throws InterruptedException
   */
  public LspEvent take() throws InterruptedException {
    return eventQueue.take();
  }


  /**
   * Publish LSP event into event loop
   *
   * @param event the event
   * @param <R>   type of the event result
   * @return future object for the event
   */
  public <R> CompletableFuture<R> query(LspQuery<R> event) {
      if (!eventQueue.offer(event)) {
        LOG.warn("Event " + event + " skipped");
      }
    return event.getResult();
  }

  /**
   * Publish LSP event into event loop
   *
   * @param event the event
   */
  public void notify(LspNotification event) {
      if (!eventQueue.offer(event)) {
        LOG.warn("Event " + event + " skipped");
      }
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
