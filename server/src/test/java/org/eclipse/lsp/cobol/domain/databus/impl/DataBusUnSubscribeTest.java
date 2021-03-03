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
import org.eclipse.lsp.cobol.domain.event.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.concurrent.TimeoutException;

import static org.eclipse.lsp.cobol.domain.databus.impl.DatabusTestConstants.WAITER_DELAY;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.fail;

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
    Object subscriber = databus.subscribe(DataEventType.RUN_ANALYSIS_EVENT, this);
    // Subscribe
    databus.postData(new RunAnalysisEvent());
    try {
      waiter.await(WAITER_DELAY);
    } catch (TimeoutException | InterruptedException e) {
      fail(e);
    }
    assertThrows(
        TimeoutException.class,
        () -> {
          // Unsubscribe
          databus.unSubscribe(subscriber);
          databus.postData(new RunAnalysisEvent());
          // wait undefined because no subscriber anymore
          waiter.await(WAITER_DELAY);
        });
  }
}
