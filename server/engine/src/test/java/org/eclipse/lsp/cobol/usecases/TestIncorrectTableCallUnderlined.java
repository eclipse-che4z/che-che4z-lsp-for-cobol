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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This test verifies that the definition checks applies to the table calls */
class TestIncorrectTableCallUnderlined {

  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           MOVE 'ABC' TO {_OL-ACCT-NO({SUB1|2})|1_}.\n"
          + "       End program ProgramId.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable OL-ACCT-NO is not defined",
                DiagnosticSeverity.Error,
                 ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(), "Variable SUB1 is not defined", DiagnosticSeverity.Error,  ErrorSource.PARSING.getText())));
  }
}
