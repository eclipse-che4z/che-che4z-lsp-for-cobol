/*
 * Copyright (c) 2022 DAF Trucks NV.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * DAF Trucks NV – implementation of DaCo COBOL statements
 * and DAF development standards
 */
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** Tests the DaCo ROW Modify statement */
class TestDaCoTableRowModifyStatement {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WS-AREA}. \r\n"
          + "           03 {$*AREA-XW1}. \r\n"
          + "             05 {$*TBLPRO-XL1}. \r\n"
          + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
          + "             05 {$*TBFPRO-XL1}. \r\n"
          + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
          + "             05 {$*DSAPRO-XL1}. \r\n"
          + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "            ROW MODIFY {$TBLPRO-XL1} ON {$DSAPRO-XL1} WITH {$DSAPRO-XL1}. \r\n"
          + "            ROW MODIFY {$TBLPRO-XL1} ON 'ASDF' WITH {$DSAPRO-XL1}. \r\n"
          + "            ROW MODIFY {$TBFPRO-XL1} ON {$DSAPRO-XL1} WITH {$DSAPRO-XL1}. \r\n"
          + "            ROW MODIFY {$TBFPRO-XL1} ON 'FDERT' WITH {$DSAPRO-XL1}. \r\n"
          // Negative tests
          + "            ROW MODIFY {$DSAPRO-XL1|1} ON {$DSAPRO-XL1} WITH {$DSAPRO-XL1}. \r\n"
          + "            ROW MODIFY {GBR4|1|2} ON {$DSAPRO-XL1} WITH {$DSAPRO-XL1}. \r\n"
          + "            ROW MODIFY {$TBFPRO-XL1} ON {GBR4|2} WITH {$DSAPRO-XL1}. \r\n"
          + "            ROW MODIFY {$TBFPRO-XL1} ON {$DSAPRO-XL1} WITH {GBR4|2}. \r\n";

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "String must starts with TBL or TBF values",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "Variable GBR4 is not defined",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())),
            ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig());
  }
}
