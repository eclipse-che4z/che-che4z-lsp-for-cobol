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
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Test to check ParagraphCompletion */
class ParagraphCompletionTest {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   outer1.\n"
          + "        02   INNER1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       Procedure Division.\n"
          + "       000-Main-Logic.\n"
          + "           Perform 100-Test.\n"
          + "           Stop Run.\n"
          + "       100-Test.\n"
          + "           Move INNER1 of OUTER1 to Str.\n"
          + "       End program ProgramId.";

  /**
   * this test creates a test document, scans it for paragraph names, adds them to completionItems,
   * then attempts to find the expected output
   */
  @Test
  void testParagraphCompletion() {
    CobolDocumentModel document = createModel();

    Set<Completion> completionSet = new HashSet<>();
    completionSet.add(new ParagraphCompletion());
    Completions completions = new Completions(completionSet);
    List<CompletionItem> completionItems =
        completions.collectFor(document, createCompletionParams()).getItems();

    assertEquals(2, completionItems.size());
    assertTrue(
        completionItems.get(0).getLabel().contains("100-Test")
            || completionItems.get(0).getLabel().contains("000-Main-Logic"),
        "100-Test");
    assertTrue(
        completionItems.get(1).getLabel().contains("100-Test")
            || completionItems.get(1).getLabel().contains("000-Main-Logic"),
        "000-Main-Logic");

    assertEquals(CompletionItemKind.Method, completionItems.get(0).getKind());
  }

  private CompletionParams createCompletionParams() {
    return new CompletionParams(new TextDocumentIdentifier("id"), new Position(8, 0));
  }

  private CobolDocumentModel createModel() {
    Map<String, List<Location>> paragraphDefinitions = new HashMap<>();
    paragraphDefinitions.put(
        "000-Main-Logic",
        Collections.singletonList(
            new Location(null, new Range(new Position(7, 6), new Position(7, 20)))));
    paragraphDefinitions.put(
        "100-Test",
        Collections.singletonList(
            new Location(null, new Range(new Position(10, 6), new Position(10, 14)))));

    AnalysisResult result = AnalysisResult.empty().toBuilder().paragraphDefinitions(paragraphDefinitions).build();

    return new CobolDocumentModel(TEXT, result);
  }
}
