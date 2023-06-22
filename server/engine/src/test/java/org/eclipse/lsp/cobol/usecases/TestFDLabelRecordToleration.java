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
 * Doc</a> LABEL RECORDS should e followed by ARE and LABEL RECORD should be followed by IS. But the
 * cobol compiler tolerate LABEL RECORD ARE and RECORDS IS, this class tests this toleration.
 */
public class TestFDLabelRecordToleration {

  private static final String BASE =
      "000900 IDENTIFICATION DIVISION.                                         00000900\n"
          + "001000 PROGRAM-ID. ABCDEFGH.                                            00001000\n"
          + "001100 ENVIRONMENT DIVISION.                                            00001100\n"
          + "001200 INPUT-OUTPUT SECTION.                                            00001200\n"
          + "001300 FILE-CONTROL.                                                    00001300\n"
          + "001400     SELECT {$ABCD} ASSIGN TO ABCDEFG                           \n"
          + "001500            ORGANIZATION IS INDEXED. \n"
          + "002300 DATA DIVISION.                                                   00002300\n"
          + "002400 FILE SECTION.                                                    00002400\n"
          + "002500 FD  {$*ABCD}                                                         00002500\n";
  private static final String SUFFIX =
      "002800     DATA RECORD IS {$AAAAAAAAAA}.                                   00002800\n"
          + "       01 {$*AAAAAAAAAA} PIC 9(2).\n";
  private static final String TEXT_TOLERATE_RECORDS_IS =
      BASE
          + "               LABEL RECORDS IS OMITTED                                 01510000\n"
          + SUFFIX;

  private static final String TEXT_TOLERATE_RECORD_ARE =
      BASE + "               LABEL RECORD ARE OMITTED                              \n" + SUFFIX;

  @Test
  void test1() {
    UseCaseEngine.runTest(TEXT_TOLERATE_RECORDS_IS, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(TEXT_TOLERATE_RECORD_ARE, ImmutableList.of(), ImmutableMap.of());
  }
}
