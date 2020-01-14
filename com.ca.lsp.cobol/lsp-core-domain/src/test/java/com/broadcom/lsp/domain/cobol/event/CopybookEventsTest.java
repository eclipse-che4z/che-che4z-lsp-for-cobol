/** */
package com.broadcom.lsp.domain.cobol.event;

import com.broadcom.lsp.domain.CopybookStorableProvider;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import static org.junit.Assert.*;

@Slf4j
public class CopybookEventsTest extends CopybookStorableProvider {
  private static final String UNKNOWN_EVENT_MESSAGE = "Dummy event";
  private static final String REQCPY = "REQCPY";
  private static final String FETCHEDCPY = "FETCHEDCPY";
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

  /** Test that the UnknownEvent DTO is correclty populated */
  @Test
  public void unknowEventTest() {
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

  private String getUnknownCopybookHeader() {
    return new UnknownEvent(UNKNOWN_EVENT_MESSAGE).getHeader();
  }
}
