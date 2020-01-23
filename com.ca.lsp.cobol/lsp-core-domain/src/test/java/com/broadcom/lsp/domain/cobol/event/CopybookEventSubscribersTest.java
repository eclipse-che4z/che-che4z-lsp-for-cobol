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

import com.broadcom.lsp.domain.CopybookStorableProvider;
import com.broadcom.lsp.domain.cobol.event.api.CopybookEventFactory;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.impl.FetchedCopybookEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.impl.RequiredCopybookEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.impl.RunAnalysisEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.impl.UnknownEventSubscriber;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

@Slf4j
public class CopybookEventSubscribersTest extends CopybookStorableProvider {
  static class DatabusObserverTest implements EventObserver<DataEvent> {
    @Override
    public void observerCallback(DataEvent adaptedDataEvent) {
      LOG.debug("CALLBACK WORKS!");
    }
  }

  private static final String REQCPY = "REQCPY";
  private static final String FETCHEDCPY = "FETCHEDCPY";
  private static final String RUNANALYSIS = "RUNANALYSIS";
  private static final String UNKNOWN = "UNKNOWN";
  private DatabusObserverTest databusObserver;

  @Before
  public void initObserver() {
    databusObserver = new DatabusObserverTest();
  }

  /** This test verify that the RequiredCopybook factory creates a new RequiredCopybook event */
  @Test
  public void testRequireSubscriberFactory() {
    assertEquals(REQCPY, getRequiredSubscriberFromFactory().getEventType().getHeader());
  }

  /** This test verify that the FetchedCopybook factory creates a new FetchedCopybook event */
  @Test
  public void testFetchSubscriberFactory() {
    assertEquals(FETCHEDCPY, getFetchedSubscriberFromFactory().getEventType().getHeader());
  }

  /** This test verify that the FetchedCopybook factory creates a new FetchedCopybook event */
  @Test
  public void testRerunAnalysisSubscriberFactory() {
    assertEquals(RUNANALYSIS, getRerunSubscriberFromFactory().getEventType().getHeader());
  }

  /** This test verify that the Unknown factory creates a new Unknown event */
  @Test
  public void testUnknownSubscriberFactory() {
    assertEquals(UNKNOWN, getUnknownSubscriberFromFactory().getEventType().getHeader());
  }

  /** This test verify that a wrong factory isn't returned back. */
  @Test
  public void negativeTestSubscriberFactory() {
    assertNotEquals(REQCPY, getFetchedSubscriberFromFactory());
    assertNotEquals(UNKNOWN, getFetchedSubscriberFromFactory());

    assertNotEquals(FETCHEDCPY, getRequiredSubscriberFromFactory());
    assertNotEquals(UNKNOWN, getRequiredSubscriberFromFactory());

    assertNotEquals(REQCPY, getUnknownSubscriberFromFactory());
    assertNotEquals(FETCHEDCPY, getFetchedSubscriberFromFactory());

    assertNotEquals(RUNANALYSIS, getFetchedSubscriberFromFactory());
  }

  private UnknownEventSubscriber getUnknownSubscriberFromFactory() {
    return (UnknownEventSubscriber)
        CopybookEventFactory.getFactory(DataEventType.UNKNOWN_EVENT).create(databusObserver);
  }

  private RequiredCopybookEventSubscriber getRequiredSubscriberFromFactory() {
    return (RequiredCopybookEventSubscriber)
        CopybookEventFactory.getFactory(DataEventType.REQUIRED_COPYBOOK_EVENT)
            .create(databusObserver);
  }

  private FetchedCopybookEventSubscriber getFetchedSubscriberFromFactory() {
    return (FetchedCopybookEventSubscriber)
        CopybookEventFactory.getFactory(DataEventType.FETCHED_COPYBOOK_EVENT)
            .create(databusObserver);
  }

  private RunAnalysisEventSubscriber getRerunSubscriberFromFactory() {
    return (RunAnalysisEventSubscriber)
        CopybookEventFactory.getFactory(DataEventType.RERUN_ANALYSIS_EVENT).create(databusObserver);
  }
}
