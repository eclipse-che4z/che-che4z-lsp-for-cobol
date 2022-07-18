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
package org.eclipse.lsp.cobol.usecases.example;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** UseCase test example with variants */
class TestParametrised {
  private static final String TEXT_START =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n";

  private static final String END_1 = "       01  {$*VAR}     PIC S9(4) COMP{|eof}";
  private static final String END_2 = "       01  {$*VAR}     PIC S9(4){|eof}";

  private static Stream<String> textsGetter() {
    return Stream.of(END_1, END_2).map(end -> TEXT_START + end);
  }

  @ParameterizedTest
  @MethodSource("textsGetter")
  @DisplayName("Parameterized - different ends")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "eof",
            new Diagnostic(
                new Range(),
                "Unexpected end of file",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
