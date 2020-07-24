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

import org.junit.Ignore;
import org.junit.Test;

import java.util.List;

/**
 * " 57 IGYDS1089-S ""INDXED"" was invalid. Scanning was resumed at the next area ""A"" item,
 * level-number, or the start of the next clause.
 *
 * <p>57 IGYDS1089-S ""I"" was invalid. Scanning was resumed at the next area ""A"" item,
 * level-number, or the start of the next clause.
 *
 * <p>67 IGYPS2121-S ""IN3"" was not defined as a data-name. The statement was discarded.
 *
 * <p>Same message on line: 68 72 73 79 81 83 85 90 91 93 101
 *
 * <p>68 IGYPS2013-E Not enough subscripts or indices were specified for ""DN1"". A subscript or
 * index value of 1 was assumed for each missing subscript or index.
 *
 * <p>Same message on line: 81 85 101
 *
 * <p>100 IGYPS2072-S ""ST"" was invalid. Skipped to the next verb, period or procedure-name
 * definition."
 */
public class Chetest2Test extends NegativeTest {
  private static final String FILE_NAME = "CHETEST2.cbl";
  private static final int EXPECTED_ERRORS_NUMBER = 19;

  public Chetest2Test() {
    super(FILE_NAME, EXPECTED_ERRORS_NUMBER, List.of());
  }

  @Ignore("Unsupported while semantic analysis is not implemented")
  @Test
  public void test() {
    super.test();
  }
}
