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
package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

/** These test for variations other idms SECTION definitions */
class TestIdmsSections {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        ENVIRONMENT DIVISION.\r\n";

  private static final String IDMSSS_WITH_ALL_CLAUSES =
      "        IDMS-CONTROL SECTION.\r\n"
          + "            PROTOCOL. MODE ABC\r\n"
          + "            SUBSCHEMA-NAMES LENGTH 18\r\n"
          + "            IDMS-RECORDS WITHIN WORKING-STORAGE.\r\n"
          + "        DATA DIVISION.\r\n"
          + "       SCHEMA SECTION.\r\n"
          + "            DB EMPSS01 WITHIN ENPSCHM VERSION 1234.\r\n";

  /** This test should fail because the subschema-name length is max 8 characters */
  private static final String IDMSSS_NO_CS_NO_VERSION =
      "        DATA DIVISION.\r\n"
          + "        SCHEMA SECTION.\r\n"
          + "            DB EMPSS0123 WITHIN ENPSCHM.\r\n";

  private static final String IDMSMS_WITH_ALL_CLAUSES =
      "        DATA DIVISION.\r\n"
          + "        SCHEMA SECTION.\r\n"
          + "            DB EMPSS0123 WITHIN ENPSCHM.\r\n"
          + "        MAP SECTION.\r\n"
          + "        MAX FIELD LIST IS 12 \r\n"
          + "        MAP MAP1 TYPE IS EXTENDED PAGING.\r\n"
          + "        MAP MAP2\r\n"
          + "        MAP MAP3 TYPE STANDARD.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + IDMSSS_WITH_ALL_CLAUSES,
        BOILERPLATE + IDMSSS_NO_CS_NO_VERSION,
        BOILERPLATE + IDMSMS_WITH_ALL_CLAUSES);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  void test(String text) {
    UseCaseEngine.runTest(text, List.of(), Map.of());
  }
}
