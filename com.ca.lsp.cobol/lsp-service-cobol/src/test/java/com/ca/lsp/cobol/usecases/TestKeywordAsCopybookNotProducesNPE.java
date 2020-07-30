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

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that there is no syntax error shown on a copybook usage when the copybook name
 * is a keyword (DETAIL in this case).
 */
public class TestKeywordAsCopybookNotProducesNPE {

  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      01   {$*PARENT1}. \n"
          + "5       COPY {~DETAIL}. \n"
          + "6      Procedure Division.\n"
          + "7      {#*000-Main-Logic}.\n"
          + "8          DISPLAY {$CHILD1} OF {$PARENT1}.\n"
          + "9      End program ProgramId.";

  private static final String DETAIL =
      "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n"
          + "           03  {$*CHILD2}         PIC 9   VALUE IS '1'.";

  private static final String DETAIL_NAME = "DETAIL";

  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, List.of(new CobolText(DETAIL_NAME, DETAIL)), Map.of());
  }
}
