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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.common.mapping;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.google.common.collect.ImmutableMap;
import java.util.Map;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test for ExtendedText class */
class ExtendedTextTest {

  private static final String TEXT =
      "     0 LINE\n" + "     1 LINE\n" + "     2 LINE\n" + "     3 LINE\n";

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
    assertEquals(
        new Range(new Position(3, 0), new Position(3, 5)).toString(),
        location.getRange().toString());

    range = new Range(new Position(2, 0), new Position(2, 5));
    location = extendedText.mapLocation(range);
    assertEquals(
        new Range(new Position(0, 0), new Position(0, 5)).toString(),
        location.getRange().toString());
    assertEquals("copybook", location.getUri());
  }

  @Test
  void testInsertToBottom() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(4, new ExtendedText("NEW LINE", "copybook"), new Location());

    Range range = new Range(new Position(4, 0), new Position(4, 5));
    Location location = extendedText.mapLocation(range);
    assertEquals(
        new Range(new Position(0, 0), new Position(0, 5)).toString(),
        location.getRange().toString());
    assertEquals("copybook", location.getUri());
  }

  @Test
  void testInsertToTop() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(0, new ExtendedText("NEW LINE", "copybook"), new Location());

    Range range = new Range(new Position(0, 0), new Position(0, 5));
    Location location = extendedText.mapLocation(range);
    assertEquals(
        new Range(new Position(0, 0), new Position(0, 5)).toString(),
        location.getRange().toString());
    assertEquals("copybook", location.getUri());

    range = new Range(new Position(1, 0), new Position(1, 5));
    location = extendedText.mapLocation(range);
    assertEquals(
        new Range(new Position(0, 0), new Position(0, 5)).toString(),
        location.getRange().toString());
    assertEquals("uri", location.getUri());
  }

  @Test
  void insertExtendedText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    extendedText.insert(
        new Range(new Position(1, 7), new Position(2, 8)),
        new ExtendedText("COPYBOOK 1 LINE\r\nCOPYBOOK 2 LINE\r\nCOPYBOOK 3 LINE", "copybook"));

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

    assertEquals(
        new Range(new Position(0, 0), new Position(0, 3)).toString(),
        location.getRange().toString());
    assertEquals("copybook", location.getUri());

    range = new Range(new Position(6, 0), new Position(6, 3));
    location = extendedText.mapLocation(range);

    assertEquals(
        new Range(new Position(2, 0), new Position(2, 3)).toString(),
        location.getRange().toString());
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
    assertEquals(
        "     0 LINE\n" + "     1\n" + " LINE\n" + "     2 LINE\n" + "     3 LINE",
        extendedText.toString());
  }

  @Test
  void testDeleteInsideTheLine() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");
    Range range = new Range(new Position(1, 4), new Position(1, 9));
    Location location = extendedText.mapLocation(range);

    assertEquals(range.toString(), location.getRange().toString());
    assertEquals("uri", location.getUri());

    Range deleteRange = new Range(new Position(1, 1), new Position(1, 4));
    extendedText.delete(deleteRange);

    Range newRange = new Range(new Position(1, 1), new Position(1, 6));
    location = extendedText.mapLocation(newRange);

    assertEquals(
        "     0 LINE\n" + "  1 LINE\n" + "     2 LINE\n" + "     3 LINE", extendedText.toString());
    assertEquals(range.toString(), location.getRange().toString());
    assertEquals("uri", location.getUri());
  }

  @Test
  void testDeleteTwoLines() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range deleteRange = new Range(new Position(1, 6), new Position(2, 4));
    extendedText.delete(deleteRange);

    Range newRange = new Range(new Position(2, 1), new Position(2, 6));
    Location location = extendedText.mapLocation(newRange);

    assertEquals(
        "     0 LINE\n" + "     1\n" + " 2 LINE\n" + "     3 LINE", extendedText.toString());

    assertEquals(
        new Range(new Position(2, 5), new Position(2, 10)).toString(),
        location.getRange().toString());
  }

  @Test
  void testDeleteRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range deleteRange = new Range(new Position(1, 6), new Position(3, 4));
    extendedText.delete(deleteRange);

    Range newRange = new Range(new Position(2, 1), new Position(2, 6));
    Location location = extendedText.mapLocation(newRange);

    assertEquals("     0 LINE\n" + "     1\n" + " 3 LINE", extendedText.toString());

    assertEquals(
        new Range(new Position(3, 5), new Position(3, 10)).toString(),
        location.getRange().toString());
  }

  @Test
  void testClearInsideOneLine() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(0, 8), new Position(0, 10));
    extendedText.clear(range);

    assertEquals(
        "     0 L  E\n" + "     1 LINE\n" + "     2 LINE\n" + "     3 LINE",
        extendedText.toString());
  }

  @Test
  void testClearTwoLinesRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(0, 8), new Position(1, 6));
    extendedText.clear(range);

    assertEquals(
        "     0 L   \n" + "       LINE\n" + "     2 LINE\n" + "     3 LINE",
        extendedText.toString());
  }

  @Test
  void testClearBigRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(0, 8), new Position(3, 9));
    extendedText.clear(range);

    assertEquals(
        "     0 L   \n" + "           \n" + "           \n" + "         NE",
        extendedText.toString());
  }

  @Test
  void testReplaceInsideOneLine() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(1, 10));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW_", instantLocation);

    // "NEW" world location
    Location result = extendedText.mapLocation(new Range(new Position(1, 9), new Position(1, 11)));

    assertEquals(
        "     0 LINE\n" + "     1 L_NEW_E\n" + "     2 LINE\n" + "     3 LINE",
        extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceTwoLines() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(2, 10));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW_", instantLocation);

    // "NEW" world location
    Location result = extendedText.mapLocation(new Range(new Position(1, 9), new Position(1, 11)));

    assertEquals(
        "     0 LINE\n" + "     1 L_NEW_\n" + "E\n" + "     3 LINE", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceBigRange() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(3, 10));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW_", instantLocation);

    // "NEW" world location
    Location result = extendedText.mapLocation(new Range(new Position(1, 9), new Position(1, 11)));

    assertEquals("     0 LINE\n" + "     1 L_NEW_\n" + "E", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceInsideOneLineMultipleLinesText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(1, 10));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW1_\n     _NEW2_", instantLocation);

    // "NEW2" world location
    Location result = extendedText.mapLocation(new Range(new Position(2, 6), new Position(2, 9)));

    assertEquals(
        "     0 LINE\n" + "     1 L_NEW1_\n" + "     _NEW2_E\n" + "     2 LINE\n" + "     3 LINE",
        extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceTwoLinesMultipleLinesText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(2, 10));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW1_\n     _NEW2_", instantLocation);

    // "NEW2" world location
    Location result = extendedText.mapLocation(new Range(new Position(2, 6), new Position(2, 9)));

    assertEquals(
        "     0 LINE\n" + "     1 L_NEW1_\n" + "     _NEW2_E\n" + "     3 LINE",
        extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testReplaceBigRangeMultipleLinesText() {
    ExtendedText extendedText = new ExtendedText(TEXT, "uri");

    Range range = new Range(new Position(1, 8), new Position(3, 10));
    Location instantLocation = new Location("replace", range);
    extendedText.replace(range, "_NEW1_\n     _NEW2_", instantLocation);

    // "NEW2" world location
    Location result = extendedText.mapLocation(new Range(new Position(2, 6), new Position(2, 9)));

    assertEquals("     0 LINE\n" + "     1 L_NEW1_\n" + "     _NEW2_E", extendedText.toString());
    assertEquals(instantLocation.toString(), result.toString());
  }

  @Test
  void testInsertCopybookProperOriginalLocation() {
    ExtendedText document = new ExtendedText(TEXT, "uri");
    ExtendedText copybook1 =
        new ExtendedText("COPY1 LINE 0\nCOPY1 LINE 1\nCOPY1 LINE 2", "copybook1");
    ExtendedText copybook2 =
        new ExtendedText("COPY2 LINE 0\nCOPY2 LINE 1\nCOPY2 LINE 2", "copybook2");

    copybook1.insert(new Range(new Position(2, 0), new Position(2, 11)), copybook2);
    Location copyLocation =
        copybook1.mapLocation(new Range(new Position(1, 0), new Position(3, 8)));
    assertEquals("copybook1", copyLocation.getUri());
    assertEquals(new Range(new Position(1, 0), new Position(2, 11)), copyLocation.getRange());

    document.insert(new Range(new Position(3, 8), new Position(3, 11)), copybook1);
    Location documentLocation =
        document.mapLocation(new Range(new Position(2, 0), new Position(7, 5)));
    assertEquals("uri", documentLocation.getUri());
    assertEquals(new Range(new Position(2, 0), new Position(3, 11)), documentLocation.getRange());

    copyLocation = document.mapLocation(new Range(new Position(4, 0), new Position(7, 5)));
    assertEquals("copybook1", copyLocation.getUri());
    assertEquals(new Range(new Position(2, 0), new Position(3, 11)), documentLocation.getRange());
  }

  @Test
  void testInsertWithPadding() {
    Range range = new Range(new Position(1, 2), new Position(2, 5));
    ExtendedText extendedText = new ExtendedText("example_text\nexample_text", "example_uri");
    ExtendedText copybook1 =
        new ExtendedText("COPY1 LINE 0\nCOPY1 LINE 1\nCOPY1 LINE 2", "copybook1");
    ExtendedText expectedCopybook =
        new ExtendedText("COPY1 LINE 0\nCOexample_text\n  example_text LINE 2", "copybook1");

    copybook1.insertWithPadding(range, extendedText);

    assertEquals(
        expectedCopybook.getLines().get(0).toString(), copybook1.getLines().get(0).toString());
    assertEquals(
        expectedCopybook.getLines().get(1).toString(), copybook1.getLines().get(1).toString());
    assertEquals(
        expectedCopybook.getLines().get(2).toString(), copybook1.getLines().get(2).toString());
  }

  @Test
  void testReplace_three_lines() {
    ExtendedText extendedText = new ExtendedText("MOVE VAR1 TO VAR2", "uri");

    Range range = new Range(new Position(0, 0), new Position(0, 18));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 4));
    Location location = new Location("replacement", statementRange);
    extendedText.replace(range, "DISPLAY VAR2.\nDISPLAY VAR1.\nMOVE VAR2 TO VAR1\n", location);

    assertEquals(
        "DISPLAY VAR2.\n" + "DISPLAY VAR1.\n" + "MOVE VAR2 TO VAR1", extendedText.toString());
  }

  @Test
  void testReplaceWithMap_general() {
    // Extended text contains 3 lines, last 2 lines we are going to replace, using replacement map
    ExtendedText extendedText =
        new ExtendedText("MOVE 1 TO A\n" + "     VOID AAA THRU \n PAR OF PAR. CONTINUE.", "uri");
    Range range = new Range(new Position(1, 5), new Position(2, 12));
    Range statementRange = new Range(new Position(1, 5), new Position(1, 9));

    // The statement map that will be using to replace actual "VOID AAA THRU \n PAR OF PAR." text
    // The name of the token PAR is the same as its value (1st "PAR" token)
    // The name of the token SEC is different from its actual value "PAR" (2nd "PAR" token)
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "AAA",
                new Token(
                    new Location(
                        extendedText.getUri(),
                        new Range(new Position(1, 10), new Position(1, 13)))),
            "PAR",
                new Token(
                    new Location(
                        extendedText.getUri(), new Range(new Position(2, 1), new Position(2, 4)))),
            "SEC",
                new Token(
                    new Location(
                        extendedText.getUri(),
                        new Range(new Position(2, 8), new Position(2, 11)))));

    String replacementMap = "MOVE 1 TO {AAA}\n" + "GO TO {PAR} OF {SEC}.";

    Location statementLocation = new Location("uri", statementRange);
    Location variableLocation =
        new Location("uri", new Range(new Position(1, 10), new Position(1, 13)));
    Location parLocation = new Location("uri", new Range(new Position(2, 1), new Position(2, 4)));
    Location secLocation = new Location("uri", new Range(new Position(2, 8), new Position(2, 11)));

    extendedText.replace(range, statementRange, statementMap, replacementMap);

    assertEquals(
        "MOVE 1 TO A\n" + "     MOVE 1 TO AAA\n" + "GO TO PAR OF PAR. CONTINUE.",
        extendedText.toString());

    // MOVE
    Location location = extendedText.mapLocation(new Range(new Position(1, 5), new Position(1, 9)));
    assertEquals(statementLocation.toString(), location.toString());

    // TO
    location = extendedText.mapLocation(new Range(new Position(1, 12), new Position(1, 14)));
    assertEquals(statementLocation.toString(), location.toString());

    // GO TO
    location = extendedText.mapLocation(new Range(new Position(2, 0), new Position(2, 6)));
    assertEquals(statementLocation.toString(), location.toString());

    // AAA
    location = extendedText.mapLocation(new Range(new Position(1, 15), new Position(1, 18)));
    assertEquals(variableLocation.toString(), location.toString());

    // PAR before OF
    location = extendedText.mapLocation(new Range(new Position(2, 7), new Position(2, 10)));
    assertEquals(parLocation.toString(), location.toString());

    // PAR after OF
    location = extendedText.mapLocation(new Range(new Position(2, 13), new Position(2, 16)));
    assertEquals(secLocation.toString(), location.toString());
  }

  @Test
  void testReplaceWithMap_order() {
    ExtendedText extendedText = new ExtendedText("MOVE VAR1 TO VAR2", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "VAR1",
                new Token(
                    new Location(
                        extendedText.getUri(), new Range(new Position(0, 5), new Position(0, 9)))),
            "VAR2",
                new Token(
                    new Location(
                        extendedText.getUri(),
                        new Range(new Position(0, 13), new Position(0, 17)))));

    Range range = new Range(new Position(0, 0), new Position(0, 17));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 4));
    extendedText.replace(
        range,
        statementRange,
        statementMap,
        "DISPLAY {VAR2}.\nDISPLAY {VAR1}.\nMOVE {VAR2} TO {VAR1}\n");

    assertEquals(
        "DISPLAY VAR2.\n" + "DISPLAY VAR1.\n" + "MOVE VAR2 TO VAR1", extendedText.toString());

    Location statementLocation = new Location("uri", statementRange);
    Location var1Location = new Location("uri", new Range(new Position(0, 5), new Position(0, 9)));
    Location var2Location =
        new Location("uri", new Range(new Position(0, 13), new Position(0, 17)));

    // line 1: DISPLAY
    Location location = extendedText.mapLocation(new Range(new Position(0, 0), new Position(0, 7)));
    assertEquals(statementLocation.toString(), location.toString());

    // line 1: VAR2
    location = extendedText.mapLocation(new Range(new Position(0, 8), new Position(0, 12)));
    assertEquals(var2Location.toString(), location.toString());

    // line 2: D(ISPLAY)
    location = extendedText.mapLocation(new Range(new Position(1, 1), new Position(1, 7)));
    assertEquals(statementLocation.toString(), location.toString());

    // line 2: VAR1
    location = extendedText.mapLocation(new Range(new Position(1, 8), new Position(1, 12)));
    assertEquals(var1Location.toString(), location.toString());
  }

  @Test
  void testInsertWithMap_order() {
    ExtendedText extendedText = new ExtendedText("MOVE VAR1 TO VAR2\nSTOP RUN.", "uri");

    Token val1 =
        new Token(
            "MOD1",
            new Location(extendedText.getUri(), new Range(new Position(0, 5), new Position(0, 9))));
    Token val2 =
        new Token(
            "MOD2",
            new Location(
                extendedText.getUri(), new Range(new Position(0, 13), new Position(0, 17))));

    Map<String, Token> statementMap =
        ImmutableMap.of(
            "VAR1", val1,
            "VAR2", val2);

    Range statementRange = new Range(new Position(0, 0), new Position(0, 4));
    Map<String, Token> tokens =
        extendedText.insertWithMap(
            1,
            statementRange,
            statementMap,
            "DISPLAY {VAR2}.\nDISPLAY {VAR1}.\nMOVE {VAR2} TO {VAR1}");

    assertEquals(
        "MOVE VAR1 TO VAR2\n"
            + "DISPLAY MOD2.\n"
            + "DISPLAY MOD1.\n"
            + "MOVE MOD2 TO MOD1\n"
            + "STOP RUN.",
        extendedText.toString());
    assertEquals(2, tokens.size());

    Location statementLocation = new Location("uri", statementRange);
    Location var1Location = new Location("uri", new Range(new Position(0, 5), new Position(0, 9)));
    Location var2Location =
        new Location("uri", new Range(new Position(0, 13), new Position(0, 17)));

    // inserted line 1: DISPLAY (filler text self-maps to the generated block, like plain insert())
    Location location = extendedText.mapLocation(new Range(new Position(1, 0), new Position(1, 7)));
    assertEquals(statementLocation.toString(), location.toString());

    // inserted line 1: VAR2 (substituted token keeps its original location)
    location = extendedText.mapLocation(new Range(new Position(1, 8), new Position(1, 12)));
    assertEquals(var2Location.toString(), location.toString());

    // inserted line 2: DISPLAY (filler text self-maps to the generated block, like plain insert())
    location = extendedText.mapLocation(new Range(new Position(2, 0), new Position(2, 7)));
    assertEquals(statementLocation.toString(), location.toString());

    // inserted line 2: VAR1 (substituted token keeps its original location)
    location = extendedText.mapLocation(new Range(new Position(2, 8), new Position(2, 12)));
    assertEquals(var1Location.toString(), location.toString());

    // untouched original statement still maps to itself
    location = extendedText.mapLocation(statementRange);
    assertEquals(statementLocation.toString(), location.toString());
  }

  @Test
  void testReplaceWithMap_duplication() {
    ExtendedText extendedText = new ExtendedText("STATEMENT VAR1", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "VAR1",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 14)))));

    Range range = new Range(new Position(0, 0), new Position(0, 14));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 9));
    extendedText.replace(
        range, statementRange, statementMap, "DISPLAY {VAR1}. DISPLAY {VAR1}. MOVE 1 TO {VAR1}.\n");

    assertEquals("DISPLAY VAR1. DISPLAY VAR1. MOVE 1 TO VAR1.", extendedText.toString());

    Location statementLocation = new Location("uri", statementRange);
    Location var1Location =
        new Location("uri", new Range(new Position(0, 10), new Position(0, 14)));

    // DISPLAY
    Location location = extendedText.mapLocation(new Range(new Position(0, 0), new Position(0, 7)));
    assertEquals(statementLocation.toString(), location.toString());

    // 1st VAR1
    location = extendedText.mapLocation(new Range(new Position(0, 8), new Position(0, 12)));
    assertEquals(var1Location.toString(), location.toString());

    // 2nd VAR1
    location = extendedText.mapLocation(new Range(new Position(0, 22), new Position(0, 26)));
    assertEquals(var1Location.toString(), location.toString());

    // 2rd VAR1
    location = extendedText.mapLocation(new Range(new Position(0, 38), new Position(0, 42)));
    assertEquals(var1Location.toString(), location.toString());
  }

  @Test
  void testReplaceWithMap_with_braces() {
    ExtendedText extendedText = new ExtendedText("MOVE VAR1 TO VAR2", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "VAR1",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 5), new Position(0, 9)))));

    Range range = new Range(new Position(0, 0), new Position(0, 17));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 4));
    extendedText.replace(
        range, statementRange, statementMap, "DISPLAY '&{VAR1&}'. DISPLAY {VAR1}.\n");

    Location statementLocation = new Location("uri", statementRange);
    Location var1Location = new Location("uri", new Range(new Position(0, 5), new Position(0, 9)));

    assertEquals("DISPLAY '{VAR1}'. DISPLAY VAR1.", extendedText.toString());

    // DISPLAY
    Location location = extendedText.mapLocation(new Range(new Position(0, 0), new Position(0, 7)));
    assertEquals(statementLocation.toString(), location.toString());

    // {VAR1}
    location = extendedText.mapLocation(new Range(new Position(0, 9), new Position(0, 15)));
    assertEquals(statementLocation.toString(), location.toString());

    // VAR1
    location = extendedText.mapLocation(new Range(new Position(0, 26), new Position(0, 30)));
    assertEquals(var1Location.toString(), location.toString());
  }

  @Test
  void testReplaceWithMap_with_double_escape_character() {
    ExtendedText extendedText = new ExtendedText("MOVE 1 TO FOO", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "BAR",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 13)))));

    Range range = new Range(new Position(0, 0), new Position(0, 13));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 4));
    extendedText.replace(range, statementRange, statementMap, "DISPLAY '&&'. DISPLAY {BAR}");

    Location barLocation = new Location("uri", new Range(new Position(0, 10), new Position(0, 13)));

    assertEquals("DISPLAY '&'. DISPLAY FOO", extendedText.toString());

    // BAR
    Location location =
        extendedText.mapLocation(new Range(new Position(0, 21), new Position(0, 24)));
    assertEquals(barLocation.toString(), location.toString());
  }

  @Test
  void testReplaceWithMap_missing_statement_token() {
    ExtendedText extendedText = new ExtendedText("MOVE 1 TO FOO", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "BAR",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 13)))));

    Range range = new Range(new Position(0, 0), new Position(0, 13));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 4));
    extendedText.replace(range, statementRange, statementMap, "DISPLAY BAR");

    assertEquals("DISPLAY BAR", extendedText.toString());
  }

  @Test
  void testReplaceWithMap_replace_value() {
    ExtendedText extendedText = new ExtendedText("STATEMENT FOO", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "FOO",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 13)))));

    Range range = new Range(new Position(0, 0), new Position(0, 13));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 9));
    extendedText.replace(range, statementRange, statementMap, "{FOO|FOOBAR} STATEMENT");

    Location statementLocation = new Location("uri", statementRange);
    Location fooLocation = new Location("uri", new Range(new Position(0, 10), new Position(0, 13)));

    assertEquals("FOOBAR STATEMENT", extendedText.toString());

    // FOOBAR
    Location location = extendedText.mapLocation(new Range(new Position(0, 0), new Position(0, 6)));
    assertEquals(fooLocation.toString(), location.toString());

    // FOO(BAR)
    location = extendedText.mapLocation(new Range(new Position(0, 3), new Position(0, 6)));
    assertEquals(fooLocation.toString(), location.toString());

    // STATEMENT
    location = extendedText.mapLocation(new Range(new Position(0, 7), new Position(0, 16)));
    assertEquals(statementLocation.toString(), location.toString());
  }

  @Test
  void testReplaceWithMap_replace_multiple_values() {
    ExtendedText extendedText = new ExtendedText("STATEMENT FOO", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "FOO",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 13)))));

    Range range = new Range(new Position(0, 0), new Position(0, 13));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 9));
    extendedText.replace(
        range,
        statementRange,
        statementMap,
        "{FOO|FOOBAR} STATEMENT. DISPLAY {FOO}\nDISPLAY {FOO|NEW_VALUE}");

    Location statementLocation = new Location("uri", statementRange);
    Location fooLocation = new Location("uri", new Range(new Position(0, 10), new Position(0, 13)));

    assertEquals("FOOBAR STATEMENT. DISPLAY FOO\nDISPLAY NEW_VALUE", extendedText.toString());

    // FOOBAR
    Location location = extendedText.mapLocation(new Range(new Position(0, 0), new Position(0, 6)));
    assertEquals(fooLocation.toString(), location.toString());

    // STATEMENT
    location = extendedText.mapLocation(new Range(new Position(0, 7), new Position(0, 16)));
    assertEquals(statementLocation.toString(), location.toString());

    // DISPLAY
    location = extendedText.mapLocation(new Range(new Position(0, 18), new Position(0, 25)));
    assertEquals(statementLocation.toString(), location.toString());

    // FOO
    location = extendedText.mapLocation(new Range(new Position(0, 26), new Position(0, 29)));
    assertEquals(fooLocation.toString(), location.toString());

    // NEWVALUE
    location = extendedText.mapLocation(new Range(new Position(1, 8), new Position(0, 16)));
    assertEquals(fooLocation.toString(), location.toString());
  }

  @Test
  void testReplaceWithMap_misplaced_value_separator() {
    ExtendedText extendedText = new ExtendedText("STATEMENT FOO", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "FOO",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 13)))));

    Range range = new Range(new Position(0, 0), new Position(0, 13));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 9));
    extendedText.replace(range, statementRange, statementMap, "DISPLAY | {FOO}.");

    assertEquals("DISPLAY | FOO.", extendedText.toString());
  }

  @Test
  void testReplaceWithMap_double_value_separator() {
    ExtendedText extendedText = new ExtendedText("STATEMENT FOO", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "FOO",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 13)))));

    Range range = new Range(new Position(0, 0), new Position(0, 13));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 9));
    extendedText.replace(range, statementRange, statementMap, "DISPLAY {FOO||BAR}.");

    assertEquals("DISPLAY |BAR.", extendedText.toString());
  }

  @Test
  void testReplaceWithMap_edge_case_1() {
    ExtendedText extendedText = new ExtendedText("STATEMENT AB", "uri");
    Map<String, Token> statementMap =
        ImmutableMap.of(
            "A",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 10), new Position(0, 11)))),
            "B",
            new Token(
                new Location(
                    extendedText.getUri(), new Range(new Position(0, 11), new Position(0, 12)))));

    Range range = new Range(new Position(0, 0), new Position(0, 12));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 9));
    extendedText.replace(range, statementRange, statementMap, "STATEMENT {A}\nSTATEMENT {B}");

    Location locationA =
        extendedText.mapLocation(new Range(new Position(0, 10), new Position(0, 11)));
    Location locationB =
        extendedText.mapLocation(new Range(new Position(1, 10), new Position(1, 11)));

    assertEquals("STATEMENT A\n" + "STATEMENT B", extendedText.toString());
    assertEquals(
        new Location("uri", new Range(new Position(0, 10), new Position(0, 11))), locationA);
    assertEquals(
        new Location("uri", new Range(new Position(0, 11), new Position(0, 12))), locationB);
  }

  @Test
  void testReplaceWithMap_edge_case_2() {
    ExtendedText extendedText = new ExtendedText("STATEMENT A,B", "uri");
    Range rangeA = new Range(new Position(0, 10), new Position(0, 11));
    Range rangeB = new Range(new Position(0, 12), new Position(0, 13));

    Map<String, Token> statementMap =
        ImmutableMap.of(
            "A", new Token(new Location(extendedText.getUri(), rangeA)),
            "B", new Token(new Location(extendedText.getUri(), rangeB)));

    Range range = new Range(new Position(0, 0), new Position(0, 13));
    Range statementRange = new Range(new Position(0, 0), new Position(0, 9));
    extendedText.replace(range, statementRange, statementMap, "STATEMENT {A}{B}");

    Location locationA =
        extendedText.mapLocation(new Range(new Position(0, 10), new Position(0, 11)));
    Location locationB =
        extendedText.mapLocation(new Range(new Position(0, 11), new Position(0, 12)));

    assertEquals("STATEMENT AB", extendedText.toString());
    assertEquals(new Location("uri", rangeA), locationA);
    assertEquals(new Location("uri", rangeB), locationB);
  }
}
