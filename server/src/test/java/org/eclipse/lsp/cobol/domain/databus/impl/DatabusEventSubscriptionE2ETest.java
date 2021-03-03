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

package org.eclipse.lsp.cobol.domain.databus.impl;

import org.eclipse.lsp.cobol.domain.event.model.DataEvent;
import org.eclipse.lsp.cobol.domain.event.model.DataEventType;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import java.util.concurrent.TimeoutException;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.fail;

/**
 * This class contains all the unit tests related to the pubblish/subscribe pattern handled by the
 * databus.
 */
@Slf4j
class DatabusEventSubscriptionE2ETest extends DatabusConfigProvider {
  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    waiter.assertTrue(targetEventType() == adaptedDataEvent.getEventType());
    waiter.resume();
  }

  /**
   * This test verify that the observerCallback() method is successfully engaged for a require
   * event.
   */
  @Test
  void databusSubscriptionPositiveTest() {
    /*
     This positive test verify that a class subscribed to a specific DataEventType got a notification about that event.
     The main flow is explained below:
       1. The client (our unit class for this example) subscribes itself for an event using the method subscribeTo(theEvent)
       2. The unit class publish a message on the database of theEvent type and wait for a while using the Waiter
       3. The observerCallback() of the unit class is triggered (because subscribed on the event published on the databus)
       4. The callback verify that the event received is exactly the one that is looking for
       5. It's the same kind of event so will resume the waiter and the test will be ended successfully.
    */

    try {
      databusSubscriptionForPositiveScenario(
          DataEventType.UNKNOWN_EVENT, DataEventType.UNKNOWN_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.RUN_ANALYSIS_EVENT, DataEventType.RUN_ANALYSIS_EVENT);
    } catch (TimeoutException | InterruptedException e) {
      fail();
    }
  }

  /**
   * This test verify that the observerCallback will not be engaged caused by a different event
   * published on the databus.
   */
  @Test
  void databusSubscriptionNegativeTest() {
    /*
     This negative test verify that a class subscribed to a specific DataEventType got a notification about a different event.
     In this scenario will check that a Timeout exception from the Waiter is thrown.
     The main flow is explained below:
       1. The client (our unit class for this example) subscribes itself for an event using the method subscribeTo(theEvent)
       2. The unit class publish a message on the databud of a different kind of event - let's say anotherDifferentEvent and wait for a while using the Waiter
       3. The observerCallback() is never triggered because it was registered for theEvent but on the bus there is anotherDifferentEvent
       4. The waiter will throws a Timeout exception because it wasn't resumed by the observer.
    */
    assertThrows(
        TimeoutException.class,
        () -> {
          databusSubscriptionForNegativeScenario(
              DataEventType.RUN_ANALYSIS_EVENT, DataEventType.UNKNOWN_EVENT);
        });
  }

  @Test
  void databusUnsubscriptionPositiveTest() {
    assertThrows(
        TimeoutException.class,
        () -> databusUnsubscribeForPositiveScenario(DataEventType.RUN_ANALYSIS_EVENT));
    assertThrows(
        TimeoutException.class,
        () -> databusUnsubscribeForPositiveScenario(DataEventType.UNKNOWN_EVENT));
  }
}
