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

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.MarkupContent;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This test {@link KeywordCompletion} asserts that filtration and preparing the keyword completion
 * suggestions works correctly
 */
class KeywordCompletionTest {
  private static final String DOCUMENTATION_TEXT =
      "The ACCEPT statement transfers data or system date-related information into the "
          + "data area referenced by the specified identifier.\r\n\r\n"
          + "[Read more](https://www.ibm.com/support/knowledgecenter/en/SS6SG3_6.2.0/"
          + "com.ibm.cobol62.ent.doc/PGandLR/ref/rlpsacce.htm)\r\n\r\n"
          + "© Copyright IBM Corporation 1994, 2019.\r\n\r\n"
          + "U.S. Government Users Restricted Rights - "
          + "Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.\r\n\r\n***\r\n\r\n"
          + "[IDMS] The ACCEPT statement transfers database, transaction, or task-related information to a specified "
          + "location in program variable storage.";
  private static final String LABEL = "ACCEPT";

  private KeywordCompletion completion = new KeywordCompletion(new Keywords());

  @Test
  void testCompletionEmptyResult() {
    assertThat(
        completion.getCompletionItems(
            "accep", new CobolDocumentModel("", AnalysisResult.builder().build())),
        is(createExpected()));
  }

  @Test
  void testCompletionNull() {
    assertThat(completion.getCompletionItems("Accep", null), is(createExpected()));
  }

  @Test
  void testCompletionMock() {
    assertEquals(
        createExpected(), completion.getCompletionItems("ACCEP", MockCompletionModel.MODEL));
  }

  private List<CompletionItem> createExpected() {
    return ImmutableList.of(createItem());
  }

  private CompletionItem createItem() {
    MarkupContent doc = new MarkupContent();
    doc.setValue(DOCUMENTATION_TEXT);
    doc.setKind("markdown");
    CompletionItem item = new CompletionItem(LABEL);
    item.setLabel(LABEL);
    item.setInsertText(LABEL);
    item.setDocumentation(doc);
    item.setKind(CompletionItemKind.Keyword);
    item.setSortText("7" + LABEL);
    return item;
  }
}
