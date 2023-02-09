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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.dialects.daco.utils.Fixtures;
import org.junit.jupiter.api.Test;

/** This test covers case with overlap locations in mapping */
class TestOnRcuRangeException {
  static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*A} PIC X.\n"
          + "       01 {$*MISMAP} PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "              MODIFY MAP {$MISMAP}\n"
          + "                 FOR DFLD {$A} ON RCU EDIT ERROR;\n"
          + "              SHOW ERROR 010\n"
          + "           CONTINUE.\n";

  @Test
  void test() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT,
        ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
