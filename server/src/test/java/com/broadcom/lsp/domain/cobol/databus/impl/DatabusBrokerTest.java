/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.broadcom.lsp.domain.cobol.databus.impl;

import com.broadcom.lsp.domain.CopybookStorableProvider;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import lombok.Getter;
import lombok.Setter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static com.broadcom.lsp.domain.cobol.databus.model.RegistryId.GENERAL_REGISTRY_ID;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@Slf4j
class DatabusBrokerTest extends CopybookStorableProvider implements EventObserver<DataEvent> {
  @Getter @Setter private int hitCount;
  private static final DataEventType UNKNOWN_EVENT_TYPE = DataEventType.UNKNOWN_EVENT;

  private DefaultDataBusBroker<UnknownEvent, UnknownEventSubscriber> broker =
      new DefaultDataBusBroker<>(3, new CopybookRepositoryLRU(3));
  private CopybookStorable dummyCopybook = getDummyStorable();

  @Getter private final Waiter waiter = new Waiter();

  @BeforeEach
  void initCache() {
    // populate the cache with some data
    broker.storeData(dummyCopybook);
  }

  /**
   * This test verifies that the client can invalidate the databus internal cache using the broker.
   */
  @Test
  void invalidateCacheTest() {
    LOG.info("Cache size before invalidate call = " + broker.cacheSize());
    broker.invalidateCache();
    assertEquals(0, broker.cacheSize());
  }

  /**
   * This test verifies that the client can grab the top item from the databus internal cache using
   * the broker.
   */
  @Test
  void getLastItemTest() {
    assertNotNull(broker.lastRecentlyUsed().get().getName());
  }

  /**
   * This test verifies that the client can grab the least item from the databus internal cache
   * using the broker.
   */
  @Test
  void getLeastItemTest() {
    assertNotNull(broker.leastRecentlyUsed().get().getName());
  }

  /**
   * This test verifies that the client can retrieve an element from the databus internal cache
   * using the broker.
   */
  @Test
  void isElementStoredInCacheTest() {
    assertEquals(getDummyStorable().getName(), broker.getData(dummyCopybook.getId()).getName());
  }

  /** This test verifies that a client could subscribe for an event using the broker. */
  @Test
  @SneakyThrows
  void subscribeTest() {
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
    waiter.await(5000);
    assertEquals(1, getHitCount());
  }

  /** This test verifies that a client could subscribe for an event using the general registry. */
  @Test
  @SneakyThrows
  void subscribeOnGeneralRegistryTest() {
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

    broker.subscribe(GENERAL_REGISTRY_ID, unknownEventSubscriber);
    // a new unknown event is published..
    broker.postData(UnknownEvent.builder().build());
    waiter.await(5000);
    assertEquals(1, getHitCount());
  }

  /** This test verifies that a class is able to unsubscribe for a specific event. */
  @Test
  @SneakyThrows
  void unsubscribeTest() {
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
    waiter.await(1000);
    // at that moment hitCount = 1
    broker.unSubscribe(subscriber);

    // a new unknown event published again and again...
    broker.postData(UnknownEvent.builder().build());
    broker.postData(UnknownEvent.builder().build());
    broker.postData(UnknownEvent.builder().build());

    // verify that the hit count is still 1
    assertEquals(1, getHitCount());
  }

  /**
   * This method is overrided by the unit test class in order to apply a custom activity for testing
   * purposes.
   *
   * @param adaptedDataEvent the data event
   */
  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    setHitCount(getHitCount() + 1);

    LOG.debug(
        String.format(
            "The subscriber react for the event %s published",
            adaptedDataEvent.getEventType().name()));
    waiter.resume();
  }
}
