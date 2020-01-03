/*
 *
 *  Copyright (c) 2019 Broadcom.
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
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;
import org.junit.Before;
import org.junit.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;
import static org.junit.Assert.assertEquals;

/** This class checks that all the semantic elements definitions and usages are found correctly */
public class DefinitionsAndUsagesTest extends ConfigurableTest {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   outer1. \n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       01   outer2.\n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       01   Str          PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       000-Main-Logic.\n"
          + "           Perform 100-Test.\n"
          + "           Stop Run.\n"
          + "       100-Test.\n"
          + "           Move inner1 of outer1 to Str.\n"
          + "           Move inner2 of outer1 to Str.\n"
          + "           Move inner1 of outer2 to Str.\n"
          + "           Move inner2 of outer2 to Str.\n"
          + "       End program ProgramId.";

  private static final String OUTER1 = "OUTER1";
  private static final String INNER1 = "INNER1";
  private static final String STR = "STR";
  private static final String MAIN_LOGIC = "000-MAIN-LOGIC";
  private static final String TEST = "100-TEST";

  private AnalysisResult analysisResult;

  @Before
  public void createService() {
    analysisResult = analyze(TEXT);
  }

  @Test
  public void testRecognitionForVariables() {
    assertEquals(analysisResult.getVariables().toString(), 5, analysisResult.getVariables().size());

    Map<String, List<Location>> definitions = analysisResult.getVariableDefinitions();
    assertEquals(definitions.keySet().toString(), 5, definitions.size());
    assertEquals(definitions.keySet().toString(), 1, definitions.get(OUTER1).size());
    assertEquals(definitions.keySet().toString(), 2, definitions.get(INNER1).size());

    Map<String, List<Location>> usages = analysisResult.getVariableUsages();
    assertEquals(usages.keySet().toString(), 5, usages.size());
    assertEquals(usages.keySet().toString(), 2, usages.get(OUTER1).size());
    assertEquals(usages.keySet().toString(), 2, usages.get(INNER1).size());
    assertEquals(usages.keySet().toString(), 4, usages.get(STR).size());
  }

  @Test
  public void testRecognitionForParagraphs() {
    assertEquals(
        analysisResult.getParagraphs().toString(), 2, analysisResult.getParagraphs().size());

    Map<String, List<Location>> definitions = analysisResult.getParagraphDefinitions();
    assertEquals(definitions.keySet().toString(), 2, definitions.size());
    assertEquals(definitions.keySet().toString(), 1, definitions.get(MAIN_LOGIC).size());
    assertEquals(definitions.keySet().toString(), 1, definitions.get(TEST).size());

    Map<String, List<Location>> usages = analysisResult.getParagraphUsages();
    assertEquals(usages.keySet().toString(), 1, usages.size());
    assertEquals(usages.keySet().toString(), 1, usages.get(TEST).size());
  }
}
