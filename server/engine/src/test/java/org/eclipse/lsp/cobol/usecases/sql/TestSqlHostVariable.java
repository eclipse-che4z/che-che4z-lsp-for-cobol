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

  public static final String BINARY_ARR_TEXT1 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*GREET}.\n"
                  + "       02 {$*VAR} SQL TYPE IS BINARY(255) OCCURS 32767 TIMES.\n"
                  + "        PROCEDURE DIVISION.\n";

  public static final String BINARY_ARR_TEXT2 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*GREET}.\n"
                  + "       02 {$*VAR} SQL TYPE IS VARBINARY(32704) OCCURS 32767 TIMES.\n"
                  + "        PROCEDURE DIVISION.\n";

  public static final String BINARY_ARR_TEXT3 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*GREET}.\n"
                  + "       02 {$*VAR} SQL TYPE IS BINARY(255) OCCURS 32767.\n"
                  + "        PROCEDURE DIVISION.\n";

  public static final String BINARY_ARR_TEXT4 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*GREET}.\n"
                  + "       02 {$*VAR} SQL TYPE IS VARBINARY(32704) OCCURS 32767.\n"
                  + "        PROCEDURE DIVISION.\n";

  public static final String TABLE_LOCATOR_TEXT =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*VAR-NAME1} USAGE IS SQL TYPE IS TABLE LIKE TABLENAME AS LOCATOR.\n"
                  + "       01 {$*VAR-NAME2} USAGE SQL TYPE IS TABLE LIKE TABLENAME AS LOCATOR.\n"
                  + "       01 {$*VAR-NAME3} SQL TYPE IS TABLE LIKE TABLENAME AS LOCATOR.\n"
                  + "        PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$var-name1}..";

  public static final String LOD_VARS_TEXT =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*VAR-NAME1} USAGE IS SQL TYPE IS DBCLOB-FILE.\n"
                  + "       01 {$*VAR-NAME2} USAGE IS SQL TYPE IS BLOB (10 K).\n"
                  + "       01 {$*VAR-NAME3} USAGE IS SQL TYPE IS CHARACTER LARGE OBJECT (10 M).\n"
                  + "       01 {$*VAR-NAME4} USAGE IS SQL TYPE IS CHAR LARGE OBJECT (10 G).\n"
                  + "       01 {$*VAR-NAME5} USAGE IS SQL TYPE IS CLOB (20).\n"
                  + "       01 {$*VAR-NAME6} USAGE IS SQL TYPE IS DBCLOB (30 K).\n"
                  + "       01 {$*VAR-NAME7} USAGE IS SQL TYPE IS BLOB-LOCATOR.\n"
                  + "       01 {$*VAR-NAME8} USAGE IS SQL TYPE IS CLOB-LOCATOR.\n"
                  + "       01 {$*VAR-NAME9} USAGE IS SQL TYPE IS DBCLOB-LOCATOR.\n"
                  + "       01 {$*VAR-NAME10} USAGE IS SQL TYPE IS BLOB-FILE.\n"
                  + "       01 {$*VAR-NAME11} USAGE IS SQL TYPE IS CLOB-FILE.\n"
                  + "       01 {$*VAR12`->VAR12`->VAR12-LENGTH`->VAR12-DATA} USAGE IS SQL TYPE IS BINARY LARGE OBJECT (10).\n"
                  + "        PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$VAR12}.\n"
                  + "           DISPLAY {$VAR12-LENGTH}.\n"
                  + "           DISPLAY {$VAR12-DATA}.";

  public static final String LOD_VARS_TEXT1 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*GREET}.\n"
                  + "          49 {$*VAR} USAGE IS SQL TYPE IS CHARACTER LARGE OBJECT (10 M).\n"
                  + "        PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$VAR}.";

  public static final String LOB_XML_TEXT1 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*VAR1`->VAR1`->VAR1-LENGTH`->VAR1-DATA} USAGE IS SQL TYPE IS XML AS BINARY LARGE OBJECT (10).\n"
                  + "       01 {$*VAR-NAME2} USAGE IS SQL TYPE IS XML AS BLOB (10 K).\n"
                  + "       01 {$*VAR3} USAGE IS SQL TYPE IS XML AS CHARACTER LARGE OBJECT (10 M).\n"
                  + "       01 {$*VAR-NAME4} USAGE IS SQL TYPE IS XML AS CHAR LARGE OBJECT (10 G).\n"
                  + "       01 {$*VAR-NAME5} USAGE IS SQL TYPE IS XML AS CLOB (20).\n"
                  + "       01 {$*VAR-NAME6} USAGE IS SQL TYPE IS XML AS DBCLOB (30 K).\n"
                  + "       01 {$*VAR-NAME10} USAGE IS SQL TYPE IS XML AS  BLOB-FILE.\n"
                  + "       01 {$*VAR-NAME11} USAGE IS SQL TYPE IS XML AS  CLOB-FILE.\n"
                  + "       01 {$*VAR-NAME12} USAGE IS SQL TYPE IS XML AS  DBCLOB-FILE.\n"
                  + "        PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$var1}.";

  public static final String LOB_XML_TEXT2 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*VAR-NAME1}.\n"
                  + "          04 {$*VAR} USAGE IS SQL TYPE IS XML AS CHARACTER LARGE OBJECT (10).\n"
                  + "        PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$var-name1}.";

  public static final String LOB_XML_TEXT3 =
          "        Identification Division.\n"
                  + "        Program-Id. 'TEST1'.\n"
                  + "        Data Division.\n"
                  + "         Working-Storage Section.\n"
                  + "       01 {$*VAR-NAME1}.\n"
                  + "          49 {$*VAR|1} USAGE IS SQL TYPE IS XML AS CHARACTER LARGE OBJECT (10).\n"
                  + "        PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$var-name1}.";
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

  @Test
  void testTableLocVariable() {
    UseCaseEngine.runTest(TABLE_LOCATOR_TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testLobVariables() {
    UseCaseEngine.runTest(LOD_VARS_TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testLobVariables_levelError() {
    UseCaseEngine.runTest(LOD_VARS_TEXT1, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testLobXMLVariables1() {
    UseCaseEngine.runTest(LOB_XML_TEXT1, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testLobXMLVariables2() {
    UseCaseEngine.runTest(LOB_XML_TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testLobXMLVariables_levelError() {
    UseCaseEngine.runTest(LOB_XML_TEXT3, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "Allowed range is 2 to 48",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()
            )
    ));
  }

  @Test
  void testBinaryHostVariableArray1() {
    UseCaseEngine.runTest(BINARY_ARR_TEXT1, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testBinaryHostVariableArray2() {
    UseCaseEngine.runTest(BINARY_ARR_TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testBinaryHostVariableArray3() {
    UseCaseEngine.runTest(BINARY_ARR_TEXT3, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testBinaryHostVariableArray4() {
    UseCaseEngine.runTest(BINARY_ARR_TEXT4, ImmutableList.of(), ImmutableMap.of());
  }
}
