/*
 * Copyright (c) 2021 Broadcom.
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
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp.cobol.core.engine.flavors.CobolFlavorImpl;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** UseCase test example without errors */
class TestFlavorCase {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*VAR}     PIC S9(4) COMP.";

  private static final String TEXT_WITH_FLAVOR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       FOO BAR {$*SOMETHING} \n"
          + "       01  {$*VAR}     PIC S9(4) COMP.";

  private static final String TEXT_WITH_FLAVOR_2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       FOO BAR                                                          11111111\n"
          + "000000           {$*SOMETHING} \n"
          + "       01  {$*VAR}     PIC S9(4) COMP.";

  private AnalysisConfig analysisConfig = new AnalysisConfig(
      ImmutableSet.of(),
      new CopybookConfig(CopybookProcessingMode.DISABLED, SQLBackend.DATACOM_SERVER),
      ImmutableList.of(CobolFlavorImpl.NAME)
  );

  @Test
  void testWithout() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), analysisConfig);
  }

  @Test
  void testWith() {
    UseCaseEngine.runTest(TEXT_WITH_FLAVOR, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), analysisConfig);
  }

  @Test
  void testWithComments() {
    UseCaseEngine.runTest(TEXT_WITH_FLAVOR_2, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), analysisConfig);
  }
}
