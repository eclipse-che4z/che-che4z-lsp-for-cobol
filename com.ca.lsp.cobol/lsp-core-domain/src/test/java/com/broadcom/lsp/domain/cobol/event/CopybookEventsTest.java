/** */
package com.broadcom.lsp.domain.cobol.event;

import com.broadcom.lsp.domain.CopybookStorableProvider;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.UnknownEvent;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

@Slf4j
public class CopybookEventsTest extends CopybookStorableProvider {
  private static final String unknownEventMessage = "Dummy event";
  /** Test that the RequiredCopybookEvent DTO is correclty populated */
  @Test
  public void requestCopybookEventTest() {
    assertEquals(getREQCPY(), getRequireCopybookHeader());
  }

  /** Test that the FetchedCopybookEvent DTO is correclty populated */
  @Test
  public void fetchCopybookEventTest() {
    assertEquals(getFETCHEDCPY(), getFetchCopybookHeader());
  }

  /** Test that the UnknownEvent DTO is correclty populated */
  @Test
  public void unknowEventTest() {
    assertEquals(getUNKNOWN(), getUnknownCopybookHeader());
  }

  /** This test verify that the header of an event object doesn't return a wrong type */
  @Test
  public void negativeTestEvent() {
    assertNotEquals(getFETCHEDCPY(), getUnknownCopybookHeader());
    assertNotEquals(getREQCPY(), getUnknownCopybookHeader());

    assertNotEquals(getFETCHEDCPY(), getRequireCopybookHeader());
    assertNotEquals(getUNKNOWN(), getRequireCopybookHeader());

    assertNotEquals(getREQCPY(), getFetchCopybookHeader());
    assertNotEquals(getUNKNOWN(), getFetchCopybookHeader());
  }

  private String getRequireCopybookHeader() {
    return new RequiredCopybookEvent(getCopybookName()).getHeader();
  }

  private String getFetchCopybookHeader() {
    return new FetchedCopybookEvent(getCopybookName(), getCopybookURI(), getCopybookContent())
        .getHeader();
  }

  private String getUnknownCopybookHeader() {
    return new UnknownEvent(unknownEventMessage).getHeader();
  }
}
