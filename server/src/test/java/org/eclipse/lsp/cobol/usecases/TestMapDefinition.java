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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.*;
import org.eclipse.lsp.cobol.service.delegates.hover.VariableHover;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

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
        UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER)));
    final Hover mapHover =
        new VariableHover()
            .getHover(
                new CobolDocumentModel(TEXT, result),
                new TextDocumentPositionParams(
                    new TextDocumentIdentifier(UseCaseUtils.DOCUMENT_URI), new Position(5, 19)));
    assertEquals(
        new Hover(ImmutableList.of(Either.forRight(new MarkedString("cobol", "MAP ABCDE.")))),
        mapHover);
  }
}
