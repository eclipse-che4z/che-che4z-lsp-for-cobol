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
package com.broadcom.lsp.cobol.domain.event;

import com.broadcom.lsp.cobol.domain.event.api.CopybookEventFactory;
import com.broadcom.lsp.cobol.domain.event.api.EventObserver;
import com.broadcom.lsp.cobol.domain.event.impl.RunAnalysisEventSubscriber;
import com.broadcom.lsp.cobol.domain.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.cobol.domain.event.model.DataEvent;
import com.broadcom.lsp.cobol.domain.event.model.DataEventType;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

/**
 * This test checks functionality of event subscriber factory. It creates subscribers with required
 * event types and asserts that they created correctly.
 */
@Slf4j
class CopybookEventSubscribersTest {
  private static class DatabusObserverTest implements EventObserver<DataEvent> {
    @Override
    public void observerCallback(DataEvent adaptedDataEvent) {
      LOG.debug("CALLBACK WORKS!");
    }
  }

  private static final String RUN_ANALYSIS = "RUN_ANALYSIS";
  private static final String REQCPY = "REQCPY";
  private static final String UNKNOWN = "UNKNOWN";

  private DatabusObserverTest databusObserver;

  @BeforeEach
  void initObserver() {
    databusObserver = new DatabusObserverTest();
  }

  /** This test verifies that the Unknown factory creates a new Unknown event */
  @Test
  void testUnknownSubscriberFactory() {
    assertEquals(UNKNOWN, getUnknownSubscriberFromFactory());
  }

  /** This test verifies that the RunAnalysis factory creates a new RunAnalysis event */
  @Test
  void testRunAnalysisSubscriberFactory() {
    assertEquals(RUN_ANALYSIS, getRunAnalysisSubscriberFromFactory());
  }

  /** This test verifies that a wrong factory isn't returned. */
  @Test
  void negativeTestSubscriberFactory() {
    assertNotEquals(REQCPY, getUnknownSubscriberFromFactory());
  }

  private String getUnknownSubscriberFromFactory() {
    return ((UnknownEventSubscriber)
            CopybookEventFactory.getFactory(DataEventType.UNKNOWN_EVENT).create(databusObserver))
        .getEventType()
        .getHeader();
  }

  private String getRunAnalysisSubscriberFromFactory() {
    return ((RunAnalysisEventSubscriber)
            CopybookEventFactory.getFactory(DataEventType.RUN_ANALYSIS_EVENT).create(databusObserver))
        .getEventType()
        .getHeader();
  }
}
