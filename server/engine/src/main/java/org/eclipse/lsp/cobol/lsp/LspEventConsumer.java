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

import static org.eclipse.lsp.cobol.lsp.LspMessageBroker.POISON_PILL;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

/** A consumer of {@link LspMessageBroker} */
@Slf4j
public class LspEventConsumer {
  @Getter private final LspMessageBroker lspMessageBroker;
  private final ExecutorService singleThreadExecutor =
      Executors.newSingleThreadExecutor(r -> new Thread(r, "LSP Event Consumer"));
  private final ExecutorService notificationThreadExecutor =
          Executors.newSingleThreadExecutor(r -> new Thread(r, "LSP Notification Consumer"));
  private final ExecutorService queryThreadExecutor =
          Executors.newSingleThreadExecutor(r -> new Thread(r, "LSP Query Consumer"));

  protected LspEventConsumer(LspMessageBroker lspMessageBroker) {
    this.lspMessageBroker = lspMessageBroker;
  }

  /**
   * Handles {@link LspEvent}
   *
   * @param event
   */
  private void handle(LspEvent event) {
    if (event instanceof LspNotification) {
      CompletableFuture.runAsync(((LspNotification) event)::execute, notificationThreadExecutor);
      return;
    }
    if (event instanceof LspQuery) {
      CompletableFuture.runAsync(() -> handle((LspQuery<?>) event), queryThreadExecutor);
    }
  }

  private <T> void handle(LspQuery<T> event) {
    if (event.getResult().isCancelled()) {
      LOG.info(event + " was canceled.");
      return;
    }
    try {
      if (!event.getDependencies().stream().allMatch(LspEventDependency::isSatisfied)) {
        boolean isCanceled =
            event.getCancelConditions().stream()
                .anyMatch(LspEventCancelCondition::shouldBeCanceled);
        if (isCanceled) {
          LOG.debug("cancel event: " + event);
          event.getResult().cancel(true);
        } else {
          this.lspMessageBroker.putBack(event);
        }
        return;
      }
      event.getResult().complete(event.query());
    } catch (Exception e) {
      event.getResult().completeExceptionally(e);
    }
  }

  private void consume() throws InterruptedException {
    LspEvent nextEvent = lspMessageBroker.take();
    while (nextEvent != POISON_PILL) {
      handle(nextEvent);
      nextEvent = this.lspMessageBroker.take();
    }
  }

  /**
   * Start the {@link LspEvent} consumer
   */
  public void startConsumer() {
    CompletableFuture.supplyAsync(
        () -> {
          try {
            consume();
          } catch (InterruptedException e) {
            throw new RuntimeException(e);
          } finally {
            LOG.info("LSP Consumer shutting down");
            singleThreadExecutor.shutdown();
          }
          return null;
        },
        singleThreadExecutor);
  }
}
