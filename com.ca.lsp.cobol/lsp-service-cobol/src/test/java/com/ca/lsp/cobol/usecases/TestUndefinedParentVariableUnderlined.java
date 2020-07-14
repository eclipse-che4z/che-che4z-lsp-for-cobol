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

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_CHANGE;
import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_OPEN;
import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static java.util.Collections.emptyList;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * This test checks that the undefined parent variable underlined while variable call hierarchy
 * check.
 */
public class TestUndefinedParentVariableUnderlined {
  private static final String TEXT =
      "0       IDENTIFICATION DIVISION.\r\n"
          + "1       PROGRAM-ID. TEST1.\r\n"
          + "2       DATA DIVISION.\r\n"
          + "3       WORKING-STORAGE SECTION.\r\n"
          + "4       01   {$*BORROWER}.\r\n"
          + "5          05 {$*AGE}                   PIC 9(3).\r\n"
          + "6              10 {$*MAMA} PIC 99 VALUE 3.\r\n"
          + "7       PROCEDURE DIVISION.\r\n"
          + "8       {#*PROCB}.\r\n"
          + "9       MOVE 10 TO {$MAMA} OF {$AGE|1} OF {$BORROWE|2}.\r\n"
          + "10      END PROGRAM TEST1.";


  private static final String MESSAGE = "Invalid definition for: ";
  private static final String BORROWE = "BORROWE";
  private static final String AGE = "AGE";

  @Test
  public void assertSyncTypeNotChangesLogic() {
    assertEquals(analyze(TEXT, emptyList(), DID_OPEN), analyze(TEXT, emptyList(), DID_CHANGE));
  }

  @Test
  public void assertAnalysisResult() {
      Map<String, Diagnostic> expectedDiagnostics = new HashMap<>();
      expectedDiagnostics.put("1", new Diagnostic(null, MESSAGE + AGE, Information, INFO.getText()));
      expectedDiagnostics.put("2", new Diagnostic(null, MESSAGE + BORROWE, Information, INFO.getText()));
      UseCaseEngine.runTest(TEXT, emptyList(), expectedDiagnostics);
  }
}
