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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks sql include statement for explicitly defined SQLCA/SQLDA. */
class TestSqlIncludeStatementForDefinedFields {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "           EXEC SQL INCLUDE {~SQLCA} END-EXEC.\n"
          + "           EXEC SQL INCLUDE {~SQLDA} END-EXEC.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 23 TO {$SQLCAID}  OF  {$SQLCA}.\n"
          + "           MOVE 63 TO {$SQLCABC} OF  {$SQLCA}.\n"
          + "           MOVE 00 TO {$SQLCODE} OF  {$SQLCA}.\n"
          + "           MOVE 144 TO {$SQLN} OF  {$SQLDA}.\n"
          + "           MOVE 200 TO {$SQLD} OF  {$SQLDA}.\n"
          + "           IF {$SQLCODE} = ZERO  THEN  DISPLAY \"SUCCESS SQLCODE = \" {$SQLCODE}\n "
          + "           ELSE DISPLAY \" FAIL SQLCA-DBCODE-EXT = \"  {$SQLCA-DBCODE-EXT}.\n"
          + "           DISPLAY  {$SQLCA-EYE-CATCH} .\n"
          + "           DISPLAY  {$SQLCA-LEN}.\n"
          + "           DISPLAY  {$SQLCA-DB-VRS}.\n"
          + "           DISPLAY  {$SQLN}.\n"
          + "           DISPLAY  {$SQLD}.\n"
          + "           DISPLAY  {$SQLLEN}.\n"
          + "           DISPLAY  {$SQLTYPE}.\n"
          + "           DISPLAY  {$SQLVAR2-RESERVED-1}.\n"
          + "           DISPLAY  {$SQLDATATYPE-NAMEL}.\n";

  private static final String STRUCT1 =
      "       01  {$*SQLCA}.\n"
          + "            05 {$*SQLCAID}      PIC X(8).\n"
          + "            05 {$*SQLCABC}      PIC S9(9) COMP-5.\n"
          + "            05 {$*SQLCODE}      PIC S9(9) COMP-5.\n"
          + "            05 {$*SQLCA-EYE-CATCH}   PIC X(08).\n"
          + "            05 {$*SQLCA-LEN}      PIC S9(9) COMP-5.\n"
          + "            05 {$*SQLCA-DB-VRS}      PIC S9(9) COMP-5.\n"
          + "            05 {$*SQLCA-ERROR-DATA}.\n"
          + "                10 {$*SQLCA-DBCODE}.\n"
          + "                   15 {$*SQLCA-DBCODE-EXT}   PIC X(02).\n"
          + "                   15 {$*SQLCA-DBCODE-INT}    PIC S9(4) COMP.\n";

  private static final String STRUCT2 =
      "       01  {$*SQLDA}.\n"
          + "            05 {$*SQLN}      PIC S9(4) BINARY.\n"
          + "            05 {$*SQLD} BINARY.\n"
          + "                10 {$*SQLVAR1}.\n"
          + "                   15 {$*SQLLEN}   PIC S9(4) BINARY.\n"
          + "                   15 {$*SQLTYPE}  PIC S9(4) BINARY.\n"
          + "                10 {$*SQLVAR2}.\n"
          + "                   15 {$*SQLVAR2-RESERVED-1}   PIC S9(9) BINARY.\n"
          + "                   15 {$*SQLDATATYPE-NAMEL}  PIC S9(4) BINARY.\n";

  private static final String CPY_SQLCA = "SQLCA";
  private static final String CPY_SQLDA = "SQLDA";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(CPY_SQLCA, STRUCT1), new CobolText(CPY_SQLDA, STRUCT2)),
        ImmutableMap.of());
  }
}
