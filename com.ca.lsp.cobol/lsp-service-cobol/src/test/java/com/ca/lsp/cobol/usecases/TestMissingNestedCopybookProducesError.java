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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** Test missing nested copybooks produce syntax errors in parent copybooks. */
public class TestMissingNestedCopybookProducesError {

  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      01  {$*PARENT}.\n"
          + "5      COPY {~REPL} REPLACING ==TAG== BY ==ABC==.\n"
          + "6      PROCEDURE DIVISION.\n"
          + "7      {#*MAINLINE}.\n"
          + "8      MOVE 0 TO {$ABC-ID}.\n"
          + "9      GOBACK. ";

  private static final String REPL =
      "       05 {$*TAG-ID^ABC-ID} PIC 9.\n" + "       COPY {~CPYNAME|missing}.";
  private static final String REPL_NAME = "REPL";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(new CobolText(REPL_NAME, REPL)),
        Map.of(
            "missing",
            new Diagnostic(
                null, "CPYNAME: Copybook not found", Error, ERROR.getText(), "MISSING_COPYBOOK")));
  }
}
