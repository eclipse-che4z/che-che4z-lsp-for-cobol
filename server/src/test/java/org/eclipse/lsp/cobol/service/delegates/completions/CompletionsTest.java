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
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.CONSTANTS;
import static org.eclipse.lsp.cobol.service.delegates.completions.CompletionOrder.COPYBOOKS;
import static org.eclipse.lsp.cobol.service.delegates.completions.MockCompletionModel.RESULT;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This test checks the logic of completion support. It retrieves the token by the given position
 * and calls all the providers in attempt to resolve it.
 */
class CompletionsTest {
  @Test
  void testCollecting() {
    Completions completions =
        new Completions(
            ImmutableSet.of(
                new CopybookCompletion(), new ConstantCompletion(), new ParagraphCompletion()));
    CompletionList actual =
        completions.collectFor(
            new CobolDocumentModel("Lorem ipsum dolor c amet", RESULT),
            new CompletionParams(
                new TextDocumentIdentifier(""), new Position(0, 19))); // The position of 'c;
    assertEquals(createExpected(), actual);
  }

  private CompletionList createExpected() {
    return new CompletionList(
        false,
        ImmutableList.of(
            createItem("cpyU1", CompletionItemKind.Class, COPYBOOKS),
            createItem("CpyU2", CompletionItemKind.Class, COPYBOOKS),
            createItem("constD1", CompletionItemKind.Constant, CONSTANTS),
            createItem("ConstD2", CompletionItemKind.Constant, CONSTANTS)));
  }

  private CompletionItem createItem(String name, CompletionItemKind kind, CompletionOrder order) {
    CompletionItem item = new CompletionItem(name);
    item.setLabel(name);
    item.setInsertText(name);
    item.setKind(kind);
    item.setSortText(order.prefix + name);
    return item;
  }
}
