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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Tests CICS conditions can be used for variable declaration. */
public class TestCICSConditionCanBeUsedForVariableDeclaration {

  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*RESPONSE}   PIC s9(8) COMP-4 VALUE 0.\n"
          + "       01 {$*CICS-RESP}.\n"
          + "           88 {$*%s} VALUE +02.\n"
          + "           88 {$*WRBRK} VALUE +03.\n"
          + "       PROCEDURE DIVISION.\n";

  private static Stream<String> getCicsConditions() {
    return Stream.of(
        "EOC", "EODS", "INVMPSZ", "INVPARTN", "INVREQ", "MAPFAIL", "PARTNFAIL", "RDATT", "UNEXPIN");
  }

  @ParameterizedTest
  @MethodSource("getCicsConditions")
  void test(String conditionName) {
    UseCaseEngine.runTest(
        String.format(TEXT, conditionName), ImmutableList.of(), ImmutableMap.of());
  }
}
