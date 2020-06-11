/*
 *
 *  * Copyright (c) 2020 Broadcom.
 *  *
 *  * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *  *
 *  * This program and the accompanying materials are made
 *  * available under the terms of the Eclipse Public License 2.0
 *  * which is available at https://www.eclipse.org/legal/epl-2.0/
 *  *
 *  * SPDX-License-Identifier: EPL-2.0
 *  *
 *  * Contributors:
 *  * Broadcom, Inc. - initial API and implementation
 *  *
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
import static org.junit.Assert.assertEquals;

/**
 * This test checks that there is no error thrown when there are several COPY statements one by one
 * with the same name in different cases.
 */
public class TestSameCopybooksWithDifferentCases {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT.   COPY STRUCT1.\n"
          + "       COPY Struct1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO CHILD1 OF PARENT.";

  private static final String STRUCT1 =
      "       02  PARENT2.\n"
          + "           03  CHILD1         PIC 9   VALUE IS '0'.\n"
          + "           03  CHILD2         PIC 9   VALUE IS '1'.\n"
          + "           03  CHILD3         PIC 9   VALUE IS '2'.";

  private static final String CPY_NAME = "STRUCT1";

  @Test
  public void test() {
    AnalysisResult result = analyze(TEXT, singletonList(new CobolText(CPY_NAME, STRUCT1)));

    assertDiagnostics(result);
    assertCopybookUsages(result);
    assertCopybookDefinitions(result);
    assertVariableDefinitions(result);
    assertVariableUsages(result);
  }

  private void assertDiagnostics(AnalysisResult result) {
    Map<String, List<Diagnostic>> diagnostics = result.getDiagnostics();
    assertEquals(createMessage(diagnostics), 0, diagnostics.get(DOCUMENT_URI).size());
    assertEquals(createMessage(diagnostics), 0, diagnostics.get(toURI(CPY_NAME)).size());
  }

  private void assertCopybookUsages(AnalysisResult result) {
    Map<String, List<Location>> copybookUsages = result.getCopybookUsages();
    assertEquals("Number of copybook usages", 1, copybookUsages.size());
    List<Location> struct1Usages = copybookUsages.get("STRUCT1");
    assertEquals("Number of STRUCT1 usages", 2, struct1Usages.size());

    assertLocation(struct1Usages.get(0), DOCUMENT_URI, 4, 26, CPY_NAME.length());
    assertLocation(struct1Usages.get(1), DOCUMENT_URI, 5, 12, CPY_NAME.length());
  }

  private void assertCopybookDefinitions(AnalysisResult result) {
    Map<String, List<Location>> copybookDefinitions = result.getCopybookDefinitions();
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 1, copybookDefinitions.size());
    assertCopybookDefinition(copybookDefinitions, "STRUCT1");
  }

  private void assertVariableDefinitions(AnalysisResult result) {
    Map<String, List<Location>> variableDefinitions = result.getVariableDefinitions();
    assertEquals("Number of defined variables", 5, variableDefinitions.size());

    List<Location> parentDefinition = variableDefinitions.get("PARENT");
    assertEquals("NUmber of PARENT definitions", 1, parentDefinition.size());
    assertLocation(parentDefinition.get(0), DOCUMENT_URI, 4, 11, "PARENT".length());

    assertCopybookVariableDefinitions(variableDefinitions, "PARENT2", 0, 11);
    assertCopybookVariableDefinitions(variableDefinitions, "CHILD1", 1, 15);
    assertCopybookVariableDefinitions(variableDefinitions, "CHILD2", 2, 15);
    assertCopybookVariableDefinitions(variableDefinitions, "CHILD3", 3, 15);
  }

  private void assertVariableUsages(AnalysisResult result) {

    Map<String, List<Location>> variableUsages = result.getVariableUsages();
    assertEquals("Number of used variables", 2, variableUsages.size());
    assertVariableUsage(variableUsages, "CHILD1", 18);
    assertVariableUsage(variableUsages, "PARENT", 28);
  }

  private void assertVariableUsage(
      Map<String, List<Location>> variableUsages, String varName, int startCharacter) {
    List<Location> child1 = variableUsages.get(varName);
    assertEquals("Number of " + varName + " usages", 1, child1.size());
    assertLocation(child1.get(0), DOCUMENT_URI, 7, startCharacter, varName.length());
  }

  private void assertCopybookVariableDefinitions(
      Map<String, List<Location>> variableDefinitions,
      String varName,
      int line,
      int startCharacter) {
    List<Location> parent2definitions = variableDefinitions.get(varName);
    assertEquals("Number of " + varName + " definitions", 1, parent2definitions.size());
    assertLocation(
        parent2definitions.get(0), toURI(CPY_NAME), line, startCharacter, varName.length());
  }

  private void assertLocation(
      Location location, String uri, int lineNumber, int startPosition, int nameLength) {
    assertEquals(uri, location.getUri());
    Range range = location.getRange();

    Position start = range.getStart();
    Position end = range.getEnd();

    assertEquals("Location start line", lineNumber, start.getLine());
    assertEquals("Location start character", startPosition, start.getCharacter());
    assertEquals("Location end line", lineNumber, end.getLine());
    assertEquals("Location end character", startPosition + nameLength, end.getCharacter());
  }

  private String createMessage(Map<String, List<Diagnostic>> diagnostics) {
    return diagnostics.values().stream()
        .flatMap(List::stream)
        .map(Diagnostic::getMessage)
        .reduce((x, y) -> x + "\r\n" + y)
        .orElse("");
  }
}
