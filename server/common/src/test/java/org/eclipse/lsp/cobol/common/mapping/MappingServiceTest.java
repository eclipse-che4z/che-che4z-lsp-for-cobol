/*
 * Copyright (c) 2022 Broadcom.
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

import lombok.var;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

/** Test class for {@link MappingService} **/
class MappingServiceTest {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       77  MYFILE-STATUS  PIC  X(2)   VALUE SPACES.\n"
          + "           88  OPEN-OK  VALUE '00'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           COPY TEST.\n"
          + "           DISPLAY MYFILE-STATUS.";

  private static final String TEXT_SHRINK =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       COPY IDMS EXTEND.\n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       77  MYFILE-STATUS  PIC  X(2)   VALUE SPACES.\n"
          + "           88  OPEN-OK  VALUE '00'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "           DISPLAY MYFILE-STATUS.";

  private static final String TEXT_REPLACEMENT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "         01 TEST REPLACEMENT\n"
          + "            CONT INUE\n";

  private static final String TEXT_REPLACEMENT_NEW_LINE =
      "0123\n"
          + "5\n"
          + "\n"
          + "6\n";

  private static final String TEXT_REPLACEMENT_FOR_RANGE =
      "00000000\n"
          + "1111111\n"
          + "2222222\n"
          + "3333333\n"
          + "4444444\n"
          + "5555555\n"
          + "6666666\n"
          + "7777777\n"
          + "8888888\n";

  private static final String COPYBOOK = "           COPYBOOK TEXT\n"
      + "           NEXT LINE 1\n"
      + "           NEXT LINE 2\n"
      + "           NEXT LINE 3\n";

  private static final String COPYBOOK2 = "!!!!\n";

  private static final String BIG_COPY = "11111-COPYBOOK\n"
      + "22222-COPYBOOK\n"
      + "33333-COPYBOOK\n"
      + "44444-COPYBOOK\n"
      + "55555-COPYBOOK\n"
      + "66666-COPYBOOK\n"
      + "77777-COPYBOOK\n"
      + "88888-COPYBOOK\n"
      + "99999-COPYBOOK\n"
      + "10 10-COPYBOOK\n"
      + "11 11-COPYBOOK\n"
      + "12 12-COPYBOOK\n"
      + "13 13-COPYBOOK\n"
      + "14 14-COPYBOOK\n"
      + "15 15-COPYBOOK";

  @Test
  void testMappingWithErasingForRange1() {
    TextTransformations textTransformations = TextTransformations.of(TEXT_REPLACEMENT_FOR_RANGE, "original");
    Range copybookRange = new Range(new Position(1, 2), new Position(3, 5));

    textTransformations.replace(copybookRange, TextTransformations.empty());
    copybookRange = new Range(new Position(4, 2), new Position(6, 5));

    textTransformations.extend(copybookRange, TextTransformations.of(BIG_COPY, "copybook2"));
    MappingService mappingService = new MappingService(textTransformations);

    Range copyRange = new Range(new Position(2, 2), new Position(2, 4));
    Optional<Location> originalLocation1 = mappingService.getOriginalLocation(copyRange);

    Range bottomRange = new Range(new Position(17, 2), new Position(8, 4));
    Optional<Location> originalLocation2 = mappingService.getOriginalLocation(bottomRange);

    assertTrue(originalLocation1.isPresent());
    assertEquals(0, originalLocation1.get().getRange().getStart().getLine());
    assertEquals(2, originalLocation1.get().getRange().getStart().getCharacter());

    assertTrue(originalLocation2.isPresent());
    assertEquals(7, originalLocation2.get().getRange().getStart().getLine());
    assertEquals(2, originalLocation2.get().getRange().getStart().getCharacter());
  }

  @Test
  void testMappingWithErasingForRange2() {
    TextTransformations textTransformations = TextTransformations.of(TEXT_REPLACEMENT_FOR_RANGE, "original");
    Range copybookRange = new Range(new Position(1, 2), new Position(3, 5));

    textTransformations.extend(copybookRange, TextTransformations.of(BIG_COPY, "copybook1"));
    copybookRange = new Range(new Position(4, 2), new Position(6, 5));

    textTransformations.replace(copybookRange, TextTransformations.empty());
    MappingService mappingService = new MappingService(textTransformations);

    Range copyRange = new Range(new Position(2, 2), new Position(2, 4));
    Optional<Location> originalLocation1 = mappingService.getOriginalLocation(copyRange);

    Range bottomRange = new Range(new Position(8, 2), new Position(8, 4));
    Optional<Location> originalLocation2 = mappingService.getOriginalLocation(bottomRange);

    assertTrue(originalLocation1.isPresent());
    assertEquals(1, originalLocation1.get().getRange().getStart().getLine());
    assertEquals(2, originalLocation1.get().getRange().getStart().getCharacter());

    assertTrue(originalLocation2.isPresent());
    assertEquals(7, originalLocation2.get().getRange().getStart().getLine());
    assertEquals(2, originalLocation2.get().getRange().getStart().getCharacter());
  }

  @Test
  void testMapping() {
    var service = prepareService();
    var mapping = service.getLocalityMap();

    assertEquals(3, mapping.size());

    assertEquals(0, mapping.get(0).getExtendedRange().getStart().getLine());
    assertEquals(6, mapping.get(0).getExtendedRange().getEnd().getLine());
    assertEquals(0, mapping.get(0).getOriginalLocation().getRange().getStart().getLine());
    assertEquals(6, mapping.get(0).getOriginalLocation().getRange().getEnd().getLine());
    assertEquals("original", mapping.get(0).getOriginalLocation().getUri());

    assertEquals(7, mapping.get(1).getExtendedRange().getStart().getLine());
    assertEquals(11, mapping.get(1).getExtendedRange().getEnd().getLine());
    assertEquals(0, mapping.get(1).getOriginalLocation().getRange().getStart().getLine());
    assertEquals(4, mapping.get(1).getOriginalLocation().getRange().getEnd().getLine());
    assertEquals("copybook", mapping.get(1).getOriginalLocation().getUri());

    assertEquals(12, mapping.get(2).getExtendedRange().getStart().getLine());
    assertEquals(20, mapping.get(2).getExtendedRange().getEnd().getLine());
    assertEquals(8, mapping.get(2).getOriginalLocation().getRange().getStart().getLine());
    assertEquals(16, mapping.get(2).getOriginalLocation().getRange().getEnd().getLine());
    assertEquals("original", mapping.get(2).getOriginalLocation().getUri());
  }

  @Test
  void testLocationBeforeCopybook() {
    var service = prepareService();
    Optional<Location> location = service.getOriginalLocation(new Range(new Position(2, 10), new Position(5, 15)));

    assertTrue(location.isPresent());
    assertEquals("original", location.get().getUri());
    assertEquals(2, location.get().getRange().getStart().getLine());
    assertEquals(10, location.get().getRange().getStart().getCharacter());
    assertEquals(5, location.get().getRange().getEnd().getLine());
    assertEquals(15, location.get().getRange().getEnd().getCharacter());
  }

  @Test
  void testLocationInCopybook() {
    var service = prepareService();
    Optional<Location> location = service.getOriginalLocation(new Range(new Position(8, 10), new Position(9, 15)));

    assertTrue(location.isPresent());
    assertEquals("copybook", location.get().getUri());
    assertEquals(1, location.get().getRange().getStart().getLine());
    assertEquals(10, location.get().getRange().getStart().getCharacter());
    assertEquals(2, location.get().getRange().getEnd().getLine());
    assertEquals(15, location.get().getRange().getEnd().getCharacter());
  }

  @Test
  void testLocationInNestedCopybook() {
    TextTransformations textTransformations = TextTransformations.of(TEXT, "original");
    Range range1 = new Range(new Position(7, 11), new Position(7, 21));
    TextTransformations copybookTT = TextTransformations.of(COPYBOOK, "copybook");
    textTransformations.extend(range1, copybookTT);

    Range range2 = new Range(new Position(1, 0), new Position(1, 22));
    copybookTT.extend(range2, TextTransformations.of(COPYBOOK2, "copybook2"));

    MappingService service = new MappingService(textTransformations);
    Optional<Location> location = service.getOriginalLocation(
            new Range(new Position(8, 0), new Position(8, 4)));

    assertTrue(location.isPresent());
    assertEquals("copybook2", location.get().getUri());
    assertEquals(0, location.get().getRange().getStart().getLine());
    assertEquals(0, location.get().getRange().getStart().getCharacter());
    assertEquals(0, location.get().getRange().getEnd().getLine());
    assertEquals(4, location.get().getRange().getEnd().getCharacter());

    Optional<Location> location2 = service.getOriginalLocation(
            new Range(new Position(6, 0), new Position(6, 2)));

    assertTrue(location2.isPresent());
    assertEquals("original", location2.get().getUri());
    assertEquals(6, location2.get().getRange().getStart().getLine());
    assertEquals(0, location2.get().getRange().getStart().getCharacter());
    assertEquals(6, location2.get().getRange().getEnd().getLine());
    assertEquals(2, location2.get().getRange().getEnd().getCharacter());

    Optional<Location> location3 = service.getOriginalLocation(
            new Range(new Position(7, 0), new Position(7, 2)));

    assertTrue(location3.isPresent());
    assertEquals("copybook", location3.get().getUri());
    assertEquals(0, location3.get().getRange().getStart().getLine());
    assertEquals(0, location3.get().getRange().getStart().getCharacter());
    assertEquals(0, location3.get().getRange().getEnd().getLine());
    assertEquals(2, location3.get().getRange().getEnd().getCharacter());

    Optional<Location> location4 = service.getOriginalLocation(
            new Range(new Position(10, 0), new Position(10, 2)));

    assertTrue(location4.isPresent());
    assertEquals("copybook", location4.get().getUri());
    assertEquals(2, location4.get().getRange().getStart().getLine());
    assertEquals(0, location4.get().getRange().getStart().getCharacter());
    assertEquals(2, location4.get().getRange().getEnd().getLine());
    assertEquals(2, location4.get().getRange().getEnd().getCharacter());
  }

  @Test
  void testLocationInNestedCopybook2() {
    TextTransformations textTransformations = TextTransformations.of(TEXT, "original");
    TextTransformations copybookTT = TextTransformations.of(COPYBOOK, "copybook");
    textTransformations.extend(new Range(new Position(7, 11), new Position(7, 21)), copybookTT);
    copybookTT.extend(new Range(new Position(), new Position(0, 24)), TextTransformations.of(COPYBOOK2, "copybook2"));

    MappingService service = new MappingService(textTransformations);
    Optional<Location> location = service.getOriginalLocation(
            new Range(new Position(7, 0), new Position(7, 4)));

    assertTrue(location.isPresent());
    assertEquals("copybook2", location.get().getUri());
    assertEquals(0, location.get().getRange().getStart().getLine());
    assertEquals(0, location.get().getRange().getStart().getCharacter());
    assertEquals(0, location.get().getRange().getEnd().getLine());
    assertEquals(4, location.get().getRange().getEnd().getCharacter());

    Optional<Location> location2 = service.getOriginalLocation(
            new Range(new Position(6, 0), new Position(6, 2)));

    assertTrue(location2.isPresent());
    assertEquals("original", location2.get().getUri());
    assertEquals(6, location2.get().getRange().getStart().getLine());
    assertEquals(0, location2.get().getRange().getStart().getCharacter());
    assertEquals(6, location2.get().getRange().getEnd().getLine());
    assertEquals(2, location2.get().getRange().getEnd().getCharacter());

    Optional<Location> location3 = service.getOriginalLocation(
            new Range(new Position(7, 0), new Position(7, 2)));

    assertTrue(location3.isPresent());
    assertEquals("copybook2", location3.get().getUri());
    assertEquals(0, location3.get().getRange().getStart().getLine());
    assertEquals(0, location3.get().getRange().getStart().getCharacter());
    assertEquals(0, location3.get().getRange().getEnd().getLine());
    assertEquals(2, location3.get().getRange().getEnd().getCharacter());

    Optional<Location> location4 = service.getOriginalLocation(
            new Range(new Position(10, 0), new Position(10, 2)));

    assertTrue(location4.isPresent());
    assertEquals("copybook", location4.get().getUri());
    assertEquals(2, location4.get().getRange().getStart().getLine());
    assertEquals(0, location4.get().getRange().getStart().getCharacter());
    assertEquals(2, location4.get().getRange().getEnd().getLine());
    assertEquals(2, location4.get().getRange().getEnd().getCharacter());
  }

  @Test
  void testLocationAfterCopybook() {
    var service = prepareService();
    Optional<Location> location = service.getOriginalLocation(new Range(new Position(12, 10), new Position(12, 15)));

    assertTrue(location.isPresent());
    assertEquals("original", location.get().getUri());
    assertEquals(8, location.get().getRange().getStart().getLine());
    assertEquals(10, location.get().getRange().getStart().getCharacter());
    assertEquals(8, location.get().getRange().getEnd().getLine());
    assertEquals(15, location.get().getRange().getEnd().getCharacter());
  }

  @Test
  void testLocationOutOfCode() {
    var service = prepareService();
    Optional<Location> location = service.getOriginalLocation(new Range(new Position(13, 10), new Position(13, 15)));
    assertTrue(location.isPresent());

    location = service.getOriginalLocation(new Range(new Position(-1, 10), new Position(-1, 15)));
    assertFalse(location.isPresent());
  }

  @Test
  void testShrinkEmptyLines() {
    TextTransformations textTransformations = TextTransformations.of(TEXT_SHRINK, "original");
    Range range = new Range(new Position(5, 0), new Position(8, 8));
    textTransformations.replace(range, "");

    range = new Range(new Position(12, 0), new Position(17, 8));
    textTransformations.replace(range, "");

    MappingService mappingService = new MappingService(textTransformations);

    // Original location for "77"
    Optional<Location> location = mappingService.getOriginalLocation(new Range(new Position(5, 5), new Position(5, 10)));
    assertTrue(location.isPresent());
    assertEquals(9, location.get().getRange().getStart().getLine());
    assertEquals(5, location.get().getRange().getStart().getCharacter());

    // Original location for "DISPLAY"
    location = mappingService.getOriginalLocation(new Range(new Position(8, 5), new Position(8, 10)));
    assertTrue(location.isPresent());
    assertEquals(18, location.get().getRange().getStart().getLine());
  }

  @Test
  void testExtendAndShrinkEmptyLines() {
    TextTransformations textTransformations = TextTransformations.of(TEXT_SHRINK, "original");

    textTransformations.extend(new Range(new Position(4, 0), new Position(4, 24)), new TextTransformations("COPYBOOK\nCOPYBOOK\n", "copybook"));

    Range range = new Range(new Position(5, 0), new Position(8, 8));
    textTransformations.replace(range, "");

    MappingService mappingService = new MappingService(textTransformations);
    Optional<Location> location = mappingService.getOriginalLocation(new Range(new Position(7, 5), new Position(7, 10)));
    assertTrue(location.isPresent());

    assertEquals(9, location.get().getRange().getStart().getLine());
    assertEquals(5, location.get().getRange().getStart().getCharacter());
  }

  @Test
  void testReplacementPositioning() {
    TextTransformations textTransformations = TextTransformations.of(TEXT_REPLACEMENT, "original");
    Range range = new Range(new Position(2, 17), new Position(3, 12));
    textTransformations.replace(range, "");

    MappingService mappingService = new MappingService(textTransformations);

    Optional<Location> location = mappingService.getOriginalLocation(new Range(new Position(2, 12), new Position(2, 16)));
    assertTrue(location.isPresent());
    assertEquals(2, location.get().getRange().getStart().getLine());

    location = mappingService.getOriginalLocation(new Range(new Position(2, 17), new Position(2, 20)));
    assertTrue(location.isPresent());
    assertEquals(3, location.get().getRange().getStart().getLine());
    assertEquals(12, location.get().getRange().getStart().getCharacter());
    assertEquals(15, location.get().getRange().getEnd().getCharacter());
  }

  @Test
  void testReplacementNewLinePositioning() {
    TextTransformations textTransformations = TextTransformations.of(TEXT_REPLACEMENT_NEW_LINE, "original");
    Range range = new Range(new Position(0, 4), new Position(1, 1));
    textTransformations.replace(range, "");

    MappingService mappingService = new MappingService(textTransformations);

    Optional<Location> location = mappingService.getOriginalLocation(new Range(new Position(2, 0), new Position(2, 0)));
    assertTrue(location.isPresent());
    assertEquals(3, location.get().getRange().getStart().getLine());
    assertEquals(0, location.get().getRange().getStart().getCharacter());
  }

  @Test
  void testInsertMiddle() {
    TextTransformations textTransformations = TextTransformations.of(TEXT, "original");

    Range copybookRange = new Range(new Position(7, 11), new Position(7, 21));
    textTransformations.insert(7, TextTransformations.of(COPYBOOK2, "copybook"));
    MappingService mappingService = new MappingService(textTransformations);

    Optional<Location> location = mappingService.getOriginalLocation(copybookRange);
    assertTrue(location.isPresent());
    assertEquals(7, location.get().getRange().getStart().getLine());

    location = mappingService.getOriginalLocation(new Range(new Position(8, 11), new Position(8, 21)));
    assertTrue(location.isPresent());
    assertEquals(0, location.get().getRange().getStart().getLine());

    location = mappingService.getOriginalLocation(new Range(new Position(9, 11), new Position(9, 21)));
    assertTrue(location.isPresent());
    assertEquals(8, location.get().getRange().getStart().getLine());
  }

  @Test
  void testInsertBlank() {
    TextTransformations textTransformations = TextTransformations.of(TEXT, "original");

    Range copybookRange = new Range(new Position(7, 11), new Position(7, 21));

    textTransformations.insert(7, TextTransformations.of("", "copybook"));
    MappingService mappingService = new MappingService(textTransformations);

    Optional<Location> location = mappingService.getOriginalLocation(copybookRange);
    assertTrue(location.isPresent());
    assertEquals(7, location.get().getRange().getStart().getLine());

    location = mappingService.getOriginalLocation(new Range(new Position(8, 11), new Position(8, 21)));
    assertTrue(location.isPresent());
    assertEquals(8, location.get().getRange().getStart().getLine());

    textTransformations.calculateExtendedText();
    location = mappingService.getOriginalLocation(new Range(new Position(9, 11), new Position(9, 21)));
    assertFalse(location.isPresent());
  }

  private MappingService prepareService() {
    TextTransformations textTransformations = TextTransformations.of(TEXT, "original");
    textTransformations.extend(new Range(new Position(7, 11), new Position(7, 21)), TextTransformations.of(COPYBOOK, "copybook"));

    return new MappingService(textTransformations);
  }

}
