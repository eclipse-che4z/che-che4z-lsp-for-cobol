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

import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookNameServiceImpl;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** Test to check SubroutineCompletion */
class CopybookNameCompletionTest {
  private static final String TEXT = "       COPYBOOK  \n";
  private final CopybookNameService copybookNameService = mock(CopybookNameServiceImpl.class);

  @Test
  void testCopybookNameCompletion() {
    when(copybookNameService.getNames("id")).thenReturn(Arrays.asList(
        CopybookName.builder().displayName("Copy1").build(),
        CopybookName.builder().displayName("copy2").build(),
        CopybookName.builder().displayName("no-copy").build()));

    CopybookNameCompletion copybookNameCompletion = new CopybookNameCompletion(copybookNameService);
    CobolDocumentModel document = new CobolDocumentModel("id", TEXT, AnalysisResult.builder().build());
    CompletionParams params =
        new CompletionParams(new TextDocumentIdentifier("id"), new Position(1, 16));

    List<CompletionItem> completionItems =
        new Completions(ImmutableSet.of(copybookNameCompletion))
            .collectFor(document, params)
            .getItems();

    assertEquals(3, completionItems.size());
    assertEquals("Copy1", completionItems.get(0).getLabel());
    assertEquals(CompletionItemKind.Class, completionItems.get(0).getKind());
  }
}
