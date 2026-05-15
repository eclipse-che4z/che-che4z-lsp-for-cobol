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

package org.eclipse.lsp.cobol.dialects.idms.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.SqlDecimalComma;
import org.eclipse.lsp.cobol.common.SqlProcessing;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.junit.jupiter.api.Test;

/** Test for nested COPY IDMS statement inside the IDMS copybook */
public class TestCopyIdmsNested2 {

  private static final String TEXT =
      "0      ID DIVISION. PROGRAM-ID. A.\n"
          + "1      ENVIRONMENT DIVISION.\n"
          + "2      IDMS-CONTROL SECTION.\n"
          + "3      PROTOCOL. MODE ABC.\n"
          + "4      IDMS-RECORDS MANUAL.\n"
          + "5      DATA DIVISION.\n"
          + "6      WORKING-STORAGE SECTION.\n"
          + "7      01  {$*ROOT}.\n"
          + "8          02  COPY IDMS {~ISC!IDMS}.\n"
          + "9      PROCEDURE DIVISION.\n"
          + "10         DISPLAY {$IDMS-NODE} OF {$ISUBNODE} OF {$ROOT}.\n";
  private static final String ISC =
      "       03  {$*ISUBNODE}.\n           04 COPY IDMS {~IC1!IDMS}.";
  private static final String IC1 = "       05  {$*IDMS-NODE} PIC X.";

  @Test
  void testNestedIdmsCopybook() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("ISC", IdmsDialect.NAME, ISC),
            new CobolText("IC1", IdmsDialect.NAME, IC1, UseCaseUtils.toURI("NESTED_COPY"), false)),
        ImmutableMap.of(),
        ImmutableList.of(),
        new AnalysisConfig(
            CopybookProcessingMode.ENABLED,
            ImmutableList.of(IdmsDialect.NAME),
            true,
            false,
            SqlProcessing.ENABLED,
            SqlDecimalComma.DISABLED,
            ImmutableList.of(),
            ImmutableMap.of()));
  }
}
