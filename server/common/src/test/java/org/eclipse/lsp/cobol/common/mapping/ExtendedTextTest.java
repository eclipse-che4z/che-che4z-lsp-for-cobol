/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.common.mapping;

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Test for ExtendedText class
 */
class ExtendedTextTest {

  private static final String TEXT = "     0 LINE\n"
      + "     1 LINE\n"
      + "     2 LINE\n"
      + "     3 LINE\n";

  @Test
  void testToString() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    assertEquals(TEXT.substring(0, TEXT.length() - 1), extendedText.toString());

    extendedText = new ExtendedText("TEXT\nTEXT", "uri");
    assertEquals("TEXT\nTEXT", extendedText.toString());
  }

  @Test
  void testInsertToMiddle() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(2, new ExtendedText("NEW LINE", "copybook"), new Location());

    Range range = new Range(new Position(4, 0), new Position(4, 5));
    Location location = extendedText.mapLocation(range);
    assertEquals(new Range(new Position(3, 0), new Position(3, 5)).toString(), location.getRange().toString());

    range = new Range(new Position(2, 0), new Position(2, 5));
    location = extendedText.mapLocation(range);
    assertEquals(new Range(new Position(0, 0), new Position(0, 5)).toString(), location.getRange().toString());
    assertEquals("copybook", location.getUri());
  }

  @Test
  void testInsertToBottom() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(4, new ExtendedText("NEW LINE", "copybook"), new Location());

    Range range = new Range(new Position(4, 0), new Position(4, 5));
    Location location = extendedText.mapLocation(range);
    assertEquals(new Range(new Position(0, 0), new Position(0, 5)).toString(), location.getRange().toString());
    assertEquals("copybook", location.getUri());
  }

  @Test
  void testInsertToTop() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(0, new ExtendedText("NEW LINE", "copybook"), new Location());

    Range range = new Range(new Position(0, 0), new Position(0, 5));
    Location location = extendedText.mapLocation(range);
    assertEquals(new Range(new Position(0, 0), new Position(0, 5)).toString(), location.getRange().toString());
    assertEquals("copybook", location.getUri());

    range = new Range(new Position(1, 0), new Position(1, 5));
    location = extendedText.mapLocation(range);
    assertEquals(new Range(new Position(0, 0), new Position(0, 5)).toString(), location.getRange().toString());
    assertEquals("uri", location.getUri());
  }

  @Test
  void insertExtendedText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(new Range(new Position(1, 7), new Position(2, 7)), new ExtendedText("COPYBOOK 1 LINE\r\nCOPYBOOK 2 LINE\r\nCOPYBOOK 3 LINE", "copybook"));

    Range range = new Range(new Position(2, 0), new Position(2, 3));
    Location location = extendedText.mapLocation(range);

    assertEquals(
        "     0 LINE\n"
            + "     1 \n"
            + "COPYBOOK 1 LINE\n"
            + "COPYBOOK 2 LINE\n"
            + "COPYBOOK 3 LINE\n"
            + "    \n"
            + "        INE\n"
            + "     3 LINE",
        extendedText.toString());

    assertEquals(new Range(new Position(0, 0), new Position(0, 3)).toString(), location.getRange().toString());
    assertEquals("copybook", location.getUri());

    range = new Range(new Position(6, 0), new Position(6, 3));
    location = extendedText.mapLocation(range);

    assertEquals(new Range(new Position(2, 0), new Position(2, 3)).toString(), location.getRange().toString());
    assertEquals("uri", location.getUri());
  }

  @Test
  void testDeleteLines() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(4, new ExtendedText("NEW LINE", "copybook"), new Location());

    extendedText.deleteLines(new Range(new Position(1, 5), new Position(3, 8)));
    assertEquals("     0 LINE\nNEW LINE", extendedText.toString());
  }

  @Test
  void testAddLineBreak() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.addLineBreak(new Position(1, 6));
    assertEquals("     0 LINE\n"
        + "     1\n"
        + " LINE\n"
        + "     2 LINE\n"
        + "     3 LINE", extendedText.toString());
  }

  @Test
  void testDeleteInsideTheLine() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    Range range = new Range(new Position(1, 4), new Position(1, 9));
    Location location = extendedText.mapLocation(range);

    assertEquals(range.toString(), location.getRange().toString());
    assertEquals("uri", location.getUri());

    Range deleteRange = new Range(new Position(1, 1), new Position(1, 3));
    extendedText.delete(deleteRange);

    Range newRange = new Range(new Position(1, 1), new Position(1, 6));
    location = extendedText.mapLocation(newRange);

    assertEquals("     0 LINE\n"
        + "  1 LINE\n"
        + "     2 LINE\n"
        + "     3 LINE", extendedText.toString());
    assertEquals(range.toString(), location.getRange().toString());
    assertEquals("uri", location.getUri());
  }

  @Test
  void testDeleteTwoLines() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range deleteRange = new Range(new Position(1, 6), new Position(2, 3));
    extendedText.delete(deleteRange);

    Range newRange = new Range(new Position(2, 1), new Position(2, 6));
    Location location = extendedText.mapLocation(newRange);

    assertEquals("     0 LINE\n"
        + "     1\n"
        + " 2 LINE\n"
        + "     3 LINE", extendedText.toString());

    assertEquals(new Range(new Position(2, 5), new Position(2, 10)).toString(), location.getRange().toString());
  }

  @Test
  void testDeleteRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range deleteRange = new Range(new Position(1, 6), new Position(3, 3));
    extendedText.delete(deleteRange);

    Range newRange = new Range(new Position(2, 1), new Position(2, 6));
    Location location = extendedText.mapLocation(newRange);

    assertEquals("     0 LINE\n"
        + "     1\n"
        + " 3 LINE", extendedText.toString());

    assertEquals(new Range(new Position(3, 5), new Position(3, 10)).toString(), location.getRange().toString());
  }

  @Test
  void testClearInsideOneLine() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(0, 8), new Position(0, 9));
    extendedText.clear(range);

    assertEquals("     0 L  E\n"
        + "     1 LINE\n"
        + "     2 LINE\n"
        + "     3 LINE", extendedText.toString());
  }

  @Test
  void testClearTwoLinesRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(0, 8), new Position(1, 5));
    extendedText.clear(range);

    assertEquals("     0 L   \n"
        + "       LINE\n"
        + "     2 LINE\n"
        + "     3 LINE", extendedText.toString());
  }

  @Test
  void testClearBigRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(0, 8), new Position(3, 8));
    extendedText.clear(range);

    assertEquals("     0 L   \n"
        + "           \n"
        + "           \n"
        + "         NE", extendedText.toString());
  }

  @Test
  void testReplaceInsideOneLine() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(1, 9));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW_", instantLocation);

    // "NEW" world location
    Location result = extendedText.mapLocation(new Range(new Position(1, 9), new Position(1, 11)));

    assertEquals("     0 LINE\n"
        + "     1 L_NEW_E\n"
        + "     2 LINE\n"
        + "     3 LINE", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceTwoLines() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(2, 9));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW_", instantLocation);

    // "NEW" world location
    Location result = extendedText.mapLocation(new Range(new Position(1, 9), new Position(1, 11)));

    assertEquals("     0 LINE\n"
        + "     1 L_NEW_\n"
        + "E\n"
        + "     3 LINE", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceBigRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(3, 9));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW_", instantLocation);

    // "NEW" world location
    Location result = extendedText.mapLocation(new Range(new Position(1, 9), new Position(1, 11)));

    assertEquals("     0 LINE\n"
        + "     1 L_NEW_\n"
        + "E", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceInsideOneLineMultipleLinesText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(1, 9));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW1_\n     _NEW2_", instantLocation);

    // "NEW2" world location
    Location result = extendedText.mapLocation(new Range(new Position(2, 6), new Position(2, 9)));

    assertEquals("     0 LINE\n"
        + "     1 L_NEW1_\n"
        + "     _NEW2_E\n"
        + "     2 LINE\n"
        + "     3 LINE", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceTwoLinesMultipleLinesText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(2, 9));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW1_\n     _NEW2_", instantLocation);

    // "NEW2" world location
    Location result = extendedText.mapLocation(new Range(new Position(2, 6), new Position(2, 9)));

    assertEquals("     0 LINE\n"
        + "     1 L_NEW1_\n"
        + "     _NEW2_E\n"
        + "     3 LINE", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceBigRangeMultipleLinesText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(3, 9));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW1_\n     _NEW2_", instantLocation);

    // "NEW2" world location
    Location result = extendedText.mapLocation(new Range(new Position(2, 6), new Position(2, 9)));

    assertEquals("     0 LINE\n"
        + "     1 L_NEW1_\n"
        + "     _NEW2_E", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testInsertCopybookProperOriginalLocation() {
    ExtendedText document = new ExtendedText(TEXT, "uri");
    ExtendedText copybook1 = new ExtendedText("COPY1 LINE 0\nCOPY1 LINE 1\nCOPY1 LINE 2", "copybook1");
    ExtendedText copybook2 = new ExtendedText("COPY2 LINE 0\nCOPY2 LINE 1\nCOPY2 LINE 2", "copybook2");

    copybook1.insert(new Range(new Position(2, 0), new Position(2, 11)), copybook2);
    Location copyLocation = copybook1.mapLocation(new Range(new Position(1, 0), new Position(3, 8)));
    assertEquals("copybook1", copyLocation.getUri());
    assertEquals(new Range(new Position(1, 0), new Position(2, 11)), copyLocation.getRange());

    document.insert(new Range(new Position(3, 8), new Position(3, 11)), copybook1);
    Location documentLocation = document.mapLocation(new Range(new Position(2, 0), new Position(7, 5)));
    assertEquals("uri", documentLocation.getUri());
    assertEquals(new Range(new Position(2, 0), new Position(3, 11)), documentLocation.getRange());

    copyLocation = document.mapLocation(new Range(new Position(4, 0), new Position(7, 5)));
    assertEquals("copybook1", copyLocation.getUri());
    assertEquals(new Range(new Position(2, 0), new Position(3, 11)), documentLocation.getRange());

  }

  @Test
  void testInsertWithPadding() {
    Range range = new Range(new Position(1, 2), new Position(2, 4));
    ExtendedText extendedText = new ExtendedText("example_text\nexample_text", "example_uri");
    ExtendedText copybook1 = new ExtendedText("COPY1 LINE 0\nCOPY1 LINE 1\nCOPY1 LINE 2", "copybook1");
    ExtendedText expectedCopybook = new ExtendedText("COPY1 LINE 0\nCO  example_text        \n  example_text      LINE 2", "copybook1");

    copybook1.insertWithPadding(range, extendedText);

    assertTrue(copybook1.getLines().get(0).toString().equals(expectedCopybook.getLines().get(0).toString()));
    assertTrue(copybook1.getLines().get(1).toString().equals(expectedCopybook.getLines().get(1).toString()));
    assertTrue(copybook1.getLines().get(2).toString().equals(expectedCopybook.getLines().get(2).toString()));
  }

}
