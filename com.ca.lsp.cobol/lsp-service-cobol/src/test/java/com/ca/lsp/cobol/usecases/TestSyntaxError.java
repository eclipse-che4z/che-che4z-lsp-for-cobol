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
 * This test checks if the parser recognizes typo on the "DIVISIONs" token. The correct is
 * "DIVISION".
 *
 * @author teman02
 */
public class TestSyntaxError extends NegativeUseCase {
  public TestSyntaxError() {
    super(TEXT);
  }

  private static final String TEXT =
      "        IDENTIFICATION DIVISIONs. \r\n" // Typo on DIVISIONs
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "        END PROGRAM test1.";

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertRange(Range range) {
    assertEquals(23, range.getStart().getCharacter());
    assertEquals(32, range.getEnd().getCharacter());
  }
}
