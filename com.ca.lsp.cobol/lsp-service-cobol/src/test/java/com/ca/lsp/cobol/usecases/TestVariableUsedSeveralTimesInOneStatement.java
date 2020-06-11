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
 * variables placed in one line found.
 */
public class TestVariableUsedSeveralTimesInOneStatement {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   PARENT1. \n"
          + "        02   CHILD      PIC 9(4) Binary. \n"
          + "       01   PARENT2.\n"
          + "        02   CHILD      PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       000-Main-Logic.\n"
          + "           MOVE CHILD IN PARENT1 TO CHILD IN PARENT2.\n"
          + "       End program ProgramId.";

  private static final String CHILD = "CHILD";
  private static final String PARENT1 = "PARENT1";
  private static final String PARENT2 = "PARENT2";
  private static final String MAIN_LOGIC = "000-MAIN-LOGIC";

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

  private void assertDiagnostics(Map<String, List<Diagnostic>> diagnostics) {
    long numberOfDiagnostics = diagnostics.values().stream().mapToLong(List::size).sum();
    assertEquals("Diagnostics: " + diagnostics.toString(), 0, numberOfDiagnostics);
  }

  private void assertParagraphUsages(Map<String, List<Location>> usages) {
    assertEquals("Paragraph usages: " + usages.toString(), 0, usages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Paragraph definitions: " + definitions.toString(), 1, definitions.size());
    assertNumberOfLocations(definitions, MAIN_LOGIC, 1);
    assertLocation(definitions, MAIN_LOGIC, DOCUMENT_URI, 9, 7);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 0, copybookDefinitions.size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 0, copybookUsages.size());
  }

  private void assertVariableDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Variable definitions: " + definitions.toString(), 3, definitions.size());

    assertNumberOfLocations(definitions, PARENT1, 1);
    assertLocation(definitions, PARENT1, DOCUMENT_URI, 4, 12);
    assertNumberOfLocations(definitions, PARENT2, 1);
    assertLocation(definitions, PARENT2, DOCUMENT_URI, 6, 12);
    assertNumberOfLocations(definitions, CHILD, 2);
    assertLocation(definitions, CHILD, DOCUMENT_URI, 5, 13);
    assertLocation(definitions, CHILD, DOCUMENT_URI, 7, 13);
  }

  private void assertVariableUsages(Map<String, List<Location>> usages) {
    assertEquals("Variable usages: " + usages.toString(), 3, usages.size());

    assertNumberOfLocations(usages, PARENT1, 1);
    assertLocation(usages, PARENT1, DOCUMENT_URI, 10, 25);
    assertNumberOfLocations(usages, PARENT2, 1);
    assertLocation(usages, PARENT2, DOCUMENT_URI, 10, 45);
    assertNumberOfLocations(usages, CHILD, 2);
    assertLocation(usages, CHILD, DOCUMENT_URI, 10, 16);
    assertLocation(usages, CHILD, DOCUMENT_URI, 10, 36);
  }
}
