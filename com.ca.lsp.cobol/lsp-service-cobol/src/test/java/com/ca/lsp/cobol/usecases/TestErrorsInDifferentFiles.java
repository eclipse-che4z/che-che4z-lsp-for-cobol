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
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static java.util.Collections.singletonList;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * Test syntax errors found in a copybook displayed in the according file. Here, variable definition
 * in the copybook pasted to procedure division that is an error.
 */
public class TestErrorsInDifferentFiles {

  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      Procedure Division.\n"
          + "5      {#*000-Main-Logic}.\n"
          + "6      COPY {~ASDASD}. \n"
          + "7          DISPLAY {$CHILD1|invalid}.\n"
          + "8      End program ProgramId.";

  private static final String ASDASD =
      "           03  {CHILD1|child1}         {PIC|pic} 9   VALUE IS '0'.";

  private static final String ASDASD_NAME = "ASDASD";

  @Test
  public void test() {
    Map<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "invalid",
        new Diagnostic(null, "Invalid definition for: CHILD1", Information, INFO.getText()));
    expectedDiagnostics.put(
        "pic",
        new Diagnostic(null, "Syntax error on 'PIC' expected SECTION", Error, ERROR.getText()));
    expectedDiagnostics.put(
        "child1",
        new Diagnostic(null, "Syntax error on 'CHILD1' expected SECTION", Error, ERROR.getText()));
    UseCaseEngine.runTest(
        TEXT, singletonList(new CobolText(ASDASD_NAME, ASDASD)), expectedDiagnostics);
  }
}
