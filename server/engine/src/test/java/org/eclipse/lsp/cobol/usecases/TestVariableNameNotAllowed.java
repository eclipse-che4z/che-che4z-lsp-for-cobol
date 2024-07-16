/*
 * Copyright (c) 2024 Broadcom.
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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

/** Tests the allowed name on a variable. */
public class TestVariableNameNotAllowed {
  public static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID.    TEST12.\n"
                  + "       ENVIRONMENT DIVISION.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01 {$*%s|1} PIC 9(9) VALUE 0.\n"
                  + "       PROCEDURE DIVISION.";

  @ParameterizedTest
  @ValueSource(strings = {"INSERT", "BIT", "CONDITION", "COPY", "CURSOR"})
  void test(String input) {
    UseCaseEngine.runTest(
            String.format(TEXT, input),
            ImmutableList.of(),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            String.format("Variable name %s is not allowed", input),
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
