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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tolerate string statement with comma character */
public class TestStringStatementWithInvalidCommaCharIsTolerated {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST23.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-VARIABLES}.\n"
          + "          05 {$*WS-REFRESH-TOKEN-LENGTH}     PIC S9(4)V  COMP-3.\n"
          + "          05 {$*WS-REFRESH-TOKEN}            PIC X(1500).\n"
          + "          05 {$*SW-DUMMY}                    PIC X(01) VALUE 'N'.\n"
          + "             88 {$*SW-DUMMY-Y}                         VALUE 'Y'.\n"
          + "             88 {$*SW-DUMMY-N}                         VALUE 'N'.\n"
          + "          05 {$*WS-REQUEST-BODY}             PIC X(2000) VALUE SPACES.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EVALUATE TRUE\n"
          + "              WHEN {$SW-DUMMY-Y}\n"
          + "                 STRING 'refresh_token='   DELIMITED BY SIZE\n"
          + "                       {,|1}{$WS-REFRESH-TOKEN}(1:{$WS-REFRESH-TOKEN-LENGTH})\n"
          + "                                           DELIMITED BY SIZE\n"
          + "                       , '&'                DELIMITED BY SIZE\n"
          + "                       , 'grant_type='      DELIMITED BY SIZE\n"
          + "                       {,|2}'refresh_token'    DELIMITED BY SIZE\n"
          + "                    INTO {$WS-REQUEST-BODY}\n"
          + "                 END-STRING.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A blank is missing after ','",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "A blank is missing after ','",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }
}
