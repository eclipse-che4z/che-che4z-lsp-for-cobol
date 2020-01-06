/*
 * Copyright (c) 2019 Broadcom.
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

import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

/** This use case checks if there is an error being thrown if the END-PERFORM token is missing */
public class TestEndPerformCausesError extends NegativeUseCase {

  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.\r\n"
          + "000200 PROGRAM-ID.   TEST1.\r\n"
          + "000301 AUTHOR.       A PROGRAMMER.\r\n"
          + "000400 PROCEDURE DIVISION.\r\n"
          + "000500 MOVE ID1 TO\r\n"
          + "000600                 ID2.\r\n"
          + "000700            PERFORM VARYING ROW-SUB FROM 1 BY 1 UNTIL ROW-SUB > 20\r\n"
          + "000800                 INITIALIZE ID3(ROW-SUB)\r\n"
          + "000900                 INITIALIZE ID4(ROW-SUB).\r\n"
          + "001000       \r\n"
          + "001100            MOVE ID5 TO ID6\r\n"
          + "001200                                  ID7.\r\n"
          + "001300        000-START-EXIT.\r\n"
          + "001400            EXIT.";

  public TestEndPerformCausesError() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertRanges(List<Range> ranges) {
    Range range = ranges.get(0);
    // The position of dot at the end of line "INITIALIZE ID4(ROW-SUB)."
    assertEquals(8, range.getStart().getLine());
    assertEquals(46, range.getStart().getCharacter());
  }
}
