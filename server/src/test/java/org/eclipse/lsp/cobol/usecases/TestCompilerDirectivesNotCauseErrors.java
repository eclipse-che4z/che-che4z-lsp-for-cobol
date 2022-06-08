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

/** This class checks that there are no errors shown for compiler directives on several lines */
class TestCompilerDirectivesNotCauseErrors {

  private static final String TEXT =
      "       PROCESS NODYNAM,CODEPAGE(1140),NSYMBOL(NATIONAL)\n"
          + "       PROCESS ARITH(EXTEND),OPT(1),CICS\n"
          + "      ******************************************************************\n"
          + "      * TEST\n"
          + "      ******************************************************************\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. TEST1.\n"
          + "        AUTHOR. ANDREI.\n"
          + "        INSTALLATION. 1234.\n"
          + "        DATE-WRITTEN. 01/01/1970 6:00 PM.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       1 {$*PARENT} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*MAINLINE} SECTION.\n"
          + "      * --------------------------------------------------------------\n"
          + "      * MAINLINE\n"
          + "      * --------------------------------------------------------------\n"
          + "           PERFORM {#DISP1}\n"
          + "           EXEC CICS RETURN\n"
          + "           END-EXEC\n"
          + "           .\n"
          + "       {#*DISP1}.\n"
          + "              DISPLAY 'HELLO'.\n"
          + "       END PROGRAM 'TEST1'.";

  private static final String TEXT_WRONG_SEQUENCE =
      "{a|1}12     PROCESS CICS('COBOL3,APOST,SP')                                \n"
          + "       Identification Division.\n"
          + "       Program-Id. 'ACTDCNVI'.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  // Ref: https://www.ibm.com/support/knowledgecenter/SS6SG3_6.3.0/lr/ref/rlcdscbl.html
  @Test
  void test_error_on_wrongSequenceNo() {
    UseCaseEngine.runTest(
        TEXT_WRONG_SEQUENCE,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "The first character of the sequence number must be numeric.",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
