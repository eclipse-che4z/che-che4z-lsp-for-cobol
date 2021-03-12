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
package org.eclipse.lsp.cobol.service.delegates.completions;

import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.*;

import static java.util.Collections.singletonList;
import static org.junit.jupiter.api.Assertions.assertEquals;

/** Test to check VariableCompletion */
class VariableCompletionTest {
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
  void testVariableCompletion() {
    CobolDocumentModel document = createModel();
    Set<Completion> completionSet = new HashSet<>();
    completionSet.add(new VariableCompletion());
    Completions completions = new Completions(completionSet);
    List<CompletionItem> completionItems =
        completions.collectFor(document, createCompletionParams()).getItems();

    assertEquals(2, completionItems.size());
    assertEquals("TBPARM1", completionItems.get(0).getLabel());
    assertEquals(CompletionItemKind.Variable, completionItems.get(0).getKind());
  }

  private CompletionParams createCompletionParams() {
    return new CompletionParams(new TextDocumentIdentifier("id"), new Position(12, 30));
  }

  private CobolDocumentModel createModel() {
    Map<String, List<Location>> variableDefinitions = new HashMap<>();
    variableDefinitions.put(
        "TBPARM1",
        singletonList(new Location(null, new Range(new Position(5, 9), new Position(5, 16)))));
    variableDefinitions.put(
        "TBPARM2",
        singletonList(new Location(null, new Range(new Position(6, 9), new Position(6, 16)))));
    variableDefinitions.put(
        "ATCDEM4",
        singletonList(new Location(null, new Range(new Position(7, 9), new Position(7, 16)))));
    variableDefinitions.put(
        "P1PARM1",
        singletonList(new Location(null, new Range(new Position(8, 9), new Position(8, 16)))));

    AnalysisResult result =
        AnalysisResult.empty().toBuilder().variableDefinitions(variableDefinitions).build();

    return new CobolDocumentModel(TEXT, result);
  }
}
