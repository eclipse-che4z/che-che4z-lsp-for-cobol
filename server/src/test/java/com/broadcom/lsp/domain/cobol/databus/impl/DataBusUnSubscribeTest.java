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

import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.concurrent.TimeoutException;

/**
 * This test verifies that the object that was unsubscribed from the databus doesn't receive
 * notifications anymore.
 */
@Slf4j
class DataBusUnSubscribeTest extends DatabusConfigProvider {
  private DefaultDataBusBroker databus;

  @BeforeEach
  void setUp() {
    databus = new DefaultDataBusBroker<>(3, new CopybookRepositoryLRU(3));
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    waiter.assertTrue(DataEventType.REQUIRED_COPYBOOK_EVENT == adaptedDataEvent.getEventType());
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
    LOG.debug(String.format("Expected : %s", DataEventType.REQUIRED_COPYBOOK_EVENT.getId()));
    waiter.resume();
  }

  @Test
  void subscribe() {
    Assertions.assertThrows(
        TimeoutException.class,
        () -> {
          // Subscribe
          Object subscriber = databus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
          databus.postData(
              RequiredCopybookEvent.builder().name("CPYBUILD_SUBSCRIPTION TEST").build());
          waiter.await(5000);
          // Unsubscribe
          databus.unSubscribe(subscriber);
          databus.postData(
              RequiredCopybookEvent.builder().name("CPYBUILD_SUBSCRIPTION TEST").build());
          // wait undefined because no subscriber anymore
          waiter.await(5000);
        });
  }
}
