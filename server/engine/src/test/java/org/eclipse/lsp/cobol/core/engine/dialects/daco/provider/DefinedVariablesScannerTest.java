/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;


import org.junit.jupiter.api.Test;

import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This tests the logic of {@link DefinedVariablesScanner} */
class DefinedVariablesScannerTest {
  private static final String TEXT_DYN_DUPLICATE =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1. \n"
          + "        DATA DIVISION. \n"
          + "        WORKING-STORAGE SECTION. \n"
          + "       01  AREA-XAA.\n"
          + "           03 TBLNAM-XAA PIC X(6).\n"
          + "        PROCEDURE DIVISION. \n"
          + "               MOVE 6 to RUSNAM-BAA.\n";

  @Test
  void test() {
    Set<String> result = DefinedVariablesScanner.scan(TEXT_DYN_DUPLICATE);
    assertEquals(1, result.size());
  }
}
