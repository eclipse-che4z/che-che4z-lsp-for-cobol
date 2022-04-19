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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test that dialect multiline inside IF statement didn't cause any errors */
class TestDialectMultilineInsideIf {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    CMOMQC1M.\n"
          + "       DATA   DIVISION.\n"
          + "       MAP    SECTION.\n"
          + "           MAP {$*MCOMQC1M} TYPE IS EXTENDED.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*FOO} PIC X.\n"
          + "       LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           IF {$FOO}                  NOT = ALL '-'\n"
          + "              MODIFY MAP {$MCOMQC1M}\n"
          + "                 FOR DFLD {$FOO}(4) ATTRIBUTES BRIGHT\n"
          + "           END-IF.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(),
        IdmsBase.getAnalysisConfig());
  }
}
