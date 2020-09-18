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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.*;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.*;

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
          + "7          DISPLAY {$CHILD1|invalid}.\n"
          + "8      End program ProgramId.";

  private static final String ASDASD =
      "           {03|areaA1}  {CHILD1|child1|areaA2}         {PIC|pic} 9   VALUE IS '0'.";

  private static final String ASDASD_NAME = "ASDASD";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(new CobolText(ASDASD_NAME, ASDASD)),
        Map.of(
            "invalid",
            new Diagnostic(null, "Invalid definition for: CHILD1", Information, INFO.getText()),
            "pic",
            new Diagnostic(null, "Syntax error on 'PIC' expected SECTION", Error, ERROR.getText()),
            "child1",
            new Diagnostic(
                null, "Syntax error on 'CHILD1' expected SECTION", Error, ERROR.getText()),
            "is",
            new Diagnostic(null, "Syntax error on 'IS' expected SECTION", Error, ERROR.getText()),
            "areaA1",
            new Diagnostic(
                null, "The following token must start in Area A: 03", Warning, WARNING.getText()),
            "areaA2",
            new Diagnostic(
                null,
                "The following token must start in Area A: CHILD1",
                Warning,
                WARNING.getText())));
  }
}
