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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static com.google.common.collect.ImmutableMap.of;
import org.eclipse.lsp.cobol.core.model.ErrorSource;

/** The errors inside CICS should be shown in the expected position */
class TestExecCicsShowsErrorCorrectly {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    XCTL123.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC CICS {XCTL123|1} PROGRAM (XCTL1) END-EXEC.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'XCTL123' expected {ABEND, ADD, ADDRESS, ALLOCATE, ASKTIME, ASSIGN, BIF, "
                    + "BUILD, CANCEL, CHANGE, CHECK, CONNECT, CONSISTENT, CONVERSE, CONVERTTIME, DATASET, DEFINE, "
                    + "DELAY, DELETE, DELETEQ, DEQ, DOCUMENT, DUMP, ENDBR, ENDBROWSE, ENQ, ENTER, EXTRACT, FILE, "
                    + "FORCE, FORMATTIME, FREE, FREEMAIN, GDS, GET, GETMAIN, GETNEXT, HANDLE, IGNORE, INQUIRE, "
                    + "INTO, INVOKE, ISSUE, KEYLENGTH, LENGTH, LINK, LOAD, MONITOR, MOVE, NOSUSPEND, POINT, POP, "
                    + "POST, PROCESS, PURGE, PUSH, PUT, QUERY, RBA, READ, READNEXT, READPREV, READQ, RECEIVE, "
                    + "RELEASE, REMOVE, REPETABLE, REQID, RESET, RESETBR, RESP, RESP2, RESUME, RETRIEVE, RETURN, "
                    + "REWIND, REWRITE, RIDFLD, ROUTE, RRN, RUN, SEND, SET, SIGNAL, SIGNOFF, SIGNON, SOAPFAULT, "
                    + "SPOOLCLOSE, SPOOLOPEN, SPOOLREAD, SPOOLWRITE, START, STARTBR, STARTBROWSE, SUSPEND, "
                    + "SYNCPOINT, SYSID, TASK, TEST, TRANSFORM, UNCOMMITTED, UNLOCK, UPDATE, VERIFY, WAIT, "
                    + "WAITCICS, WEB, WRITE, WRITEQ, WSACONTEXT, WSAEPR, XCTL, XRBA}",
                DiagnosticSeverity.Error,
                 ErrorSource.PARSING.getText())));
  }
}
