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

package org.eclipse.lsp.cobol.usecases;

import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.hover.VariableHover;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.junit.jupiter.api.Test;

/** Hovering over 88 with multiple VALUE clauses should show all of them */
class Test88ThruHover {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TEST.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*EIGHT-BITS}            PIC X.\n"
          + "          88 {$*BIT-ONE}   value  Is    X'80' THRU X'FF'.\n"
          + "          88 {$*BIT-TWO}   Values    ARE X'40'  THRU  X'7F'\n"
          + "                              X'C0' THRU X'FF'.\n"
          + "          88 {$*BIT-THREE}   VALUE  X'80' THRU X'FF'.\n"
          + "          88 {$*BIT-FOUR} VALUES X'40'  THRU  X'7F'\n"
          + "                              X'C0' THRU X'FF'.";
  public static final String HOVER =
      "01 EIGHT-BITS PIC X.\n"
          + "  88 BIT-ONE VALUE IS X'80' THRU X'FF'.\n"
          + "  88 BIT-TWO VALUES ARE X'40' THRU X'7F'\n"
          + "                        X'C0' THRU X'FF'.\n"
          + "  88 BIT-THREE VALUE X'80' THRU X'FF'.\n"
          + "  88 BIT-FOUR VALUES X'40' THRU X'7F'\n"
          + "                     X'C0' THRU X'FF'.";

  @Test
  void test() {
    final AnalysisResult result =
        UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));

    assertHover(result);
  }

  private void assertHover(AnalysisResult result) {
    UriDecodeService uriDecodeService = mock(UriDecodeService.class);
    when(uriDecodeService.decode(DOCUMENT_URI)).thenReturn(DOCUMENT_URI);
    HoverProvider provider = new VariableHover(uriDecodeService);

    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    when(documentGraph.isCopybook(anyString())).thenReturn(false);
    final Hover actual =
        provider.getHover(
            new CobolDocumentModel("", "", result),
            new TextDocumentPositionParams(
                new TextDocumentIdentifier(DOCUMENT_URI), new Position(4, 15)), documentGraph);

    Hover expected = new Hover(ImmutableList.of(Either.forRight(new MarkedString("cobol", HOVER))));
    assertEquals(expected, actual);
  }
}
