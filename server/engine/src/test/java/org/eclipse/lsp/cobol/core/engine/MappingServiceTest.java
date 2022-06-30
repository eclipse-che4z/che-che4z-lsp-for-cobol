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
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

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

  private static final String COPYBOOK = "COPYBOOK TEXT\n"
      + "           NEXT LINE 1\n"
      + "           NEXT LINE 2\n"
      + "           NEXT LINE 3\n";

  @Test
  void test() {
    TextTransformations textTransformations = TextTransformations.of(TEXT, "original");

    CopyNode copyNode = new CopyNode(Locality.builder()
        .range(new Range(new Position(7, 11), new Position(7, 21)))
        .build(), "copybook");

    textTransformations.extend(copyNode, TextTransformations.of(COPYBOOK, "copybook"));

    var mapping = MappingService.buildLocalityMap(textTransformations);
    assertEquals(3, mapping.size());

    assertEquals(0, mapping.get(0).getKey().getStart().getLine());
    assertEquals(6, mapping.get(0).getKey().getEnd().getLine());
    assertEquals(0, mapping.get(0).getValue().getRange().getStart().getLine());
    assertEquals(6, mapping.get(0).getValue().getRange().getEnd().getLine());
    assertEquals("original", mapping.get(0).getValue().getUri());

    assertEquals(7, mapping.get(1).getKey().getStart().getLine());
    assertEquals(10, mapping.get(1).getKey().getEnd().getLine());
    assertEquals(0, mapping.get(1).getValue().getRange().getStart().getLine());
    assertEquals(3, mapping.get(1).getValue().getRange().getEnd().getLine());
    assertEquals("copybook", mapping.get(1).getValue().getUri());

    assertEquals(11, mapping.get(2).getKey().getStart().getLine());
    assertEquals(11, mapping.get(2).getKey().getEnd().getLine());
    assertEquals(8, mapping.get(2).getValue().getRange().getStart().getLine());
    assertEquals(8, mapping.get(2).getValue().getRange().getEnd().getLine());
    assertEquals("original", mapping.get(2).getValue().getUri());
  }

}
