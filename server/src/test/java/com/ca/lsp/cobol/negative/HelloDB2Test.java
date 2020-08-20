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
package com.ca.lsp.cobol.negative;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * " IGYSC1428-W The ""TEST(DWARF)"" option was specified but the compiler return code was 8 or
 * greater. The ""NOTEST"" option will be in effect.
 *
 * <p>28 IGYDS0225-S An ""EXEC SQL"" statement was found, but the ""SQL"" compiler option was not in
 * effect. The statement was discarded.
 *
 * <p>Same message on line: 33 45
 *
 * <p>35 IGYPS2121-S ""SQLCA"" was not defined as a data-name. The statement was discarded."
 */
@Disabled("Unsupported while semantic analysis not implemented")
public class HelloDB2Test extends NegativeTest {
  private static final String FILE_NAME = "HELLODB2.cbl";
  private static final int EXPECTED_ERRORS_NUMBER = 5;

  HelloDB2Test() {
    super(FILE_NAME, EXPECTED_ERRORS_NUMBER, List.of());
  }

  @Test
  public void test() {
    super.test();
  }
}
