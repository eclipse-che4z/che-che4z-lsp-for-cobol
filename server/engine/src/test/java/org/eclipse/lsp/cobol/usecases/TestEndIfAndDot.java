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

/** UseCase test example without errors */
class TestEndIfAndDot {
  private static final String TEXT_WITH_DOT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*Var-1} PIC 9.\n"
          + "       01 {$*Var-2} PIC 9.\n"
          + "       Procedure Division.\n"
          + "           IF {$Var-1} = {$Var-2}\n"
          + "           ADD 1 TO {$Var-2}\n"
          + "           END-IF.\n"
          + "           ABEND CODE {$Var-1}.";

  private static final String TEXT_WITHOUT_DOT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*Var-1} PIC 9.\n"
          + "       01 {$*Var-2} PIC 9.\n"
          + "       Procedure Division.\n"
          + "           IF {$Var-1} = {$Var-2}\n"
          + "           ADD 1 TO {$Var-2}\n"
          + "           END-IF\n"
          + "           ABEND CODE {$Var-1}.";

  @Test
  void testWithDot() {
    UseCaseEngine.runTest(
        TEXT_WITH_DOT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testWithoutDot() {
    UseCaseEngine.runTest(
        TEXT_WITHOUT_DOT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
