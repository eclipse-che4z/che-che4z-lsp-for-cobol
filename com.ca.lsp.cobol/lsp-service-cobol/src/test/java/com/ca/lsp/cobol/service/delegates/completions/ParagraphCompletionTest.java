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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.junit.Test;

/** Test to check ParagraphCompletion */
public class ParagraphCompletionTest {
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

  @Test
  public void testParagraphCompletion() {
    ParagraphCompletion completion = new ParagraphCompletion();
    MyDocumentModel document = createModel();

    List<CompletionItem> completionItems =
        completion.collectCompletions(document, createCompletionParams());

    assertEquals(2, completionItems.size());
    // assertTrue("000-Main-Logic", completionItems.get(1).getLabel());
    assertTrue(
        "100-Test",
        completionItems.get(0).getLabel().contains("100-Test")
            || completionItems.get(0).getLabel().contains("000-Main-Logic"));
    assertTrue(
        "000-Main-Logic",
        completionItems.get(1).getLabel().contains("100-Test")
            || completionItems.get(1).getLabel().contains("000-Main-Logic"));
  }

  private CompletionParams createCompletionParams() {
    return new CompletionParams(new TextDocumentIdentifier("id"), new Position(8, 0));
  }

  private MyDocumentModel createModel() {
    Map<String, List<Range>> paragraphDefinitions = new HashMap<>();
    paragraphDefinitions.put(
        "000-Main-Logic",
        Collections.singletonList(new Range(new Position(7, 6), new Position(7, 20))));
    paragraphDefinitions.put(
        "100-Test",
        Collections.singletonList(new Range(new Position(10, 6), new Position(10, 14))));

    AnalysisResult result =
        new AnalysisResult(
            Collections.emptyList(),
            Collections.emptyMap(),
            Collections.emptyMap(),
            paragraphDefinitions,
            Collections.emptyMap());

    return new MyDocumentModel(TEXT, result);
  }
}
