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
package org.eclipse.lsp.cobol.domain.event;

import org.eclipse.lsp.cobol.domain.event.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.domain.event.model.UnknownEvent;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

@Slf4j
class CopybookEventsTest {
  private static final String UNKNOWN_EVENT_MESSAGE = "Dummy event";
  private static final String REQCPY = "REQCPY";
  private static final String FETCHEDCPY = "FETCHEDCPY";
  private static final String UNKNOWN = "UNKNOWN";
  private static final String RUN_ANALYSIS_EVENT = "RUN_ANALYSIS";

  /** Test the UnknownEvent DTO is correctly populated */
  @Test
  void unknownEventTest() {
    assertEquals(UNKNOWN, getUnknownCopybookHeader());
  }

  /** Test the RunAnalysisEvent DTO is correctly populated. */
  @Test
  void runAnalysisTest() {
    assertEquals(RUN_ANALYSIS_EVENT, getRunAnalysisHeader());
  }

  /** This test verifies that the header of an event object doesn't return a wrong type */
  @Test
  void negativeTestEvent() {
    assertNotEquals(FETCHEDCPY, getUnknownCopybookHeader());
    assertNotEquals(REQCPY, getUnknownCopybookHeader());
    assertNotEquals(RUN_ANALYSIS_EVENT, getUnknownCopybookHeader());
  }

  /** This test verifies that a null header not returned from the callee. */
  @Test
  void notNullValuesFromHeaderReturned() {
    // assert that header is not null value
    assertNotNull(getUnknownCopybookHeader());
    assertNotNull(getRunAnalysisHeader());
  }

  private String getUnknownCopybookHeader() {
    return new UnknownEvent(UNKNOWN_EVENT_MESSAGE).getHeader();
  }

  private String getRunAnalysisHeader() {
    return new RunAnalysisEvent().getHeader();
  }
}
