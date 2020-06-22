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

/** Test missing nested copybooks produce syntax errors in parent copybooks. */
public class TestMissingNestedCopybookProducesError {

  private static final String DOCUMENT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      01  PARENT.\n"
          + "5      COPY REPL REPLACING ==TAG== BY ==ABC==.\n"
          + "6      PROCEDURE DIVISION.\n"
          + "7      MAINLINE.\n"
          + "8      MOVE 0 TO ABC-ID.\n"
          + "9      GOBACK. ";

  private static final String REPL = "       05 TAG-ID PIC 9.\n" + "       COPY CPYNAME.";
  private static final String REPL_NAME = "REPL";
  private static final String REPL_URI = toURI(REPL_NAME);

  private static final String CPYNAME = "CPYNAME";
  private static final String PARENT = "PARENT";
  private static final String MAINLINE = "MAINLINE";
  private static final String ABC_ID = "ABC-ID";

  @Test
  public void test() {
    AnalysisResult result = analyze(DOCUMENT, singletonList(new CobolText(REPL_NAME, REPL)));

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
    assertEquals(message, 1, diagnostics.get(REPL_URI).size());
  }

  private void assertCopybookUsages(Map<String, List<Location>> copybookUsages) {
    assertEquals("Copybook usages: " + copybookUsages.toString(), 2, copybookUsages.size());
    assertNumberOfLocations(copybookUsages, REPL_NAME, 1);
    assertLocation(copybookUsages, REPL_NAME, DOCUMENT_URI, 5, 12);
    assertNumberOfLocations(copybookUsages, CPYNAME, 1);
    assertLocation(copybookUsages, CPYNAME, REPL_URI, 1, 12);
  }

  private void assertCopybookDefinitions(Map<String, List<Location>> copybookDefinitions) {
    assertEquals(
        "Copybook definitions: " + copybookDefinitions.toString(), 1, copybookDefinitions.size());
    assertCopybookDefinition(copybookDefinitions, REPL_NAME);
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
    assertLocation(paragraphDefinitions, MAINLINE, DOCUMENT_URI, 7, 7);
  }

  private void assertVariableUsages(Map<String, List<Location>> variableUsages) {
    assertEquals("Variable usages: " + variableUsages.toString(), 1, variableUsages.size());

    assertNumberOfLocations(variableUsages, ABC_ID, 1);
    assertLocation(variableUsages, ABC_ID, DOCUMENT_URI, 8, 17);
  }

  private void assertVariableDefinitions(Map<String, List<Location>> variableDefinitions) {
    assertEquals(
        "Variable definitions: " + variableDefinitions.toString(), 2, variableDefinitions.size());

    assertNumberOfLocations(variableDefinitions, PARENT, 1);
    assertLocation(variableDefinitions, PARENT, DOCUMENT_URI, 4, 11);

    assertNumberOfLocations(variableDefinitions, ABC_ID, 1);
    assertLocation(variableDefinitions, ABC_ID, REPL_URI, 0, 10);
  }
}
