/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.variables;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.stream.Stream;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

/** Symbol variable name should not cause an error. */
public class TestSymbolVariableName {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  SYMVAR.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*SYMBOL} PIC X(10).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$SYMBOL}.\n"
          + "           call {%'subrtn'} using {$SYMBOL}\n"
          + "              exit.\n"
          + "              GOBACK.\n";

  private static final String CODE_TEMPLATE =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test232.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {01|1} {%s|2|3} pic x(9).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY \"testing in progress\".\n"
          + "\n";

  private static final String CODE_TEMPLATE_SINGLE_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test232.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {%s|1} pic x(9).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY \"testing in progress\".\n"
          + "\n";

  private static Stream<Pair<String, String>> getOptions() {
    return Stream.of(
        ImmutablePair.of("address", ""),
        ImmutablePair.of("bottom", ""),
        ImmutablePair.of("close", ""),
        ImmutablePair.of("count", ""),
        ImmutablePair.of("currency", ""),
        ImmutablePair.of("data", ""),
        ImmutablePair.of("date", ""),
        ImmutablePair.of("day", ""),
        ImmutablePair.of("dbcs", ""),
        ImmutablePair.of("exit", ""),
        ImmutablePair.of("extend", ""),
        ImmutablePair.of("first", ""),
        ImmutablePair.of("initial", ""),
//        ImmutablePair.of("national", ""), TODO: The "PICTURE" clause in the data definition was not compatible with the specified "USAGE NATIONAL"
        ImmutablePair.of("object", "Missing token REFERENCE at usageFormat"),
        ImmutablePair.of("off", ""),
        ImmutablePair.of("quote", ""),
        ImmutablePair.of("separate", ""),
        ImmutablePair.of("sequence", ""),
        ImmutablePair.of("service", ""),
        ImmutablePair.of("standard", ""),
        ImmutablePair.of("suppress", ""),
        ImmutablePair.of(
            "terminal", "Encountered invalid token. Analysis skipped to the next verb or period."),
        ImmutablePair.of("test", ""),
        ImmutablePair.of("time", ""),
        ImmutablePair.of("top", ""));
  }

  @ParameterizedTest(name = "{arguments} not allowed as variable")
  @MethodSource("getOptions")
  void testOption(Pair<String, String> keyword) {
    String code = String.format(CODE_TEMPLATE, keyword.getLeft());
    ImmutableMap<String, Diagnostic> expectedDiagnostics;
    if (!StringUtils.isEmpty(keyword.getRight())) {
      code = String.format(CODE_TEMPLATE_SINGLE_ERROR, keyword.getLeft());
      expectedDiagnostics =
          ImmutableMap.of(
              "1",
              new Diagnostic(
                  new Range(),
                  keyword.getRight(),
                  DiagnosticSeverity.Error,
                  ErrorSource.PARSING.getText()));
    } else {
      expectedDiagnostics =
          ImmutableMap.of(
              "1",
              new Diagnostic(
                  new Range(),
                  "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item FILLER",
                  DiagnosticSeverity.Error,
                  ErrorSource.PARSING.getText()),
              "2",
              new Diagnostic(
                  new Range(),
                  String.format("A period was assumed before \"%s\".", keyword.getLeft()),
                  DiagnosticSeverity.Error,
                  ErrorSource.PARSING.getText()),
              "3",
              new Diagnostic(
                  new Range(),
                  String.format("Syntax error on '%s'", keyword.getLeft()),
                  DiagnosticSeverity.Error,
                  ErrorSource.PARSING.getText()));
    }

    UseCaseEngine.runTest(code, ImmutableList.of(), expectedDiagnostics);
  }

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
