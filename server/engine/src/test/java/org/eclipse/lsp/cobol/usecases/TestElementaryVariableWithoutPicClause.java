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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test allowed elementary variables without pic clause */
public class TestElementaryVariableWithoutPicClause {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT} USAGE POINTER-32.\n"
          + "       01  {$*PARENT2} USAGE POINTER.\n"
          + "       01  {$*PARENT3} USAGE INDEX.\n"
          + "       01  {$*PARENT4} USAGE COMP-1.\n"
          + "       01  {$*PARENT5} USAGE COMPUTATIONAL-1.\n"
          + "       01  {$*PARENT6} USAGE COMPUTATIONAL-2.\n"
          + "       01  {$*PARENT7} USAGE COMP-2.\n"
          + "       01  {$*PARENT8} USAGE PROCEDURE-POINTER.\n"
          + "       01  {$*PARENT9} USAGE FUNCTION-POINTER.\n"
          + "       01  {$*PARENT10} USAGE OBJECT REFERENCE.\n"
          + "       PROCEDURE DIVISION.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
