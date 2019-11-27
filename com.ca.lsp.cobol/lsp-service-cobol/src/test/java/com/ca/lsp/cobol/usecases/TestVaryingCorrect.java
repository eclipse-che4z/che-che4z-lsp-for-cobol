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

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * This use cases checks if varying with multiple identifiers works correctly.
 */
@RunWith(Parameterized.class)
public class TestVaryingCorrect extends PositiveUseCase {

  public TestVaryingCorrect(String text) {
    super(text);
  }

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.   \r\n"
          + "        PROCEDURE DIVISION.\r\n";

  private static final String VARYING_WITH_TWO_IDENTIFIERS =
      "          PERFORM PROCEDURE-NAME-1 THROUGH PROCEDURE-NAME-2\r\n"
          + "            VARYING IDENTIFIER-2 FROM IDENTIFIER-3\r\n"
          + "            BY IDENTIFIER-4 UNTIL CONDITION-1\r\n"
          + "            AFTER IDENTIFIER-5 FROM IDENTIFIER-6\r\n"
          + "            BY IDENTIFIER-7 UNTIL CONDITION-2 .";

  private static final String VARYING_WITH_THREE_IDENTIFIERS =
      "          PERFORM PROCEDURE-NAME-1 THROUGH PROCEDURE-NAME-2\r\n"
          + "            VARYING IDENTIFIER-2 FROM IDENTIFIER-3\r\n"
          + "            BY IDENTIFIER-4 UNTIL CONDITION-1\r\n"
          + "            AFTER IDENTIFIER-5 FROM IDENTIFIER-6\r\n"
          + "            BY IDENTIFIER-7 UNTIL CONDITION-2\r\n"
          + "            AFTER IDENTIFIER-8 FROM IDENTIFIER-9\r\n"
          + "            BY IDENTIFIER-10 UNTIL CONDITION-3 .";

  @Parameterized.Parameters
  public static Collection<Object> textsToTest() {
    List<Object> result = new ArrayList<>();
    result.add(BOILERPLATE + VARYING_WITH_TWO_IDENTIFIERS);
    result.add(BOILERPLATE + VARYING_WITH_THREE_IDENTIFIERS);
    return result;
  }

  @Test
  public void test() {
    super.test();
  }
}
