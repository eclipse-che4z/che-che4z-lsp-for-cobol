package com.broadcom.domain;

import com.broadcom.lsp.domain.cobol.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.model.UnknownEvent;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;

public class CopybookEventTest {
  private static final String COPYBOOK_NAME = "Test";
  private static final String COPYBOOK_URI = "file:///C:/Users/test/Test.cbl";
  private static final String COPYBOOK_CONTENT = "000000 IDENTIFICATION DIVISION.";
  private static final String UNKNOWN_EVENT_MSG = "Dummy event";

  /*
  Test that the RequiredCopybookEvent DTO is correclty populated
    */
  @Test
  public void requestCopybookEventTest() {
    assertNotNull(new RequiredCopybookEvent(COPYBOOK_NAME).getHeader());
  }

  /*
  Test that the FetchedCopybookEvent DTO is correclty populated
    */
  @Test
  public void fetchCopybookEventTest() {
    assertNotNull(
        new FetchedCopybookEvent(COPYBOOK_NAME, COPYBOOK_URI, COPYBOOK_CONTENT).getHeader());
  }

  @Test
  public void unknowEventTest() {
    assertNotNull(new UnknownEvent(UNKNOWN_EVENT_MSG).getHeader());
  }
}
