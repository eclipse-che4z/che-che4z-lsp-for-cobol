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

import com.broadcom.lsp.cobol.domain.event.impl.AnalysisFinishedEventSubscriber;
import com.broadcom.lsp.cobol.domain.event.model.AnalysisFinishedEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEventType;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.concurrent.TimeoutException;

import static com.broadcom.lsp.cobol.domain.databus.impl.DatabusTestConstants.WAITER_DELAY;
import static org.junit.jupiter.api.Assertions.fail;

/** This test verifies that the observer is not triggered by the event it is not subscribed to. */
@Slf4j
class DataBusSubscribeBadTest extends DatabusConfigProvider {

  private DefaultDataBusBroker<AnalysisFinishedEvent, AnalysisFinishedEventSubscriber> databus;

  @BeforeEach
  void setUp() {
    databus = new DefaultDataBusBroker<>(3);
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    waiter.assertFalse(DataEventType.RUN_ANALYSIS_EVENT == adaptedDataEvent.getEventType());
    waiter.resume();
  }

  @Test
  void subscribe() {
    databus.subscribe(DataEventType.ANALYSIS_FINISHED_EVENT, this);
    databus.postData(new AnalysisFinishedEvent());
    try {
      waiter.await(WAITER_DELAY);
    } catch (TimeoutException | InterruptedException e) {
      fail("No events were received");
    }
  }
}
