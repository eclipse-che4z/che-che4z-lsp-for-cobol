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
package com.broadcom.lsp.domain.cobol.event;

import com.broadcom.lsp.domain.cobol.event.api.CopybookEventFactory;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.impl.FetchedCopybookEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.impl.RequiredCopybookEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.impl.RunAnalysisEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

/**
 * This test checks functionality of event subscriber factory. It creates subscribers with required
 * event types and asserts that they created correctly.
 */
@Slf4j
public class CopybookEventSubscribersTest {
  static class DatabusObserverTest implements EventObserver<DataEvent> {
    @Override
    public void observerCallback(DataEvent adaptedDataEvent) {
      LOG.debug("CALLBACK WORKS!");
    }
  }

  private static final String RUN_ANALYSIS = "RUN_ANALYSIS";
  private static final String REQCPY = "REQCPY";
  private static final String FETCHEDCPY = "FETCHEDCPY";
  private static final String UNKNOWN = "UNKNOWN";

  private DatabusObserverTest databusObserver;

  @BeforeEach
  public void initObserver() {
    databusObserver = new DatabusObserverTest();
  }

  /** This test verifies that the RequiredCopybook factory creates a new RequiredCopybook event */
  @Test
  public void testRequireSubscriberFactory() {
    assertEquals(REQCPY, getRequiredSubscriberFromFactory());
  }

  /** This test verifies that the FetchedCopybook factory creates a new FetchedCopybook event */
  @Test
  public void testFetchSubscriberFactory() {
    assertEquals(FETCHEDCPY, getFetchedSubscriberFromFactory());
  }

  /** This test verifies that the Unknown factory creates a new Unknown event */
  @Test
  public void testUnknownSubscriberFactory() {
    assertEquals(UNKNOWN, getUnknownSubscriberFromFactory());
  }

  /** This test verifies that the RunAnalysis factory creates a new RunAnalysis event */
  @Test
  public void testRunAnalysisSubscriberFactory() {
    assertEquals(RUN_ANALYSIS, getRunAnalysisSubscriberFromFactory());
  }

  /** This test verifies that a wrong factory isn't returned. */
  @Test
  public void negativeTestSubscriberFactory() {
    assertNotEquals(REQCPY, getFetchedSubscriberFromFactory());
    assertNotEquals(UNKNOWN, getFetchedSubscriberFromFactory());

    assertNotEquals(FETCHEDCPY, getRequiredSubscriberFromFactory());
    assertNotEquals(UNKNOWN, getRequiredSubscriberFromFactory());

    assertNotEquals(REQCPY, getUnknownSubscriberFromFactory());
    assertNotEquals(RUN_ANALYSIS, getFetchedSubscriberFromFactory());
  }

  private String getUnknownSubscriberFromFactory() {
    return ((UnknownEventSubscriber)
            CopybookEventFactory.getFactory(UNKNOWN_EVENT).create(databusObserver))
        .getEventType()
        .getHeader();
  }

  private String getRequiredSubscriberFromFactory() {
    return ((RequiredCopybookEventSubscriber)
            CopybookEventFactory.getFactory(REQUIRED_COPYBOOK_EVENT).create(databusObserver))
        .getEventType()
        .getHeader();
  }

  private String getFetchedSubscriberFromFactory() {
    return ((FetchedCopybookEventSubscriber)
            CopybookEventFactory.getFactory(FETCHED_COPYBOOK_EVENT).create(databusObserver))
        .getEventType()
        .getHeader();
  }

  private String getRunAnalysisSubscriberFromFactory() {
    return ((RunAnalysisEventSubscriber)
            CopybookEventFactory.getFactory(RUN_ANALYSIS_EVENT).create(databusObserver))
        .getEventType()
        .getHeader();
  }
}
