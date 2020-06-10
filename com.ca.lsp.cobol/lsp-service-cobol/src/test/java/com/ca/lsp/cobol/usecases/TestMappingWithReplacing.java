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
 * This test verifies that the replacing statement changes the variable names in the given copybook
 * by the provided pattern. Here, :TAG: should be replaced with CSTOUT, so the copybook content
 * processed as CSTOUT-KEY and CSTOUT-ID, and those variables are available for "Go to Definition"
 * request.
 */
public class TestMappingWithReplacing {

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

  private static final String CUSTCOPY_URI = toURI("CUSTCOPY");

  @Test
  public void test() {
    AnalysisResult result = analyze(DOCUMENT, singletonList(new CobolText("CUSTCOPY", CUSTCOPY)));

    assertDiagnostics(result.getDiagnostics());

    assertCopybookUsages(result.getCopybookUsages());
    assertCopybookDefinitions(result.getCopybookDefinitions());

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
    assertNumberOfLocations(copybookUsages, "CUSTCOPY", 1);
    assertLocation(copybookUsages, "CUSTCOPY", DOCUMENT_URI, 5, 12);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 1, copybookDefinitions.size());
    assertCopybookDefinition(copybookDefinitions, "CUSTCOPY");
  }

  private void assertParagraphUsages(Map<String, List<Location>> paragraphUsages) {
    assertEquals("Paragraph usages: " + paragraphUsages.toString(), 0, paragraphUsages.size());
  }

  private void assertParagraphDefinitions(Map<String, List<Location>> paragraphDefinitions) {
    assertEquals(
        "Paragraph definitions: " + paragraphDefinitions.toString(),
        1,
        paragraphDefinitions.size());

    assertNumberOfLocations(paragraphDefinitions, "MAINLINE", 1);
    assertLocation(paragraphDefinitions, "MAINLINE", DOCUMENT_URI, 7, 7);
  }

  private void assertVariableUsages(Map<String, List<Location>> variableUsages) {
    assertEquals("Variable usages: " + variableUsages.toString(), 3, variableUsages.size());

    assertNumberOfLocations(variableUsages, "PARENT", 1);
    assertLocation(variableUsages, "PARENT", DOCUMENT_URI, 8, 48);

    assertNumberOfLocations(variableUsages, "CSTOUT-KEY", 1);
    assertLocation(variableUsages, "CSTOUT-KEY", DOCUMENT_URI, 8, 34);

    assertNumberOfLocations(variableUsages, "CSTOUT-ID", 1);
    assertLocation(variableUsages, "CSTOUT-ID", DOCUMENT_URI, 8, 21);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable usages: " + variableDefinitions.toString(), 3, variableDefinitions.size());

    assertNumberOfLocations(variableDefinitions, "PARENT", 1);
    assertLocation(variableDefinitions, "PARENT", DOCUMENT_URI, 4, 11);

    assertNumberOfLocations(variableDefinitions, "CSTOUT-KEY", 1);
    assertLocation(variableDefinitions, "CSTOUT-KEY", CUSTCOPY_URI, 0, 15);

    assertNumberOfLocations(variableDefinitions, "CSTOUT-ID", 1);
    assertLocation(variableDefinitions, "CSTOUT-ID", CUSTCOPY_URI, 1, 19);
  }
}
