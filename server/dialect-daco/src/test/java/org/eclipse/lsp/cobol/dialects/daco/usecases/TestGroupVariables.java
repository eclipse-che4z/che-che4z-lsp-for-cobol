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
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test for group variables **/
class TestGroupVariables {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    BADPA61M.\n"
      + "       ENVIRONMENT  DIVISION.\n"
      + "       IDMS-CONTROL SECTION.\n"
      + "       PROTOCOL.    MODE IS BATCH           DEBUG\n"
      + "              IDMS-RECORDS            MANUAL.\n"
      + "       DATA   DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01 {$*AREA-XW4}.\n"
      + "           03 {$*TBLOPT-XW4}.\n"
      + "               07 {$*TBLCRI-XW4}.\n"
      + "                 09 {$*RUSCRI-BW4}       PIC S9(2)   VALUE ZERO  COMP.\n"
      + "                 09 {$*ROWCRI-XW4}                   OCCURS 40.\n"
      + "       01 {$*AREA-XW5}.\n"
      + "           05 {$*TBLCRI-XW6}  COPY-FROM W4.";

  @Test
  void test() {
    UseCaseEngine.runTestForDiagnostics(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
