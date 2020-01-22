/*
 * Copyright (c) 2019 Broadcom.
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
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RerunAnalysisEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import static org.junit.Assert.*;

@Slf4j
public class CopybookEventsTest extends CopybookStorableProvider {
  private static final String UNKNOWN_EVENT_MESSAGE = "Dummy event";
  private static final String REQCPY = "REQCPY";
  private static final String FETCHEDCPY = "FETCHEDCPY";
  private static final String RERUN = "RERUN";
  private static final String UNKNOWN = "UNKNOWN";
  private static final String COPYBOOK_NAME = "Test";
  private static final String COPYBOOK_URI = "file:///C:/Users/test/Test.cbl";
  private static final String COPYBOOK_CONTENT = "000000 IDENTIFICATION DIVISION.";

  /** Test that the RequiredCopybookEvent DTO is correclty populated */
  @Test
  public void requestCopybookEventTest() {
    assertEquals(REQCPY, getRequireCopybookHeader());
  }

  /** Test that the FetchedCopybookEvent DTO is correclty populated */
  @Test
  public void fetchCopybookEventTest() {
    assertEquals(FETCHEDCPY, getFetchCopybookHeader());
  }

  /** Test that the FetchedCopybookEvent DTO is correclty populated */
  @Test
  public void rerunAnalysisEventTest() {
    assertEquals(RERUN, getRerunAnalysisHeader());
  }

  /** Test that the UnknownEvent DTO is correclty populated */
  @Test
  public void unknownEventTest() {
    assertEquals(UNKNOWN, getUnknownCopybookHeader());
  }

  /** This test verify that the header of an event object doesn't return a wrong type */
  @Test
  public void negativeTestEvent() {
    assertNotEquals(FETCHEDCPY, getUnknownCopybookHeader());
    assertNotEquals(REQCPY, getUnknownCopybookHeader());

    assertNotEquals(FETCHEDCPY, getRequireCopybookHeader());
    assertNotEquals(UNKNOWN, getRequireCopybookHeader());

    assertNotEquals(REQCPY, getFetchCopybookHeader());
    assertNotEquals(UNKNOWN, getFetchCopybookHeader());

    assertNotEquals(RERUN, getFetchCopybookHeader());
  }

  /** This test verify that a null header is not returned back from the callee. */
  @Test
  public void notNullValuesFromHeaderReturned() {
    // assert that header is not null value
    assertNotNull(getUnknownCopybookHeader());
    assertNotNull(getRequireCopybookHeader());
    assertNotNull(getFetchCopybookHeader());
  }

  private String getRequireCopybookHeader() {
    return new RequiredCopybookEvent(COPYBOOK_NAME).getHeader();
  }

  private String getFetchCopybookHeader() {
    return new FetchedCopybookEvent(COPYBOOK_NAME, COPYBOOK_URI, COPYBOOK_CONTENT).getHeader();
  }

  private String getRerunAnalysisHeader() {
    return new RerunAnalysisEvent().getHeader();
  }

  private String getUnknownCopybookHeader() {
    return new UnknownEvent(UNKNOWN_EVENT_MESSAGE).getHeader();
  }
}
