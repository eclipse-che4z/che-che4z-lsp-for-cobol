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

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;
import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;

public class TestMappingWIthReplacing {

  private static final String DOCUMENT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01  PARENT.\r\n"
          + "       COPY CUSTCOPY REPLACING ==:TAG:== BY ==CSTOUT==.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       MAINLINE.\r\n"
          + "           MOVE 1 TO CSTOUT-ID OF CSTOUT-KEY OF PARENT.\r\n"
          + "       GOBACK.";

  private static final String CUSTCOPY =
      "           05  :TAG:-KEY.\r\n" + "               10  :TAG:-ID             PIC 9.\r\n";

  @Test
  public void test() {
    AnalysisResult result = analyze(DOCUMENT, singletonList(new CobolText("CUSTCOPY", CUSTCOPY)));

    assertDiagnostics(result.getDiagnostics());
    assertCopybookUsages(result.getCopybookUsages());

    assertVariableDefinitions(result.getVariableDefinitions());
    assertVariableUsages(result.getVariableUsages());

    assertParagraphDefinitions(result.getParagraphDefinitions());
    assertParagraphUsages(result.getParagraphUsages());
  }

  private void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Diagnostics: " + diagnostics.toString(), 0, diagnostics.size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 1, copybookUsages.size());
    assertSingleLocation(copybookUsages, "CUSTCOPY", DOCUMENT_URI, 5, 12);
  }

  private void assertParagraphUsages(Map<String, List<Location>> paragraphUsages) {
    assertEquals("Paragraph usages: " + paragraphUsages.toString(), 0, paragraphUsages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> paragraphDefinitions) {
    assertEquals(
        "Paragraph definitions: " + paragraphDefinitions.toString(),
        1,
        paragraphDefinitions.size());
    assertSingleLocation(paragraphDefinitions, "MAINLINE", DOCUMENT_URI, 7, 7);
  }

  private void assertVariableUsages(Map<String, List<Location>> variableUsages) {
    assertEquals("Variable usages: " + variableUsages.toString(), 3, variableUsages.size());

    assertSingleLocation(variableUsages, "PARENT", DOCUMENT_URI, 8, 48);
    assertSingleLocation(variableUsages, "CSTOUT-KEY", DOCUMENT_URI, 8, 34);
    assertSingleLocation(variableUsages, "CSTOUT-ID", DOCUMENT_URI, 8, 21);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable usages: " + variableDefinitions.toString(), 3, variableDefinitions.size());
    assertSingleLocation(variableDefinitions, "PARENT", DOCUMENT_URI, 4, 11);
    assertSingleLocation(variableDefinitions, "CSTOUT-KEY", "CUSTCOPY", 0, 15);
    assertSingleLocation(variableDefinitions, "CSTOUT-ID", "CUSTCOPY", 1, 19);
  }

  private void assertSingleLocation(
      Map<String, List<Location>> source, String name, String parent, int line, int start) {
    List<Location> locations = source.get(name);

    assertEquals("Number of " + name + "locations: ", 1, locations.size());
    assertEquals(
        name + " location:",
        new Location(
            parent,
            new Range(new Position(line, start), new Position(line, start + name.length()))),
        locations.get(0));
  }
}
