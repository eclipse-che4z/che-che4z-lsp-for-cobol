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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * This test checks the error shown if the copybook that is used in the COBOL file contains a link
 * to another one, that has a dependency to the first copybook.
 */
class TestCopybookWithIndirectRecursiveDependencyIsDetected {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        {_COPY {~INDIRECT-COPY|1|3}.|2_}\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String INDIRECT = "        {_COPY {~INNER-COPY|1|4}.|2_}";
  private static final String INNER_COPY = "        {_COPY {~INDIRECT-COPY|3}.|1_}";

  private static final String INDIRECT_NAME = "INDIRECT-COPY";
  private static final String INNER_COPY_NAME = "INNER-COPY";

  private static final String MESSAGE_RECURSION = "Recursive copybook declaration for: ";
  private static final String MESSAGE_LONG_DECLARATION =
      "Copybook declaration has more than 8 characters for: ";

  @Test
  void testInnerCopy() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText(INNER_COPY_NAME, INNER_COPY), new CobolText(INDIRECT_NAME, INDIRECT)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), MESSAGE_RECURSION + INDIRECT_NAME, Error, ErrorSource.COPYBOOK.getText()),
            "2",
            new Diagnostic(
                new Range(), "Errors inside the copybook", Error, ErrorSource.COPYBOOK.getText()),
            "3",
            new Diagnostic(
                new Range(),
                MESSAGE_LONG_DECLARATION + INDIRECT_NAME,
                Information,
                ErrorSource.COPYBOOK.getText()),
            "4",
            new Diagnostic(
                new Range(),
                MESSAGE_LONG_DECLARATION + INNER_COPY_NAME,
                Information,
                ErrorSource.COPYBOOK.getText())));
  }
}
