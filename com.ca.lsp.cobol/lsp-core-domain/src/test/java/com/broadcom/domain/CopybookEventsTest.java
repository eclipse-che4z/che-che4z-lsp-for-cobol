/** */
package com.broadcom.domain;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

public class CopybookEventsTest extends DomainConfigurableTest {

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
}
