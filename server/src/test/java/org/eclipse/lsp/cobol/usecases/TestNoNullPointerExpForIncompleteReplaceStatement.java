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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** Test no Null pointer exceptions are thrown for incomplete copy replace statements */
class TestNoNullPointerExpForIncompleteReplaceStatement {
  private static final String TEXT2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "           SELECT {$CUSTOMER-FILE-OUT} ASSIGN TO CUSTOUT\n"
          + "               ACCESS IS SEQUENTIAL.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.                                                    \n"
          + "       FD  {$*CUSTOMER-FILE-OUT}\n"
          + "           RECORDING MODE IS V\n"
          + "           BLOCK CONTAINS 0 RECORDS\n"
          + "           RECORD IS VARYING FROM 20 TO 596 CHARACTERS.\n"
          + "           {copy|1} custcopy REPLACING =";

  private static final String TEXT = TEXT2 + "=";

  @Test
  void testWhenTypingEndsAtDoubleEqualChar() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'copy' expected {CBL, END, EXEC, FD, FILE, ID, IDENTIFICATION, LINKAGE, "
                    + "LOCAL-STORAGE, PROCEDURE, PROCESS, SD, WORKING-STORAGE, MAP, SCHEMA, '01-49', '66', '77', '88'}",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void testWhenTypingEndsAtSingleEqualChar() {
    UseCaseEngine.runTest(
        TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'copy' expected {CBL, END, EXEC, FD, FILE, ID, IDENTIFICATION, "
                    + "LINKAGE, LOCAL-STORAGE, PROCEDURE, PROCESS, SD, WORKING-STORAGE, MAP, SCHEMA, "
                    + "'01-49', '66', '77', '88'}",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
