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
package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test sql host variables */
public class TestSqlHostVariable {
  public static final String TEXT =
      "        Identification Division.\n"
          + "        Program-Id. 'TEST1'.\n"
          + "        Data Division.\n"
          + "         Working-Storage Section.\n"
          + "       01 {$*VAR-NAME} USAGE IS SQL TYPE IS RESULT-SET-LOCATOR VARYING.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           DISPLAY {$var-name}.";

  public static final String TEXT2 =
      "        Identification Division.\n"
          + "        Program-Id. 'TEST1'.\n"
          + "        Data Division.\n"
          + "         Working-Storage Section.\n"
          + "          copy {~abc}.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           DISPLAY {$var-name}.";

  public static final String TEXT3 =
      "        Identification Division.\n"
          + "        Program-Id. 'TEST1'.\n"
          + "        Data Division.\n"
          + "         Working-Storage Section.\n"
          + "        PROCEDURE DIVISION.\n"
          + "         {_01 VAR-NAME USAGE IS SQL TYPE IS RESULT-SET-LOCATOR VARYING|1_}.";

  public static final String BINARY_TEXT1 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*VAR-INVALID-BIN} USAGE IS SQL TYPE IS BINARY({256|1}).\n"
                  + "        PROCEDURE DIVISION.\n";

  public static final String BINARY_TEXT2 =
          "        Identification Division.\n"
          + "        Program-Id. 'TEST1'.\n"
          + "        Data Division.\n"
          + "         Working-Storage Section.\n"
          + "       01 {$*VAR-INVALID-BIN} USAGE IS SQL TYPE IS BINARY({-|1}1).\n"
          + "        PROCEDURE DIVISION.\n";

  public static final String BINARY_TEXT3 =
          "        Identification Division.\n"
          + "        Program-Id. 'TEST1'.\n"
          + "        Data Division.\n"
          + "         Working-Storage Section.\n"
          + "       01 {$*VAR-INVALID-BIN`->VAR-INVALID-BIN`->VAR-INVALID-BIN-LEN`->VAR-INVALID-BIN-TEXT} USAGE IS SQL TYPE IS VARBINARY({32705|1}).\n"
          + "        PROCEDURE DIVISION.\n";

  public static final String BINARY_TEXT4 =
          "        Identification Division.\n"
          + "        Program-Id. 'TEST1'.\n"
          + "        Data Division.\n"
          + "         Working-Storage Section.\n"
          + "       01 {$*VAR-INVALID-BIN`->VAR-INVALID-BIN`->VAR-INVALID-BIN-LEN`->VAR-INVALID-BIN-TEXT} USAGE IS SQL TYPE IS VARBINARY({-|1}1234).\n"
          + "        PROCEDURE DIVISION.\n";

  @Test
  void testSupportForResultSetLocator() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSupportForHostVariable_whenPlacedInCopybook() {
    UseCaseEngine.runTest(
        TEXT2,
        ImmutableList.of(
            new CobolText(
                "ABC", "       01 {$*VAR-NAME} USAGE IS SQL TYPE IS RESULT-SET-LOCATOR VARYING.")),
        ImmutableMap.of());
  }

  @Test
  void testHostVariable_whenPlacedAtWrongSection() {
    UseCaseEngine.runTest(
        TEXT3,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "this DB2 statement is allowed only in LINKAGE SECTION or WORKING-STORAGE SECTION",
                DiagnosticSeverity.Error,
                ErrorSource.DIALECT.getText())));
  }

  @Test
  void testBinaryHostVariable_whenLargeBinaryValue() {
    UseCaseEngine.runTest(
            BINARY_TEXT1,
            ImmutableList.of(),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            "Allowed range is 1 to 255",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testBinaryHostVariable_whenNegativeBinaryValue() {
    UseCaseEngine.runTest(
            BINARY_TEXT2,
            ImmutableList.of(),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            "Allowed range is 1 to 255",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()
                    )
            )
    );
  }

  @Test
  void testBinaryHostVariable_whenLargeVarbinaryValue() {
    UseCaseEngine.runTest(
            BINARY_TEXT3,
            ImmutableList.of(),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            "Allowed range is 1 to 32704",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()
                    )
            )
    );
  }

  @Test
  void testBinaryHostVariable_whenNegativeVarbinaryValue() {
    UseCaseEngine.runTest(
            BINARY_TEXT4,
            ImmutableList.of(),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            "Allowed range is 1 to 32704",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()
                    )
            )
    );
  }
}
