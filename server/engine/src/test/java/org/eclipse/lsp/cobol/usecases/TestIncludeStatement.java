/*
 * Copyright (c) 2021 Broadcom.
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
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This test checks that ++INCLUDE statement is parsed correctly */
class TestIncludeStatement {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. PARTEST.\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          ++INCLUDE {~NAME}\n"
          + "          ++INCLUDE {~NAME1}.\n"
          + "          ++INCLUDE {~NAME123456789|NameLengthError}.\n"
          + "          PROCEDURE DIVISION.\n"
          + "              DISPLAY {$ABC}.";

  private static final String COPYBOOK = "         01 {$*ABC} PIC 9.";
  private static final String COPYBOOK1 = "         01 {$*ABC1} PIC 9.";
  private static final String COPYBOOK2 = "         01 {$*ABC2} PIC 9.";

//to check
  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("NAME", COPYBOOK),
            new CobolText("NAME1", COPYBOOK1),
            new CobolText("NAME123456789", COPYBOOK2)),
        ImmutableMap.of(
            "NameLengthError",
            new Diagnostic(
                new Range(),
                "Copybook declaration has more than 10 characters for: NAME123456789",
                DiagnosticSeverity.Information,
                ErrorSource.COPYBOOK.getText())));
  }
}
