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
package com.broadcom.lsp.cobol.domain.databus.impl;

import com.broadcom.lsp.cobol.core.model.CopybookModel;
import com.broadcom.lsp.cobol.domain.databus.model.RegistryId;
import com.broadcom.lsp.cobol.domain.event.api.EventObserver;
import com.broadcom.lsp.cobol.domain.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEventType;
import com.broadcom.lsp.cobol.domain.event.model.UnknownEvent;
import com.broadcom.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.junit.jupiter.api.Test;

import java.util.concurrent.TimeoutException;

import static com.broadcom.lsp.cobol.domain.databus.impl.DatabusTestConstants.WAITER_DELAY;
import static org.junit.jupiter.api.Assertions.assertEquals;

@Slf4j
class DatabusBrokerTest implements EventObserver<DataEvent> {
  @Accessors(fluent = true, chain = false)
  @Getter
  @Setter
  private int hitCount;

  private static final DataEventType UNKNOWN_EVENT_TYPE = DataEventType.UNKNOWN_EVENT;

  private DefaultDataBusBroker<UnknownEvent, UnknownEventSubscriber> broker =
      new DefaultDataBusBroker<>(new CustomThreadPoolExecutorService(3, 4, 60, 5));
  private final CopybookModel dummyCopybook =
      new CopybookModel(
          "Test", "file:///C:/Users/test/Test.cbl", "000000 IDENTIFICATION DIVISION.");

  @Getter private final Waiter waiter = new Waiter();

  /** This test verifies that a client could subscribe for an event using the broker. */
  @Test
  void subscribeTest() throws TimeoutException, InterruptedException {
    /*
    The scenario for this test is described below:
      1. The observer object is subscribed for the UnknownEvent and its hitCount is equals to 0.
      2. A new Unknown event is generated.
      3. The observer object react invoking the callback that will increment the hitCount to 1.
     */

    // in order to avoid any wrong initialization, hitCount is initialized to zero.
    hitCount = 0;
    broker.subscribe(UNKNOWN_EVENT_TYPE, this);
    // a new unknown event is published..
    broker.postData(UnknownEvent.builder().build());
    waiter.await(WAITER_DELAY);
    assertEquals(1, hitCount());
  }

  /** This test verifies that a client could subscribe for an event using the general registry. */
  @Test
  void subscribeOnGeneralRegistryTest() throws TimeoutException, InterruptedException {
    /*
       The scenario for this test is described below:
         1. The observer object is subscribed for the UnknownEvent on the general registry with an
    already provided unknown event subscriber
            and its hitCount is equals to 0.
         2. A new Unknown event is generated.
         3. The observer object react invoking the callback that will increment the hitCount to 1.
        */
    // in order to avoid any wrong initialization, hitCount is initialized to zero.
    hitCount = 0;
    UnknownEventSubscriber unknownEventSubscriber =
        new UnknownEventSubscriber(this, new UnknownEvent());

    broker.subscribe(RegistryId.GENERAL_REGISTRY_ID, unknownEventSubscriber);
    // a new unknown event is published..
    broker.postData(UnknownEvent.builder().build());
    waiter.await(WAITER_DELAY);
    assertEquals(1, hitCount());
  }

  /** This test verifies that a class is able to unsubscribe for a specific event. */
  @Test
  void unsubscribeTest() throws TimeoutException, InterruptedException {
    /*
    The scenario for this test is described below:
      1. The observer object is subscribed for the UnknownEvent and its hitCount is equals to 0.
      2. A new Unknown event is generated.
      3. The observer object react invoking the callback that will increment the hitCount to 1.
      4. The observer object unsubscribe itself from the UnknownEvent.
      5. The event is propagated many times.
      6. The expected behaviour is that the hitCount will continue to be 1.
     */

    // in order to avoid any wrong initialization, hitCount is initialized to zero.
    hitCount = 0;
    UnknownEventSubscriber subscriber = broker.subscribe(UNKNOWN_EVENT_TYPE, this);

    // a new unknown event published...
    broker.postData(UnknownEvent.builder().build());
    waiter.await(WAITER_DELAY);
    // at that moment hitCount = 1
    broker.unSubscribe(subscriber);

    // a new unknown event published again and again...
    broker.postData(UnknownEvent.builder().build());
    broker.postData(UnknownEvent.builder().build());
    broker.postData(UnknownEvent.builder().build());

    // verify that the hit count is still 1
    assertEquals(1, hitCount());
  }

  /**
   * This method is overrided by the unit test class in order to apply a custom activity for testing
   * purposes.
   *
   * @param adaptedDataEvent the data event
   */
  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    hitCount(hitCount() + 1);

    LOG.debug(
        String.format(
            "The subscriber react for the event %s published",
            adaptedDataEvent.getEventType().name()));
    waiter.resume();
  }
}
