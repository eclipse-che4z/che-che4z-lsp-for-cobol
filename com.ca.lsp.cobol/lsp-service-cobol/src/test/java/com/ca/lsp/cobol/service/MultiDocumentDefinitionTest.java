/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol.service;

import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;
import org.junit.Before;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.toURI;
import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;

/**
 * This test verifies that the definition positions for semantic elements from copybooks contain
 * URIs to these copybooks. If a semantic element defined in the currently open document, the URI
 * should represent this document.
 */
public class MultiDocumentDefinitionTest extends ConfigurableTest {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT.   COPY STRUCT.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO CHILD1 OF PARENT."
          + "       COPY PARS."
          + "       PERFORM PAR2.";

  private static final String STRUCT =
      "       02  PARENT2.\n"
          + "           03  CHILD1         PIC 9   VALUE IS '0'.\n"
          + "           03  CHILD2         PIC 9   VALUE IS '1'.\n"
          + "           03  CHILD3         PIC 9   VALUE IS '2'.";
  private static final String PARS =
      "       PAR1.\n"
          + "           DISPLAY \"PAR1\".\n"
          + "       PAR2.\n"
          + "           DISPLAY \"PAR2\".\n";

  private AnalysisResult analysisResult;

  @Before
  public void prepareAnalysisResult() {
    analysisResult =
        analyze(TEXT, asList(new CobolText("STRUCT", STRUCT), new CobolText("PARS", PARS)));
  }

  @Test
  public void testVariableDefinitions() {
    Map<String, List<Location>> variableDefinitions = analysisResult.getVariableDefinitions();
    assertEquals(5, variableDefinitions.size());

    assertEquals(toURI("STRUCT"), variableDefinitions.get("CHILD1").get(0).getUri());
  }

  @Test
  public void testParagraphDefinition() {
    Map<String, List<Location>> paragraphDefinitions = analysisResult.getParagraphDefinitions();
    assertEquals(2, paragraphDefinitions.size());

    assertEquals(toURI("PARS"), paragraphDefinitions.get("PAR2").get(0).getUri());
  }
}
