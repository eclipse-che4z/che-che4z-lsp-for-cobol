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

import com.google.common.eventbus.DeadEvent;
import com.google.common.eventbus.Subscribe;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.api.DeadEventSubscriber;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.domain.databus.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.service.utils.TestThreadPoolExecutor;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test {@link DefaultDataBusBroker}
 */
class DefaultDataBusBrokerTest {
  @Test
  void testTwoTypesOfEvents() {
    AnalysisFinishedEventSubscriber analysisFinishedEventSubscriber = new AnalysisFinishedEventSubscriber();
    RunAnalysisEventSubscriber runAnalysisEventSubscriber = new RunAnalysisEventSubscriber();
    DeadSubscriber deadSubscriber = new DeadSubscriber();
    DataBusBroker dataBus = new DefaultDataBusBroker(new TestThreadPoolExecutor(), deadSubscriber);
    dataBus.subscribe(analysisFinishedEventSubscriber);
    dataBus.subscribe(runAnalysisEventSubscriber);
    dataBus.postData(new AnalysisFinishedEvent());
    dataBus.postData(new AnalysisFinishedEvent());
    dataBus.postData(new RunAnalysisEvent());
    assertEquals(2, analysisFinishedEventSubscriber.hits);
    assertEquals(1, runAnalysisEventSubscriber.hits);
    assertEquals(0, deadSubscriber.hits);
  }

  @Test
  void testDeadSubscriber() {
    DeadSubscriber deadSubscriber = new DeadSubscriber();
    DataBusBroker dataBus = new DefaultDataBusBroker(new TestThreadPoolExecutor(), deadSubscriber);
    dataBus.postData(new RunAnalysisEvent());
    assertEquals(1, deadSubscriber.hits);
  }

  @Test
  void testUnsubscribe() {
    RunAnalysisEventSubscriber runAnalysisEventSubscriber = new RunAnalysisEventSubscriber();
    DeadSubscriber deadSubscriber = new DeadSubscriber();
    DataBusBroker dataBus = new DefaultDataBusBroker(new TestThreadPoolExecutor(), deadSubscriber);
    dataBus.subscribe(runAnalysisEventSubscriber);
    dataBus.postData(new RunAnalysisEvent());
    assertEquals(1, runAnalysisEventSubscriber.hits);
    assertEquals(0, deadSubscriber.hits);
    dataBus.unSubscribe(runAnalysisEventSubscriber);
    dataBus.postData(new RunAnalysisEvent());
    assertEquals(1, runAnalysisEventSubscriber.hits);
    assertEquals(1, deadSubscriber.hits);
  }

  private static class AnalysisFinishedEventSubscriber {
    public int hits = 0;

    @Subscribe
    public void handle(AnalysisFinishedEvent event) {
      hits++;
    }
  }

  private static class RunAnalysisEventSubscriber {
    public int hits = 0;

    @Subscribe
    public void handle(RunAnalysisEvent event) {
      hits++;
    }
  }

  private static class DeadSubscriber implements DeadEventSubscriber {
    public int hits = 0;

    @Override
    @Subscribe
    public void handleDeadEvent(DeadEvent event) {
      hits++;
    }
  }
}
