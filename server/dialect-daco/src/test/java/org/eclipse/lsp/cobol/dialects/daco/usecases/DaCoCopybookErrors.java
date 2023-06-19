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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Check for the error on the copybook statement if copybook contains errors
 */
class DaCoCopybookErrors {
  private static final String TEXT = "000020 IDENTIFICATION DIVISION.\n"
      + "000030 PROGRAM-ID.    BSPMOE1M.                                           D-----\n"
      + "000110 ENVIRONMENT  DIVISION.\n"
      + "000120 IDMS-CONTROL SECTION.\n"
      + "000130 PROTOCOL. MODE BATCH DEBUG\n"
      + "000140              IDMS-RECORDS MANUAL.\n"
      + "000170 DATA   DIVISION.\n"
      + "000180*----------------------------------------------------------------*\n"
      + "000190 WORKING-STORAGE SECTION.\n"
      + "011480 LINKAGE SECTION.                                                   D00050\n"
      + "011550 {_01  COPY MAID {~LDQLAB1M!DaCo}|1_}.\n"
      + "011590 PROCEDURE DIVISION. \n"
      + "       {#*PARA1}.";

  private static final String COPYBOOK = "     1 01  {$*LDQLAB1M-XQL|2}.  ERROR.\n"
      + "     2     03 OPD-XQL                  PIC X(3)    VALUE SPACE.\n"
      + "     3     03 RTT-XQL                  PIC X(4)    VALUE ZERO.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("LDQLAB1M", DaCoDialect.NAME, COPYBOOK)),
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
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item LDQLAB1M-XQL",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }

}
