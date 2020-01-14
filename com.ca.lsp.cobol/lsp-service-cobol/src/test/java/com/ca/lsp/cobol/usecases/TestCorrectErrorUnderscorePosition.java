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

import static org.junit.Assert.assertEquals;

import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;

/**
 * This use case checks if the position of error is being underscored correctly. There is typo in
 * the TEXT in the line 6, but as designed the following token should be underscored as unexpected,
 * because in this case PERORM may be put as a variable.
 */
public class TestCorrectErrorUnderscorePosition extends NegativeUseCase {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.   \r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           PERORM VARYING A FROM 10 BY 10 UNTIL A > 40\r\n" // Typo in "PERORM",
                                                                         // offending token is
                                                                         // "VARYING"
          + "               PERFORM VARYING b FROM 1 BY 1 UNTIL B > 4\r\n"
          + "               END-PERFORM\r\n"
          + "            END-PERFORM.\r\n"
          + "\r\n"
          + "            STOP RUN.";

  public TestCorrectErrorUnderscorePosition() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertRanges(List<Range> ranges) {
    Range range = ranges.get(0);
    assertEquals(18, range.getStart().getCharacter());
    assertEquals(25, range.getEnd().getCharacter());
  }
}
