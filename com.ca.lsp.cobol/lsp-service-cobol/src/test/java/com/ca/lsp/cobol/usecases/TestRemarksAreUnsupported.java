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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.Test;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonMap;

/**
 * This test checks that the remarks not marked as comments, and the syntax analysis applied.
 *
 * <p>The REMARKS is an old syntax that is not supported anymore, so it should be marked as error.
 */
public class TestRemarksAreUnsupported {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TEST1.\n"
          + "      ******************************************************************\n"
          + "      *REMARKS.\n"
          + "      ******************************************************************\n"
          + "\n"
          + "             {INPUT|unsupported} FILE           - DDS0001.PATSRCH\n"
          + "\n"
          + "             VSAM MASTER FILES    - DDS0001.PATMASTR & DDS0001.PATPERSN\n"
          + "\n"
          + "             INPUT ERROR FILE     - DDS0001.PATERR\n"
          + "\n"
          + "             OUTPUT FILE PRODUCED -  DDS001.WARDPRT\n"
          + "\n"
          + "             DUMP FILE            -   SYSOUT\n"
          + "\n"
          + "      ******************************************************************\n"
          + "\n"
          + "       ENVIRONMENT DIVISION.";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        TEXT,
        emptyList(),
        singletonMap(
            "unsupported",
            new Diagnostic(
                null,
                "Syntax error on 'INPUT' expected "
                    + "{<EOF>, AUTHOR, DATA, DATE_COMPILED, DATE_WRITTEN, "
                    + "END, ENVIRONMENT, ID, IDENTIFICATION, INSTALLATION, "
                    + "PROCEDURE, SECURITY, COMMENTENTRYLINE}",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
