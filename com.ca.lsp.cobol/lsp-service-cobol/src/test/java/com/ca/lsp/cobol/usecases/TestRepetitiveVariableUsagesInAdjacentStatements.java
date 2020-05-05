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

import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static org.junit.Assert.assertEquals;

/**
 * This test checks that document with multi-definitions parsed correctly and all the usages of
 * variables placed in a row retrieved.
 */
public class TestRepetitiveVariableUsagesInAdjacentStatements {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   outer1. \n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       01   outer2.\n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       01   Str          PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       000-Main-Logic.\n"
          + "           Perform 100-Test.\n"
          + "           Stop Run.\n"
          + "       100-Test.\n"
          + "           Move inner1 of outer1 to Str.\n"
          + "           Move inner2 of outer1 to Str.\n"
          + "           Move inner1 of outer2 to Str.\n"
          + "           Move inner2 of outer2 to Str.\n"
          + "       End program ProgramId.";

  private static final String OUTER1 = "OUTER1";
  private static final String OUTER2 = "OUTER2";
  private static final String INNER1 = "INNER1";
  private static final String INNER2 = "INNER2";
  private static final String STR = "STR";
  private static final String MAIN_LOGIC = "000-MAIN-LOGIC";
  private static final String TEST = "100-TEST";

  @Test
  public void test() {
    AnalysisResult result = analyze(TEXT);

    assertDiagnostics(result.getDiagnostics());

    assertCopybookUsages(result.getCopybookUsages());
    assertCopybookDefinitions(result.getCopybookDefinitions());

    assertVariableUsages(result.getVariableUsages());
    assertVariableDefinitions(result.getVariableDefinitions());

    assertParagraphDefinitions(result.getParagraphDefinitions());
    assertParagraphUsages(result.getParagraphUsages());
  }

  private void assertParagraphUsages(Map<String, List<Location>> usages) {
    assertEquals("Paragraph usages: " + usages.toString(), 1, usages.size());

    assertNumberOfLocations(usages, TEST, 1);
    assertLocation(usages, TEST, DOCUMENT_URI, 13, 19);
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Paragraph definitions: " + definitions.toString(), 2, definitions.size());

    assertNumberOfLocations(definitions, TEST, 1);
    assertLocation(definitions, TEST, DOCUMENT_URI, 15, 7);

    assertNumberOfLocations(definitions, MAIN_LOGIC, 1);
    assertLocation(definitions, MAIN_LOGIC, DOCUMENT_URI, 12, 7);
  }

  private void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Diagnostics: " + diagnostics.toString(), 0, diagnostics.size());
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 0, copybookDefinitions.size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 0, copybookUsages.size());
  }

  private void assertVariableDefinitions(Map<String, List<Location>> definions) {
    assertEquals("Variable definitions: " + definions.toString(), 5, definions.size());
    assertLocation(definions, OUTER1, DOCUMENT_URI, 4, 12);
    assertLocation(definions, OUTER2, DOCUMENT_URI, 7, 12);
    assertLocation(definions, STR, DOCUMENT_URI, 10, 12);

    List<Location> inner1 = definions.get(INNER1);

    assertEquals("Number of " + INNER1 + " definitions: ", 2, inner1.size());

    assertLocation(definions, INNER1, DOCUMENT_URI, 5, 13);
    assertLocation(definions, INNER1, DOCUMENT_URI, 8, 13);

    List<Location> inner2 = definions.get(INNER2);

    assertEquals("Number of " + INNER2 + " definitions: ", 2, inner2.size());
    assertLocation(definions, INNER2, DOCUMENT_URI, 6, 13);
    assertLocation(definions, INNER2, DOCUMENT_URI, 9, 13);
  }

  private void assertVariableUsages(Map<String, List<Location>> usages) {
    assertEquals("Variable usages: " + usages.toString(), 5, usages.size());

    assertNumberOfLocations(usages, INNER1, 2);
    assertLocation(usages, INNER1, DOCUMENT_URI, 16, 16);
    assertLocation(usages, INNER1, DOCUMENT_URI, 18, 16);

    assertNumberOfLocations(usages, INNER2, 2);
    assertLocation(usages, INNER2, DOCUMENT_URI, 17, 16);
    assertLocation(usages, INNER2, DOCUMENT_URI, 19, 16);

    assertNumberOfLocations(usages, OUTER1, 2);
    assertLocation(usages, OUTER1, DOCUMENT_URI, 16, 26);
    assertLocation(usages, OUTER1, DOCUMENT_URI, 17, 26);

    assertNumberOfLocations(usages, OUTER2, 2);
    assertLocation(usages, OUTER2, DOCUMENT_URI, 19, 26);
    assertLocation(usages, OUTER2, DOCUMENT_URI, 18, 26);

    assertNumberOfLocations(usages, STR, 4);
    assertLocation(usages, STR, DOCUMENT_URI, 16, 36);
    assertLocation(usages, STR, DOCUMENT_URI, 17, 36);
    assertLocation(usages, STR, DOCUMENT_URI, 18, 36);
    assertLocation(usages, STR, DOCUMENT_URI, 19, 36);
  }
}
