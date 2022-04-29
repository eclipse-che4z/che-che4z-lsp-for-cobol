/*
 * Copyright (c) 2021 Broadcom.
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

/** SNAP TITLE should not cause NPE while applying analysis */
class TestSnapTitle {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*WK_TITLE}.\n"
          + "            05 {$*WK1} PIC X.\n"
          + "            05 {$*WK2} PIC X.\n"
          + "            05 {$*WK3} PIC X.\n"
          + "            05 {$*WK4} PIC X.\n"
          + "        PROCEDURE DIVISION.\n"
          + "            SNAP TITLE IS {$WK_TITLE} SYSTEM FROM {$WK1} TO {$WK2}\n"
          + "            FROM {$WK3} TO {$WK4}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), IdmsBase.getAnalysisConfig());
  }
}
