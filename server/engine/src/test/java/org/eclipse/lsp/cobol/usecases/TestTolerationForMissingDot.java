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
  public static final String TEXT =
      "       IDENTIFICATION DIVISION\n"
          + "       {PROGRAM-ID|1}. testabd.\n"
          + "       ENVIRONMENT DIVISION\n"
          + "       {CONFIGURATION|2} SECTION\n"
          + "       {SPECIAL-NAMES|3}.\n"
          + "       SOURCE-COMPUTER    {IBM-PC|4}                                              \n"
          + "       {OBJECT-COMPUTER|5}    .IBM-PC CHARACTER SET.\n"
          + "       {INPUT-OUTPUT|6} SECTION\n"
          + "       {FILE-CONTROL|7}\n"
          + "       {DATA|8} DIVISION\n"
          + "        {FILE|9} SECTION\n"
          + "        {WORKING-STORAGE|10} SECTION\n"
          + "        {01|11} {$*test1}.\n"
          + "           05 {$*testa} pic x\n"
          + "        {LINKAGE|12} SECTION\n"
          + "       {PROCEDURE|13} DIVISION\n"
          + "        {_{@*MAIN-PROCESSING}|14_} SECTION.\n"
          + "         {#*MAINLINE-PARAGRAPH}.\n"
          + "             display {$TESTA}\n"
          + "             STOP RUN.\n"
          + "       {#*ABC}\n"
          + "           {display|15} \"under abc\".";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), getExpectedDiagnostics());
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
