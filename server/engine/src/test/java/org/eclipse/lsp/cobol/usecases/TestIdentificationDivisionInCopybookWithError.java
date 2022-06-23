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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/**
 * This test checks the insertion of IDENTIFICATION DIVISION statement that contains a syntax error
 * in a copybook found and underlined correctly
 */
class TestIdentificationDivisionInCopybookWithError {
  private static final String TEXT =
      "0      {_COPY {~IDDIV}.|1_}\n"
          + "1      PROGRAM-ID. BKP92S1.        \n"
          + "2      DATA DIVISION.              \n"
          + "3      WORKING-STORAGE SECTION.    \n"
          + "4      01  {$*PARENT}.  COPY {~STRUCT1}.  \n"
          + "5      PROCEDURE DIVISION.\n"
          + "6      {#*MAINLINE}.\n"
          + "7          MOVE 1 TO {$CHILD1}.\n"
          + "8          GOBACK. ";

  private static final String STRUCT1 = "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n";
  private static final String IDDIV = "       IDENTIFICATION {DIVISIONs|1}.";

  private static final String IDDIV_NAME = "IDDIV";
  private static final String STRUCT1_NAME = "STRUCT1";

  private static final String MESSAGE = "Syntax error on 'DIVISIONs' expected DIVISION";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(IDDIV_NAME, IDDIV), new CobolText(STRUCT1_NAME, STRUCT1)),
        ImmutableMap.of(
            "1", new Diagnostic(new Range(), MESSAGE, Error, SourceInfoLevels.ERROR.getText())));
  }
}
