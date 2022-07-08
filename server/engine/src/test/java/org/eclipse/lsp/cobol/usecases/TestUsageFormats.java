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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that variables with USAGE formats specified do not produce errors. */
class TestUsageFormats {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ID1}.\n"
          + "           02 {$*ID2} USAGE IS POINTER.\n"
          + "           02 FILLER PIC XX.\n"
          + "       01  {$*ID3}.\n"
          + "           02 {$*ID4} USAGE IS POINTER OCCURS 10 TIMES.\n"
          + "       01  {$*ID5}  USAGE IS INDEX.   \n"
          + "       01  {$*ID6} pic x(500) usage display.\n"
          + "       01  {$*ID7}  pic 9(8) usage binary.\n"
          + "       01  {$*ID8}.\n"
          + "           02 {$*ID9}  OCCURS 2 TIMES PIC 9(9) USAGE BINARY.\n"
          + "       1 {$*ID10} GROUP-USAGE NATIONAL.\n"
          + "       2 PIC N(12) USAGE NATIONAL\n"
          + "           VALUE NX'00000000000000000000000000000'.\n"
          + "       01  {$*ID11} USAGE IS         PROCEDURE-POINTER.\n"
          + "       01 {$*ID12}.\n"
          + "          02 {$*ID13}          PIC X(15) Usage is Display.\n"
          + "       01 {$*ID14}.\n"
          + "        05 {$*ID15} PICTURE X(4)  USAGE DISPLAY.\n"
          + "        05 {$*ID16} POINTER.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
