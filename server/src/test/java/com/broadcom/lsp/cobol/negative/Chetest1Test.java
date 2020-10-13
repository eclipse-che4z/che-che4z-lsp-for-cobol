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

package com.broadcom.lsp.cobol.negative;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * 20 IGYLI0088-S The "COPY" statement was invalid. Expected "REPLACING", but found "02". The
 * statement was discarded.
 *
 * <p>"44 IGYDS1262-E A minimum occurrence integer was specified for table ""FILLER"" without the
 * ""DEPENDING ON"" phrase. The minimum occurrence integer was discarded.
 *
 * <p>45 IGYDS1089-S ""DEENDING"" was invalid. Scanning was resumed at the next area ""A"" item,
 * level-number, or the start of the next clause."
 */
@Disabled("Unsupported while semantic analysis not implemented")
public class Chetest1Test extends NegativeTest {
  private static final String FILE_NAME = "CHETEST1.cbl";
  private static final int EXPECTED_ERRORS_NUMBER = 3;

  Chetest1Test() {
    super(FILE_NAME, EXPECTED_ERRORS_NUMBER, List.of());
  }

  @Test
  public void test() {
    super.test();
  }
}
