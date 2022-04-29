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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import static com.google.common.collect.ImmutableMap.of;
import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** This test checks that only mnemonic ames expected in the SET ON/OFF statement */
class TestSetToBoolean {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    RESS.\n"
          + "       DATA DIVISION.\n"
          + "       working-storage section.\n"
          + "       1 {$*a-result} pic s9(9) comp.\n"
          + "           88 {$*a-resume} value 10.\n"
          + "           88 {$*b-resume} value 10.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           set {$a-resume} to true.\n"
          + "           set {$b-resume} to false.\n"
          + "           set {$a-result|1} to false.\n"
          + "           set {$a-resume} {$b-resume} to true.\n"
          + "           set {$a-result|1} {$b-resume} to false.\n"
          + "       END PROGRAM RESS. ";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        of(
            "1",
            new Diagnostic(
                null,
                "Invalid receiving field type. Expected: Condition name",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
