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

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Warning;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test syntax errors found in a copybook displayed in the according file. Here, variable definition
 * in the copybook pasted to procedure division that is an error.
 */
class TestErrorsInDifferentFiles {

  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4      Procedure Division.\n"
          + "5      {#*000-Main-Logic}.\n"
          + "6      {_COPY {~ASDASD}.|error_} \n"
          + "7          DISPLAY {CHILD1|chund}.\n"
          + "8      End program ProgramId.";

  private static final String ASDASD =
          "           {#*03|areaA11}  {#*CHILD1|child11|waria}         {PIC|dot} 9   VALUE IS '0'.";

  private static final String ASDASD_NAME = "ASDASD";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(ASDASD_NAME, ASDASD)),
            ImmutableMap.of(
                    "pic",
                    new Diagnostic(
                            new Range(),
                            "Syntax error on 'PIC'",
                            Error,
                            ErrorSource.COPYBOOK.getText()),
                    "child1",
                    new Diagnostic(
                            new Range(),
                            "Syntax error on 'CHILD1'",
                            Error,
                            ErrorSource.COPYBOOK.getText()),
                    "child11",
                    new Diagnostic(
                            new Range(),
                            "Syntax error on 'CHILD1'",
                            Error,
                            ErrorSource.PARSING.getText()),
                    "areaA11",
                    new Diagnostic(
                            new Range(),
                            "The following token must start in Area A: 03",
                            Warning,
                            ErrorSource.PARSING.getText()),
                    "error",
                    new Diagnostic(
                            new Range(),
                            "Errors inside the copybook",
                            Error,
                            ErrorSource.COPYBOOK.getText()),
                    "waria",
                    new Diagnostic(
                            new Range(),
                            "The following token must start in Area A: CHILD1",
                            Warning,
                            ErrorSource.PARSING.getText()),
                    "dot",
                    new Diagnostic(
                            new Range(),
                            "Syntax error on 'PIC'",
                            Error,
                            ErrorSource.PARSING.getText()),
                    "chund",
                    new Diagnostic(
                            new Range(),
                            "Variable CHILD1 is not defined",
                            Error,
                            ErrorSource.PARSING.getText())
                    ));
  }
}
