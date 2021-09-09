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

/** Variable usages with table calls and references modifiers parsed correctly */
class TestTableCall {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*Fic}    Pic x(80) value spaces.\n"
          + "       01  {$*SC}     Pic 9(2)  value 0.\n"
          + "       01  {$*I}      Pic 9(3)  value 0.\n"
          + "       01  {$*LT}.\n"
          + "            03   {$*LP} occurs  1 to 100 times\n"
          + "                               depending on {$LC}.\n"
          + "                       05 {$*LE}  pic x(80) value  spaces.\n"
          + "                       05 {$*LEL} pic 999.\n"
          + "       01  {$*LC}     pic 9(3)  value 0.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           INSPECT {$Fic} Tallying {$SC}\n"
          + "                For LEADING\n"
          + "                {$LE}({$I})(1:{$LEL}({$I})).";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
