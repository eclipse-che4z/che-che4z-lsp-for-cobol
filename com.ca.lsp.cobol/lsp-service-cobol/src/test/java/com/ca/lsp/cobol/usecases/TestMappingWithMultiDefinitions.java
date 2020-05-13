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
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
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

  private static final String STRUC_NAME = "STRUC";
  private static final String WITHNEST_NAME = "WITHNEST";
  private static final String PARS_NAME = "PARS";
  private static final String NESTED_NAME = "NESTED";
  private static final String NESTED1_NAME = "NESTED1";
  private static final String NESTED2_NAME = "NESTED2";

  @Test
  public void test() {
    AnalysisResult result =
        analyze(
            DOCUMENT,
            asList(
                new CobolText(STRUC_NAME + ".CPY", STRUC),
                new CobolText(WITHNEST_NAME + ".CPY", WITHNEST),
                new CobolText(NESTED_NAME + ".CPY", NESTED),
                new CobolText(NESTED1_NAME + ".CPY", NESTED1),
                new CobolText(NESTED2_NAME + ".CPY", NESTED2),
                new CobolText(PARS_NAME + ".CPY", PARS)));

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

    assertNumberOfLocations(copybookUsages, STRUC_NAME, 2);
    assertLocation(copybookUsages, STRUC_NAME, DOCUMENT_URI, 4, 23);
    assertLocation(copybookUsages, STRUC_NAME, DOCUMENT_URI, 5, 24);

    assertNumberOfLocations(copybookUsages, WITHNEST_NAME, 1);
    assertLocation(copybookUsages, WITHNEST_NAME, DOCUMENT_URI, 6, 12);
    assertNumberOfLocations(copybookUsages, PARS_NAME, 1);
    assertLocation(copybookUsages, PARS_NAME, DOCUMENT_URI, 9, 12);
    assertNumberOfLocations(copybookUsages, NESTED_NAME, 1);
    assertLocation(copybookUsages, NESTED_NAME, toURI(WITHNEST_NAME), 2, 16);
    assertNumberOfLocations(copybookUsages, NESTED1_NAME, 1);
    assertLocation(copybookUsages, NESTED1_NAME, toURI(WITHNEST_NAME), 4, 16);
    assertNumberOfLocations(copybookUsages, NESTED2_NAME, 1);
    assertLocation(copybookUsages, NESTED2_NAME, toURI(NESTED1_NAME), 3, 16);
  }

  private void assertParagraphUsages(Map<String, List<Location>> paragraphUsages) {
    assertEquals("Paragraph usages: " + paragraphUsages.toString(), 2, paragraphUsages.size());

    assertNumberOfLocations(paragraphUsages, "PAR1", 1);
    assertLocation(paragraphUsages, "PAR1", DOCUMENT_URI, 13, 19);
    assertNumberOfLocations(paragraphUsages, "MAIN-LINE", 1);
    assertLocation(paragraphUsages, "MAIN-LINE", DOCUMENT_URI, 8, 15);
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> paragraphDefinitions) {
    assertEquals(
        "Paragraph definitions: " + paragraphDefinitions.toString(),
        2,
        paragraphDefinitions.size());
    assertLocation(paragraphDefinitions, "PAR1", toURI(PARS_NAME), 0, 7);
    assertLocation(paragraphDefinitions, "MAIN-LINE", DOCUMENT_URI, 10, 7);
  }

  private void assertVariableUsages(Map<String, List<Location>> variableUsages) {
    assertEquals("Variable usages: " + variableUsages.toString(), 6, variableUsages.size());

    assertNumberOfLocations(variableUsages, "CHILD2", 3);
    assertLocation(variableUsages, "CHILD2", toURI(PARS_NAME), 3, 26);
    assertLocation(variableUsages, "CHILD2", toURI(PARS_NAME), 5, 26);
    assertLocation(variableUsages, "CHILD2", DOCUMENT_URI, 11, 22);

    assertNumberOfLocations(variableUsages, "PARENT", 1);
    assertLocation(variableUsages, "PARENT", DOCUMENT_URI, 11, 32);

    assertNumberOfLocations(variableUsages, "CHILD1", 1);
    assertLocation(variableUsages, "CHILD1", toURI(PARS_NAME), 1, 14);

    assertNumberOfLocations(variableUsages, "CHILD3-NESTED", 1);
    assertLocation(variableUsages, "CHILD3-NESTED", DOCUMENT_URI, 12, 22);

    assertNumberOfLocations(variableUsages, "PARENT-NESTED", 1);
    assertLocation(variableUsages, "PARENT-NESTED", DOCUMENT_URI, 12, 39);

    assertNumberOfLocations(variableUsages, "PARENT3", 1);
    assertLocation(variableUsages, "PARENT3", DOCUMENT_URI, 12, 56);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable definitions: " + variableDefinitions.toString(), 15, variableDefinitions.size());

    assertNumberOfLocations(variableDefinitions, "PARENT", 1);
    assertLocation(variableDefinitions, "PARENT", DOCUMENT_URI, 4, 10);
    assertNumberOfLocations(variableDefinitions, "PARENT2", 1);
    assertLocation(variableDefinitions, "PARENT2", DOCUMENT_URI, 5, 10);

    assertNumberOfLocations(variableDefinitions, "CHILD1", 1);
    assertLocation(variableDefinitions, "CHILD1", toURI(STRUC_NAME), 0, 15);
    assertNumberOfLocations(variableDefinitions, "CHILD2", 1);
    assertLocation(variableDefinitions, "CHILD2", toURI(STRUC_NAME), 1, 15);

    assertNumberOfLocations(variableDefinitions, "PARENT3", 1);
    assertLocation(variableDefinitions, "PARENT3", toURI(WITHNEST_NAME), 0, 10);
    assertNumberOfLocations(variableDefinitions, "CHILD3", 1);
    assertLocation(variableDefinitions, "CHILD3", toURI(WITHNEST_NAME), 1, 15);
    assertNumberOfLocations(variableDefinitions, "CHILD4", 1);
    assertLocation(variableDefinitions, "CHILD4", toURI(WITHNEST_NAME), 3, 15);
    assertNumberOfLocations(variableDefinitions, "CHILD5", 1);
    assertLocation(variableDefinitions, "CHILD5", toURI(WITHNEST_NAME), 5, 15);

    assertNumberOfLocations(variableDefinitions, "CHILD6", 1);
    assertLocation(variableDefinitions, "CHILD6", toURI(NESTED_NAME), 0, 15);
    assertNumberOfLocations(variableDefinitions, "CHILD7", 1);
    assertLocation(variableDefinitions, "CHILD7", toURI(NESTED_NAME), 1, 15);

    assertNumberOfLocations(variableDefinitions, "PARENT-NESTED", 1);
    assertLocation(variableDefinitions, "PARENT-NESTED", toURI(NESTED1_NAME), 0, 10);
    assertNumberOfLocations(variableDefinitions, "CHILD1-NESTED", 1);
    assertLocation(variableDefinitions, "CHILD1-NESTED", toURI(NESTED1_NAME), 1, 15);
    assertNumberOfLocations(variableDefinitions, "CHILD2-NESTED", 1);
    assertLocation(variableDefinitions, "CHILD2-NESTED", toURI(NESTED1_NAME), 2, 15);

    assertNumberOfLocations(variableDefinitions, "CHILD3-NESTED", 1);
    assertLocation(variableDefinitions, "CHILD3-NESTED", toURI(NESTED2_NAME), 0, 15);
    assertNumberOfLocations(variableDefinitions, "CHILD4-NESTED", 1);
    assertLocation(variableDefinitions, "CHILD4-NESTED", toURI(NESTED2_NAME), 1, 15);
  }
}
