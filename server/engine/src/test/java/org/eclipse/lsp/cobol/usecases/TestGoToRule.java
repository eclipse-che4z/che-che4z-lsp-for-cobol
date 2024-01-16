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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Check that GO TO statement works according to the specification */
class TestGoToRule {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*PARENT}.\n"
          + "             05 {$*CHILD} PIC 9.\n"
          + "        PROCEDURE DIVISION. \n"
          + "           GO TO {#ABC}.\n"
          + "        {#*ABC}.\n"
          + "           GO {#CDE} {#FGH} DEPENDING ON {$CHILD} OF {$PARENT}.\n"
          + "        {#*CDE}.\n"
          + "           DISPLAY 'asdf'.\n"
          + "        {#*FGH}.\n"
          + "           DISPLAY 'asdf'.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
