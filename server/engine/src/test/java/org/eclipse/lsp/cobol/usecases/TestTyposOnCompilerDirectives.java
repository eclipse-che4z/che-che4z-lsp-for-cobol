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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.core.ParserUtils;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assumptions.assumeFalse;

/** This test checks that the compiler directives that contain typos processed as usual lines */
class TestTyposOnCompilerDirectives {
  private static final String PROCESS_WITHOUT_NUMBER_TYPO =
      "PROESS {DATA|1}(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITH_NUMBER_TYPO =
      "012345 {PROESS|1} DATA(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITHOUT_NUMBER_DATA_TYPO =
      "PROCESS {DDATA|1}(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITH_NUMBER_DATA_TYPO =
      "012345 PROCESS {DDATA|1}(24),RMODE(24),NODYNAM\r\n";

  private static final String FOLLOWING_TEXT =
      "000000 Identification DIVISION.                                         23323232\r\n"
          + "002800 Program-ID.                                                      23323232\r\n"
          + "002800  HELLOWORLD.                                                     23323232\r\n"
          + "024200 PROCEDURE DIVISION .                                             CM1014.2\r\n";

  private static final String DATA_ERROR_MESSAGE =
      "Syntax error on 'DDATA'";

  @BeforeAll
  public static void beforeMethod() {
    assumeFalse(ParserUtils.isHwParserEnabled());
  }

  @Test
  void testProcessWithoutNumbersWithTypo() {
    UseCaseEngine.runTest(
        PROCESS_WITHOUT_NUMBER_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'DATA'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testProcessWithNumbersWithTypo() {
    UseCaseEngine.runTest(
        PROCESS_WITH_NUMBER_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'PROESS'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testProcessWithTypoOnData() {
    UseCaseEngine.runTest(
        PROCESS_WITH_NUMBER_DATA_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                DATA_ERROR_MESSAGE,
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testProcessWithoutNumberWithTypoOnData() {
    UseCaseEngine.runTest(
        PROCESS_WITHOUT_NUMBER_DATA_TYPO + FOLLOWING_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                DATA_ERROR_MESSAGE,
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
