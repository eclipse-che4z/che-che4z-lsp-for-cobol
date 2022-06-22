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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

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
          + "            IDMS-RECORDS WITHIN LINKAGE\n"
          + "         DATA DIVISION.\n"
          + "         LINKAGE SECTION.\n";

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
            new Diagnostic(new Range(), MESSAGE_1, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  @Disabled("Not working")
  void testImplicitCopybook_linkageSection() {
    UseCaseEngine.runTest(
        BOILERPLATE + IDMSCS_LINKAGE_SECTION,
        ImmutableList.of(new CobolText("SUBSCHEMA-DESCRIPTION", "")),
        ImmutableMap.of(),
        ImmutableList.of(),
        new AnalysisConfig(
            new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DATACOM_SERVER, ImmutableList.of()),
            ImmutableList.of(),
            ImmutableList.of(IdmsDialect.NAME)));
  }

}
