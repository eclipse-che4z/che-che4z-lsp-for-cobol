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
 * This test checks that parser can find and underline an incorrect variable structure. Here CHILD1
 * is not a part of PARENT1 because they are on the same level, but on the line 8 they called the
 * way if CHILD1 was a part of PARENT1 structure. It is incorrect, so CHILD1 should be underlined.
 */
class TestInvalidVariableStructureFound {
  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      01   {$*PARENT1}. \n"
          + "5      01   {$*CHILD1} PIC 9. \n"
          + "6      Procedure Division.\n"
          + "7      {#*000-Main-Logic}.\n"
          + "8          MOVE 0 TO {$CHILD1|1} OF {$PARENT1}.\n"
          + "9      End program ProgramId.";

  private static final String MESSAGE = "Invalid definition for: CHILD1";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, List.of(), Map.of("1", new Diagnostic(null, MESSAGE, Information, INFO.getText())));
  }
}
