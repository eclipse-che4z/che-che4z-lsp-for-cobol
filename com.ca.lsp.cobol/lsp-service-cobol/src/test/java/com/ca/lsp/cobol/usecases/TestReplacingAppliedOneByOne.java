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
 * This test checks that the REPLACING statement applied one by one will be collapsed to show only
 * the resulting replacement. Here, 'ABC' replaced by 'DEF', 'DEF' by 'GHI', and 'GHI' by 'JKL' in a
 * row, so the variable ABC-ID should turn into JKL-ID.
 */
public class TestReplacingAppliedOneByOne {

  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\r\n"
          + "1      PROGRAM-ID. TEST1.\r\n"
          + "2      DATA DIVISION.\r\n"
          + "3      WORKING-STORAGE SECTION.\r\n"
          + "4      COPY CUSTCOPY REPLACING ==ABC== BY ==DEF==\r\n"
          + "5                              ==DEF== BY ==GHI==\r\n"
          + "6                              ==GHI== BY ==JKL==.\r\n"
          + "7      PROCEDURE DIVISION.\r\n"
          + "8      MAINLINE.\r\n"
          + "9          MOVE 1 TO JKL-ID OF JKL-KEY.\r\n"
          + "10     GOBACK.";

  private static final String CUSTCOPY =
      "           05  ABC-KEY.\r\n" + "               10  ABC-ID             PIC 9.\r\n";

  private static final String CUSTCOPY_URI = toURI("CUSTCOPY");
  private static final String CUSTCOPY_NAME = "CUSTCOPY";

  private static final String JKL_ID = "JKL-ID";
  private static final String JKL_KEY = "JKL-KEY";
  private static final String MAINLINE = "MAINLINE";

  @Test
  public void test() {
    AnalysisResult result = analyze(TEXT, singletonList(new CobolText("CUSTCOPY", CUSTCOPY)));

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
    assertEquals(message, 0, diagnostics.get(CUSTCOPY_URI).size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 1, copybookUsages.size());
    assertNumberOfLocations(copybookUsages, CUSTCOPY_NAME, 1);
    assertLocation(copybookUsages, CUSTCOPY_NAME, DOCUMENT_URI, 4, 12);
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

    assertNumberOfLocations(paragraphDefinitions, MAINLINE, 1);
    assertLocation(paragraphDefinitions, MAINLINE, DOCUMENT_URI, 8, 7);
  }

  private void assertVariableUsages(Map<String, List<Location>> variableUsages) {
    assertEquals("Variable usages: " + variableUsages.toString(), 2, variableUsages.size());

    assertNumberOfLocations(variableUsages, JKL_ID, 1);
    assertLocation(variableUsages, JKL_ID, DOCUMENT_URI, 9, 21);

    assertNumberOfLocations(variableUsages, JKL_KEY, 1);
    assertLocation(variableUsages, JKL_KEY, DOCUMENT_URI, 9, 31);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable definitions: " + variableDefinitions.toString(), 2, variableDefinitions.size());

    assertNumberOfLocations(variableDefinitions, JKL_KEY, 1);
    assertLocation(variableDefinitions, JKL_KEY, CUSTCOPY_URI, 0, 15);

    assertNumberOfLocations(variableDefinitions, JKL_ID, 1);
    assertLocation(variableDefinitions, JKL_ID, CUSTCOPY_URI, 1, 19);
  }
}
