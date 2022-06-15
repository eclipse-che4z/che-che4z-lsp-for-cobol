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
import org.eclipse.lsp.cobol.service.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.InsertTextFormat;
import org.eclipse.lsp4j.MarkupContent;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/** Test to check SnippetCompletion */
class SnippetCompletionTest {
  private static final String INSERT_TEXT = "WRITE ${1:item}";
  private static final String DOCUMENTATION_TEXT = "WRITE item";
  private static final String LABEL = "WRITE";
  private CachingConfigurationService cachingConfigurationService =
      mock(CachingConfigurationService.class);
  private SettingsService settingsService = mock(SettingsService.class);
  private final SnippetCompletion completion = new SnippetCompletion(new Snippets());

  @Test
  @Disabled
  void testCompletionEmptyResult() {
    assertThat(
        new SnippetCompletion(new Snippets())
            .getCompletionItems("Wr", new CobolDocumentModel("", AnalysisResult.builder().build())),
        is(createExpected()));
  }

  @Test
  @Disabled
  void testCompletionNull() {
    assertThat(completion.getCompletionItems("WR", null), is(createExpected()));
  }

  @Test
  @Disabled
  void testCompletionMock() {
    assertEquals(createExpected(), completion.getCompletionItems("wr", MockCompletionModel.MODEL));
  }

  private List<CompletionItem> createExpected() {
    return ImmutableList.of(createItem());
  }

  private CompletionItem createItem() {
    MarkupContent doc = new MarkupContent();
    doc.setValue(DOCUMENTATION_TEXT);
    doc.setKind("markdown");
    CompletionItem item = new CompletionItem(LABEL);
    item.setLabel(DOCUMENTATION_TEXT);
    item.setInsertText(INSERT_TEXT);
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    item.setDocumentation(doc);
    item.setKind(CompletionItemKind.Snippet);
    item.setSortText("6" + DOCUMENTATION_TEXT);
    return item;
  }
}
