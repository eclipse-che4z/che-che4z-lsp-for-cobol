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
package org.eclipse.lsp.cobol.usecases.idms;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Idms copybook may be missed */
class TestIdmsMissedCopybook {
  private static final String TEXT =
      "000200 IDENTIFICATION DIVISION.\n"
          + "000300 PROGRAM-ID.    BMEDIQ1M.\n"
          + "001200 ENVIRONMENT  DIVISION.\n"
          + "001300 IDMS-CONTROL SECTION.\n"
          + "001400 PROTOCOL.    MODE IS BATCH           DEBUG\n"
          + "001500              IDMS-RECORDS            MANUAL.\n"
          + "001900 DATA   DIVISION.\n"
          + "002000 WORKING-STORAGE SECTION.\n"
          + "008500   01 {$*DETH01-XW3}             PIC X(132)  VALUE\n"
          + "008600     '-Inrec -ODT- -Tra hhmmsshh --SorVlg-- ---TrmNum -PmoCre- -Or\n"
          + "008700-    'g ------Header EDI------------------------------------------\n"
          + "008800-    '---------'.\n"
          + "018200 01  COPY IDMS {~SUBSCHEMA-NAMES!IDMS|1}.";

  @Test
  void test() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "SUBSCHEMA-NAMES: Copybook not found",
                DiagnosticSeverity.Error,
                ErrorSource.DIALECT.getText(),
                "missing copybook")),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
