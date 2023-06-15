/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test for IDMS copybook error that should be propagated upper
 */
class TestCopyIdmsError {

  private static final String TEXT = "        IDENTIFICATION DIVISION. \n"
      + "        PROGRAM-ID. test1.\n"
      + "        ENVIRONMENT DIVISION.\n"
      + "        IDMS-CONTROL SECTION.\n"
      + "            PROTOCOL. MODE ABC.\n"
      + "            IDMS-RECORDS MANUAL\n"
      + "        DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       {_01 COPY IDMS {~COPY1!IDMS}|1_}.\n"
      + "       PROCEDURE DIVISION.\n";

  private static final String COPYBOOK = "       01  {$*LDQLAB|2}.\r\n";
  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("COPY1", IdmsDialect.NAME, COPYBOOK)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "postprocessing.copybookHasErrors",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "semantics.emptyStructure",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())
        ),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }

}
