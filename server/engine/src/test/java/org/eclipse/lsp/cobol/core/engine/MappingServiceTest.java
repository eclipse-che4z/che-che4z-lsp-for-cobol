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
package org.eclipse.lsp.cobol.core.engine;

import lombok.var;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
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

  private static final String COPYBOOK = "           COPYBOOK TEXT\n"
      + "           NEXT LINE 1\n"
      + "           NEXT LINE 2\n"
      + "           NEXT LINE 3\n";

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
    assertEquals(12, mapping.get(2).getExtendedRange().getEnd().getLine());
    assertEquals(8, mapping.get(2).getOriginalLocation().getRange().getStart().getLine());
    assertEquals(8, mapping.get(2).getOriginalLocation().getRange().getEnd().getLine());
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
    assertFalse(location.isPresent());

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
    Optional<Location> location = mappingService.getOriginalLocation(new Range(new Position(5, 5), new Position(5, 10)));
    assertTrue(location.isPresent());

    assertEquals(9, location.get().getRange().getStart().getLine());
    assertEquals(location.get().getRange().getStart().getCharacter(), 5);

    location = mappingService.getOriginalLocation(new Range(new Position(8, 5), new Position(8, 10)));
    assertTrue(location.isPresent());

    assertEquals(18, location.get().getRange().getStart().getLine());
  }

  @Test
  void testExtendAndShrinkEmptyLines() {
    TextTransformations textTransformations = TextTransformations.of(TEXT_SHRINK, "original");

    CopyNode copyNode = new CopyNode(Locality.builder()
        .range(new Range(new Position(4, 0), new Position(4, 24)))
        .build(), "copybook");

    textTransformations.extend(copyNode, new TextTransformations("COPYBOOK\nCOPYBOOK\n", "copybook"));

    Range range = new Range(new Position(5, 0), new Position(8, 8));
    textTransformations.replace(range, "");

    MappingService mappingService = new MappingService(textTransformations);
    Optional<Location> location = mappingService.getOriginalLocation(new Range(new Position(7, 5), new Position(7, 10)));
    assertTrue(location.isPresent());

    assertEquals(9, location.get().getRange().getStart().getLine());
    assertEquals(location.get().getRange().getStart().getCharacter(), 5);
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

  private MappingService prepareService() {
    TextTransformations textTransformations = TextTransformations.of(TEXT, "original");

    CopyNode copyNode = new CopyNode(Locality.builder()
        .range(new Range(new Position(7, 11), new Position(7, 21)))
        .build(), "copybook");

    textTransformations.extend(copyNode, TextTransformations.of(COPYBOOK, "copybook"));

    return new MappingService(textTransformations);
  }

}
