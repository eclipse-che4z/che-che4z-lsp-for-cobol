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
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS WRITE DML statement */
public class TestIdmsWriteClause {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_PROGRAM} PIC X(8).\r\n"
          + "        01 {$*WK_REPLY} PIC X(8).\r\n"
          + "        01 {$*WK_TEXT} PIC X(8).\r\n"
          + "        01 {$*WK1} PIC X(8).\r\n"
          + "        01 {$*WK2} PIC X(8).\r\n"
          + "        01 {$*WK3} PIC X(8).\r\n"
          + "        01 {$*WK4} PIC X(8).\r\n"
          + "        01 {$*WK5} PIC X(8).\r\n"
          + "        01 {$*WK6} PIC X(8).\r\n"
          + "        01 {$*WK_MESSAGE} PIC X(8).\r\n"
          + "        01 {$*WK_HEADER} PIC X(8).\r\n"
          + "        01 {$*WK_LENGTH} PIC X(8).\r\n"
          + "        01 {$*ERROR-STATUS} PIC X(4) VALUE '1400'.\n"
          + "           88 {$*ANY-ERROR-STATUS} VALUE '0001' THRU '9999'.\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String WRITE_JOURNAL_1 =
      "            WRITE JOURNAL FROM {$WK1} TO {$WK2}.\r\n";

  private static final String WRITE_JOURNAL_2 =
      "            WRITE JOURNAL WAIT NOSPAN FROM {$WK1} LENGTH 8.\r\n";

  private static final String WRITE_JOURNAL_3 =
      "            WRITE JOURNAL SPAN FROM {$WK1} LENGTH 8.\r\n";

  private static final String WRITE_JOURNAL_4 =
      "            MOVE 8 TO {$WK_LENGTH}.\r\n"
          + "           WRITE JOURNAL SPAN FROM {$WK1} TO {$WK_LENGTH}.\r\n";

  private static final String WRITE_LINE_TO_TERMINAL_1 =
      "           WRITE LINE TO TERMINAL FROM {$WK1} TO {$WK2}.\r\n";

  private static final String WRITE_LINE_TO_TERMINAL_2 =
      "            MOVE 8 TO {$WK_LENGTH}.\r\n"
          + "           MOVE 1 TO {$WK_HEADER}.\r\n"
          + "           WRITE LINE TO TERMINAL WAIT NEWPAGE NOBACKPAGE\r\n"
          + "           FROM {$WK1} TO {$WK2} HEADER {$WK_HEADER}.\r\n";

  private static final String WRITE_LINE_TO_TERMINAL_3 =
      "           MOVE 1 TO {$WK_HEADER}.\r\n"
          + "           WRITE LINE TO TERMINAL NOBACKPAGE\r\n"
          + "           FROM {$WK1} TO {$WK2} HEADER 1.\r\n";

  private static final String WRITE_LOG_1 = "           WRITE LOG MESSAGE ID 9000010.\r\n";

  private static final String WRITE_LOG_2 =
      "           WRITE LOG MESSAGE ID 9000010 PARMS FROM {$WK1} TO {$WK2}\r\n"
          + "           FROM {$WK3} LENGTH 8 REPLY INTO {$WK_REPLY} MAX LENGTH 8\r\n"
          + "           MESSAGE PREFIX IS 'DC' TEXT INTO {$WK_TEXT} MAX LENGTH 8\r\n"
          + "           MESSAGE PREFIX IS NO TEXT ONLY.\r\n";

  private static final String WRITE_LOG_3 =
      "           MOVE 9000010 TO {$WK_MESSAGE}.\r\n"
          + "           MOVE 8 TO {$WK_LENGTH}.\r\n"
          + "           WRITE LOG MESSAGE ID {$WK_MESSAGE} REPLY INTO\r\n"
          + "           {$WK_REPLY} MAX LENGTH {$WK_LENGTH}\r\n"
          + "           TEXT INTO {$WK_TEXT} TO {$WK1}\r\n"
          + "           TEXT ONLY.\r\n";

  private static final String WRITE_PRINTER_1 =
      "           WRITE PRINTER FROM {$WK1} TO {$WK2}.\r\n";

  private static final String WRITE_PRINTER_2 =
      "           WRITE PRINTER NEWPAGE ENDRPT NATIVE FROM {$WK1} TO {$WK2}\r\n"
          + "           COPIES 3 REPORT ID 34 DESTINATION 'TSTDEST' ALL HOLD KEEP.\n";

  private static final String WRITE_PRINTER_3 =
      "           WRITE PRINTER NEWPAGE ENDRPT SCREEN CONTENTS\r\n"
          + "           COPIES 3 REPORT ID 34 CLASS 4 HOLD KEEP.\n";

  private static final String WRITE_PRINTER_4 =
      "           MOVE 2 TO {$WK1}.\r\n"
          + "           MOVE 244 TO {$WK2}.\r\n"
          + "           MOVE 54 TO {$WK3}.\r\n"
          + "           MOVE 8 TO {$WK_LENGTH}.\r\n"
          + "           WRITE PRINTER NEWPAGE ENDRPT NATIVE FROM {$WK1} LENGTH {$WK_LENGTH}\r\n"
          + "           COPIES {$WK1} REPORT ID {$WK2} CLASS {$WK3}.\n";

  private static final String WRITE_PRINTER_5 =
      "           MOVE 2 TO {$WK1}.\r\n"
          + "           MOVE 244 TO {$WK2}.\r\n"
          + "           MOVE 'TSTDEST' TO {$WK3}.\r\n"
          + "           MOVE 8 TO {$WK_LENGTH}.\r\n"
          + "           WRITE PRINTER NEWPAGE ENDRPT NATIVE FROM {$WK1} LENGTH {$WK_LENGTH}\r\n"
          + "           COPIES {$WK1} REPORT ID {$WK2} DESTINATION {$WK3}.\n";

  private static final String WRITE_TERMINAL_1 =
      "           WRITE TERMINAL FROM {$WK1} TO {$WK2}.\n";

  private static final String WRITE_TERMINAL_2 =
      "           WRITE TERMINAL FROM {$WK1} LENGTH {$WK2}.\n";

  private static final String WRITE_TERMINAL_3 =
      "           WRITE TERMINAL FROM {$WK1} LENGTH 8.\n";

  private static final String WRITE_TERMINAL_4 =
      "           WRITE TERMINAL NOWAIT ERASE ALL UNPROTECTED FREE STORAGE\r\n"
          + "           FROM {$WK1} TO {$WK2}.\n";

  private static final String WRITE_TERMINAL_5 =
      "           WRITE TERMINAL ERASE FROM {$WK1} TO {$WK2}.\n";

  private static final String WRITE_THEN_READ_1 =
      "           WRITE THEN READ TERMINAL FROM {$WK1} TO {$WK2} INTO {$WK3}\r\n"
          + "           TO {$WK4}.\n";

  private static final String WRITE_THEN_READ_2 =
      "           WRITE THEN READ TERMINAL WAIT NEWPAGE FREE STORAGE FROM {$WK1}\n"
          + "           TO {$WK2} BUFFER FROM POSITION '0000000A' GET STORAGE\n"
          + "           INTO {$WK3} MAX LENGTH 8 RETURN LENGTH {$WK4}.\n";

  private static final String WRITE_THEN_READ_3 =
      "           MOVE '0000000A' TO {$WK1}.\n"
          + "           MOVE 8 TO {$WK_LENGTH}\n"
          + "           WRITE THEN READ TERMINAL WAIT ERASE ALL UNPROTECTED\n"
          + "           FREE STORAGE FROM {$WK1} TO {$WK2} MODIFIED FROM POSITION\n"
          + "           {$WK1} INTO {$WK3} MAX LENGTH {$WK_LENGTH}.\n";

  private static final String WRITE_JOURNAL_ON_1 =
      "            WRITE JOURNAL WAIT NOSPAN FROM {$WK1} LENGTH 8\r\n"
          + "           ON {$ANY-ERROR-STATUS} DISPLAY 'WRITE ERROR'.\n";

  private static final String WRITE_THEN_READ_ON_1 =
      "           WRITE THEN READ TERMINAL WAIT NEWPAGE FREE STORAGE FROM {$WK1}\n"
          + "           TO {$WK2} BUFFER FROM POSITION '0000000A' GET STORAGE\n"
          + "           INTO {$WK3} MAX LENGTH 8 RETURN LENGTH {$WK4}\n"
          + "           ON {$ANY-ERROR-STATUS} DISPLAY 'WRITE ERROR'.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + WRITE_JOURNAL_1,
        BOILERPLATE + WRITE_JOURNAL_2,
        BOILERPLATE + WRITE_JOURNAL_3,
        BOILERPLATE + WRITE_JOURNAL_4,
        BOILERPLATE + WRITE_LINE_TO_TERMINAL_1,
        BOILERPLATE + WRITE_LINE_TO_TERMINAL_2,
        BOILERPLATE + WRITE_LINE_TO_TERMINAL_3,
        BOILERPLATE + WRITE_LOG_1,
        BOILERPLATE + WRITE_LOG_2,
        BOILERPLATE + WRITE_LOG_3,
        BOILERPLATE + WRITE_PRINTER_1,
        BOILERPLATE + WRITE_PRINTER_2,
        BOILERPLATE + WRITE_PRINTER_3,
        BOILERPLATE + WRITE_PRINTER_4,
        BOILERPLATE + WRITE_PRINTER_5,
        BOILERPLATE + WRITE_TERMINAL_1,
        BOILERPLATE + WRITE_TERMINAL_2,
        BOILERPLATE + WRITE_TERMINAL_3,
        BOILERPLATE + WRITE_TERMINAL_4,
        BOILERPLATE + WRITE_TERMINAL_5,
        BOILERPLATE + WRITE_THEN_READ_1,
        BOILERPLATE + WRITE_THEN_READ_2,
        BOILERPLATE + WRITE_THEN_READ_3,
        BOILERPLATE + WRITE_JOURNAL_ON_1,
        BOILERPLATE + WRITE_THEN_READ_ON_1);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS read tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
