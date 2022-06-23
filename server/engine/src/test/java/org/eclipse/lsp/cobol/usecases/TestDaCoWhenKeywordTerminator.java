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

/**
 * Test for recognition of "WHEN" COBOL keyword by DaCo.
 */
public class TestDaCoWhenKeywordTerminator {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01 {$*A} PIC X.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           EVALUATE TRUE\n"
                  + "           WHEN {$A} NOT = TRUE\n"
                  + "              RETURN WARNING 004\n"
                  + "           WHEN {$A} NOT NUMERIC\n"
                  + "              RETURN WARNING 002\n"
                  + "           END-EVALUATE.";
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(),
            ImmutableMap.of(), ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig());
  }
}
