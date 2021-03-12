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

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Testing Copybook autocomplete class, to determine if copybook names will be correctly detected
 * and shown in the autocomplete list
 */
class CopybookCompletionTest {

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
          + "       COPY BRDCMCP.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       PROGB.\n"
          + "           PERFORM WITH TEST BEFORE UNTIL TBPARM1 = 0\n"
          + "             SUBTRACT 1 FROM T\n"
          + "             CALL 'ATCDEM4' \n"
          + "           END-PERFORM\n"
          + "       END PROGRAM ID1.";

  @Test
  void testCopybookCompletion() {
    CobolDocumentModel document = createModel();
    Set<Completion> completionSet = new HashSet<>();
    completionSet.add(new CopybookCompletion());
    Completions completions = new Completions(completionSet);
    List<CompletionItem> completionItems =
        completions.collectFor(document, createCompletionParams()).getItems();

    assertEquals(1, completionItems.size());
    assertEquals("BRDCMCP", completionItems.get(0).getLabel());
    assertEquals(CompletionItemKind.Class, completionItems.get(0).getKind());
  }

  private CompletionParams createCompletionParams() {
    return new CompletionParams(new TextDocumentIdentifier("id"), new Position(12, 30));
  }

  private CobolDocumentModel createModel() {
    Map<String, List<Location>> copybookUsages = new HashMap<>();
    copybookUsages.put(
        "BRDCMCP",
        Collections.singletonList(
            new Location(null, new Range(new Position(9, 11), new Position(9, 18)))));

    AnalysisResult result = AnalysisResult.empty().toBuilder().copybookUsages(copybookUsages).build();

    return new CobolDocumentModel(TEXT, result);
  }
}
