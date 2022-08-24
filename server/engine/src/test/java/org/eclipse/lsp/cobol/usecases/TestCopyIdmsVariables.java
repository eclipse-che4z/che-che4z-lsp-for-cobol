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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test order of the variables for IDMS copybooks
 */
class TestCopyIdmsVariables {

  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    BSDJTZ1M.\n"
      + "       ENVIRONMENT  DIVISION.\n"
      + "       DATA   DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01 {$*WS-AREA} PIC S9(3) VALUE ZERO COMP.\n"
      + "       LINKAGE SECTION.\n"
      + "       01  COPY IDMS {~COPY1!IDMS}.\n"
      + "       PROCEDURE DIVISION.\n"
      + "           DISPLAY {$WS-AREA}.\n"
      + "       WRITE TRANSACTION DJT2 LENGTH {$WS-AREA}.";

    private static final String MIXED_TEXT = "       IDENTIFICATION DIVISION.\n"
        + "       PROGRAM-ID.    CMR9501M.\n"
        + "       DATA   DIVISION.\n"
        + "       WORKING-STORAGE SECTION.\n"
        + "       01  {$*WS-AREA}.\n"
        + "           03 {$*AREA-XW9}.\n"
        + "             05 COPY MAID {~COPYM!DaCo}.\n"
        + "       01  COPY IDMS {~COPYI!IDMS}.\n"
        + "       PROCEDURE DIVISION.";

    private static final String TEXT_DOUBLE_IDMS = "       IDENTIFICATION DIVISION.\n"
        + "       PROGRAM-ID.    CMAR901M.\n"
        + "       DATA   DIVISION.\n"
        + "       WORKING-STORAGE SECTION.\n"
        + "       01  {$*MRB}.\n"
        + "           03 COPY IDMS {~COPY1!IDMS}.\n"
        + "       01  COPY IDMS {~COPY2!IDMS}.\n"
        + "       PROCEDURE DIVISION.\n"
        + "           OBTAIN NEXT {$MRB} WITHIN {$PROGRAM-NAME}.\n";

  private static final String COPYBOOK = "       01  {$*SUBSCHEMA-CTRL}.\n"
      + "           03 {$*PROGRAM-NAME}             PIC X(8)    VALUE SPACE.\n";

  private static final String COPYM = "       01  {$*MESSTU-XW9}.\n"
      + "           03 {$*RGL-BW9}             PIC X(8)    VALUE SPACE.\n";

  private static final String COPY1 = "       01  {$*VAR1}.\n"
      + "           03 {$*VAR2}             PIC X(8)    VALUE SPACE.\n";

  private static final String COPY2 = "       01  FILLER                      PIC X(0).\n"
      + "       01  COPY IDMS {~COPYBOOK!IDMS}.\n";

  @Test
  void testWithMaidSatements() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText("COPY1", IdmsDialect.NAME, COPYBOOK)), ImmutableMap.of(),
        ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testMixedCopybooks() {
    UseCaseEngine.runTest(
        MIXED_TEXT, ImmutableList.of(new CobolText("COPYI", IdmsDialect.NAME, COPY1),
            new CobolText("COPYM", DaCoDialect.NAME, COPYM)), ImmutableMap.of(),
        ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testDoubleIdmsCopybooks() {
    UseCaseEngine.runTest(
        TEXT_DOUBLE_IDMS, ImmutableList.of(new CobolText("COPY1", IdmsDialect.NAME, COPY1),
            new CobolText("COPY2", IdmsDialect.NAME, COPY2),
            new CobolText("COPYBOOK", IdmsDialect.NAME, COPYBOOK)), ImmutableMap.of(),
        ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

}
