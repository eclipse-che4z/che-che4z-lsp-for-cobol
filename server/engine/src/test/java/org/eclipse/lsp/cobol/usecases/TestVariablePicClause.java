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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests for variable picture clause
 */
class TestVariablePicClause {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID. GRP1.\n"
      + "       DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01 {$*ROOT}.\n"
      + "           02 {$*VARNAME|1} PIC X(3).\n"
      + "             03 {$*CHILD} PIC X(2).\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(new Range(), "Group variable VARNAME cannot have PICTURE clause", DiagnosticSeverity.Error,  ErrorSource.PARSING.getText())));
  }
}
