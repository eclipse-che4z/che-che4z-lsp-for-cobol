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
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test for IDMS and regular copybook names collision handling */
public class TestMixedCopybookNavigation {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. DE533538.\n"
              + "        ENVIRONMENT DIVISION.\n"
              + "        IDMS-CONTROL SECTION.\n"
              + "            PROTOCOL. MODE ABC.\n"
              + "            IDMS-RECORDS MANUAL\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       COPY IDMS {~CBOOK!IDMS}.\n"
                  + "       COPY {~CBOOK}.\n"
                  + "       procedure division.\n"
                  + "           DISPLAY {$PROGRAM-STATUS}.\n"
                  + "           DISPLAY {$PROGRAM-NAME}.";
  private static final String CBOOK_IDMS = "       01  {$*WORK-VARIABLES}.\n"
          + "           05  {$*PROGRAM-NAME} PIC X(20) VALUE SPACES.";
  private static final String CBOOK = "       01  {$*MAIN-VARIABLES}.\n"
          + "           05  {$*PROGRAM-STATUS} PIC X(20) VALUE SPACES.";
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT,
            ImmutableList.of(
                    new CobolText("CBOOK", CBOOK),
                    new CobolText("CBOOK", IdmsDialect.NAME, CBOOK_IDMS)),
            ImmutableMap.of(), ImmutableList.of(),
            new AnalysisConfig(
                    CopybookProcessingMode.ENABLED,
                    ImmutableList.of(IdmsDialect.NAME), true,
                    ImmutableList.of(),
                    ImmutableMap.of()));
  }
}
