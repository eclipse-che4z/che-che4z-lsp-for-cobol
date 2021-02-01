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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/** This class checks that there are no errors shown for compiler directives on several lines */
class TestCompilerDirectivesNotCauseErrors {

  private static final String TEXT =
      "       PROCESS NODYNAM,CODEPAGE(1140),NSYMBOL(NATIONAL)\n"
          + "       PROCESS ARITH(EXTEND),NOOPT,CICS\n"
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

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
