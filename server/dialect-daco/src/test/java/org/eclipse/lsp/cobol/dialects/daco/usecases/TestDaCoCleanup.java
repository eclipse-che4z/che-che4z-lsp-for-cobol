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

package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.dialects.daco.utils.Fixtures;
import org.junit.jupiter.api.Test;

/** Test that cleanup works properly */
class TestDaCoCleanup {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*A1} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "009800 {@*S000}  SECTION.\n"
          + "       D-C MOVE 0 TO {$A1}\n"
          + "           DISPLAY {$A1}.\n";

  @Test
  void test() {
    UseCaseEngine.runTestForDiagnostics(TEXT, ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
