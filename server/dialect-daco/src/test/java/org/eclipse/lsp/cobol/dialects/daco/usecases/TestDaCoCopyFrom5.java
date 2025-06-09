/*
 * Copyright (c) 2025 Broadcom.
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
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** A test case for COPY FROM statement without IDMS */
public class TestDaCoCopyFrom5 {
  private static final String TEXT =
      "1      IDENTIFICATION DIVISION.\n"
          + "2      PROGRAM-ID.    CPFTC.\n"
          + "3      DATA   DIVISION.\n"
          + "4      WORKING-STORAGE SECTION.\n"
          + "5      01 ROOT.\n"
          + "6          05 NODE1 COPY-FROM W4.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        new AnalysisConfig(
            CopybookProcessingMode.DISABLED,
            ImmutableList.of(DaCoDialect.NAME),
            true,
            false,
            ImmutableList.of(),
            ImmutableMap.of()));
  }
}
