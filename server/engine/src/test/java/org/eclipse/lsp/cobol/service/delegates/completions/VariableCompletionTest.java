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
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.empty;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This test {@link VariableCompletion} asserts that filtration and preparing the variable
 * completion suggestions works correctly
 */
class VariableCompletionTest {

  private static final String HEADER =
      "       Identification Division.\n"
          + "       Program-id. TEST.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n";

  private static final String FULL_TEXT =
      HEADER
          + "       01 {$*var1} PIC 9.\n"
          + "       01 {$*VAR2} PIC 9.\n"
          + "       01 {$*ANOTHER} PIC 9.\n";

  @Test
  void testCompletionEmptyResult() {
    CobolDocumentModel model = getModel(HEADER);
    Completion completion =
        new VariableCompletion(new SymbolService(model.getAnalysisResult().getSymbolTableMap()));
    assertThat(completion.getCompletionItems("smth", model), is(empty()));
  }

  @Test
  void testCompletionNull() {
    Completion completion = new VariableCompletion(new SymbolService());
    assertThat(completion.getCompletionItems("smth", null), is(empty()));
  }

  @Test
  void testCompletionMock() {
    CobolDocumentModel model = getModel(FULL_TEXT);
    Completion completion =
        new VariableCompletion(new SymbolService(model.getAnalysisResult().getSymbolTableMap()));
    assertEquals(createExpected(), completion.getCompletionItems("va", model));
  }

  private List<CompletionItem> createExpected() {
    return ImmutableList.of(
        createItem("VAR1", "01 VAR1 PIC 9."), createItem("VAR2", "01 VAR2 PIC 9."));
  }

  private CompletionItem createItem(String name, String desc) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setDocumentation(desc);
    item.setKind(CompletionItemKind.Variable);
    item.setSortText("0" + name);
    return item;
  }

  private CobolDocumentModel getModel(String text) {
    return new CobolDocumentModel(
        text, UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of()));
  }
}
