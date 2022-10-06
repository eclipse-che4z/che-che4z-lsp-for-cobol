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
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.empty;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This test {@link ParagraphCompletion} asserts that filtration and preparing the paragraph
 * completion suggestions works correctly
 */
class ParagraphCompletionTest {
  private final Completion completion = new ParagraphCompletion(MockCompletionModel.SYMBOL_SERVICE);

  @Test
  void testCompletionEmptyResult() {
    assertThat(
        completion.getCompletionItems(
            "smth", new CobolDocumentModel("", AnalysisResult.builder().build())),
        is(empty()));
  }

  @Test
  void testCompletionNull() {
    assertThat(completion.getCompletionItems("smth", null), is(empty()));
  }

  @Test
  void testCompletionMock() {
    assertEquals(createExpected(), completion.getCompletionItems("pa", MockCompletionModel.MODEL));
  }

  private List<CompletionItem> createExpected() {
    return ImmutableList.of(createItem("PARD1"), createItem("PARD2"));
  }

  private CompletionItem createItem(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setKind(CompletionItemKind.Method);
    item.setSortText("1" + name);
    return item;
  }
}
