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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test for nested COPY IDMS statement inside the IDMS copybook
 */
public class TestCopyIdmsNested {

  private static final String TEXT = "        IDENTIFICATION DIVISION. \n"
      + "        PROGRAM-ID. test1.\n"
      + "        ENVIRONMENT DIVISION.\n"
      + "        IDMS-CONTROL SECTION.\n"
      + "            PROTOCOL. MODE ABC.\n"
      + "            IDMS-RECORDS MANUAL\n"
      + "        DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01 {$*NAME1}.\n"
      + "           03 COPY IDMS {~COPY1!IDMS}.\n"
      + "       PROCEDURE DIVISION.\n";

  private static final String COPY1 =        "       01  COPY IDMS {~NESTED_COPY!IDMS}.\n";
  private static final String NESTED_COPY =  "       01  {$*NESTED_COPY}.\n"
      + "           03 {$*RANDOM-NAME}            PIC X(16).\n";

  private static final String TEXT_CIRCULAR = "        IDENTIFICATION DIVISION. \n"
      + "        PROGRAM-ID. test1.\n"
      + "        ENVIRONMENT DIVISION.\n"
      + "        IDMS-CONTROL SECTION.\n"
      + "            PROTOCOL. MODE ABC.\n"
      + "            IDMS-RECORDS MANUAL\n"
      + "        DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01 {$*NAME1}            PIC X(16).\n"
      + "           03 COPY IDMS {~COPY1!IDMS}.\n"
      + "       PROCEDURE DIVISION.\n";

  private static final String COPY_LOOP =  "       01  COPY IDMS {COPY1|1}.\n";

  @Test
  void testNestedIdmsCopybook() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(
                new CobolText("COPY1", IdmsDialect.NAME, COPY1),
                new CobolText("NESTED_COPY", IdmsDialect.NAME, NESTED_COPY, UseCaseUtils.toURI("NESTED_COPY"), false)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testNestedIdmsCopybook_infiniteLoop() {
    Diagnostic diagnosticCircular =
        new Diagnostic(
            new Range(new Position(0, 21), new Position(0, 26)),
            "COPY1: Copybook has circular dependency",
            DiagnosticSeverity.Error,
            ErrorSource.DIALECT.getText(),
            "missing copybook");

    UseCaseEngine.runTest(
        TEXT_CIRCULAR, ImmutableList.of(
            new CobolText("COPY1", IdmsDialect.NAME, COPY_LOOP)),
        ImmutableMap.of("1", diagnosticCircular),
        ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

}
