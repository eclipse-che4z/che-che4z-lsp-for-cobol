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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/**
 * This test checks that the RENAMES clause with the specified variable range using THRU includes
 * only the variables from this range. Here: VARNAME5 is out of the range VARNAME2 - VARNAME4 and
 * should not present in the VARNAME5 structure.
 */
class TestRenamingIncludesOnlyRequiredVariable {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTRENAME.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME1}.\n"
          + "          02 {$*VARNAME2} PIC 9.\n"
          + "          02 {$*VARNAME3}.\n"
          + "            03 {$*VARNAME4} PIC 9.\n"
          + "          02 {$*VARNAME5} PIC 9.\n"
          + "       66 {$*VARNAME6} RENAMES {$VARNAME2} THRU {$VARNAME4}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 TO {_VARNAME5 OF VARNAME6|1_}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Variable VARNAME5 is not defined",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
