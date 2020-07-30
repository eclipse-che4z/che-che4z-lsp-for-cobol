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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * This test asserts syntax error on not defined variable. CHILD1 on line 6 is used, but not
 * defined, so it should be underlined.
 */
public class TestMessageIfVariableNotDefined {
  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      Procedure Division.\n"
          + "5      {#*000-Main-Logic}.\n"
          + "6          MOVE 0 TO {$CHILD1|notDefined}.\n"
          + "7      End program ProgramId.";

  private static final String MESSAGE = "Invalid definition for: CHILD1";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of("notDefined", new Diagnostic(null, MESSAGE, Information, INFO.getText())));
  }
}
