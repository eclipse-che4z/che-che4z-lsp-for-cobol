/*
 * Copyright (c) 2023 Broadcom.
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

import static org.eclipse.lsp.cobol.common.error.ErrorCodes.MISSING_COPYBOOK;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test resolving copybooks inside EXEC SQL section **/
class TestCopyWithinSQL {
  private static final String TEXT1 = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    VFB150.\n"
      + "       DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "           EXEC SQL\n"
      + "               INCLUDE {~COPY1|1}\n"
      + "           END-EXEC.\n"
      + "           EXEC SQL\n"
      + "                INCLUDE {~SQLCA} \n"
      + "           END-EXEC.\n";

  private static final String TEXT2 = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    VFB150.\n"
      + "       DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "           EXEC SQL\n"
      + "                INCLUDE {~SQLCPY}\n"
      + "           END-EXEC.\n"
      + "           EXEC SQL\n"
      + "                INCLUDE {~COPY1|1}\n"
      + "           END-EXEC.\n";

  private static final String SQLCPY = "\n"
      + "\n"
      + "\n"
      + "\n"
      + "\n"
      + "\n"
      + "        01 {$*SQLCA}.\n"
      + "                05 {$*SQLCAID}      PIC X(8).\n";

  @Test
  void testMissedCopyBefore() {
    UseCaseEngine.runTest(TEXT1, ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(new Range(),
                "COPY1: Copybook not found",
                DiagnosticSeverity.Error, ErrorSource.COPYBOOK.getText(),
                MISSING_COPYBOOK.getLabel()))
    );
  }

  @Test
  void testMissedCopyAfter() {
    UseCaseEngine.runTest(TEXT2,
        ImmutableList.of(new CobolText("SQLCPY", SQLCPY)),
        ImmutableMap.of(
            "1",
            new Diagnostic(new Range(),
                "COPY1: Copybook not found",
                DiagnosticSeverity.Error, ErrorSource.COPYBOOK.getText(),
                MISSING_COPYBOOK.getLabel()))
    );
  }

}
