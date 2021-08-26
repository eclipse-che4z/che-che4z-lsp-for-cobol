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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Check that commas in the PROCEDURE DIVISION USING statement don't cause syntax errors */
class TestProcedureDivisionWithCommas {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. TEST1.\n"
          + "          DATA DIVISION.\n"
          + "          LINKAGE SECTION.\n"
          + "          01  {$*var1}  PIC X(1).\n"
          + "          01  {$*var2}  PIC X(1).\n"
          + "          01  {$*var3}  PIC X(1).\n"
          + "          01  {$*var4}  PIC X(1).\n"
          + "          PROCEDURE DIVISION USING {$var1}, {$var2},\n"
          + "           {$var3}, {$var4}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
