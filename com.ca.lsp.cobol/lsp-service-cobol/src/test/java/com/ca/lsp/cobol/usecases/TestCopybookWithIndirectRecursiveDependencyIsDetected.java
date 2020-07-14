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
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static java.util.Arrays.asList;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * This test checks the error shown if the copybook that is used in the COBOL file contains a link
 * to another one, that has a dependency to the first copybook.
 */
public class TestCopybookWithIndirectRecursiveDependencyIsDetected {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        COPY {~INDIRECT-COPY|1|3}.\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String INDIRECT = "        COPY {~INNER-COPY|2|4}.";
  private static final String INNER_COPY = "        COPY {~INDIRECT-COPY|3}.";

  private static final String INDIRECT_NAME = "INDIRECT-COPY";
  private static final String INNER_COPY_NAME = "INNER-COPY";

  private static final String MESSAGE_RECURSION = "Recursive copybook declaration for: ";
  private static final String MESSAGE_LONG_DECLARATION =
      "Copybook declaration has more than 8 characters for: ";

  @Test
  public void test() {
    Map<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "1", new Diagnostic(null, MESSAGE_RECURSION + INDIRECT_NAME, Error, ERROR.getText()));
    expectedDiagnostics.put(
        "2", new Diagnostic(null, MESSAGE_RECURSION + INNER_COPY_NAME, Error, ERROR.getText()));
    expectedDiagnostics.put(
        "3",
        new Diagnostic(
            null, MESSAGE_LONG_DECLARATION + INDIRECT_NAME, Information, INFO.getText()));
    expectedDiagnostics.put(
        "4",
        new Diagnostic(
            null, MESSAGE_LONG_DECLARATION + INNER_COPY_NAME, Information, INFO.getText()));

    UseCaseEngine.runTest(
        TEXT,
        asList(new CobolText(INNER_COPY_NAME, INNER_COPY), new CobolText(INDIRECT_NAME, INDIRECT)),
        expectedDiagnostics);
  }
}
