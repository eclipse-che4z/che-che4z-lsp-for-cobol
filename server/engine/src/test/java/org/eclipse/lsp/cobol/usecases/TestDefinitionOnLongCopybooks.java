/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.usecases;

import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.references.ElementOccurrences;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;
import org.mockito.MockedStatic;

/**
 * Test Go to Definition works on a COPY statement that is at the end of a file, and the copybook
 * has more lines than the document.
 */
class TestDefinitionOnLongCopybooks {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. VSAMTEST.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       COPY {~ABCD}. \n";

  private static final String COPYBOOK_CONTENT =
      "       01 {$*ABCD0}.\n"
          + "           05 {$*ABCD1} PIC 9.\n"
          + "           05 {$*ABCD2} PIC 9.\n"
          + "           05 {$*ABCD3} PIC 9.\n"
          + "           05 {$*ABCD4} PIC 9.\n"
          + "           05 {$*ABCD5} PIC 9.\n"
          + "           05 {$*ABCD6} PIC 9.\n"
          + "           05 {$*ABCD7} PIC 9.\n"
          + "           05 {$*ABCD8} PIC 9.";

  @Test
  void test() {
    AnalysisResult result =
        UseCaseEngine.runTest(
            TEXT, ImmutableList.of(new CobolText("ABCD", COPYBOOK_CONTENT)), ImmutableMap.of());
    SymbolsRepository symbolsRepository = mock(SymbolsRepository.class);
    UriDecodeService uriDecodeService = new UriDecodeService();
    CobolDocumentModel document = new CobolDocumentModel(DOCUMENT_URI, TEXT, result);
    TextDocumentPositionParams position = new TextDocumentPositionParams(
            new TextDocumentIdentifier(DOCUMENT_URI), new Position(4, 15));
    Location expectedDef = new Location(
            "file:///c:/workspace/.c4z/.copybooks/ABCD.cpy",
            new Range(new Position(), new Position()));
    DefinedAndUsedStructure ctx = mock(DefinedAndUsedStructure.class);
    when(ctx.getDefinitions()).thenReturn(Collections.singletonList(expectedDef));
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    when(documentGraph.isCopybook(anyString())).thenReturn(false);

    try (MockedStatic mocked = mockStatic(SymbolsRepository.class)) {
      mocked.when(() -> SymbolsRepository.findElementByPosition(eq(DOCUMENT_URI), eq(document.getAnalysisResult()),
          eq(position.getPosition()))).thenReturn(Optional.of(ctx));
      List<Location> definitions = new ElementOccurrences(documentGraph, uriDecodeService).findDefinitions(document, position);

      assertEquals(1, definitions.size());
      assertEquals(expectedDef, definitions.get(0));
    }
  }
}
