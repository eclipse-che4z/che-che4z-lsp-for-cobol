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
import org.eclipse.lsp.cobol.core.model.ErrorStage;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the remarks not marked as comments, and the syntax analysis applied.
 *
 * <p>The REMARKS is an old syntax that is not supported anymore, so it should be marked as error.
 */
class TestRemarksAreUnsupported {

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
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "unsupported",
            new Diagnostic(
                new Range(),
                "Syntax error on 'INPUT' expected {AUTHOR, CBL, DATA, DATE-COMPILED, DATE-WRITTEN, "
                    + "END, ENVIRONMENT, ID, IDENTIFICATION, INSTALLATION, PROCEDURE, PROCESS, SECURITY}",
                DiagnosticSeverity.Error,
                ErrorStage.SYNTAX.getText())));
  }
}
