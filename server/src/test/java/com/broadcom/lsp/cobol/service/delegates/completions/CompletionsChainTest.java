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
package com.broadcom.lsp.cobol.service.delegates.completions;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.stubbing.Answer;

import java.util.Comparator;
import java.util.List;

import static com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** This tests checks the order of completion elements: 1. Variables 2. Keywords */
class CompletionsChainTest {

  private static final CobolDocumentModel MODEL =
      new CobolDocumentModel(
          "TOKEN",
          AnalysisResult.builder()
              .variableDefinitions(ImmutableMap.of("TOKEN_0", ImmutableList.of(new Location())))
              .build());
  private Completions completions;

  @BeforeEach
  void createService() {
    VariableCompletion variableCompletion = new VariableCompletion();
    KeywordCompletion keywordCompletion = mock(KeywordCompletion.class);
    when(keywordCompletion.getCompletionSource(any(CobolDocumentModel.class)))
        .thenReturn(ImmutableList.of("TOKEN_1", "TOKEN_2"));
    when(keywordCompletion.getKind()).thenReturn(CompletionItemKind.Keyword);
    when(keywordCompletion.getSortOrderPrefix()).thenReturn("4");
    when(keywordCompletion.customize(any(CompletionItem.class)))
        .thenAnswer((Answer<CompletionItem>) invocation -> invocation.getArgument(0));

    completions = new Completions(ImmutableSet.of(variableCompletion, keywordCompletion));
  }

  @Test
  void testCompletionsOrder() {
    List<CompletionItem> list = getCompletionItems(new Position(0, 5)).getItems();
    list.sort(Comparator.comparing(CompletionItem::getSortText));
    assertFalse(list.isEmpty());
    assertEquals(3, list.size());
    assertEquals(CompletionItemKind.Variable, list.get(0).getKind());
    assertEquals(CompletionItemKind.Keyword, list.get(list.size() - 1).getKind());
  }

  private CompletionList getCompletionItems(Position position) {
    return completions.collectFor(
        MODEL, new CompletionParams(new TextDocumentIdentifier(DOCUMENT_URI), position));
  }
}
