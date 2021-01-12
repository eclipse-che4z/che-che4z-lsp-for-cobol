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
package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/** This use case checks if the absence of dot at the end recognized as an error. */
class TestExtraneousInputEOFExpecting {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           if (1 > 0) NEXT SENTENCE{|1}"; // No dot at the end of file

  private static final String MESSAGE =
      "Extraneous input '<EOF>' expected {ACCEPT, CANCEL, CLOSE, COMPUTE, DISPLAY, DIVIDE, "
          + "EVALUATE, EXHIBIT, GOBACK, IF, INITIALIZE, INITIATE, INSPECT, MULTIPLY, PERFORM, "
          + "PURGE, SERVICE, SORT, STOP, STRING, SUBTRACT, TERMINATE, UNSTRING, CALL, CONTINUE, "
          + "DISABLE, ENABLE, EXIT, GENERATE, GO, MERGE, SEARCH, XML, ADD, ALTER, DELETE, ENTRY, "
          + "MOVE, OPEN, READ, RECEIVE, RELEASE, RETURN, REWRITE, SEND, SET, START, EXEC_SQL, EXEC, "
          + "WRITE, DOT_FS}";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "1",
            new Diagnostic(
                null, MESSAGE, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())));
  }
}
