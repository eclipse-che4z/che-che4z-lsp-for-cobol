/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** Test if variable usage position tracked correctly with line concatenation. */
class TestLineContinuation2 {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. MIN.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 FILLER  PIC IS X(99) VALUE IS \" FEATURE                     PA\n"
          + "      -    \"\n"
          + "      -    \"REMARKS\".                                                   \n"
          + "       PROCEDURE DIVISION.                                              \n"
          + "           {_COPY                                           {~CBB}.|CBBMAIN\n_}";
  private static final String CBB = "       {#*P-001}.\n" + "           PERFORM {MISSING-PAR|CBB}.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("CBB", CBB)),
        ImmutableMap.of(
            "CBBMAIN",
            new Diagnostic(
                new Range(),
                "Errors inside the copybook",
                Error,
                "COBOL Language Support (copybook)",
                null),
            "CBB",
            new Diagnostic(
                    new Range(),
                    "The following paragraph is not defined: MISSING-PAR",
                    Error,
                    "COBOL Language Support (parsing)",
                    null)));
  }
}
