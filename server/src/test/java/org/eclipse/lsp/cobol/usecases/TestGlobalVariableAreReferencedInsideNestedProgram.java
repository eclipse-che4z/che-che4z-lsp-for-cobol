/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks that global FD variables from a parent cobol program can be referenced inside a
 * nested program
 */
public class TestGlobalVariableAreReferencedInsideNestedProgram {
  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.                                         IC2334.2\n"
          + "000200 PROGRAM-ID.                                                      IC2334.2\n"
          + "000300     IC233A.                                                      IC2334.2\n"
          + "004000 ENVIRONMENT DIVISION.                                            IC2334.2\n"
          + "004600 INPUT-OUTPUT SECTION.                                            IC2334.2\n"
          + "004700 FILE-CONTROL.                                                    IC2334.2\n"
          + "004800     SELECT {$PRINT-FILE} ASSIGN TO                                  IC2334.2\n"
          + "004900     XXXXX055.                                                    IC2334.2\n"
          + "005000     SELECT OPTIONAL {$TEST-FILE} ASSIGN TO                          IC2334.2\n"
          + "005100     XXXXX018.                                                    IC2334.2\n"
          + "005200 DATA DIVISION.                                                   IC2334.2\n"
          + "005300 FILE SECTION.                                                    IC2334.2\n"
          + "005400 FD  {$*PRINT-FILE}.                                                  IC2334.2\n"
          + "005500 01  {$*PRINT-REC} PICTURE X(120).                                    IC2334.2\n"
          + "005600 01  {$*DUMMY-RECORD} PICTURE X(120).                                 IC2334.2\n"
          + "005700 FD  {$*TEST-FILE} GLOBAL.                                            IC2334.2\n"
          + "005800 01  {$*TEST-REC} PIC X(20).                                          IC2334.2\n"
          + "005900 WORKING-STORAGE SECTION.                                         IC2334.2\n"
          + "040200 IDENTIFICATION DIVISION.                                         IC2334.2\n"
          + "040300 PROGRAM-ID.                                                      IC2334.2\n"
          + "040400     IC233A-1.                                                    IC2334.2\n"
          + "050200 DATA DIVISION.                                                   IC2334.2\n"
          + "050300 FILE SECTION.                                                    IC2334.2\n"
          + "050400 WORKING-STORAGE SECTION.                                         IC2334.2\n"
          + "050500 PROCEDURE DIVISION.                                              IC2334.2\n"
          + "050600 {@*SECT-IC233A-1-001} SECTION.                                       IC2334.2\n"
          + "050700 {#*USE-INIT-1}.                                                      IC2334.2\n"
          + "050800     OPEN    INPUT {$TEST-FILE}.                                     IC2334.2\n"
          + "050900     READ    {$TEST-FILE}.                                           IC2334.2\n"
          + "051000 {#*END-PROG}.                                                        IC2334.2\n"
          + "051100     EXIT PROGRAM.                                                IC2334.2\n"
          + "051200 END PROGRAM IC233A-1.                                            IC2334.2\n"
          + "051300 END PROGRAM IC233A.                                              IC2334.2\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
