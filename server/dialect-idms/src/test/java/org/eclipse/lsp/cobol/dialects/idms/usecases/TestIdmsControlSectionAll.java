/*
 * Copyright (c) 2020 Broadcom.
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
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.dialects.idms.utils.Fixtures;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

/** These test for variations of valid IDMS-CONTROL SECTION definitions */
class TestIdmsControlSectionAll {

  private static final String MESSAGE_1 =
      "The length 17 is not allowed. Allowed values are 16, 18.";

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n";

  private static final String IDMSCS_WITH_ALL_CLAUSES =
      "            PROTOCOL. MODE ABC\n"
          + "            SUBSCHEMA-NAMES LENGTH 18\n"
          + "            IDMS-RECORDS WITHIN WORKING-STORAGE";

  private static final String IDMSCS_WITH_ALL_CLAUSES_PUNCT =
      "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS WITHIN LINKAGE,\n"
          + "            SUBSCHEMA-NAMES LENGTH 18;";

  private static final String IDMSCS_WITH_SSN_IDMSREC =
      "            PROTOCOL. SUBSCHEMA-NAMES LENGTH IS 16\n"
          + "            IDMS-RECORDS WITHIN WORKING-STORAGE LEVELS INCREMENTED 18";

  private static final String IDMSCS_WITH_ONLY_PROTOCOL = "            PROTOCOL.";

  private static final String IDMSCS_WITH_SSN_LEN_ERROR =
      "            PROTOCOL. \n"
          + "            SUBSCHEMA-NAMES LENGTH IS {17|1}\n"
          + "            IDMS-RECORDS WITHIN WORKING-STORAGE LEVELS INCREMENTED 18";

  private static final String IDMSCS_MANUAL =
      "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n";

  private static final String IDMSCS_LINKAGE_SECTION =
      "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS WITHIN WORKING-STORAGE\n"
          + "         DATA DIVISION.\n"
          + "         WORKING-STORAGE SECTION.\n"
          + "         PROCEDURE DIVISION.\n"
          + "           DISPLAY {$EMPLOYEE}.\n";

  private static final String SUBSCHEMA_DESCRIPTION = "       01 {$*EMPLOYEE} PIC X(8).\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + IDMSCS_WITH_ALL_CLAUSES,
        BOILERPLATE + IDMSCS_WITH_ALL_CLAUSES_PUNCT,
        BOILERPLATE + IDMSCS_WITH_SSN_IDMSREC,
        BOILERPLATE + IDMSCS_WITH_ONLY_PROTOCOL,
        BOILERPLATE + IDMSCS_WITH_SSN_LEN_ERROR,
        BOILERPLATE + IDMSCS_MANUAL
        );
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(new Range(), MESSAGE_1, DiagnosticSeverity.Error, ErrorSource.DIALECT.getText())),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testImplicitCopybook_workingStorageSection() {
    UseCaseEngine.runTestForDiagnostics(
        BOILERPLATE + IDMSCS_LINKAGE_SECTION,
        ImmutableList.of(Fixtures.subschemaCopy(SUBSCHEMA_DESCRIPTION)),
        ImmutableMap.of(),
        ImmutableList.of(),
        new AnalysisConfig(
                CopybookProcessingMode.ENABLED,
            ImmutableList.of(IdmsDialect.NAME), true,
            ImmutableList.of(),
            ImmutableMap.of()));
  }

}
