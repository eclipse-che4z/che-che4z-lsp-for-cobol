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
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This use case checks if there is an error thrown if the END-PERFORM token is missing */
class TestEndPerformCausesError {
  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.\n"
          + "000200 PROGRAM-ID.   TEST1.\n"
          + "000301 AUTHOR.       A PROGRAMMER.\n"
          + "000302 DATA DIVISION.\n"
          + "000303 WORKING-STORAGE SECTION.\n"
          + "000304 01 {$*ID1} PIC 9.\n"
          + "000305 01 {$*ID2} PIC 9.\n"
          + "000308 01 {$*ID3} OCCURS 5 TIMES.\n"
          + "000309     02 {$*ROW-SUB} USAGE INDEX.\n"
          + "000400 PROCEDURE DIVISION.\n"
          + "000500     MOVE {$ID1} TO {$ID2}.\n"
          + "000700     PERFORM VARYING {$ROW-SUB} FROM 1 BY 1 UNTIL {$ROW-SUB} > 20\n"
          + "000800      INITIALIZE {$ID3}({$ROW-SUB})\n"
          + "000900      INITIALIZE {$ID3}({$ROW-SUB}){.|1}\n"
          + "000500     MOVE {$ID1} TO {$ID2}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Extraneous input '.' expected END-PERFORM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
