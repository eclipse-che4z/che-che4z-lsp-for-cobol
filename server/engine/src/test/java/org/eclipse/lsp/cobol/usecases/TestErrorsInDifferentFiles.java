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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Warning;

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
          + "6      {_COPY {~ASDASD}.|child1|areaA1|areaA2|pic_} \n"
          + "7          DISPLAY {CHILD1|invalid}.\n"
          + "8      End program ProgramId.";

  private static final String ASDASD =
      "           {@*03|areaA11}  {@*CHILD1|child11|areaA22}         {PIC|pic1} 9   VALUE IS '0'.";

  private static final String ASDASD_NAME = "ASDASD";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(ASDASD_NAME, ASDASD)),
        new ImmutableMap.Builder<String, Diagnostic>()
            .put(
                "invalid",
                new Diagnostic(
                    new Range(),
                    "Variable CHILD1 is not defined",
                    Error,
                    ErrorSource.PARSING.getText()))
            .put(
                "pic",
                new Diagnostic(
                    new Range(),
                    "Syntax error on 'PIC' expected SECTION",
                    Error,
                    ErrorSource.COPYBOOK.getText())).put(
                "pic1",
                new Diagnostic(
                    new Range(),
                    "Syntax error on 'PIC' expected SECTION",
                    Error,
                    ErrorSource.PARSING.getText()))
            .put(
                "child1",
                new Diagnostic(
                    new Range(),
                    "Syntax error on 'CHILD1' expected SECTION",
                    Error,
                    ErrorSource.COPYBOOK.getText())).put(
                "child11",
                new Diagnostic(
                    new Range(),
                    "Syntax error on 'CHILD1' expected SECTION",
                    Error,
                    ErrorSource.PARSING.getText()))
            .put(
                "areaA1",
                new Diagnostic(
                    new Range(),
                    "The following token must start in Area A: 03",
                    Warning,
                    ErrorSource.COPYBOOK.getText())) .put(
                "areaA11",
                new Diagnostic(
                    new Range(),
                    "The following token must start in Area A: 03",
                    Warning,
                    ErrorSource.PARSING.getText()))
            .put(
                "areaA2",
                new Diagnostic(
                    new Range(),
                    "The following token must start in Area A: CHILD1",
                    Warning,
                    ErrorSource.COPYBOOK.getText()))
                .put(
                "areaA22",
                new Diagnostic(
                    new Range(),
                    "The following token must start in Area A: CHILD1",
                    Warning,
                    ErrorSource.PARSING.getText()))
            .build());
  }
}
