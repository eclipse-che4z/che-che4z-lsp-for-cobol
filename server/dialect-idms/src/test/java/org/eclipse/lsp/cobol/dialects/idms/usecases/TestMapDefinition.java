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
package org.eclipse.lsp.cobol.dialects.idms.usecases;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.dialects.idms.utils.Fixtures;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.hover.VariableHover;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.junit.jupiter.api.Test;

/**
 * This use case checks that the map defined in the MAP SECTION is recognized as a variable
 * definition
 */
class TestMapDefinition {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        MAP    SECTION.\n"
          + "           MAX FIELD LIST 30.\n"
          + "           MAP {$*ABCDE}.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*LDAR}.\n"
          + "             07 {$*ITENUM} PIC X(7).\n"
          + "        PROCEDURE DIVISION.\n"
          + "            MODIFY MAP {$ABCDE} CURSOR AT DFLD {$ITENUM}.\n"
          + "            DISPLAY {$ABCDE}.";

  @Test
  void test() {
    final AnalysisResult result =
        UseCaseEngine.runTestForDiagnostics(
            TEXT,
            ImmutableList.of(Fixtures.subschemaCopy(""), Fixtures.mapsCopy("")),
            ImmutableMap.of(),
            ImmutableList.of(),
            new AnalysisConfig(
                CopybookProcessingMode.ENABLED,
                ImmutableList.of(IdmsDialect.NAME), true,
                ImmutableList.of(),
                ImmutableMap.of()));
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    when(documentGraph.isCopybook(anyString())).thenReturn(false);
    final Hover mapHover =
        new VariableHover(new UriDecodeService())
            .getHover(
                new CobolDocumentModel(UseCaseUtils.DOCUMENT_URI, TEXT, result),
                new TextDocumentPositionParams(
                    new TextDocumentIdentifier(UseCaseUtils.DOCUMENT_URI), new Position(5, 19)), documentGraph);
    assertEquals(
        new Hover(ImmutableList.of(Either.forRight(new MarkedString("cobol", "MAP ABCDE.")))),
        mapHover);
  }
}
