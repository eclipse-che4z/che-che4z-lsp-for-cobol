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
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * This test checks that parser can find and underline an incorrect variable structure. Here CHILD1
 * is not a part of PARENT1 because they are on the same level, but on the line 8 they called the
 * way if CHILD1 was a part of PARENT1 structure. It is incorrect, so CHILD1 should be underlined.
 */
public class TestInvalidVariableStructureFound {
  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      01   PARENT1. \n"
          + "5      01   CHILD1 PIC 9. \n"
          + "6      Procedure Division.\n"
          + "7      000-Main-Logic.\n"
          + "8          MOVE 0 TO CHILD1 OF PARENT1.\n"
          + "9      End program ProgramId.";

  private static final String CHILD1 = "CHILD1";
  private static final String PARENT1 = "PARENT1";
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
    assertEquals("Diagnostics: " + diagnostics.toString(), 1, numberOfDiagnostics);

    Diagnostic invalidChild1 = diagnostics.get(DOCUMENT_URI).get(0);
    assertEquals("Invalid definition for: CHILD1", invalidChild1.getMessage());
    assertEquals(new Range(new Position(8, 21), new Position(8, 27)), invalidChild1.getRange());
    assertEquals(Information, invalidChild1.getSeverity());
    assertEquals("COBOL Language Support - I", invalidChild1.getSource());
    assertNull(invalidChild1.getCode());
  }

  private void assertParagraphUsages(Map<String, List<Location>> usages) {
    assertEquals("Paragraph usages: " + usages.toString(), 0, usages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Paragraph definitions: " + definitions.toString(), 1, definitions.size());
    assertNumberOfLocations(definitions, MAIN_LOGIC, 1);
    assertLocation(definitions, MAIN_LOGIC, DOCUMENT_URI, 7, 7);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 0, copybookDefinitions.size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 0, copybookUsages.size());
  }

  private void assertVariableDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Variable definitions: " + definitions.toString(), 2, definitions.size());

    assertNumberOfLocations(definitions, PARENT1, 1);
    assertLocation(definitions, PARENT1, DOCUMENT_URI, 4, 12);
    assertNumberOfLocations(definitions, CHILD1, 1);
    assertLocation(definitions, CHILD1, DOCUMENT_URI, 5, 12);
  }

  private void assertVariableUsages(Map<String, List<Location>> usages) {
    assertEquals("Variable usages: " + usages.toString(), 2, usages.size());

    assertNumberOfLocations(usages, PARENT1, 1);
    assertLocation(usages, PARENT1, DOCUMENT_URI, 8, 31);
    assertNumberOfLocations(usages, CHILD1, 1);
    assertLocation(usages, CHILD1, DOCUMENT_URI, 8, 21);
  }
}
