/*
 * Copyright (c) 2020 Broadcom.
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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;
import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;

/**
 * This test checks the positive scenario with building an extended document with correct positions
 * retrieval.
 */
public class TestMappingWithMultiDefinitions {

  private static final String DOCUMENT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01 PARENT. COPY STRUC.\r\n"
          + "       01 PARENT2. COPY STRUC.\r\n"
          + "       COPY WITHNEST.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       PERFORM MAIN-LINE.\r\n"
          + "       COPY PARS.\r\n"
          + "       MAIN-LINE.\r\n"
          + "           MOVE 00 TO CHILD2 OF PARENT.\r\n"
          + "           MOVE 00 TO CHILD3-NESTED OF PARENT-NESTED OF PARENT3.\r\n"
          + "           PERFORM PAR1.\r\n"
          + "       GOBACK.";

  private static final String STRUC =
      "           02  CHILD1         PIC 9   VALUE IS '0'.\r\n"
          + "           02  CHILD2         PIC 99.\r\n";

  private static final String WITHNEST =
      "       01 PARENT3.\r\n"
          + "           03  CHILD3         PIC 9   VALUE IS '2'.\r\n"
          + "           COPY NESTED.\r\n"
          + "           03  CHILD4         PIC 9   VALUE IS '2'.\r\n"
          + "           COPY NESTED1.\r\n"
          + "           03  CHILD5         PIC 9   VALUE IS '2'.\r\n";

  private static final String NESTED =
      "           03  CHILD6         PIC 99.\r\n"
          + "           03  CHILD7         PIC 9   VALUE IS '2'.\r\n";

  private static final String NESTED1 =
      "       03 PARENT-NESTED.\r\n"
          + "           04  CHILD1-NESTED         PIC 9   VALUE IS '2'.\r\n"
          + "           04  CHILD2-NESTED         PIC 9   VALUE IS '2'.\r\n"
          + "           COPY NESTED2.\r\n";

  private static final String NESTED2 =
      "           04  CHILD3-NESTED         PIC 9   VALUE IS '2'.\r\n"
          + "           04  CHILD4-NESTED         PIC 9   VALUE IS '2'.\r\n";

  private static final String PARS =
      "       PAR1.\r\n"
          + "           IF CHILD1 EQUAL TO 1\r\n"
          + "           THEN\r\n"
          + "               MOVE 10 TO CHILD2\r\n"
          + "           ELSE\r\n"
          + "               MOVE 11 TO CHILD2\r\n"
          + "           END-IF.\r\n";

  @Test
  public void test() {
    System.out.println("mama");

    AnalysisResult result =
        analyze(
            DOCUMENT,
            asList(
                new CobolText("STRUC", STRUC),
                new CobolText("WITHNEST", WITHNEST),
                new CobolText("NESTED", NESTED),
                new CobolText("NESTED1", NESTED1),
                new CobolText("NESTED2", NESTED2),
                new CobolText("PARS", PARS)));

    assertDiagnostics(result.getDiagnostics());
    assertCopybookUsages(result.getCopybookUsages());

    assertVariableDefinitions(result.getVariableDefinitions());
    assertVariableUsages(result.getVariableUsages());

    assertParagraphDefinitions(result.getParagraphDefinitions());
    assertParagraphUsages(result.getParagraphUsages());
  }

  private void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Diagnostics: " + diagnostics.toString(), 0, diagnostics.size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 6, copybookUsages.size());
    List<Location> struc = copybookUsages.get("STRUC");

    assertEquals("Number of STRUC usage: ", 2, struc.size());

    assertEquals(
        "STRUC first usage:",
        new Location(DOCUMENT_URI, new Range(new Position(4, 23), new Position(4, 28))),
        struc.get(0));

    assertEquals(
        "STRUC second usage:",
        new Location(DOCUMENT_URI, new Range(new Position(5, 24), new Position(5, 29))),
        struc.get(1));

    assertSingleLocation(copybookUsages, "WITHNEST", DOCUMENT_URI, 6, 12);
    assertSingleLocation(copybookUsages, "PARS", DOCUMENT_URI, 9, 12);
    assertSingleLocation(copybookUsages, "NESTED", "WITHNEST", 2, 16);
    assertSingleLocation(copybookUsages, "NESTED1", "WITHNEST", 4, 16);
    assertSingleLocation(copybookUsages, "NESTED2", "NESTED1", 3, 16);
  }

  private void assertParagraphUsages(Map<String, List<Location>> paragraphUsages) {
    assertEquals("Paragraph usages: " + paragraphUsages.toString(), 2, paragraphUsages.size());
    assertSingleLocation(paragraphUsages, "PAR1", DOCUMENT_URI, 13, 19);
    assertSingleLocation(paragraphUsages, "MAIN-LINE", DOCUMENT_URI, 8, 15);
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> paragraphDefinitions) {
    assertEquals(
        "Paragraph definitions: " + paragraphDefinitions.toString(),
        2,
        paragraphDefinitions.size());
    assertSingleLocation(paragraphDefinitions, "PAR1", "PARS", 0, 7);
    assertSingleLocation(paragraphDefinitions, "MAIN-LINE", DOCUMENT_URI, 10, 7);
  }

  private void assertVariableUsages(Map<String, List<Location>> variableUsages) {
    assertEquals("Variable usages: " + variableUsages.toString(), 6, variableUsages.size());
    List<Location> child2 = variableUsages.get("CHILD2");

    assertEquals("Number of CHILD2 usages: ", 3, child2.size());

    assertEquals(
        "CHILD2 usage:",
        new Location("PARS", new Range(new Position(3, 26), new Position(3, 32))),
        child2.get(0));

    assertEquals(
        "CHILD2 usage:",
        new Location("PARS", new Range(new Position(5, 26), new Position(5, 32))),
        child2.get(1));

    assertEquals(
        "CHILD2 usage:",
        new Location(DOCUMENT_URI, new Range(new Position(11, 22), new Position(11, 28))),
        child2.get(2));

    assertSingleLocation(variableUsages, "PARENT", DOCUMENT_URI, 11, 32);
    assertSingleLocation(variableUsages, "CHILD1", "PARS", 1, 14);
    assertSingleLocation(variableUsages, "CHILD3-NESTED", DOCUMENT_URI, 12, 22);
    assertSingleLocation(variableUsages, "PARENT-NESTED", DOCUMENT_URI, 12, 39);
    assertSingleLocation(variableUsages, "PARENT3", DOCUMENT_URI, 12, 56);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable usages: " + variableDefinitions.toString(), 15, variableDefinitions.size());
    assertSingleLocation(variableDefinitions, "PARENT", DOCUMENT_URI, 4, 10);
    assertSingleLocation(variableDefinitions, "PARENT2", DOCUMENT_URI, 5, 10);

    assertSingleLocation(variableDefinitions, "CHILD1", "STRUC", 0, 15);
    assertSingleLocation(variableDefinitions, "CHILD2", "STRUC", 1, 15);

    assertSingleLocation(variableDefinitions, "PARENT3", "WITHNEST", 0, 10);
    assertSingleLocation(variableDefinitions, "CHILD3", "WITHNEST", 1, 15);
    assertSingleLocation(variableDefinitions, "CHILD4", "WITHNEST", 3, 15);
    assertSingleLocation(variableDefinitions, "CHILD5", "WITHNEST", 5, 15);

    assertSingleLocation(variableDefinitions, "CHILD6", "NESTED", 0, 15);
    assertSingleLocation(variableDefinitions, "CHILD7", "NESTED", 1, 15);

    assertSingleLocation(variableDefinitions, "PARENT-NESTED", "NESTED1", 0, 10);
    assertSingleLocation(variableDefinitions, "CHILD1-NESTED", "NESTED1", 1, 15);
    assertSingleLocation(variableDefinitions, "CHILD2-NESTED", "NESTED1", 2, 15);

    assertSingleLocation(variableDefinitions, "CHILD3-NESTED", "NESTED2", 0, 15);
    assertSingleLocation(variableDefinitions, "CHILD4-NESTED", "NESTED2", 1, 15);
  }

  private void assertSingleLocation(
      Map<String, List<Location>> source, String name, String parent, int line, int start) {
    List<Location> locations = source.get(name);

    assertEquals("Number of " + name + " usages: ", 1, locations.size());
    assertEquals(
        name + " usage:",
        new Location(
            parent,
            new Range(new Position(line, start), new Position(line, start + name.length()))),
        locations.get(0));
  }
}
