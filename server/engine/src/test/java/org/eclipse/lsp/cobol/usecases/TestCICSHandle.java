/*
 * Copyright (c) 2024 Broadcom.
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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Test CICS HANDLE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-handle-abend">HANDLE Command</a>
 *
 * <p>This class tests all variations of the HANDLE command: ABEND, AID, and CONDITION.
 */
public class TestCICSHandle {
  private static final String HANDLE_ABEND_VALID =
          "HANDLE ABEND PROGRAM({$varOne})";

  private static final String HANDLE_ABEND_INVALID =
          "HANDLE {CANCEL|errorOne}";

  private static final String HANDLE_AID_VALID_ONE =
          "HANDLE AID ANYKEY({@SEC1})";

  private static final String HANDLE_AID_VALID_TWO =
          "HANDLE AID PF1({@SEC1})";

  private static final String HANDLE_AID_INVALID =
          "HANDLE {_ANYKEY({@SEC1})|errorOne_}";

  private static final String HANDLE_AID_VALID_THREE =
          "HANDLE AID PF1({@SEC1}) PF3";

  private static final String HANDLE_AID_INVALID_TWO =
          "HANDLE {_AID CLEAR CLRPARTN ENTER OPERID ANYKEY PA1 PF1({@SEC1}) TRIGGER LIGHTPEN PA2 "
                  + "PA3 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11|errorOne_}";

  private static final String HANDLE_CONDITION_VALID =
          "HANDLE CONDITION EOC({@SEC1})";

  private static final String HANDLE_CONDITION_VALID_ONE =
          "HANDLE CONDITION ERROR";


  private static final String HANDLE_CONDITION_VALID_TWO =
          "HANDLE CONDITION";


  private static final String HANDLE_CONDITION_INVALID_ONE =
          "HANDLE {ERROR|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_TWO =
          "HANDLE CONDITION {CONDITION|errorOne} ERROR";

  private static final String HANDLE_CONDITION_INVALID_THREE =
          "HANDLE CONDITION NORMAL {NORMAL|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_WRBRK =
          "HANDLE CONDITION WRBRK {WRBRK|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_INBFMH =
          "HANDLE CONDITION INBFMH {INBFMH|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_ENDINPT =
          "HANDLE CONDITION ENDINPT {ENDINPT|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_NONVAL =
          "HANDLE CONDITION NONVAL {NONVAL|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_NOSTART =
          "HANDLE CONDITION NOSTART {NOSTART|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_TERMIDERR =
          "HANDLE CONDITION TERMIDERR {TERMIDERR|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_FILENOTFOUND =
          "HANDLE CONDITION FILENOTFOUND {FILENOTFOUND|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_NOTFND =
          "HANDLE CONDITION NOTFND {NOTFND|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_DUPKEY =
          "HANDLE CONDITION DUPKEY {DUPKEY|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_INVREQ =
          "HANDLE CONDITION INVREQ {INVREQ|errorOne}";

  private static final String HANDLE_CONDITION_INVALID_IOERR =
          "HANDLE CONDITION IOERR {IOERR|errorOne}";

  @Test
  void testHandleAbendValid() {
    CICSTestUtils.noErrorTest(HANDLE_ABEND_VALID);
  }

  @Test
  void testHandleAbendInvalid() {
    UseCaseEngine.runTest(
            getTestString(HANDLE_ABEND_INVALID),
            ImmutableList.of(),
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: ABEND",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleAidValidOne() {
    UseCaseEngine.runTest(getTestString(HANDLE_AID_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testHandleAidValidTwo() {
    UseCaseEngine.runTest(getTestString(HANDLE_AID_VALID_TWO), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testHandleAidInvalid() {
    UseCaseEngine.runTest(
            getTestString(HANDLE_AID_INVALID),
            ImmutableList.of(),
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: AID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleAidValidThree() {
    UseCaseEngine.runTest(getTestString(HANDLE_AID_VALID_THREE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testHandleAidInvalidThree() {
    UseCaseEngine.runTest(
            getTestString(HANDLE_AID_INVALID_TWO),
            ImmutableList.of(),
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Too many options provided for: HANDLE AID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionValid() {
    UseCaseEngine.runTest(getTestString(HANDLE_CONDITION_VALID), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testHandleConditionValidOne() {
    CICSTestUtils.noErrorTest(HANDLE_CONDITION_VALID_ONE);
  }

  @Test
  void testHandleConditionValidTwo() {
    CICSTestUtils.noErrorTest(HANDLE_CONDITION_VALID_TWO);
  }

  @Test
  void testHandleConditionInvalidOne() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: CONDITION",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidTwo() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: CONDITION",
                            DiagnosticSeverity.Warning,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidThree() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NORMAL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidWrbrk() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_WRBRK,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: WRBRK",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidInbfmh() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_INBFMH,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: INBFMH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidEndinpt() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_ENDINPT,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: ENDINPT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidNonval() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_NONVAL,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NONVAL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidNostart() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_NOSTART,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NOSTART",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidTermiderr() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_TERMIDERR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: TERMIDERR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidFilenotfound() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_FILENOTFOUND,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: FILENOTFOUND",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidNotfnd() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_NOTFND,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NOTFND",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidDupkey() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_DUPKEY,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: DUPKEY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidInvreq() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_INVREQ,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: INVREQ",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testHandleConditionInvalidIoerr() {
    CICSTestUtils.errorTest(
            HANDLE_CONDITION_INVALID_IOERR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: IOERR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  private static final String BASE_TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. ABCDEF.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01 {$*varOne}   PIC S9 VALUE +10.\n"
                  + "       01 {$*varTwo}   PIC S9 VALUE +100.\n"
                  + "       01 {$*varThree} PIC S9 VALUE +1000.\n"
                  + "       01 {$*varFour}  PIC X VALUE 'NAME_ONE'.\n"
                  + "       01 {$*varFive}  PIC X VALUE 'NAME_TWO'.\n"
                  + "       01 {$*varSix}   PIC X VALUE 'NAME_THREE'.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "            EXEC CICS \n"
                  + "            END-EXEC.\n"
                  + "       {@*SEC1} SECTION.\n"
                  + "            DISPLAY \"Text: \".\n";

  private String getTestString(String components, String... compilerOptions) {
    List<String> instances = Arrays.asList(components.split("\\s"));
    instances.replaceAll(String.join("", Collections.nCopies(12, " "))::concat);
    List<String> compilerOptionsList =
            Arrays.stream(compilerOptions)
                    .map(compilerOption -> compilerOption = "       CBL CICS(\"" + compilerOption + "\")")
                    .collect(Collectors.toList());

    ArrayList<String> base = new ArrayList<String>(Arrays.asList(BASE_TEXT.split("\n")));
    base.addAll(0, compilerOptionsList);
    base.addAll(base.size() - 3, instances);
    return String.join("\n", base);
  }
}
