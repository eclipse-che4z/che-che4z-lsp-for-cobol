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

/** This test checks that the grammar may process the entire program put into a copybook */
public class TestEntireProgramInCopybook {
  private static final String TEXT = "0       COPY PROGA.";
  private static final String PROGA =
      "0       IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. BKP92S1.        \n"
          + "2      DATA DIVISION.              \n"
          + "3      WORKING-STORAGE SECTION.    \n"
          + "4      01  PARENT.  COPY STRUCT1.  \n"
          + "5      PROCEDURE DIVISION.\n"
          + "6      MAINLINE.\n"
          + "7        MOVE 1 TO CHILD1.\n"
          + "8      GOBACK. ";

  private static final String STRUCT1 = "           03  CHILD1         PIC 9   VALUE IS '0'.\n";

  private static final String PROGA_NAME = "PROGA";
  private static final String PROGA_URI = toURI(PROGA_NAME);
  private static final String STRUCT1_NAME = "STRUCT1";
  private static final String STRUCT1_URI = toURI(STRUCT1_NAME);
  private static final String CHILD1 = "CHILD1";
  private static final String PARENT = "PARENT";
  private static final String MAINLINE = "MAINLINE";

  @Test
  public void assertAnalysisResult() {
    AnalysisResult result =
        analyze(
            TEXT, asList(new CobolText(PROGA_NAME, PROGA), new CobolText(STRUCT1_NAME, STRUCT1)));

    assertDiagnostics(result.getDiagnostics());

    assertCopybookUsages(result.getCopybookUsages());
    assertCopybookDefinitions(result.getCopybookDefinitions());

    assertVariableUsages(result.getVariableUsages());
    assertVariableDefinitions(result.getVariableDefinitions());

    assertParagraphDefinitions(result.getParagraphDefinitions());
    assertParagraphUsages(result.getParagraphUsages());
  }

  private void assertDiagnostics(Map<String, List<Diagnostic>> diagnostics) {
    String message = "Diagnostics: " + diagnostics.toString();
    assertEquals(message, 3, diagnostics.size());
    assertEquals(message, 0, diagnostics.get(DOCUMENT_URI).size());
    assertEquals(message, 0, diagnostics.get(PROGA_URI).size());
    assertEquals(message, 0, diagnostics.get(STRUCT1_URI).size());
  }

  private void assertParagraphUsages(Map<String, List<Location>> usages) {
    assertEquals("Paragraph usages: " + usages.toString(), 0, usages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Paragraph definitions: " + definitions.toString(), 1, definitions.size());
    assertNumberOfLocations(definitions, MAINLINE, 1);
    assertLocation(definitions, MAINLINE, PROGA_URI, 6, 7);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 2, copybookDefinitions.size());
    assertCopybookDefinition(copybookDefinitions, PROGA_NAME);
    assertCopybookDefinition(copybookDefinitions, STRUCT1_NAME);
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 2, copybookUsages.size());

    assertNumberOfLocations(copybookUsages, STRUCT1_NAME, 1);
    assertLocation(copybookUsages, STRUCT1_NAME, PROGA_URI, 4, 25);

    assertNumberOfLocations(copybookUsages, PROGA_NAME, 1);
    assertLocation(copybookUsages, PROGA_NAME, DOCUMENT_URI, 0, 13);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Variable definitions: " + definitions.toString(), 2, definitions.size());

    assertNumberOfLocations(definitions, PARENT, 1);
    assertLocation(definitions, PARENT, PROGA_URI, 4, 11);

    assertNumberOfLocations(definitions, CHILD1, 1);
    assertLocation(definitions, CHILD1, STRUCT1_URI, 0, 15);
  }

  private void assertVariableUsages(Map<String, List<Location>> usages) {
    assertEquals("Variable usages: " + usages.toString(), 1, usages.size());

    assertNumberOfLocations(usages, CHILD1, 1);
    assertLocation(usages, CHILD1, PROGA_URI, 7, 19);
  }
}
