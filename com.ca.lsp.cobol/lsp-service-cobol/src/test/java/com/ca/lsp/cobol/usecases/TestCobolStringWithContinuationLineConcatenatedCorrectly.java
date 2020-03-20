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

import org.junit.Test;

/**
 * This test checks that there are no errors thrown if a keyword split and concatenated by a
 * concatenation line.
 */
public class TestCobolStringWithContinuationLineConcatenatedCorrectly extends PositiveUseCase {

  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.\r\n"
          + "000200 PROGRAM-ID.   TEST1.\r\n"
          + "000301 AUTHOR.       A PROGRAMMER.\r\n"
          + "000400 PROCEDURE DIVISION.\r\n"
          + "078070 000-000.\r\n"
          + "078076     EVALUATE TRUE\r\n"
          + "078081         WHEN PROGRAM1\r\n"
          + "078089                 MOVE 'PRESS \"CLEAR\" OR \"ENTER\" TO RETURN TO THE M\r\n"
          + "078089-                     'ENU WHEN FINISHED' TO ID1\r\n"
          + "078091                 PERFORM PROGRAM2.";

  public TestCobolStringWithContinuationLineConcatenatedCorrectly() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }
}
