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

import static org.junit.jupiter.api.Assertions.*;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.List;
import java.util.stream.Collectors;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/**
 * Test different pattern for the copy replace statements. Also covers, LEADING and TRAILING
 * clauses.
 */
class TestCopybookReplacePatterns {

  private static final String BASE =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n";
  private static final String TEXT =
      BASE
          + "5      COPY {~REPL} REPLACING ==TAG== BY == ACC ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {ACC_ID|1}.";

  private static final String TEXT2 =
      BASE
          + "5      COPY {~REPL1} REPLACING ==:TAG:== BY == ACC ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String TEXT3 =
      BASE
          + "5      COPY {~REPL3} REPLACING LEADING ==TAG== BY == ACC ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String TEXT4 =
      BASE
          + "5      COPY {~REPL4} REPLACING TRAILING ==ID== BY == BY-IDS ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$TAG_BY-IDS}.";

  private static final String TEXT5 =
      BASE
          + "       01  {$*LOGA}.  \r\n"
          + "       {_COPY {~REPL5}  \r\n"
          + "            REPLACING  ==LDAY== BY ==DMAN123000000000000000000000000000000005900\n"
          + "      -    0000000000000000011111111111111111111111111111111111111111111\n"
          + "      -    00000000000000000000000== .|2_}\r\n";

  private static final String TEXT6 =
      BASE
          + "5      COPY {~REPL6} REPLACING ==:TAG:== BY == A ==.\r\n"
          + "8      PROCEDURE DIVISION.\r\n"
          + "9          MOVE 0 TO {$A_ID}.";

  private static final String TEXT7 =
      BASE
          + "       01  {$*LOGA}.  \r\n"
          + "       {_COPY {~REPL7}  \r\n"
          + "            REPLACING  ==LDAY== BY ==DMAN123000000000000000000000000000000005900\n"
          + "      -    0000000000000000011111111111111111111111111111111111111111111\n"
          + "      -    00000000000000000000000== .|2_}\r\n";

  private static final String TEXT8 =
      BASE
          + "5      COPY {~REPL8} REPLACING =='XXX_ID$'== BY ==ACC_ID==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String TEXT9 =
      BASE
          + "5      COPY {~REPL9} REPLACING =='XXX'_ID== BY ==ACC_ID==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String TEXT10 =
      BASE
          + "5      COPY {~REPL9} SUPPRESS REPLACING =='XXX'_ID== BY ==ACC_ID==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String REPL = "0      01 {$*TAG_ID}        PIC 9.\n";
  private static final String REPL_NAME = "REPL";

  private static final String REPL1 = "0      01 {$*:TAG:_ID^ACC_ID}        PIC 9.\n";
  private static final String REPL1_NAME = "REPL1";

  private static final String REPL3 = "0      01 {$*TAG_ID^ACC_ID}        PIC 9.\n";
  private static final String REPL3_NAME = "REPL3";

  private static final String REPL4 = "0      01 {$*TAG_ID^TAG_BY-IDS}        PIC 9.\n";
  private static final String REPL4_NAME = "REPL4";

  private static final String REPL5 =
      "      ***************************************************************** 09700000\r\n"
          + "         02  {$*LOGHDR}.                                                   "
          + " 18000000\r\n"
          + "           03 "
          + " {$*LDAY^DMAN1230000000000000000000000000000000000000000000001111111111111111111111111111111111111111111100000000000000000000000|1}"
          + "           PIC S9(7) COMP-3.                         24000000";
  private static final String REPL5_NAME = "REPL5";

  private static final String REPL6 =
      "0      01 {$*:TAG:_ID^A_ID}        PIC 9.                                        00007100";
  private static final String REPL6_NAME = "REPL6";

  private static final String REPL7 =
      "      ***************************************************************** 09700000\r\n"
          + "         02  {$*LOGHDR}.                                                   "
          + " 18000000\r\n"
          + "           03 "
          + " {$*LDAY^DMAN1230000000000000000000000000000000000000000000001111111111111111111111111111111111111111111100000000000000000000000|1}"
          + "           PIC S9(7) COMP-3.";
  private static final String REPL7_NAME = "REPL7";

  private static final String REPL8 = "0      01 {$*'XXX_ID$'^ACC_ID}    PIC 9.\n";
  private static final String REPL8_NAME = "REPL8";

  private static final String REPL9 = "0      01 {$*'XXX'_ID^ACC_ID}    PIC 9.\n";
  private static final String REPL9_NAME = "REPL9";

  @Test
  void testPartialTextAreNotReplaced() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable ACC_ID is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testTextAreNotReplacedBasedOnValidSeparators() {
    UseCaseEngine.runTest(
        TEXT2, ImmutableList.of(new CobolText(REPL1_NAME, REPL1)), ImmutableMap.of());
  }

  @Test
  void testPartialTextReplaceableWithLeadingClause() {
    UseCaseEngine.runTest(
        TEXT3, ImmutableList.of(new CobolText(REPL3_NAME, REPL3)), ImmutableMap.of());
  }

  @Test
  void testPartialTextReplaceableWithTrailingClause() {
    UseCaseEngine.runTest(
        TEXT4, ImmutableList.of(new CobolText(REPL4_NAME, REPL4)), ImmutableMap.of());
  }

  @Test
  void testWhenReplacedLengthIsMoreThanReplaceable() {
    UseCaseEngine.runTest(
        TEXT5,
        ImmutableList.of(new CobolText(REPL5_NAME, REPL5)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable name cannot exceed 30 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Errors inside the copybook",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText())));
  }

  @Test
  void testWhenReplacedLengthIsLessThanReplaceable() {
    UseCaseEngine.runTest(
        TEXT6, ImmutableList.of(new CobolText(REPL6_NAME, REPL6)), ImmutableMap.of());
  }

  @Test
  void testWhenReplacedLengthIsMoreThanReplaceableAndCopybookHasNoSequence() {
    UseCaseEngine.runTest(
        TEXT7,
        ImmutableList.of(new CobolText(REPL7_NAME, REPL7)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable name cannot exceed 30 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Errors inside the copybook",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText())));
  }

  @Test
  void testQuotedTextAreReplaced() {
    UseCaseEngine.runTest(
        TEXT8, ImmutableList.of(new CobolText(REPL8_NAME, REPL8)), ImmutableMap.of());
  }

  @Test
  void testPartialQuotedTextAreReplaced() {
    UseCaseEngine.runTest(
        TEXT9, ImmutableList.of(new CobolText(REPL9_NAME, REPL9)), ImmutableMap.of());
  }

  @Test
  void testCopySuppressReplacing() {
    UseCaseEngine.runTest(
        TEXT10, ImmutableList.of(new CobolText(REPL9_NAME, REPL9)), ImmutableMap.of());
  }

  public static final String TEXT_MULTI_REPLACE_SAME_COPYBOOK =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.                                                      \n"
          + "           SM206A.                                                      \n"
          + "       DATA DIVISION.                                                   \n"
          + "       WORKING-STORAGE SECTION.                                         \n"
          + "       COPY {~COPYBK} REPLACING CDBPCB BY ==OCA-PCB== \n"
          + "                       CALL-STAT BY STATUS-CODE.                             \n"
          + "       COPY {~COPYBK} \n"
          + "               REPLACING CDBPCB BY ==BTB-PCB== \n"
          + "               CALL-STAT BY BTUS-CODE. \n"
          + "       PROCEDURE DIVISION. \n"
          + "           DISPLAY {$BTB-PCB}.  \n"
          + "           DISPLAY {$OCA-PCB}.\n"
          + "           STOP RUN.               ";
  public static final String MULTI_REPLACE_COPYBOOK =
      "000100 01         {$*CDBPCB`->OCA-PCB`->BTB-PCB}.                                           "
          + "    00010000\n"
          + "000200   03       {$*DBD-NAME}             PIC X(8).                        00020000\n"
          + "000300   03       {$*SEG-LEVEL}            PIC XX.                          00030000\n"
          + "000400   03       {$*CALL-STAT`->STATUS-CODE`->BTUS-CODE}            PIC XX.          "
          + "                00040000\n"
          + "000500   03       {$*PROC-OPTS}            PIC X(4).                        00050000\n"
          + "000600   03       {$*RESERVED}             PIC S9(5) COMPUTATIONAL.         00060000\n"
          + "000700   03       {$*SEG-NAME-FB}          PIC X(8).                        00070000\n"
          + "000800   03       {$*LENGTH-FB-KEY}        PIC S9(5) COMPUTATIONAL.         00080000\n"
          + "000900   03       {$*NUMB-SEN-SEGS}        PIC S9(5) COMPUTATIONAL.         00090000\n"
          + "001000   03       {$*KEY-FB-AREA}          PIC X(80).                      "
          + " 00100000\n";

  @Test
  void testWhenSameCopybookIsReplacedMultipleTime_thenVariablesAreResolvedCorrectly() {
    UseCaseEngine.runTest(
        TEXT_MULTI_REPLACE_SAME_COPYBOOK,
        ImmutableList.of(new CobolText("COPYBK", MULTI_REPLACE_COPYBOOK)),
        ImmutableMap.of());
  }

  /**
   * SYSPRINT OUTPUT: 000008 COPY ATHITS 000009 REPLACING 'XXXX' BY XYZ. 000010C 16105A 01
   * XYZ-BASE-RCRD-TX PIC X(421). 000000000 421C
   */
  public static final String TEXT11 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       COPY {~ATHITS}\n"
          + "           REPLACING 'XXXX' BY XYZ.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$XYZ-BASE-RCRD-TX}.\n"
          + "           STOP RUN.";

  public static final String ATHITS_NAME = "ATHITS";
  public static final String ATHITS =
      "16105A 01  {$*'XXXX'-BASE-RCRD-TX^XYZ-BASE-RCRD-TX}                  PIC X(421).\n";

  @Test
  void testLiteralReplacing() {
    UseCaseEngine.runTest(
        TEXT11, ImmutableList.of(new CobolText(ATHITS_NAME, ATHITS)), ImmutableMap.of());
  }

  public static final String TEXT12 =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.                                                      \n"
          + "           SM206A.                                                      \n"
          + "       DATA DIVISION.                                                   \n"
          + "       WORKING-STORAGE SECTION.                                         \n"
          + "       01 {$*tes}.\n"
          + "       COPY {~ATHITS}\n"
          + "           REPLACING ==:RCTR:== BY ==XOD==\n"
          + "                   ==(01)== BY ==(02)==\n"
          + "                   == 01 == BY == 05 ==.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$XYZ-XOD-TX}.\n"
          + "           STOP RUN.   ";
  public static final String ATHITS_1 = "         01 {$*XYZ-:RCTR:-TX^XYZ-XOD-TX} pic x(01).\n";

  @Test
  void testLevelReplacement_picClauseReplacement_variableReplacement() {
    AnalysisResult analysisResult =
        UseCaseEngine.runTest(
            TEXT12,
            ImmutableList.of(new CobolText(ATHITS_NAME, ATHITS_1)),
            ImmutableMap.of(),
            ImmutableList.of(),
            CobolLanguageId.COBOL);
    ProgramNode firstProgramNode = analysisResult.getRootNode().findFirstProgramNode();
    List<VariableNode> variableNodes =
        analysisResult
            .getSymbolTableMap()
            .get(SymbolTable.generateKey(firstProgramNode))
            .getVariables()
            .stream()
            .filter(v -> v.getName().equals("XYZ-XOD-TX"))
            .collect(Collectors.toList());
    assertEquals(variableNodes.size(), 1);
    assertInstanceOf(ElementaryItemNode.class, variableNodes.get(0));

    ElementaryItemNode elementaryVariable = (ElementaryItemNode) variableNodes.get(0);
    assertEquals(elementaryVariable.getPicClause(), "x(02)");
    assertEquals(elementaryVariable.getLevel(), 5);
  }

  public static final String TEXT13 =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.                                                      \n"
          + "           SM206A.                                                      \n"
          + "       DATA DIVISION.                                                   \n"
          + "       WORKING-STORAGE SECTION.                                         \n"
          + "       COPY {~ATHITS}\n"
          + "           REPLACING ==:oi x(01):== BY ==pic x(05)==.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$XYZ-RCTR-TX}.\n"
          + "           STOP RUN.   ";
  public static final String ATHITS_2 = "         01 {$*XYZ-RCTR-TX} :oi x(01):.";

  @Test
  void testPicClauseReplacementWithSpaces() {
    AnalysisResult analysisResult =
        UseCaseEngine.runTest(
            TEXT13,
            ImmutableList.of(new CobolText(ATHITS_NAME, ATHITS_2)),
            ImmutableMap.of(),
            ImmutableList.of(),
            CobolLanguageId.COBOL);
    ProgramNode firstProgramNode = analysisResult.getRootNode().findFirstProgramNode();
    List<VariableNode> variableNodes =
        analysisResult
            .getSymbolTableMap()
            .get(SymbolTable.generateKey(firstProgramNode))
            .getVariables()
            .stream()
            .filter(v -> v.getName().equals("XYZ-RCTR-TX"))
            .collect(Collectors.toList());
    assertEquals(variableNodes.size(), 1);
    assertInstanceOf(ElementaryItemNode.class, variableNodes.get(0));

    ElementaryItemNode elementaryVariable = (ElementaryItemNode) variableNodes.get(0);
    assertEquals(elementaryVariable.getPicClause(), "x(05)");
    assertEquals(elementaryVariable.getLevel(), 1);
  }

  public static final String TEXT14 =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.                                                      \n"
          + "           SM206A.                                                      \n"
          + "       DATA DIVISION.                                                   \n"
          + "       WORKING-STORAGE SECTION.                                         \n"
          + "       COPY {~ATHITS}\n"
          + "0000           REPLACING ==     AJSKA   BAJSK== BY ==UI==.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$UI}.\n"
          + "           STOP RUN.   ";
  public static final String ATHITS_3 =
      "         01 {_AJSKA \n"
          + "               BAJSK^UI_}            \n"
          + "               pic x(01).";

  @Disabled("Not supported by Usecase engine yet")
  @Test
  void testReplacementWithSpaces() {
    UseCaseEngine.runTest(
        TEXT13, ImmutableList.of(new CobolText(ATHITS_NAME, ATHITS_3)), ImmutableMap.of());
  }
}
