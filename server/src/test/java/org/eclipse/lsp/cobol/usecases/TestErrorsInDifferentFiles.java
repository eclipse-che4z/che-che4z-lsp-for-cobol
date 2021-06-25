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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
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
          + "6      {_COPY {~ASDASD}.|areaA1|areaA2|child1|pic_} \n"
          + "7          DISPLAY {CHILD1|invalid}.\n"
          + "8      End program ProgramId.";

  private static final String ASDASD =
      "           {@*03|areaA1}  {@*CHILD1|child1|areaA2}         {PIC|pic} 9   VALUE IS '0'.";

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
                    null,
                    "Variable CHILD1 is not defined",
                    Error,
                    SourceInfoLevels.ERROR.getText()))
            .put(
                "pic",
                new Diagnostic(
                    null,
                    "Syntax error on 'PIC' expected SECTION",
                    Error,
                    SourceInfoLevels.ERROR.getText()))
            .put(
                "child1",
                new Diagnostic(
                    null,
                    "Syntax error on 'CHILD1' expected SECTION",
                    Error,
                    SourceInfoLevels.ERROR.getText()))
            .put(
                "is",
                new Diagnostic(
                    null,
                    "Syntax error on 'IS' expected SECTION",
                    Error,
                    SourceInfoLevels.ERROR.getText()))
            .put(
                "areaA1",
                new Diagnostic(
                    null,
                    "The following token must start in Area A: 03",
                    Warning,
                    SourceInfoLevels.WARNING.getText()))
            .put(
                "areaA2",
                new Diagnostic(
                    null,
                    "The following token must start in Area A: CHILD1",
                    Warning,
                    SourceInfoLevels.WARNING.getText()))
            .build());
  }
}
