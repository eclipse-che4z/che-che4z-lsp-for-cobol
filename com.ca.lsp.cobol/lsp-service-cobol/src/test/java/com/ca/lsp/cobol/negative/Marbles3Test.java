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
package com.ca.lsp.cobol.negative;

import org.junit.Ignore;
import org.junit.Test;

/**
 * " IGYSC1428-W The ""TEST(DWARF)"" option was specified but the compiler return code was 8 or
 * greater. The ""NOTEST"" option will be in effect.
 *
 * <p>63 IGYDS0225-S An ""EXEC SQL"" statement was found, but the ""SQL"" compiler option was not in
 * effect. The statement was discarded."
 *
 * @author teman02
 */
public class Marbles3Test extends NegativeTest {
  private static final String FILE_NAME = "MARBLES3.cbl";
  private static final int EXPECTED_ERRORS_NUMBER = 2;

  public Marbles3Test() {
    super(FILE_NAME, EXPECTED_ERRORS_NUMBER);
  }

  @Ignore("Unsupported while semantic analysis is not implemented")
  @Test
  public void test() {
    super.test();
  }
}
