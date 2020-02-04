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

package com.ca.lsp.cobol.usecases;

import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

/**
 * This test checks that the remarks are not marked as comments and the syntax analysis is applied.
 *
 * <p>The REMARKS is an old syntax that is not supported anymore, so it should be marked as error.
 */
public class TestRemarksAreUnsupported extends NegativeUseCase {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TEST1.\n"
          + "      ******************************************************************\n"
          + "      *REMARKS.\n"
          + "      ******************************************************************\n"
          + "\n"
          + "             INPUT FILE           - DDS0001.PATSRCH\n"
          + "\n"
          + "             VSAM MASTER FILES    - DDS0001.PATMASTR & DDS0001.PATPERSN\n"
          + "\n"
          + "             INPUT ERROR FILE     - DDS0001.PATERR\n"
          + "\n"
          + "             OUTPUT FILE PRODUCED -  DDS001.WARDPRT\n"
          + "\n"
          + "             DUMP FILE            -   SYSOUT\n"
          + "\n"
          + "      ******************************************************************\n"
          + "\n"
          + "       ENVIRONMENT DIVISION.";

  public TestRemarksAreUnsupported() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  /**
   * Assert that the error range points to the 'INPUT' at line 6
   *
   * @param ranges - error ranges found by syntax analysis
   */
  @Override
  protected void assertRanges(List<Range> ranges) {
    assertFalse(ranges.isEmpty());

    Range range = ranges.get(0);
    Position start = range.getStart();
    Position end = range.getEnd();

    assertEquals(6, start.getLine());
    assertEquals(6, end.getLine());
    assertEquals(13, start.getCharacter());
    assertEquals(18, end.getCharacter());
  }
}
