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

/**
 * This use case checks if the absence of dot at the end is being recognized as an error.
 *
 * @author teman02
 */
public class TestExtraneousInputEOFExpecting extends NegativeUseCase {

  public TestExtraneousInputEOFExpecting() {
    super(TEXT);
  }

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.   \r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           if (1 > 0) NEXT SENTENCE"; // No dot at the end of file

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertRange(Range range) {
    assertEquals(35, range.getStart().getCharacter());
  }
}
