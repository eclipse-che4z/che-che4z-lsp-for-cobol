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

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static java.util.Collections.singletonList;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * Test syntax errors found in a copybook displayed in the according file. Here, variable definition
 * in the copybook pasted to procedure division that is an error.
 */
public class TestErrorsInDifferentFiles {

  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      Procedure Division.\n"
          + "5      000-Main-Logic.\n"
          + "6      COPY ASDASD. \n"
          + "7          DISPLAY CHILD1.\n"
          + "8      End program ProgramId.";

  private static final String ASDASD = "           03  CHILD1         PIC 9   VALUE IS '0'.";

  private static final String ASDASD_NAME = "ASDASD";

  private static final String MAIN_LOGIC = "000-MAIN-LOGIC";
  private static final String CHILD1 = "CHILD1";

  @Test
  public void test() {
    AnalysisResult result = analyze(TEXT, singletonList(new CobolText(ASDASD_NAME, ASDASD)));
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
    assertEquals("Diagnostics: " + diagnostics.toString(), 3, numberOfDiagnostics);
    List<Diagnostic> documentDiagnostics = diagnostics.get(DOCUMENT_URI);

    Diagnostic invalidChild1 = documentDiagnostics.get(0);
    assertEquals("Invalid definition for: CHILD1", invalidChild1.getMessage());
    assertEquals(new Range(new Position(7, 19), new Position(7, 25)), invalidChild1.getRange());
    assertEquals(Information, invalidChild1.getSeverity());
    assertEquals("COBOL Language Support - I", invalidChild1.getSource());
    assertNull(invalidChild1.getCode());

    List<Diagnostic> copybookDiagnostics = diagnostics.get(toURI(ASDASD_NAME));

    Diagnostic unexpectedChild1 = copybookDiagnostics.get(0);
    assertEquals("Syntax error on 'CHILD1' expected SECTION", unexpectedChild1.getMessage());
    assertEquals(new Range(new Position(0, 15), new Position(0, 21)), unexpectedChild1.getRange());
    assertEquals(Error, unexpectedChild1.getSeverity());
    assertEquals("COBOL Language Support - E", unexpectedChild1.getSource());
    assertNull(unexpectedChild1.getCode());

    Diagnostic unexpectedPic = copybookDiagnostics.get(1);
    assertEquals("Syntax error on 'PIC' expected SECTION", unexpectedPic.getMessage());
    assertEquals(new Range(new Position(0, 30), new Position(0, 33)), unexpectedPic.getRange());
    assertEquals(Error, unexpectedPic.getSeverity());
    assertEquals("COBOL Language Support - E", unexpectedPic.getSource());
    assertNull(unexpectedPic.getCode());
  }

  private void assertParagraphUsages(Map<String, List<Location>> usages) {
    assertEquals("Paragraph usages: " + usages.toString(), 0, usages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Paragraph definitions: " + definitions.toString(), 1, definitions.size());
    assertNumberOfLocations(definitions, MAIN_LOGIC, 1);
    assertLocation(definitions, MAIN_LOGIC, DOCUMENT_URI, 5, 7);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 1, copybookDefinitions.size());
    assertCopybookDefinition(copybookDefinitions, ASDASD_NAME);
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 1, copybookUsages.size());
    assertNumberOfLocations(copybookUsages, ASDASD_NAME, 1);
    assertLocation(copybookUsages, ASDASD_NAME, DOCUMENT_URI, 6, 12);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Variable definitions: " + definitions.toString(), 0, definitions.size());
  }

  private void assertVariableUsages(Map<String, List<Location>> usages) {
    assertEquals("Variable usages: " + usages.toString(), 1, usages.size());

    assertNumberOfLocations(usages, CHILD1, 1);
    assertLocation(usages, CHILD1, DOCUMENT_URI, 7, 19);
  }
}
