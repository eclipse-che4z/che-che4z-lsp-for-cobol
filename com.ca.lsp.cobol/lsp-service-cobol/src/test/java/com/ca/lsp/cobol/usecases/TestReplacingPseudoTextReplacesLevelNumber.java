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
import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;

/**
 * Test replacing with changing variable number returns a correct structure. Here, "01 AA-PARENT"
 * replaced by "05 EE-PARENT" that should change the structure to PARENT -> EE-PARENT
 */
public class TestReplacingPseudoTextReplacesLevelNumber {

  private static final String DOCUMENT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      01  PARENT.\n"
          + "5      COPY REPL REPLACING == 01 AA-PARENT == BY == 05  EE-PARENT ==\n"
          + "6                          ==AA-CHILD1==    BY ==EE-CHILD1==\n"
          + "7                          ==AA-CHILD2==    BY ==EE-CHILD2==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9      MAINLINE.\n"
          + "10     MOVE 0 TO EE-CHILD1 OF EE-PARENT OF PARENT.\n"
          + "11     GOBACK. ";

  private static final String REPL =
      "0      01  AA-PARENT.\n"
          + "1        10  AA-CHILD1      PIC 9.\n"
          + "2        10  AA-CHILD2    PIC X(1).";

  private static final String REPL_NAME = "REPL";
  private static final String REPL_URI = toURI(REPL_NAME);

  private static final String PARENT = "PARENT";
  private static final String EE_PARENT = "EE-PARENT";
  private static final String EE_CHILD1 = "EE-CHILD1";
  private static final String EE_CHILD2 = "EE-CHILD2";

  private static final String MAINLINE = "MAINLINE";

  @Test
  public void test() {
    AnalysisResult result = analyze(DOCUMENT, singletonList(new CobolText(REPL_NAME, REPL)));

    assertDiagnostics(result.getDiagnostics());

    assertCopybookUsages(result.getCopybookUsages());
    assertCopybookDefinitions(result.getCopybookDefinitions());

    assertVariableDefinitions(result.getVariableDefinitions());
    assertVariableUsages(result.getVariableUsages());

    assertParagraphDefinitions(result.getParagraphDefinitions());
    assertParagraphUsages(result.getParagraphUsages());
  }

  private void assertDiagnostics(Map<String, List<Diagnostic>> diagnostics) {
    String message = "Diagnostics: " + diagnostics.toString();
    assertEquals(message, 0, diagnostics.get(DOCUMENT_URI).size());
    assertEquals(message, 0, diagnostics.get(REPL_URI).size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 1, copybookUsages.size());
    assertNumberOfLocations(copybookUsages, REPL_NAME, 1);
    assertLocation(copybookUsages, REPL_NAME, DOCUMENT_URI, 5, 12);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 1, copybookDefinitions.size());
    assertCopybookDefinition(copybookDefinitions, REPL_NAME);
  }

  private void assertParagraphUsages(Map<String, List<Location>> paragraphUsages) {
    assertEquals("Paragraph usages: " + paragraphUsages.toString(), 0, paragraphUsages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> paragraphDefinitions) {
    assertEquals(
        "Paragraph definitions: " + paragraphDefinitions.toString(),
        1,
        paragraphDefinitions.size());

    assertNumberOfLocations(paragraphDefinitions, MAINLINE, 1);
    assertLocation(paragraphDefinitions, MAINLINE, DOCUMENT_URI, 9, 7);
  }

  private void assertVariableUsages(Map<String, List<Location>> variableUsages) {
    assertEquals("Variable usages: " + variableUsages.toString(), 3, variableUsages.size());

    assertNumberOfLocations(variableUsages, PARENT, 1);
    assertLocation(variableUsages, PARENT, DOCUMENT_URI, 10, 43);

    assertNumberOfLocations(variableUsages, EE_PARENT, 1);
    assertLocation(variableUsages, EE_PARENT, DOCUMENT_URI, 10, 30);

    assertNumberOfLocations(variableUsages, EE_CHILD1, 1);
    assertLocation(variableUsages, EE_CHILD1, DOCUMENT_URI, 10, 17);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable definitions: " + variableDefinitions.toString(), 4, variableDefinitions.size());

    assertNumberOfLocations(variableDefinitions, PARENT, 1);
    assertLocation(variableDefinitions, PARENT, DOCUMENT_URI, 4, 11);

    assertNumberOfLocations(variableDefinitions, EE_PARENT, 1);
    assertLocation(variableDefinitions, EE_PARENT, REPL_URI, 0, 11);

    assertNumberOfLocations(variableDefinitions, EE_CHILD1, 1);
    assertLocation(variableDefinitions, EE_CHILD1, REPL_URI, 1, 13);

    assertNumberOfLocations(variableDefinitions, EE_CHILD2, 1);
    assertLocation(variableDefinitions, EE_CHILD2, REPL_URI, 2, 13);
  }
}
