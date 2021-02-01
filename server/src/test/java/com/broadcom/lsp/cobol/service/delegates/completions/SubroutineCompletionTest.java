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
import com.broadcom.lsp.cobol.service.SubroutineService;
import com.broadcom.lsp.cobol.service.SubroutineServiceImpl;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** Test to check SubroutineCompletion */
public class SubroutineCompletionTest {
  private static final String TEXT = "       CALL 'SUB\n";

  @Test
  void testSubroutineCompletion() {
    SubroutineService subroutineService = new SubroutineServiceImpl(null, 3, 3, "HOURS");
    subroutineService.store("SUBCALL", "");
    SubroutineCompletion subroutineCompletion = new SubroutineCompletion(subroutineService);
    CobolDocumentModel document = new CobolDocumentModel(TEXT, AnalysisResult.empty());
    CompletionParams params = new CompletionParams(new TextDocumentIdentifier("id"), new Position(1, 16));

    List<CompletionItem> completionItems = new Completions(ImmutableSet.of(subroutineCompletion))
        .collectFor(document, params).getItems();

    assertEquals(1, completionItems.size());
    assertEquals("SUBCALL", completionItems.get(0).getLabel());
    assertEquals(CompletionItemKind.File, completionItems.get(0).getKind());
  }
}
