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

import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_CHANGE;
import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_OPEN;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static java.util.Collections.emptyList;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * This test checks that the undefined parent variable underlined while variable call hierarchy
 * check.
 */
public class TestUndefinedParentVariableUnderlined {
  private static final String TEXT =
      "0       IDENTIFICATION DIVISION.\r\n"
          + "1       PROGRAM-ID. TEST1.\r\n"
          + "2       DATA DIVISION.\r\n"
          + "3       WORKING-STORAGE SECTION.\r\n"
          + "4       01   BORROWER.\r\n"
          + "5          05 AGE                   PIC 9(3).\r\n"
          + "6              10 MAMA PIC 99 VALUE 3.\r\n"
          + "7       PROCEDURE DIVISION.\r\n"
          + "8       PROCB.\r\n"
          + "9       MOVE 10 TO MAMA OF AGE OF BORROWE.\r\n"
          + "10      END PROGRAM TEST1.";

  private static final String PROCB = "PROCB";
  private static final String BORROWER = "BORROWER";
  private static final String BORROWE = "BORROWE";
  private static final String AGE = "AGE";
  private static final String MAMA = "MAMA";

  @Test
  public void assertSyncTypeNotChangesLogic() {
    assertEquals(analyze(TEXT, emptyList(), DID_OPEN), analyze(TEXT, emptyList(), DID_CHANGE));
  }

  @Test
  public void assertAnalysisResult() {
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
    assertEquals("Diagnostics: " + diagnostics.toString(), 2, numberOfDiagnostics);

    Diagnostic age = diagnostics.get(DOCUMENT_URI).get(1);
    assertEquals("Invalid definition for: AGE", age.getMessage());
    assertEquals(new Range(new Position(9, 27), new Position(9, 30)), age.getRange());
    assertEquals(Information, age.getSeverity());
    assertEquals("COBOL Language Support - I", age.getSource());
    assertNull(age.getCode());

    Diagnostic borrowe = diagnostics.get(DOCUMENT_URI).get(0);
    assertEquals("Invalid definition for: BORROWE", borrowe.getMessage());
    assertEquals(new Range(new Position(9, 34), new Position(9, 41)), borrowe.getRange());
    assertEquals(Information, borrowe.getSeverity());
    assertEquals("COBOL Language Support - I", borrowe.getSource());
    assertNull(borrowe.getCode());
  }

  private void assertParagraphUsages(Map<String, List<Location>> usages) {
    assertEquals("Paragraph usages: " + usages.toString(), 0, usages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Paragraph definitions: " + definitions.toString(), 1, definitions.size());
    assertNumberOfLocations(definitions, PROCB, 1);
    assertLocation(definitions, PROCB, DOCUMENT_URI, 8, 8);
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

    assertNumberOfLocations(definitions, BORROWER, 1);
    assertLocation(definitions, BORROWER, DOCUMENT_URI, 4, 13);

    assertNumberOfLocations(definitions, AGE, 1);
    assertLocation(definitions, AGE, DOCUMENT_URI, 5, 14);

    assertNumberOfLocations(definitions, MAMA, 1);
    assertLocation(definitions, MAMA, DOCUMENT_URI, 6, 18);
  }

  private void assertVariableUsages(Map<String, List<Location>> usages) {
    assertEquals("Variable usages: " + usages.toString(), 3, usages.size());

    assertNumberOfLocations(usages, BORROWE, 1);
    assertLocation(usages, BORROWE, DOCUMENT_URI, 9, 34);

    assertNumberOfLocations(usages, AGE, 1);
    assertLocation(usages, AGE, DOCUMENT_URI, 9, 27);

    assertNumberOfLocations(usages, MAMA, 1);
    assertLocation(usages, MAMA, DOCUMENT_URI, 9, 19);
  }
}
