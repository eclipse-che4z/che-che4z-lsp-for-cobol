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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that there are no errors thrown if a string literal split and concatenated by a
 * concatenation line.
 */
public class TestCobolStringWithContinuationLineConcatenatedCorrectly {

  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.\n"
          + "000200 PROGRAM-ID.   TEST1.\n"
          + "000301 AUTHOR.       A PROGRAMMER.\n"
          + "000000 DATA DIVISION.\n"
          + "000000 WORKING-STORAGE SECTION.\n"
          + "000000  01 {$*ID1}.\n"
          + "000000  01 {$*ID2}.\n"
          + "000400 PROCEDURE DIVISION.\n"
          + "078070 {#*000-MAIN}.\n"
          + "078076     EVALUATE TRUE\n"
          + "078081         WHEN {$ID1}\n"
          + "078089                 MOVE 'PRESS \"CLEAR\" OR \"ENTER\" TO RETURN TO THE M\n"
          + "078089-                     'ENU WHEN FINISHED' TO {$ID2}\n"
          + "078091                 PERFORM {#PROGRAM2}\n"
          + "000000     END-EVALUATE.\n"
          + "000000 {#*PROGRAM2}.\n"
          + "000000  DISPLAY 'HELLO'.";

  @Disabled("Continuation line cause a semantic error #414")
  // TODO: #414
  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
