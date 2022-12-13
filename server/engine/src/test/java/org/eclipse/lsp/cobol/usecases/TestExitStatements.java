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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This tests the exit statements */
public class TestExitStatements {

  public static final String TEXT =
      "       identification division.\n"
          + "       program-id. DUMMY.\n"
          + "       author. COBOL-Test.\n"
          + "       environment division.\n"
          + "       data division.\n"
          + "       procedure division.\n"
          + "       {@*A-MAIN}         section.\n"
          + "           perform {@B-SEC}\n"
          + "           goback\n"
          + "           .\n"
          + "       \n"
          + "       {@*B-SEC}              section.\n"
          + "           display 'Hello'\n"
          + "           exit section\n"
          + "           display '(... but no goodbye)'\n"
          + "           .";

  public static final String BASE =
      "       identification division.\n"
          + "       program-id. DUMMY.\n"
          + "       author. COBOL-Test.\n"
          + "       environment division.\n"
          + "       data division.\n"
          + "       procedure division.\n"
          + "       {#*A-MAIN}.\n"
          + "           PERFORM \n"
          + "           display \"apsdsd\" END-PERFORM. \n";
  public static final String TEXT2 = BASE + "           exit paragraph.";
  public static final String TEXT3 = BASE + "           exit .";
  public static final String TEXT4 = BASE + "           exit section.";

  public static final String TEXT5 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*B} PIC 9.\n"
          + "        PROCEDURE DIVISION.\n"
          + "               PERFORM VARYING {$b} FROM 1 BY 1 UNTIL {$B} > 4\n"
          + "               EXIT PERFORM CYCLE\n"
          + "               END-PERFORM\n"
          + "            STOP RUN.";

  public static final String TEXT6 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*B} PIC 9.\n"
          + "        PROCEDURE DIVISION.\n"
          + "               PERFORM VARYING {$b} FROM 1 BY 1 UNTIL {$B} > 4\n"
          + "               EXIT PERFORM\n"
          + "               END-PERFORM\n"
          + "            STOP RUN.";

  public static final String TEXT7 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        LOCAL-STORAGE SECTION.\n"
          + "        1 {$*i} PIC S9(9) COMP-5.\n"
          + "        1 {$*zltemp1} PIC S9(9) COMP-5.\n"
          + "        PROCEDURE DIVISION.\n"
          + "            IF {$i} <= {$zltemp1}\n"
          + "               CONTINUE\n"
          + "             ELSE\n"
          + "               EXIT PERFORM\n"
          + "             END-IF.\n"
          + "        END PROGRAM test1.";

  public static final String TEXT8 =
          "        IDENTIFICATION DIVISION.\n"
                  + "        PROGRAM-ID. test1.\n"
                  + "        DATA DIVISION.\n"
                  + "        WORKING-STORAGE SECTION.\n"
                  + "        LOCAL-STORAGE SECTION.\n"
                  + "        1 {$*i} PIC S9(9) COMP-5.\n"
                  + "        1 {$*zltemp1} PIC S9(9) COMP-5.\n"
                  + "        PROCEDURE DIVISION.\n"
                  + "            IF {$i} <= {$zltemp1}\n"
                  + "               CONTINUE\n"
                  + "             ELSE\n"
                  + "               EXIT METHOD\n"
                  + "             END-IF.\n"
                  + "        END PROGRAM test1.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test3() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test4() {
    UseCaseEngine.runTest(TEXT4, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test5() {
    UseCaseEngine.runTest(TEXT5, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test6() {
    UseCaseEngine.runTest(TEXT6, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test7() {
    UseCaseEngine.runTest(TEXT7, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test8() {
    UseCaseEngine.runTest(TEXT8, ImmutableList.of(), ImmutableMap.of());
  }
}
