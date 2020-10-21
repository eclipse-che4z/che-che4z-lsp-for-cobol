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

import com.broadcom.lsp.cobol.domain.event.api.CopybookEventFactory;
import com.broadcom.lsp.cobol.domain.event.api.EventObserver;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEventType;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;

import java.util.concurrent.TimeoutException;

import static com.broadcom.lsp.cobol.domain.databus.impl.DatabusTestConstants.WAITER_DELAY;

/**
 * This class is an abstraction for data bus tests. It uses {@link Waiter} to apply waiting for the
 * asynchronous tasks.
 */
@Slf4j
abstract class DatabusConfigProvider implements EventObserver<DataEvent> {
  @Getter protected final Waiter waiter = new Waiter();
  @Setter @Getter private DataEventType targetEventType;
  private DefaultDataBusBroker databus =
      new DefaultDataBusBroker<>(3);

  void databusSubscriptionForPositiveScenario(DataEventType subscribedTo, DataEventType publishTo)
      throws TimeoutException, InterruptedException {
    subscribeTo(subscribedTo);
    publishEvent(publishTo);
    waiter.await(WAITER_DELAY);
  }

  void databusSubscriptionForNegativeScenario(DataEventType subscribedTo, DataEventType publishTo)
      throws TimeoutException, InterruptedException {
    subscribeTo(subscribedTo);
    publishEvent(publishTo);
    waiter.await(WAITER_DELAY);
  }

  void databusUnsubscribeForPositiveScenario(DataEventType targetEvent)
      throws TimeoutException, InterruptedException {
    Object subscriber = subscribeTo(targetEvent);
    publishEvent(targetEvent);
    waiter.await(WAITER_DELAY);

    // Unsubscribe
    databus.unSubscribe(subscriber);
    // publish the event again
    publishEvent(DataEventType.RUN_ANALYSIS_EVENT);
    // wait undefined because no subscriber anymore
    waiter.await(WAITER_DELAY);
  }

  private Object subscribeTo(DataEventType dataEventType) {
    setTargetEventType(dataEventType);
    return databus.subscribe(dataEventType, this);
  }

  private void publishEvent(DataEventType dataEventType) {
    databus.postData(CopybookEventFactory.createEventByEventType(dataEventType));
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug("CALLBACK WORKS!");
  }
}
