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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This test checks that statement validation applied to the nested programs */
class TestSetUpDownByInNestedProgram {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SETINDEX.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*TABLE1} OCCURS 5 TIMES INDEXED BY {$*IND1} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           SET {$IND1} DOWN BY {\"0\"|1}.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SETINDEXNESTED.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*TABLE2} OCCURS 5 TIMES INDEXED BY {$*IND2} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           SET {$IND2} DOWN BY {$TABLE2|1}.\n"
          + "       END PROGRAM SETINDEXNESTED.\n"
          + "       END PROGRAM SETINDEX.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Invalid sending field type. Expected: Elementary integer data item, Non-zero integer",
                DiagnosticSeverity.Error,
                 ErrorSource.PARSING.getText())));
  }
}
