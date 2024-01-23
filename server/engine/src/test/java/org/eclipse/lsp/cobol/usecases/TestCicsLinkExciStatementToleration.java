/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Tests the CICS EXCI LINK statement. Ref:
 * https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-link-command-exci
 */
public class TestCicsLinkExciStatementToleration {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.              \n"
          + "              PROGRAM-ID.      TESTA.     \n"
          + "       ENVIRONMENT DIVISION.      \n"
          + "       DATA DIVISION.            \n"
          + "       WORKING-STORAGE SECTION.     \n"
          + "       01  {$*WC}.          \n"
          + "           03 {$*WC-HOST-PGM}  PIC X(8) VALUE 'TEST-A'.    \n"
          + "       01  {$*WW}.       \n"
          + "           03 {$*WW-RETCODE}     PIC S9(8) COMP-5 VALUE ZERO.  \n"
          + "           03 {$*WW-PARM}.      \n"
          + "              05 {$*WW-HOST-APPLID}  PIC X(8).   \n"
          + "       PROCEDURE DIVISION.        \n"
          + "                 EXEC CICS LINK      \n"
          + "                    PROGRAM({$WC-HOST-PGM})      \n"
          + "                    APPLID({$WW-HOST-APPLID})    \n"
          + "                    RETCODE({$WW-RETCODE})      \n"
          + "                    SYNCONRETURN         \n"
          + "                 END-EXEC .       \n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
