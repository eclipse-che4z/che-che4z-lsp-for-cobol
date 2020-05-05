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

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;
import static org.junit.Assert.*;

/**
 * This test asserts syntax error on not defined variable. CHILD1 on line 6 is used, but not
 * defined, so it should be underlined.
 */
public class TestMessageIfVariableNotDefined {
  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      Procedure Division.\n"
          + "5      000-Main-Logic.\n"
          + "6          MOVE 0 TO CHILD1.\n"
          + "7      End program ProgramId.";

  private static final String CHILD1 = "CHILD1";
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

  private void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Diagnostics: " + diagnostics.toString(), 1, diagnostics.size());

    Diagnostic invalidChild1 = diagnostics.get(0);
    assertEquals("Invalid definition for: CHILD1", invalidChild1.getMessage());
    assertEquals(new Range(new Position(6, 21), new Position(6, 27)), invalidChild1.getRange());
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
    assertLocation(definitions, MAIN_LOGIC, DOCUMENT_URI, 5, 7);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 0, copybookDefinitions.size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 0, copybookUsages.size());
  }

  private void assertVariableDefinitions(Map<String, List<Location>> definitions) {
    assertEquals("Variable definitions: " + definitions.toString(), 0, definitions.size());
  }

  private void assertVariableUsages(Map<String, List<Location>> usages) {
    assertEquals("Variable usages: " + usages.toString(), 1, usages.size());

    assertNumberOfLocations(usages, CHILD1, 1);
    assertLocation(usages, CHILD1, DOCUMENT_URI, 6, 21);
  }

  private void assertNumberOfLocations(
      Map<String, List<Location>> source, String name, int number) {
    assertEquals("Number of " + name + " usages: ", number, source.get(name).size());
  }

  private void assertLocation(
      Map<String, List<Location>> source, String name, String uri, int line, int startChar) {
    List<Location> locations = source.get(name);
    Location expected =
        new Location(
            uri,
            new Range(
                new Position(line, startChar), new Position(line, startChar + name.length())));
    assertTrue(
        "Expected location for " + name + " not found: " + expected.toString(),
        locations.contains(expected));
  }
}
