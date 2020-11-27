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

import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEventType;
import com.broadcom.lsp.cobol.domain.event.model.RunAnalysisEvent;
import com.broadcom.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.concurrent.TimeoutException;

import static com.broadcom.lsp.cobol.domain.databus.impl.DatabusTestConstants.WAITER_DELAY;

/**
 * This test verifies that the object that was unsubscribed from the databus doesn't receive
 * notifications anymore.
 */
@Slf4j
class DataBusUnSubscribeTest extends DatabusConfigProvider {
  private DefaultDataBusBroker databus;

  @BeforeEach
  void setUp() {
    databus = new DefaultDataBusBroker<>(new CustomThreadPoolExecutorService(3, 4, 60, 5));
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    waiter.assertTrue(DataEventType.RUN_ANALYSIS_EVENT == adaptedDataEvent.getEventType());
    waiter.resume();
  }

  @Test
  void subscribe() {
    Assertions.assertThrows(
        TimeoutException.class,
        () -> {
          // Subscribe
          Object subscriber = databus.subscribe(DataEventType.RUN_ANALYSIS_EVENT, this);
          databus.postData(new RunAnalysisEvent());
          waiter.await(WAITER_DELAY);
          // Unsubscribe
          databus.unSubscribe(subscriber);
          databus.postData(new RunAnalysisEvent());
          // wait undefined because no subscriber anymore
          waiter.await(WAITER_DELAY);
        });
  }
}
