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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** This test checks that only mnemonic names expected in the SET TO ON/OFF statement */
class TestSetOnOff {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    MNEM.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES. \n"
          + "           C01 IS {$*NEXT-PAGE}\n"
          + "           C02 IS {$*TOP-OF-PAGE}.\n"
          + "       DATA DIVISION.\n"
          + "       working-storage section.\n"
          + "       01 {$*ABCD} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           SET {$NEXT-PAGE} TO ON. \n"
          + "           SET {$ABCD|1} TO ON.\n"
          + "           SET {ABCDE|2} TO ON.\n"
          + "           SET {$NEXT-PAGE} {$ABCD|1} TO OFF.\n"
          + "           SET {$TOP-OF-PAGE} {$NEXT-PAGE} TO ON\n"
          + "               {$TOP-OF-PAGE} {$NEXT-PAGE} TO OFF.\n"
          + "       END PROGRAM MNEM. ";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Invalid receiving field type. Expected: Mnemonic name",
                DiagnosticSeverity.Error,
                ERROR.getText()),
            "2",
            new Diagnostic(
                new Range(), "Variable ABCDE is not defined", DiagnosticSeverity.Error, ERROR.getText())));
  }
}
