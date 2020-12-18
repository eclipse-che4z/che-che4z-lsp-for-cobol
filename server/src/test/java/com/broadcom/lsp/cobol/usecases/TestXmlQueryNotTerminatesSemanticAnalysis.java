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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.core.CobolLexer;
import com.broadcom.lsp.cobol.core.CobolPreprocessorLexer;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;

import static com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * This test checks that an XML Query that has gaps in concatenation and variable calls with '$'
 * doesn't invalidate the position mapping. The reason of the issue was that {@link
 * CobolPreprocessorLexer} and {@link CobolLexer} produce different streams of tokens due to
 * different patterns for string literals and IDENTIFIER. The exact problem with the given code
 * example is that $PAYMENTDATE was treated as is by the {@link CobolPreprocessorLexer} and as $ and
 * PAYMENTDATE by {@link CobolLexer}, so the mapper while lookahead has been connecting the
 * positions incorrectly on the PAYMENTDATE below and ruining the trailing mapping. The string
 * literal had been parsed also incorrectly producing diverged token streams. As a result, the
 * semantic analyzer could not find a token for variable usages, producing unexpected behavior.
 */
class TestXmlQueryNotTerminatesSemanticAnalysis {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       LINKAGE SECTION.\n"
          + "       01 {$*VARNAME} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "            SELECT COALESCE (SUM( XMLCAST(\n"
          + "            XMLQUERY(\n"
          + "            \"declare default element namespace 'smth';\n"
          + "\n"
          + "      -     \"/Invoice[cac:PaymentMeans/cbc:id1=$PAYMENTDATE]/\n"
          + "      -     \"cac:id2/cbc:id3\"\n"
          + "            PASSING DOCUMENT\n"
          + "            , :ID1 AS PAYMENTDATE)\n"
          + "            AS DECIMAL(9,2) )) ,0) INTO :ID2\n"
          + "            FROM DB.NAME\n"
          + "            END-EXEC.\n"
          + "           MOVE 0 TO VARNAME1.\n"
          + "           GOBACK. ";

  @Test
  void test() {
    // TODO: after #619 fixed, all the false-positive diagnostics should disappear and this test
    // should be refactored using UseCaseEngine
    AnalysisResult actual = UseCaseUtils.analyze(UseCaseUtils.DOCUMENT_URI, TEXT, List.of());
    List<Diagnostic> diagnostics = actual.getDiagnostics().get(UseCaseUtils.DOCUMENT_URI);
    Assertions.assertEquals(
        diagnostics.get(diagnostics.size() - 1),
        new Diagnostic(
            new Range(new Position(19, 21), new Position(19, 29)),
            "Invalid definition for: VARNAME1",
            Information,
            INFO.getText()));
  }
}
