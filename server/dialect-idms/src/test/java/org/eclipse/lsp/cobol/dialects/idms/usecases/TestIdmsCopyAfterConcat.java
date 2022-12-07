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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Idms copybook after line concationation */
class TestIdmsCopyAfterConcat {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    PROG1.\n"
      + "       ENVIRONMENT  DIVISION.\n"
      + "       IDMS-CONTROL SECTION.\n"
      + "       PROTOCOL.    MODE IS IDMS-DC-NONAUTO DEBUG\n"
      + "                    IDMS-RECORDS MANUAL.\n"
      + "       DATA   DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01  {$*VAR1}.\n"
      + "             03 {$*VAR3}                      VALUE\n"
      + "           ' SOME TEXT SOME TEXT SOME TEXT SOME TEXT SOME TEXT SOME TEXT\n"
      + "      -    'SOME TEXT SOME TEXT'.\n"
      + "               05 {$*VAR5}           PIC X(2)    OCCURS 42.\n"
      + "       01  COPY IDMS {~COPY1!IDMS}.\n";

  private static final String COPY1 = "";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("COPY1", IdmsDialect.NAME, COPY1)),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
