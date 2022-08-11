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
package org.eclipse.lsp.cobol.usecases.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test variable tree building with copy statements
 */
public class TestDaCoIdmsCopybooks {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. MIN5.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  FIRST-ROOT.\n"
          + "           05 COPY MAID CB.\n"
          + "       01  COPY IDMS ICB.\n";

  private static final String CB = "       01  AAA PIC S9(4) VALUE ZERO  COMP.\n";
  private static final String ICB = "       01  IDMS-ROOT PIC X(8) VALUE '123'.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(
                    new CobolText("ICB", IdmsDialect.NAME, ICB),
                    new CobolText("CB", DaCoDialect.NAME, CB)
            ),
            ImmutableMap.of(),
            ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig());
  }
}
