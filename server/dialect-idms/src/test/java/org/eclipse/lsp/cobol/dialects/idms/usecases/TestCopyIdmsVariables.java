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
package org.eclipse.lsp.cobol.dialects.idms.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test order of the variables for IDMS copybooks
 */
class TestCopyIdmsVariables {

    private static final String TEXT_DOUBLE_IDMS = "       IDENTIFICATION DIVISION.\n"
        + "       PROGRAM-ID.    CMAR901M.\n"
        + "        ENVIRONMENT DIVISION.\n"
        + "        IDMS-CONTROL SECTION.\n"
        + "            PROTOCOL. MODE ABC.\n"
        + "            IDMS-RECORDS MANUAL\n"
        + "       DATA   DIVISION.\n"
        + "       WORKING-STORAGE SECTION.\n"
        + "       01  {$*MRB}.\n"
        + "           03 COPY IDMS {~COPY1!IDMS}.\n"
        + "       01  COPY IDMS {~COPY2!IDMS}.\n"
        + "       PROCEDURE DIVISION.\n"
        + "           OBTAIN NEXT {$MRB} WITHIN {$PROGRAM-NAME}.\n";

  private static final String COPYBOOK = "       01  {$*SUBSCHEMA-CTRL}.\n"
      + "           03 {$*PROGRAM-NAME}             PIC X(8)    VALUE SPACE.\n";

  private static final String COPY1 = "       01  {$*VAR1}.\n"
      + "           03 {$*VAR2}             PIC X(8)    VALUE SPACE.\n";

  private static final String COPY2 = "       01  FILLER                      PIC X(0).\n"
      + "       01  COPY IDMS {~COPYBOOK!IDMS}.\n";

  @Test
  void testDoubleIdmsCopybooks() {
    UseCaseEngine.runTest(
        TEXT_DOUBLE_IDMS, ImmutableList.of(new CobolText("COPY1", IdmsDialect.NAME, COPY1),
            new CobolText("COPY2", IdmsDialect.NAME, COPY2),
            new CobolText("COPYBOOK", IdmsDialect.NAME, COPYBOOK)), ImmutableMap.of(),
        ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

}
