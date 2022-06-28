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
import org.eclipse.lsp.cobol.core.model.ErrorStage;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks if the parser recognizes typo on the "DIVISIONs" token. The correct is
 * "DIVISION".
 */
class TestSyntaxError {

  private static final String TEXT =
      "        IDENTIFICATION {DIVISIONs|typo}.\r\n" // Typo on DIVISIONs
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "        END PROGRAM {test1|name}.";

  private static final String DIVISION = "Syntax error on 'DIVISIONs' expected DIVISION";
  private static final String NAME = "There is an issue with PROGRAM-ID paragraph";

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "typo",
            new Diagnostic(new Range(), DIVISION, DiagnosticSeverity.Error, ErrorStage.SYNTAX.getText()),
            "name",
            new Diagnostic(new Range(), NAME, DiagnosticSeverity.Warning, ErrorStage.SYNTAX.getText())));
  }
}
