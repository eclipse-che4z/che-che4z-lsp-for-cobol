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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** Typing END-IF should not produce any exceptions */
class TestEndIfDoesNotProduceError {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           IF (1 = 0) THEN\n"
          + "           DISPLAY 'asdfse'\n"
          + "           {END|1|2}{|3}\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Extraneous input 'END' expected {ACCEPT, ADD, ALTER, CALL, CANCEL, CLOSE, COMPUTE, CONTINUE, "
                    + "D-B, D-C, DEBUG, DELETE, DISABLE, DISPLAY, DIVIDE, ENABLE, ENTRY, EVALUATE, EXEC, EXHIBIT, EXIT, "
                    + "GENERATE, GET, GO, GOBACK, IF, INITIALIZE, INITIATE, INSPECT, MERGE, MOVE, MULTIPLY, OPEN, "
                    + "PERFORM, PURGE, READ, READY, RECEIVE, RELEASE, RESET, RETURN, REWRITE, ROW, SEARCH, SEND, "
                    + "SERVICE, SET, SHOW, SORT, START, STOP, STRING, SUBTRACT, TERMINATE, UNSTRING, WRITE, XML, "
                    + "'.', ';'}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "The following token must start in Area A: END",
                DiagnosticSeverity.Warning,
                SourceInfoLevels.WARNING.getText()),
            "3",
            new Diagnostic(
                null,
                "Unexpected end of file",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
