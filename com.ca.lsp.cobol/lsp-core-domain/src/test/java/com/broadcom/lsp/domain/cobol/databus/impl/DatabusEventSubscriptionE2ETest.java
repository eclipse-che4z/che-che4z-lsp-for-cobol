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
 */

package com.broadcom.lsp.domain.cobol.databus.impl;

import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.concurrent.TimeoutException;

import static org.junit.jupiter.api.Assertions.fail;

/**
 * This class contains all the unit tests related to the pubblish/subscribe pattern handled by the
 * databus.
 */
@Slf4j
class DatabusEventSubscriptionE2ETest extends DatabusConfigProvider {
  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    waiter.assertTrue(getTargetEventType() == adaptedDataEvent.getEventType());
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
    LOG.debug(String.format("Expected : %s", DataEventType.REQUIRED_COPYBOOK_EVENT.getId()));
    waiter.resume();
  }

  /**
   * This test verify that the observerCallback() method is successfully engaged for a require
   * event.
   */
  @Test
  @SneakyThrows
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
          DataEventType.REQUIRED_COPYBOOK_EVENT, DataEventType.REQUIRED_COPYBOOK_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.FETCHED_COPYBOOK_EVENT, DataEventType.FETCHED_COPYBOOK_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.UNKNOWN_EVENT, DataEventType.UNKNOWN_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.RUN_ANALYSIS_EVENT, DataEventType.RUN_ANALYSIS_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.FETCHED_SETTINGS_EVENT, DataEventType.FETCHED_SETTINGS_EVENT);
    } catch (TimeoutException | InterruptedException e) {
      fail();
    }
  }

  /**
   * This test verify that the observerCallback will not be engaged caused by a different event
   * published on the databus.
   */
  @Test
  @SneakyThrows
  public void databusSubscriptionNegativeTest() throws TimeoutException {
    /*
     This negative test verify that a class subscribed to a specific DataEventType got a notification about a different event.
     In this scenario will check that a Timeout exception from the Waiter is thrown.
     The main flow is explained below:
       1. The client (our unit class for this example) subscribes itself for an event using the method subscribeTo(theEvent)
       2. The unit class publish a message on the databud of a different kind of event - let's say anotherDifferentEvent and wait for a while using the Waiter
       3. The observerCallback() is never triggered because it was registered for theEvent but on the bus there is anotherDifferentEvent
       4. The waiter will throws a Timeout exception because it wasn't resumed by the observer.
    */
    Assertions.assertThrows(
        TimeoutException.class,
        () -> {
          databusSubscriptionForNegativeScenario(
              DataEventType.REQUIRED_COPYBOOK_EVENT, DataEventType.UNKNOWN_EVENT);
          databusSubscriptionForNegativeScenario(
              DataEventType.RUN_ANALYSIS_EVENT, DataEventType.UNKNOWN_EVENT);
          databusSubscriptionForNegativeScenario(
              DataEventType.FETCHED_COPYBOOK_EVENT, DataEventType.UNKNOWN_EVENT);
          databusSubscriptionForNegativeScenario(
              DataEventType.UNKNOWN_EVENT, DataEventType.FETCHED_COPYBOOK_EVENT);
          databusSubscriptionForNegativeScenario(
              DataEventType.FETCHED_SETTINGS_EVENT, DataEventType.UNKNOWN_EVENT);
        });
  }

  @Test
  @SneakyThrows
  public void databusUnsubscriptionPositiveTest() throws TimeoutException {
    Assertions.assertThrows(
        TimeoutException.class,
        () -> {
          databusUnsubscribeForPositiveScenario(DataEventType.REQUIRED_COPYBOOK_EVENT);
          databusUnsubscribeForPositiveScenario(DataEventType.FETCHED_COPYBOOK_EVENT);
          databusUnsubscribeForPositiveScenario(DataEventType.RUN_ANALYSIS_EVENT);
          databusUnsubscribeForPositiveScenario(DataEventType.UNKNOWN_EVENT);
          databusUnsubscribeForPositiveScenario(DataEventType.FETCHED_SETTINGS_EVENT);
        });
  }
}
