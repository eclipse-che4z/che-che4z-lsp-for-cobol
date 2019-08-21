/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.delegates.completions;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;
import org.junit.Test;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;

/**
 * Test to check VariableCompletion
 *
 * @author teman02
 */
public class VariableCompletionTest {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ID1.\n"
          + "       AUTHOR. Author."
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 TBPARM1      PIC 99 VALUE 5.\n"
          + "       01 TBPARM2      PIC 99 VALUE 0.\n"
          + "       01 ATCDEM4      PIC X(7) VALUE 'ATCDEM4'.\n"
          + "       01 P1PARM1      PIC 99 VALUE 0.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       PROGB.\n"
          + "           PERFORM WITH TEST BEFORE UNTIL TBPARM1 = 0\n"
          + "             SUBTRACT 1 FROM T\n"
          + "             CALL 'ATCDEM4' \n"
          + "           END-PERFORM\n"
          + "       END PROGRAM ID1.";

  @Test
  public void testVariableCompletion() {
    VariableCompletion completion = new VariableCompletion();
    MyDocumentModel document = createModel();

    List<CompletionItem> completionItems =
        completion.collectCompletions(document, createCompletionParams());

    assertEquals(2, completionItems.size());
    assertEquals("TBPARM1", completionItems.get(0).getLabel());
  }

  private CompletionParams createCompletionParams() {
    return new CompletionParams(new TextDocumentIdentifier("id"), new Position(12, 30));
  }

  private MyDocumentModel createModel() {
    Map<String, List<Range>> variableDefinitions = new HashMap<>();
    variableDefinitions.put("TBPARM1", Collections.singletonList(new Range(new Position(5, 9), new Position(5, 16))));
    variableDefinitions.put("TBPARM2", Collections.singletonList(new Range(new Position(6, 9), new Position(6, 16))));
    variableDefinitions.put("ATCDEM4", Collections.singletonList(new Range(new Position(7, 9), new Position(7, 16))));
    variableDefinitions.put("P1PARM1", Collections.singletonList(new Range(new Position(8, 9), new Position(8, 16))));

    AnalysisResult result =
        new AnalysisResult(Collections.emptyList(), variableDefinitions, Collections.emptyMap(), Collections.emptyMap(), Collections.emptyMap());

    return new MyDocumentModel(TEXT, result);
  }
}
