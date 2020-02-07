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
 */

package com.ca.lsp.cobol.service.delegates.completions;

import static org.junit.Assert.*;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.junit.Test;

/**
 * Testing Copybook autocomplete class, to determine if copybook names will be correctly detected
 * and shown in the autocomplete list
 */
public class CopybookCompletionTest {

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
  public void testCopybookCompletion() {
    MyDocumentModel document = createModel();
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

  private MyDocumentModel createModel() {
    Map<String, List<Location>> copybookDefinitions = new HashMap<>();
    copybookDefinitions.put(
        "BRDCMCP",
        Collections.singletonList(
            new Location(null, new Range(new Position(9, 11), new Position(9, 18)))));

    AnalysisResult result =
        new AnalysisResult(
            Collections.emptyList(),
            Collections.emptyMap(),
            Collections.emptyMap(),
            Collections.emptyMap(),
            Collections.emptyMap(),
            copybookDefinitions);

    return new MyDocumentModel(TEXT, result);
  }
}
