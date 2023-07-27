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
 * Test that COBOL LS engine tolerate wrong syntax for label record like compiler. As per <a
 * href="https://www.ibm.com/docs/en/cobol-zos/6.3?topic=division-data-file-description-entries">IBM
 * Doc</a> DATA RECORDS should e followed by ARE and DATA RECORD should be followed by IS. But the
 * cobol compiler tolerate DATA RECORD ARE and RECORDS IS, this class tests this toleration.
 */
public class TestFDDataRecordToleration {

  private static final String BASE =
      "       CBL TRUNC(BIN),ARITH(EXTEND)\n"
          + "       ID DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "      ****************************************************************\n"
          + "      *          CONFIGURATION SECTION                               *\n"
          + "      ****************************************************************\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SOURCE-COMPUTER. IBM-3090.\n"
          + "       OBJECT-COMPUTER. IBM-3090.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "           SELECT {$VAR}  ASSIGN TO VAR.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*VAR}\n"
          + "           BLOCK  CONTAINS 0 RECORDS\n"
          + "           RECORDING MODE  IS V\n"
          + "           LABEL  RECORD  ARE STANDARD\n";
  private static final String SUFFIX =
      "           RECORD IS VARYING IN SIZE FROM 1 TO 10108 CHARACTERS\n"
          + "                                     DEPENDING ON {$WS-LG}.\n"
          + "       01  {$*ENR-VAR}.\n"
          + "           05 {$*F}           PIC X         OCCURS 10108\n"
          + "                                     DEPENDING ON {$WS-LG}.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*LT}.\n"
          + "           05 {$*WS-LG}         PIC  9(08) VALUE ZERO.\n";
  private static final String TEXT_TOLERATE_RECORD_ARE =
      BASE + "           DATA   RECORD  ARE {$ENR-VAR}\n" + SUFFIX;

  private static final String TEXT_TOLERATE_RECORDS_IS =
      BASE + "           DATA   RECORDS  IS {$ENR-VAR}\n" + SUFFIX;

  @Test
  void test1() {
    UseCaseEngine.runTest(TEXT_TOLERATE_RECORDS_IS, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(TEXT_TOLERATE_RECORD_ARE, ImmutableList.of(), ImmutableMap.of());
  }
}
