/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test UTF picture clause
 *  ref - https://www.ibm.com/docs/en/cobol-zos/6.3?topic=clause-symbols-used-in-picture
 * */
public class TestUTFPicClause {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'DUMMY' RECURSIVE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       1 {$*ubuff} PIC U(1024).\n"
          + "       LOCAL-STORAGE SECTION.\n"
          + "       1 {$*ln} PIC S9(9) COMP-5.\n"
          + "       LINKAGE SECTION.\n"
          + "       1 {$*str} PIC X(1024).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE FUNCTION {$$DISPLAY-OF}( FUNCTION {$$NATIONAL-OF}( {$str} ( 1: {$ln}\n"
          + "            ) ) ) TO {$ubuff}.\n"
          + "       END PROGRAM 'DUMMY'.";

  public static final String SINGLE_UTF_BYTE_LENGTH =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGM.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*BYTE-LENGTH} PIC U\r\n"
          + "                      ByTE-LENgtH iS 500.\r\n"
          + "       PROCEDURE DIVISION .\n"
          + "           display {$BYTE-LENGTH}.\n"
          + "       END PROGRAM PGM.\n";

  public static final String MULTIPLE_UTF_BYTE_LENGTH =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGM.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*BYTE-LENGTH} PIC UU {ByTE-LENgtH|1} 500.\n"
          + "       PROCEDURE DIVISION .\n"
          + "           display {$BYTE-LENGTH}.\n"
          + "       END PROGRAM PGM.\n";

  public static final String WRONG_USE_PIC_X =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGM.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*BYTE-LENGTH} PIC X {ByTE-LENgtH|1} 500.\n"
          + "       PROCEDURE DIVISION .\n"
          + "           display {$BYTE-LENGTH}.\n"
          + "       END PROGRAM PGM.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_byte_length_clause_allowed_for_single_U_utf() {
    UseCaseEngine.runTest(SINGLE_UTF_BYTE_LENGTH, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_byte_length_clause_not_allowed_for_multiple_U_utf() {
    UseCaseEngine.runTest(
        MULTIPLE_UTF_BYTE_LENGTH,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A period was assumed before \"ByTE-LENgtH\".",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_byte_length_clause_not_allowed_for_pic_clause_other_than_u() {
    UseCaseEngine.runTest(
        WRONG_USE_PIC_X,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A period was assumed before \"ByTE-LENgtH\".",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
