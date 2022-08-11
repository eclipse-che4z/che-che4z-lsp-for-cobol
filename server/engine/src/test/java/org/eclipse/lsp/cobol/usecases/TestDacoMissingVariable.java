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
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test for DaCo and IDMS copybooks mix. */
public class TestDacoMissingVariable {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. MIN5.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT}.\n"
          + "           02 {$*OLEN-ABC} PIC S9(3)   VALUE ZERO  COMP.\n"
          + "       01  COPY IDMS {~CB!IDMS}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            WRITE TRANSACTION ABCD LENGTH {$OLEN-ABC}.\n  \t\n";

  private static final String CB = "\t \n ";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("CB", IdmsDialect.NAME, CB)),
        ImmutableMap.of(),
        ImmutableList.of(),
        new AnalysisConfig(
            new CopybookConfig(
                CopybookProcessingMode.ENABLED, SQLBackend.DATACOM_SERVER, ImmutableList.of()),
            ImmutableList.of(),
            ImmutableList.of(DaCoDialect.NAME)));
  }
}
