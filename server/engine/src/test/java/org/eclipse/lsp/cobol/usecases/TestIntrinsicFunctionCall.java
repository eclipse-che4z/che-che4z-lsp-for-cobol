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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/**
 * Test the usage of intrinsic COBOL function calls.
 *
 * Note: This test just checks the allowed
 * function names and is not intended for actual argument check.
 */
public class TestIntrinsicFunctionCall {
  private static final String PREFIX =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    CMOMQC1M.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*L1}.\n"
          + "           03 {$*WS-NUM} PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*F-MAX-TEST-01}.                                                   \n"
          + "           COMPUTE {$WS-NUM} = FUNCTION ";
  private static final String SUFFIX = "(5).";
  // Ref - https://www.ibm.com/docs/en/cobol-zos/6.3?topic=cobol-intrinsic-functions-national-data
  private static Stream<String> getFunctionName() {
    return Stream.of(
        "BIT-OF",
        "BYTE-LENGTH",
        "DISPLAY-OF",
        "FORMATTED-CURRENT-DATE",
        "FORMATTED-DATE",
        "FORMATTED-TIME",
        "FORMATTED-DATETIME",
        "HEX-OF",
        "INTEGER-OF-FORMATTED-DATE",
        "LENGTH",
        "LOWER-CASE",
        "UPPER-CASE",
        "NUMVAL",
        "NUMVAL-C",
        "NUMVAL-F",
        "MAX",
        "MIN",
        "ORD-MAX",
        "ORD-MIN",
        "REVERSE",
        "SECONDS-FORM-FORMATTED-TIME",
        "TEST-FORMATTED-DATETIME",
        "TEST-NUMVAL",
        "TEST-NUMVAL-C",
        "TEST-NUMVAL-F",
        "TRIM",
        "ULENGTH",
        "UPOS",
        "USUBSTR",
        "USUPPLEMENTARY",
        "UVALID",
        "UWIDTH");
  }

  @ParameterizedTest
  @MethodSource("getFunctionName")
  void testOption(String functionName) {
    UseCaseEngine.runTest(PREFIX + functionName + SUFFIX, ImmutableList.of(), ImmutableMap.of());
  }
}
