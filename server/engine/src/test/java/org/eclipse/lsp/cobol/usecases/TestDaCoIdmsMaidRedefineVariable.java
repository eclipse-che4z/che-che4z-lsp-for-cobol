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
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * IDMS and MAID copybooks should work together. There was an issue with redefine variable for this case.
 */
public class TestDaCoIdmsMaidRedefineVariable {
  private static final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PROGNM.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  COPY IDMS {~IDMSCB!IDMS}.\n"
          + "       01  COPY MAID {~MAIDCB!DaCo}.\n"
          + "           03 {$*A} REDEFINES {$B}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXIT.";

  private static final String IDMSCB = "       01  {$*SUBSCHEMA-CTRL}.\n"
          + "           03 {$*PROGRAM-NAME} PIC X(8)    VALUE SPACE.\n";
  private static final String MAIDCB = "       01  {$*L1}.\n"
                  + "           03 {$*B}.\n"
                  + "             05 {$*L2} PIC X.\n";

  @Test
  void testDaCoIdmsMaidRedefineVariable() {
    UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(
                    new CobolText("IDMSCB", IdmsDialect.NAME, IDMSCB),
                    new CobolText("MAIDCB", DaCoDialect.NAME, MAIDCB)
            ),
            ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
