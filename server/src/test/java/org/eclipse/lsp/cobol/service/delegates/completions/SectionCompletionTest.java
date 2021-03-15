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
import com.google.common.collect.ImmutableMap;
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
 * This test {@link SectionCompletion} asserts that filtration and preparing the section completion
 * suggestions works correctly
 */
class SectionCompletionTest {
  private Completion completion = new SectionCompletion();

  @Test
  void testCompletionEmptyResult() {
    assertThat(
        completion.getCompletionItems(
            "smth",
            new CobolDocumentModel(
                "", AnalysisResult.builder().sectionDefinitions(ImmutableMap.of()).build())),
        is(empty()));
  }

  @Test
  void testCompletionNull() {
    assertThat(completion.getCompletionItems("smth", null), is(empty()));
  }

  @Test
  void testCompletionMock() {
    assertEquals(createExpected(), completion.getCompletionItems("s", MockCompletionModel.MODEL));
  }

  private List<CompletionItem> createExpected() {
    return ImmutableList.of(createItem("secD1"), createItem("SecD2"));
  }

  private CompletionItem createItem(String name) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setKind(CompletionItemKind.Function);
    item.setSortText("2" + name);
    return item;
  }
}
