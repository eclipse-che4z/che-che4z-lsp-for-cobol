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
 * Test REPLACING with literals applied only for full tokens. Here, applying "B BY VARC" should not
 * affect VARB
 */
public class TestReplacingIdentifiersAppliedForFullTokens {
  private static final String DOCUMENT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      COPY REPL REPLACING A BY VARB\n"
          + "5                          B BY VARC\n"
          + "6                          C BY VARD\n"
          + "7                          D BY VARE.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9      MAINLINE.\n"
          + "10     MOVE 00 TO VARC OF VARB.\n"
          + "11     GOBACK. ";

  private static final String REPL =
      "0      01  A.\n"
          + "1      02  B    PIC S99.\n"
          + "2      02  C    PIC S9(5)V99.\n"
          + "3      02  D    PIC S99 OCCURS 1 TO 10 TIMES\n"
          + "4      DEPENDING ON B OF A.";

  private static final String REPL_NAME = "REPL";
  private static final String REPL_URI = toURI(REPL_NAME);

  private static final String MAINLINE = "MAINLINE";
  private static final String VARB = "VARB";
  private static final String VARC = "VARC";
  private static final String VARD = "VARD";
  private static final String VARE = "VARE";

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
    assertLocation(copybookUsages, REPL_NAME, DOCUMENT_URI, 4, 12);
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
    assertEquals("Variable usages: " + variableUsages.toString(), 2, variableUsages.size());

    assertNumberOfLocations(variableUsages, VARB, 2);
    assertLocation(variableUsages, VARB, DOCUMENT_URI, 10, 26);
    assertLocation(variableUsages, VARB, REPL_URI, 4, 28);

    assertNumberOfLocations(variableUsages, VARC, 2);
    assertLocation(variableUsages, VARC, DOCUMENT_URI, 10, 18);
    assertLocation(variableUsages, VARC, REPL_URI, 4, 20);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable definitions: " + variableDefinitions.toString(), 4, variableDefinitions.size());

    assertNumberOfLocations(variableDefinitions, VARB, 1);
    assertLocation(variableDefinitions, VARB, REPL_URI, 0, 11);

    assertNumberOfLocations(variableDefinitions, VARC, 1);
    assertLocation(variableDefinitions, VARC, REPL_URI, 1, 11);

    assertNumberOfLocations(variableDefinitions, VARD, 1);
    assertLocation(variableDefinitions, VARD, REPL_URI, 2, 11);

    assertNumberOfLocations(variableDefinitions, VARE, 1);
    assertLocation(variableDefinitions, VARE, REPL_URI, 3, 11);
  }
}
