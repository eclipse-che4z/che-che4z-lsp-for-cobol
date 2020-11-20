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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.eclipse.lsp4j.DiagnosticSeverity.Information;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

/**
 * This test checks the intersecting invalid structures underlined correctly. Here, all the
 * variables are on the same error, so there should be semantic errors on 'CHILD2 OF CHILD1' and
 * 'CHILD1 OF PARENT', where CHILD1 is an intersection for both structures.
 */
class TestIntersectedIncorrectStructureUnderlined {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT PIC 9.\n"
          + "       01  CHILD1 PIC 9.\n"
          + "       01  CHILD2 PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MAINLINE.\n"
          + "           MOVE 0 TO CHILD2 OF CHILD1 OF PARENT.\n"
          + "           GOBACK. ";

  @Test
  void test() {
    List<Diagnostic> expected =
        List.of(
            new Diagnostic(
                new Range(new Position(9, 21), new Position(9, 37)),
                "Invalid definition for: CHILD2 OF CHILD1",
                Information,
                SourceInfoLevels.INFO.getText()),
            new Diagnostic(
                new Range(new Position(9, 31), new Position(9, 47)),
                "Invalid definition for: CHILD1 OF PARENT",
                Information,
                SourceInfoLevels.INFO.getText()));
    AnalysisResult result = UseCaseUtils.analyze(UseCaseUtils.DOCUMENT_URI, TEXT, List.of());
    List<Diagnostic> actual = result.getDiagnostics().get(UseCaseUtils.DOCUMENT_URI);
    assertThat(actual, is(expected));
  }
}
