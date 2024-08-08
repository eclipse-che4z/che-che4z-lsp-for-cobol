/*
 * Copyright (c) 2024 Broadcom.
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
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests the toleration of missing DOT_FS
 */
public class TestTolerationForMissingDot {
  public static final String TEXT_ENV_COMP =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. aaa.\n"
                  + "       ENVIRONMENT DIVISION.\n"
                  + "       CONFIGURATION SECTION.\n"
                  + "       SPECIAL-NAMES.\n"
                  + "       SOURCE-COMPUTER {IBM-PC|1}\n"
                  + "       {OBJECT-COMPUTER|2}. {IBM-PC|3} CHARACTER SET.\n"
                  + "       PROCEDURE DIVISION.\n";

  public static final String TEXT_ID =
          "       IDENTIFICATION DIVISION\n"
                  + "       {PROGRAM-ID|1}. aaa.\n"
                  + "       PROCEDURE DIVISION.\n";

  @Test
  void testId() {
    UseCaseEngine.runTest(TEXT_ID, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(new Range(), "A period was assumed before \"PROGRAM-ID\".",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())
    ));
  }

  @Test
  void testEnvComp() {
    UseCaseEngine.runTest(TEXT_ENV_COMP, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(new Range(), "A period was assumed before \"IBM-PC\".",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(new Range(), "A period was assumed before \"OBJECT-COMPUTER\".",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(new Range(), "Syntax error on 'IBM-PC'",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())
    ));
  }


  private Stream<String> getExpectedErrorMessages() {
    return Stream.of(
        "A period was assumed before \"PROGRAM-ID\".",
        "A period was assumed before \"CONFIGURATION\".",
        "A period was assumed before \"SPECIAL-NAMES\".",
        "A period was assumed before \"IBM-PC\".",
        "A period was assumed before \"OBJECT-COMPUTER\".",
        "A period was assumed before \"INPUT-OUTPUT\".",
        "A period was assumed before \"FILE-CONTROL\".",
        "A period was assumed before \"DATA\".",
        "A period was assumed before \"FILE\".",
        "A period was assumed before \"WORKING-STORAGE\".",
        "A period was assumed before \"01\".",
        "A period was assumed before \"LINKAGE\".",
        "A period was assumed before \"PROCEDURE\".",
        "A period was assumed before \"MAIN-PROCESSING\".",
        "A period was assumed before \"display\".");
  }

  private Map<String, Diagnostic> getExpectedDiagnostics() {
    AtomicInteger i = new AtomicInteger(1);
    return getExpectedErrorMessages()
        .collect(
            Collectors.toMap(
                str -> String.valueOf(i.getAndIncrement()),
                str ->
                    new Diagnostic(
                        new Range(),
                        str,
                        DiagnosticSeverity.Error,
                        ErrorSource.PARSING.getText())));
  }
}
