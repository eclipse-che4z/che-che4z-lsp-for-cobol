package com.broadcom.domain;

import com.broadcom.lsp.domain.cobol.model.CopybookStorable;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class CopybookStorableTest {
  private static final String COPYBOOK_NAME = "Test";
  private static final String COPYBOOK_URI = "file:///C:/Users/test/Test.cbl";
  private static final String COPYBOOK_CONTENT = "000000 IDENTIFICATION DIVISION.";
  CopybookStorable storable = null;

  @Before
  public void createDummyStorable() {
    storable = new CopybookStorable(COPYBOOK_NAME, COPYBOOK_URI, COPYBOOK_CONTENT);
  }

  @Test
  /*
  A storable object created is not already expired
   */
  public void testStorableNotExpired() {
    assertFalse(storable.isExpired());
  }

  /*
  A storable object hit increase its hit value
   */
  @Test
  public void testHitIncrement() {
    // actual hit value
    int prevHit = storable.getHit();
    storable.match();
    assertTrue(storable.getHit() > prevHit);
  }
}
